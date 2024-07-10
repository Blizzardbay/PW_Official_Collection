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

function ACToggle(object, state, character)
    if state ~= object:isActivated() then
        
        object:setActivated(state)

        local x = object:getX()
        local y = object:getY()
        local z = object:getZ()

        if isClient() then
            local args = {x=x, y=y, z=z}
            sendClientCommand(character, 'ac_commands', 'toggle', args)
        end
        VirtualAC.Toggle(x, y, z, true)
        
        updateAC()
    end
end

function updateAC()

    if isServer() then return end

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

    local globalModData = GetAirCondModDataModData()

    for k, vac in pairs(globalModData.WorkingUnits) do

        local square = cell:getGridSquare(vac.x, vac.y, vac.z)
        if square then
            local objects = square:getSpecialObjects();
            local haveElectricity = square:haveElectricity() or world:isHydroPowerOn()
            local hasObject = false
            local id = getACId(square)

            for i=0, objects:size()-1 do
                
                local obj = objects:get(i);

                if isConnectedAC(obj) then
                    hasObject = true

                    -- power loss
                    if not haveElectricity then
                        obj:setActivated(false)
                    end

                    if obj:isActivated() then

                        local tempOffset = 7.1
                        local targetTemp = vac.temp
                        if not targetTemp then
                            targetTemp = 20
                        end

                        local fanMultiplier = 5
                        local targetFan = vac.fanspeed
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

                            local orientation = vac.orientation

                            -- print (string.format("ADDING HEATSOURCE AT x:%i y:%i z:%i, t:%i, f:%i", x, y, z, targetTemp, targetFan))

                            local hs_x
                            local hs_y
                            local hs_z = vac.z

                            if orientation == "H" then
                                hs_x = vac.x
                                hs_y = vac.y - 2
                            end
                            if orientation == "V" then
                                hs_x = vac.x - 2
                                hs_y = vac.y
                            end

                            -- local heatSquare = cell:getGridSquare(hs_x, hs_y, z)

                            --print ("--temp--")
                            --print (cm:getAirTemperatureForSquare(heatSquare, nil, true))
                            --print ("--temp--")
                            
                            local heatSource = IsoHeatSource.new(hs_x, hs_y, hs_z, targetFan * fanMultiplier, targetTemp + tempOffset)
                            cell:addHeatSource(heatSource)
                            acunit.heatsource = heatSource

                            local soundEmitter = world:getFreeEmitter(vac.x, vac.y, vac.z)
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

            -- gmd indicates ac should be here, but it is not
            -- probably taken or destroyed, so we must unregister it
            -- remove heatsource and sound emmitter
            if not hasObject then
                print ("unregistering missing AC")
                VirtualAC.Remove(vac.x, vac.y, vac.z)

                local acunit = acunits[id]
                if acunit then
                    local heatSource = acunit.heatsource
                    cell:removeHeatSource(heatSource)

                    local soundEmitter = acunit.emitter
                    soundEmitter:setVolumeAll(0)
                    soundEmitter:stopAll()
                    print ("removed!!!")
                    acunits[id] = nil
                end
                
            end
        end
    end
end

local function GameStart (isNewGame)
end

--
-- CONTEXT MENU FUNCTIONS
-- 

local function connectAC (playerObj, ACSquare, isoObject)
    
    -- remove standard iso object and replace it with clothing dryer object
    -- we need clothing dryer because this way game will count is as electrical appliance

    if luautils.walkAdj(playerObj, ACSquare) then
        ISTimedActionQueue.add(TAConnectAC:new(playerObj, ACSquare, isoObject))
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
        if v.name == getItemNameFromFullType("Base.Remote") then
            -- print ("-- this is TV remote")
            local playerObj = getSpecificPlayer(player)
            local cell = getCell()

            local x_pl = playerObj:getX()
            local y_pl = playerObj:getY()
            local z_pl = playerObj:getZ()

            local globalModData = GetAirCondModDataModData()

            local winner_found = false
            local winner_dist = 1000
            local winner_obj = nil
            local winner_square = nil

            for k, vac in pairs(globalModData.WorkingUnits) do

                local square = cell:getGridSquare(vac.x, vac.y, vac.z)
                if square and z_pl == vac.z then
                    local objects = square:getSpecialObjects();
                    for i=0, objects:size()-1 do
                        local obj = objects:get(i);
                        if isConnectedAC(obj) then
                            local dist = math.sqrt(math.pow(vac.x - x_pl, 2) + math.pow(vac.y - y_pl, 2))
                            
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
            else
                local tooltipSettings = ISToolTip:new()
                tooltipSettings.description = "No AC unit found nearby"

                local optionSettings = context:addOption(getText("ContextMenu_StoveSetting"), playerObj, SettingsRemoteAC, winner_square, winner_obj)
                optionSettings.notAvailable = true
                optionSettings.toolTip = tooltipSettings
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
                context:addOption(getText("ContextMenu_Attach"), playerObj, connectAC, ACSquare, isoObject)
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
