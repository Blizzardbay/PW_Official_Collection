--
-- ********************************
-- *** Working Air Conditioners ***
-- ********************************
-- *** Coded by: Slayer         ***
-- ********************************
--

local TATurnACOn = require("Actions/TATurnACOn");
local TATurnACOff = require("Actions/TATurnACOff");
local TAConnectAC = require("Actions/TAConnectAC");
local TASettingsAC = require("Actions/TASettingsAC");

require "ISUI/ISACUI"

print ("-----STARTING AIRCOND ------")

acunits = {}
ticker = 3

AC_SPRITE_1 = "industry_01_4"
AC_SPRITE_2 = "industry_01_5"
REMOTE_RANGE_LIMIT = 8

function getACId (square)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()
    local id = tonumber(tostring(x) .. tostring(y) .. tostring(z))
    return id
end

local function isConnectedAC (obj)
    local isAC = false
    local objName = obj:getObjectName()
    if objName == "ClothingDryer" then
        local sprite = obj:getSprite();
        if sprite then
            local objectSpriteName = sprite:getName();
            if objectSpriteName == AC_SPRITE_1 or objectSpriteName == AC_SPRITE_2 then
                isAC = true
            end
        end
    end
    return isAC
end

local function isUnconnectedAC (obj)
    local isAC = false
    local objName = obj:getObjectName()
    if objName ~= "ClothingDryer" then
        local sprite = obj:getSprite();
        if sprite then
            local objectSpriteName = sprite:getName();
            if objectSpriteName == AC_SPRITE_1 or objectSpriteName == AC_SPRITE_2 then
                isAC = true
            end
        end
    end
    return isAC
end

local function detectOrientationAC (obj)
    local sprite = obj:getSprite();
    local orientation = ""
    if sprite then
        local objectSpriteName = sprite:getName();
        if objectSpriteName == AC_SPRITE_1 then
            orientation = "H"
        elseif objectSpriteName == AC_SPRITE_2 then
            orientation = "V"
        else
            print ("[ERR] Not AC unit!")
        end
    end
    return orientation
end

function updateAC()

    -- game saves ac units and its activation state
    -- however heat sources and sound emitters are not saved
    -- so they need to be synchronized manually

    -- if ticker == 3 then
    --     ticker = 0
    -- else
    --    ticker = ticker + 1
    --    return
    -- end

    -- print ("--- AC SCAN BEGIN ----")

    local player = getPlayer()
    local cell = getCell()
    local world = getWorld()
    local cm = world:getClimateManager()
    
    local gamemode = world:getGameMode()
    local isMultiplayer = false
    if gamemode == "Multiplayer" then
        isMultiplayer = true
    end

    local cf = cm:getClimateFloat(4)
 
    if not isMultiplayer then
        cf:setEnableOverride(false)
    end

    local x_min = tonumber(math.floor(player:getX())) - 16
    local x_max = tonumber(math.floor(player:getX())) + 16

    local y_min = tonumber(math.floor(player:getY())) - 16
    local y_max = tonumber(math.floor(player:getY())) + 16

    local z_min = 0
    local z_max = 3

    local nothingFound = true

    local scannedObjCnt = 0

    for z=z_min, z_max do
        for y=y_min, y_max do
            for x=x_min, x_max do
                local square = cell:getGridSquare(x, y, z)
                if square then
                    local objects = square:getSpecialObjects();
                    local haveElectricity = square:haveElectricity() or world:isHydroPowerOn()
                    for i=0, objects:size()-1 do
                        scannedObjCnt = scannedObjCnt + 1
                        local obj = objects:get(i);

                        if isConnectedAC(obj) then
                            local id = getACId(square)

                            -- power loss
                            if not haveElectricity then
                                obj:setActivated(false)
                            end

                            if obj:isActivated() then

                                nothingFound = false

                                local tempOffset = 7.1
                                local targetTemp = obj:getModData()["targettemp"]
                                if not targetTemp then
                                    targetTemp = 20
                                end

                                local fanMultiplier = 5
                                local targetFan = obj:getModData()["targetfan"]
                                if not targetFan then
                                    targetFan = 3
                                end

                                if acunits[id] then
                                    -- print (string.format("HEATSOURCE EXISTS AT x:%i y:%i z:%i, NEWTEMP: %i, NEWFAN:%i", x, y, z, targetTemp, targetFan))
                                    local acunit = acunits[id]
                                    local heatSource = acunit.heatsource
                                    cell:removeHeatSource(heatSource)

                                    heatSource:setTemperature(targetTemp + tempOffset)
                                    heatSource:setRadius(targetFan * fanMultiplier)
                                    cell:addHeatSource(heatSource)
                                    -- cell:updateHeatSources()

                                    if not isMultiplayer then
                                        if player:isInARoom() then

                                            local gt = cm:getTemperature()
                                            -- print ("---gt---")
                                            -- print (gt)
    
                                            local ht = cell:getHeatSourceHighestTemperature(0, player:getX(), player:getY(), player:getZ())
                                            -- print ("---ht---")
                                            -- print (ht)
    
                                            if ht > 1 then
                                                local playerTemp = cm:getAirTemperatureForCharacter(player)
                                                -- print (string.format("PLAYER TEMP: %f, TARGET TEMP: %f", playerTemp, targetTemp))
                                                
                                                local newOverride = cf:getOverride()
                                                if playerTemp > targetTemp then
                                                    newOverride = newOverride - 0.5
                                                else
                                                    newOverride = newOverride + 0.5
                                                end
                                                cf:setEnableOverride(true)
                                                cf:setOverride(newOverride, 1)
                                                -- print (string.format("NEW OVERRIDE: %f", newOverride))
                                            else
                                                cf:setEnableOverride(false)
                                                -- print ("OVERRIDE DISABLED")
                                            end
                                            
                                        else -- outside room
                                            cf:setEnableOverride(false)
                                            -- print ("OVERRIDE DISABLED2")
                                        end 
                                    end

                                    local soundEmitter = acunit.emitter
                                    soundEmitter:setVolumeAll(targetFan / 5)
                                    -- player:setVehicle(nil)
                                    
                                else
                                    
                                    local acunit = {}
                                    acunit.heatSource = nil
                                    acunit.emitter = nil

                                    local orientation = obj:getModData()["orientation"]

                                    -- print (string.format("ADDING HEATSOURCE AT x:%i y:%i z:%i, t:%i, f:%i", x, y, z, targetTemp, targetFan))

                                    local hs_x
                                    local hs_y

                                    if orientation == "H" then
                                        hs_x = x
                                        hs_y = y - 2
                                    end
                                    if orientation == "V" then
                                        hs_x = x - 2
                                        hs_y = y
                                    end

                                    -- local heatSquare = cell:getGridSquare(hs_x, hs_y, z)

                                    --print ("--temp--")
                                    --print (cm:getAirTemperatureForSquare(heatSquare, nil, true))
                                    --print ("--temp--")
                                    
                                    local heatSource = IsoHeatSource.new(hs_x, hs_y, z, targetFan * fanMultiplier, targetTemp + tempOffset)
                                    cell:addHeatSource(heatSource)
                                    acunit.heatsource = heatSource

                                    local soundEmitter = world:getFreeEmitter(hs_x, hs_y, z)
                                    soundEmitter:playSoundLooped("ACRunning");
                                    soundEmitter:setVolumeAll(targetFan / 5)
                                    acunit.emitter = soundEmitter

                                    acunits[id] = acunit
                                end
                            else
                                if acunits[id] then
                                    -- print (string.format("REMOVING HEATSOURCE AT x:%i y:%i z:%i", x, y, z))
                                    
                                    local acunit = acunits[id]

                                    local heatSource = acunit.heatsource
                                    cell:removeHeatSource(heatSource)

                                    local soundEmitter = acunit.emitter
                                    soundEmitter:setVolumeAll(0)
                                    soundEmitter:stopAll()

                                    -- soundEmitter:playSound("ACSlowDown");

                                    acunits[id] = nil
                                end
                            end

                            
                        end
                    end
                end
            end
        end
    end

    -- print ("SCANNED OBJ CNT: " .. scannedObjCnt)
    -- remove all if no ac around 
    -- maybe not needed
    if nothingFound then
        -- print ("REMOVING ALL HS AND EMITTERS")
        for id, acunit in pairs(acunits) do
            local heatSource = acunit.heatsource
            cell:removeHeatSource(heatSource)

            local soundEmitter = acunit.emitter
            soundEmitter:setVolumeAll(0)
            soundEmitter:stopAll()
            print ("removed!!!")
            acunits[id] = nil
        end
    end
    
    -- print ("--- AC SCAN END----")


end

local function GameStart (isNewGame)
end

--
-- CONTEXT MENU FUNCTIONS
-- 

local function connectAC (playerObj, ACSquare, isoObject, orientation)
    
    -- remove standard iso object and replace it with clothing dryer object
    -- we need clothing dryer because this way game will count is as electrical appliance

    if luautils.walkAdj(playerObj, ACSquare) then
        ISTimedActionQueue.add(TAConnectAC:new(playerObj, ACSquare, isoObject, orientation))
    end
end

local function TurnACOn (playerObj, ACSquare, isoObject)
    if luautils.walkAdj(playerObj, ACSquare) then
        ISTimedActionQueue.add(TATurnACOn:new(playerObj, ACSquare, isoObject))
    end
end

local function TurnACOff (playerObj, ACSquare, isoObject)
    if luautils.walkAdj(playerObj, ACSquare) then
        ISTimedActionQueue.add(TATurnACOff:new(playerObj, ACSquare, isoObject))
    end
end

local function SettingsAC (playerObj, ACSquare, isoObject)
    if luautils.walkAdj(playerObj, ACSquare) then
        ISTimedActionQueue.add(TASettingsAC:new(playerObj, ACSquare, isoObject, 3))
    end
end

local function SettingsRemoteAC (playerObj, ACSquare, isoObject)
    ISTimedActionQueue.add(TASettingsAC:new(playerObj, ACSquare, isoObject, REMOTE_RANGE_LIMIT))
end

--

local function RemoteContextMenu(player, context, items)
    
    for i, v in ipairs(items) do
        if v.name == "TV Remote" then
            -- print ("-- this is TV remote")
            local playerObj = getSpecificPlayer(player)
            local cell = getCell()

            local x_pl = playerObj:getX()
            local y_pl = playerObj:getY()
            local z_pl = playerObj:getZ()

            local x_min = tonumber(math.floor(x_pl)) - REMOTE_RANGE_LIMIT
            local x_max = tonumber(math.floor(x_pl)) + REMOTE_RANGE_LIMIT

            local y_min = tonumber(math.floor(y_pl)) - REMOTE_RANGE_LIMIT
            local y_max = tonumber(math.floor(y_pl)) + REMOTE_RANGE_LIMIT

            local winner_found = false
            local winner_dist = 1000
            local winner_obj = nil
            local winner_square = nil

            for y=y_min, y_max do
                for x=x_min, x_max do
                    local square = cell:getGridSquare(x, y, z_pl)
                    local objects = square:getSpecialObjects();
                    for i=0, objects:size()-1 do
                        local obj = objects:get(i);
                        if isConnectedAC(obj) then
                            local dist = math.sqrt(math.pow(x - x_pl, 2) + math.pow(y - y_pl, 2))
                            
                            if dist < winner_dist then
                                winner_found = true
                                winner_square = square
                                winner_obj = obj
                                winner_dist = dist
                                -- print (string.format("WINNER FOUND AT x:%i, y:%i, D:%i", x, y, dist))
                            end
                        end
                    end
                end
            end
            if winner_found then
                context:addOption(getText("ContextMenu_StoveSetting"), playerObj, SettingsRemoteAC, winner_square, winner_obj)
            end
        end
    end
    
end

local function ACContextMenu(player, context, worldobjects, test)
    local playerObj = getSpecificPlayer(player);
    local ACSquare = clickedSquare
    local world = getWorld()

    if ACSquare then
        local objects = ACSquare:getObjects();
        for i=0, objects:size()-1 do
            local isoObject = objects:get(i);

            if ACSquare:haveElectricity() or world:isHydroPowerOn() then
                if isConnectedAC(isoObject) then
                    if isoObject:isActivated() then
                        context:addOption(getText("ContextMenu_Turn_Off"), playerObj, TurnACOff, ACSquare, isoObject)
                    else
                        context:addOption(getText("ContextMenu_Turn_On"), playerObj, TurnACOn, ACSquare, isoObject)
                    end
                    context:addOption(getText("ContextMenu_StoveSetting"), playerObj, SettingsAC, ACSquare, isoObject)
                end
            end

            if isUnconnectedAC(isoObject) then
                local orientation = detectOrientationAC(isoObject)
                context:addOption(getText("ContextMenu_Attach"), playerObj, connectAC, ACSquare, isoObject, orientation)
            end
        end
    end

    -- context:addOption("UPDATE AC", playerObj, updateAC)

end

-- Events.OnInitGlobalModData.Add(InitACModData)

function OnClimateTick (cm)

    local t1 = cm:getTemperature()
    local cf = cm:getClimateFloat(4) -- 4: temperature
    -- print (cf:getFinalValue())

    -- cf:setEnableModded(true)
    -- cf:setEnableAdmin(true)
    cf:setEnableOverride(false)

    -- cf:setModdedValue(true)
    -- cf:setModdedInterpolate(true)
    -- cf:setAdminValue(true)
    -- cf:setOverride(40, 1)
    

    

    local t2 = cm:getTemperature()
    -- print (t2)
    -- m:setInstance(cm)

end

function OnPlayerUpdate (pl)
    -- print ("-- player update --")
    -- t1 = pl:getTemperature()
    -- print (t1)

end


Events.OnPreFillWorldObjectContextMenu.Add(ACContextMenu)

Events.OnPreFillInventoryObjectContextMenu.Add(RemoteContextMenu)

--Events.EveryOneMinute.Add(updateAC)
Events.OnGameStart.Add(GameStart)

Events.OnClimateTick.Add(updateAC)
--Events.OnPlayerUpdate.Add(OnPlayerUpdate)
