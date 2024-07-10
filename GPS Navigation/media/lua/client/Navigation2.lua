local NavUtils = require('NavUtils')
local arr = require('Nav')
local NavUI = require('UI/NavToolTipUI')
local NMiniMap = require('NavMiniMap')

local playerObj,playSound,SymbolData,MarkerData,MapData,vehicleData;
local sensor = false;
local near = 1;
local fx,fy = 0,0
local stopCount = 0;
local angleX,angleY,angleZ;

local function NAV2_OnPlayerUpdate(character)
  if not playerObj then playerObj = character end
  arr.playerNumber = playerObj:getPlayerNum()
  local attachedItems = playerObj:getAttachedItems()
  local checkGPS, checkBattery = false, false

  for i=1, attachedItems:size() do
    local item = attachedItems:getItemByIndex(i-1)
    if item:getModule() == "NAV" and item:getType() == "GPS" then
      checkGPS = true
      arr.attachedGPS = true
      arr.attachedGPSPower = item:isEmittingLight()
      checkBattery = (item:getUsedDelta() == 0)

      if not arr.onTick then 
       Events.OnTick.Add(NAV2_MAIN)
       arr.onTick = true
      end
    end
  end

  if not checkGPS or checkBattery then
    if arr.NavMiniMap and not playerObj:getVehicle() then
      if MarkerData and SymbolData then NAV2_CLEAR(MarkerData, SymbolData) end
        if not checkGPS then
         arr.attachedGPS = false
         arr.NavMiniMap:removeFromUIManager()
         arr.NavMiniMap = nil
        end
    end
  end

  if not checkGPS and arr.onTick and not playerObj:getVehicle() then
    Events.OnTick.Remove(NAV2_MAIN)
    arr.onTick = false
  end

  if not arr.attachedGPSPower and arr.NavMiniMap and not playerObj:getVehicle() then
    if MarkerData and SymbolData then NAV2_CLEAR(MarkerData, SymbolData) end
  end

end
Events.OnPlayerUpdate.Add(NAV2_OnPlayerUpdate)


local function NAV2_OnEnterVehicle(character)
	if character then playerObj = character end
  arr.playerNumber = playerObj:getPlayerNum()
  Events.OnTick.Add(NAV2_MAIN)
  arr.onTick = true
end

Events.OnEnterVehicle.Add(NAV2_OnEnterVehicle)


local function NAV2_OnExitVehicle(character)
  if arr.NavMiniMap then
    arr.NavMiniMap:removeFromUIManager()
    arr.NavMiniMap = nil;
  end
  if MarkerData and (#arr.dis < 1 or not vehicleData:isEngineRunning()) then 
    NAV2_CLEAR(MarkerData, SymbolData)
    Events.OnTick.Remove(NAV2_MAIN) 
    arr.onTick = false
  end
end

Events.OnExitVehicle.Add(NAV2_OnExitVehicle)


function NAV2_OnSwitchVehicleSeat(character)
  local vehicle = character:getVehicle()
	if MarkerData and vehicle and not vehicle:isDriver(character) then
    NAV2_CLEAR(MarkerData, SymbolData)
  end
  if vehicle and not vehicle:isDriver(character) and arr.NavMiniMap then
    arr.NavMiniMap:removeFromUIManager()
    arr.NavMiniMap = nil;
  end
end

Events.OnSwitchVehicleSeat.Add(NAV2_OnSwitchVehicleSeat)


function NAV2_OnDisconnect()
  if MarkerData and SymbolData then
    NAV2_CLEAR(MarkerData, SymbolData)
  end
end

Events.OnSave.Add(NAV2_OnDisconnect)


function NAV2_OnLoad()
	local reci = getScriptManager():FindItem("Radio.RadioMag2");
  if reci then
   local rlist = reci:getTeachedRecipes()
   if not rlist:contains("Make GPS") then rlist:add("Make GPS") end
   --reci:setTeachedRecipes(rlist)
 end
end

Events.OnLoad.Add(NAV2_OnLoad)


function NAV2_CLEAR(marker, symbol)
  if arr.markers and #arr.markers > 0 then marker:clear() end
  if symbol then
    for i = symbol:getSymbolCount()-1, 0, -1 do
      local sy = symbol:getSymbolByIndex(i)
      if sy and string.find(tostring(sy:getClass()), "WorldMapTextureSymbolV1") and (sy:getSymbolID() == "sq" or sy:getSymbolID() == "des") then
      symbol:removeSymbolByIndex(i)
      if isClient() then NavUtils.removeSymbols(symbol, i) end
      end
    end
    arr.dis = {};
    arr.symbolX = {};
    arr.symbolY = {};
    arr.markers = {};
    arr.symbolCount = 0;
    getWorldMarkers():removeAllHomingPoints(playerObj);
    arr.homingPoint = nil;
  end
end

function NAV2_LINE_CLEAR(num, symbol)
  if symbol and arr.symbolCount > 0 then
    for i = symbol:getSymbolCount()-1, num, -1 do
      if i >= 0 then
       local sy = symbol:getSymbolByIndex(i)
       if sy and string.find(tostring(sy:getClass()), "WorldMapTextureSymbolV1") ~= nil and sy:getSymbolID() == "sq" then
         symbol:removeSymbolByIndex(i)
         if isClient() then NavUtils.removeSymbols(symbol, i) end
         arr.symbolCount = arr.symbolCount-1;
       end
      end
    end
  end
end

function NAV2_MAIN()
 local vehicle;
 local joypadData;
 if playerObj then
   vehicle = playerObj:getVehicle()
   vehicleData = vehicle
   joypadData = JoypadState.players[playerObj:getPlayerNum()+1]
 end
--[[
 if isKeyPressed(Keyboard.KEY_G) and playerObj then  
  local attachedItems = playerObj:getAttachedItems()
	for i=1,attachedItems:size() do
		local item = attachedItems:getItemByIndex(i-1)
		if item:getModule() == "NAV" and item:getType() == "GPS" then
      item:setUsedDelta(0);
			playerObj:Say("GPSBattery : " .. tostring(item:getUsedDelta()))
			--break
		end
	end
 end]]

 if (vehicle and vehicle:isDriver(playerObj)) or arr.attachedGPS then

  --if getPlayerMiniMap(playerObj:getPlayerNum()) then getPlayerMiniMap(playerObj:getPlayerNum()).inner.mapAPI:setBoolean("Symbols", false) end

  if not arr.NavMiniMap and ((vehicle and vehicle:getModData().setGPS) or arr.attachedGPS) then
    local w = (getPlayerScreenWidth(playerObj:getPlayerNum()) / 3.5)
    local h = (getPlayerScreenHeight(playerObj:getPlayerNum()) / 3.5)
    local x = getPlayerScreenWidth(playerObj:getPlayerNum()) - w
    local y = getPlayerScreenHeight(playerObj:getPlayerNum()) - h
    arr.NavMiniMap = ISNavigation:new(x, y, w, h, playerObj:getPlayerNum())
    arr.NavMiniMap:initialise()
    arr.NavMiniMap:addToUIManager()
  end

  if arr.NavMiniMap then

    if vehicle and arr.NavMiniMap and not vehicle:getModData().setGPS then
      arr.NavMiniMap:removeFromUIManager()
      arr.NavMiniMap = nil;
    end

    if vehicle and vehicle:isRegulator() and arr.auto then
      if isClient() and vehicle:getRegulatorSpeed() == 0 then
        vehicle:setRegulator(true);
        vehicle:setRegulatorSpeed(40);
      end
      local cars = getCell():getObjectList()
      local cal = Calendar.getInstance();
      for i=cars:size(),1,-1 do
        local car = cars:get(i-1)
        if car:getX()~=vehicle:getX() and car:getY()~=vehicle:getY() and car:getObjectName() == "Vehicle" then
          local vx = playerObj:getForwardDirection():getX()
          local vy = playerObj:getForwardDirection():getY()
          local forwardVector = Vector3f.new(vx, vy, 0)

          local vecToCar = Vector3f.new(car:getX() - vehicle:getX(), car:getY() - vehicle:getY(), 0)
          local distanceToCar = car:DistTo(vehicle)

          -- 벡터의 크기 계산
          local forwardVectorMagnitude = math.sqrt(forwardVector:x() * forwardVector:x() + forwardVector:y() * forwardVector:y())
          local vecToCarMagnitude = math.sqrt(vecToCar:x() * vecToCar:x() + vecToCar:y() * vecToCar:y())
  
          -- 내적 계산
          local dotProduct = forwardVector:x() * vecToCar:x() + forwardVector:y() * vecToCar:y()
  
          -- 각도 계산
          local angle = math.acos(dotProduct / (forwardVectorMagnitude * vecToCarMagnitude)) * 180 / math.pi

          if angle < 15 and distanceToCar < 21 then
           angleX = vehicle:getAngleX()
           angleY = vehicle:getAngleY()
           angleZ = vehicle:getAngleZ()

           NavUtils.selectplaySound("stop_signal", NavUtils.getVol())
           playerObj:Say(getText("IGUI_PlayerText_stop"))
           arr.auto = false
           fx,fy = 0,0
           vehicle:setRegulator(false);
           vehicle:setRegulatorSpeed(0);
           vehicle:setForceBrake()
           getWorldMarkers():removeAllDirectionArrows(playerObj);
          end
        end
     end  
    end

    if ISWorldMap_instance and ISWorldMap_instance:isVisible() then

      local map = ISWorldMap_instance.mapAPI
      local markers = map:getMarkersAPI()
      local symbol = map:getSymbolsAPI()
      SymbolData = symbol
      MarkerData = markers
      MapData = map

      if isKeyPressed(Keyboard.KEY_SPACE) or (joypadData and isJoypadLBPressed(joypadData.id)) then  
        NAV2_CLEAR(markers, symbol)
      end

      if isKeyPressed(Keyboard.KEY_X) or (joypadData ~= nil and isJoypadLTPressed(joypadData.id)) then  
        if arr.symbolCount and arr.symbolCount > 0 then
          --NAV_clear2()
          markers:removeMarker(arr.markers[#arr.markers])

          if #arr.dis > 1 then
           local xx = map:worldToUIX(arr.symbolX[#arr.symbolX-1], arr.symbolY[#arr.symbolY-1])
           local yy = map:worldToUIY(arr.symbolX[#arr.symbolX-1], arr.symbolY[#arr.symbolY-1])
           local sc = symbol:hitTest(xx, yy)

           if sc then
             NAV2_LINE_CLEAR(sc, symbol)

             local xxx = map:worldToUIX(arr.symbolX[#arr.symbolX], arr.symbolY[#arr.symbolY])
             local yyy = map:worldToUIY(arr.symbolX[#arr.symbolX], arr.symbolY[#arr.symbolY])
             local scc = symbol:hitTest(xxx, yyy-5)
             --print("scc : " .. tostring(scc))
             if scc then 
               symbol:removeSymbolByIndex(scc) 
               if isClient() then NavUtils.removeSymbols(symbol, scc) end
             end

             table.remove(arr.symbolX, #arr.symbolX)
             table.remove(arr.symbolY, #arr.symbolY)
             table.remove(arr.markers, #arr.markers)
             table.remove(arr.dis, #arr.dis)

             local textureSymbol = symbol:addTexture("des", arr.symbolX[#arr.symbolX], arr.symbolY[#arr.symbolY])
             textureSymbol:setAnchor(0.5, 1)
             textureSymbol:setScale(ISMap.SCALE)
           end
           else NAV2_CLEAR(markers, symbol)
          end

          if #arr.dis > 0 then
           local red = getSandboxOptions():getOptionByName("NavigationR"):getValue()
           local green = getSandboxOptions():getOptionByName("NavigationG"):getValue()
           local blue = getSandboxOptions():getOptionByName("NavigationB"):getValue()    
           arr.homingPoint = getWorldMarkers():addPlayerHomingPoint(playerObj, tonumber(arr.symbolX[1]), tonumber(arr.symbolY[1]), (red / 255), (green / 255), (blue / 255), 1);
           else 
            arr.homingPoint = nil;
            getWorldMarkers():removeAllHomingPoints(playerObj);
          end

        end
      end

      if isKeyPressed(Keyboard.KEY_LSHIFT) or (joypadData and isJoypadLeftStickButtonPressed(joypadData.id)) then
      
       if arr.dis and #arr.dis < 1 then
        if getSandboxOptions():getOptionByName("NavigationVoice"):getValue() then
          if playSound and playSound:isPlaying() then playSound:stop() end
           if NavUtils.getGTA4() then
             playSound = NavUtils.selectplaySound("GTA4/gta4_st", NavUtils.getVol())
             else playSound = NavUtils.playSound("st_", NavUtils.getVol())
           end
           else playerObj:Say(getText("IGUI_PlayerText_st"))
        end
       end

        local disc = IsoUtils.DistanceTo(playerObj:getX(), playerObj:getY(), map:mouseToWorldX(), map:mouseToWorldY())
        table.insert(arr.dis, disc)
        table.insert(arr.symbolX, map:mouseToWorldX())
        table.insert(arr.symbolY, map:mouseToWorldY())

        MapSymbolDefinitions.getInstance():addTexture("des", "media/textures/des.png")
        MapSymbolDefinitions.getInstance():addTexture("sq", "media/textures/sq.png")
        if #arr.dis > 1 then 
          local xx = map:worldToUIX(arr.symbolX[#arr.dis-1], arr.symbolY[#arr.dis-1])
          local yy = map:worldToUIY(arr.symbolX[#arr.dis-1], arr.symbolY[#arr.dis-1])
          local scc = symbol:hitTest(xx, yy-5)
          if scc then 
            symbol:removeSymbolByIndex(scc) 
            if isClient() then NavUtils.removeSymbols(symbol, scc) end
          end
        end
        local textureSymbol = symbol:addTexture("des", map:mouseToWorldX(), map:mouseToWorldY())
        textureSymbol:setAnchor(0.5, 1)
        textureSymbol:setScale(ISMap.SCALE)

        local x1 = 0;
        local y1 = 0;
        if #arr.dis > 1 then
          x1 = round(map:worldToUIX(arr.symbolX[#arr.symbolX-1],arr.symbolY[#arr.symbolY-1]),0)
          y1 = round(map:worldToUIY(arr.symbolX[#arr.symbolX-1],arr.symbolY[#arr.symbolY-1]),0)
        else
          x1 = round(map:worldToUIX(playerObj:getX(),playerObj:getY()),0)
          y1 = round(map:worldToUIY(playerObj:getX(),playerObj:getY()),0)
        end
        local x2 = round(map:worldToUIX(arr.symbolX[#arr.symbolX],arr.symbolY[#arr.symbolY]),0)
        local y2 = round(map:worldToUIY(arr.symbolX[#arr.symbolX],arr.symbolY[#arr.symbolY]),0)
      
        local points = NavUtils.bresenhamLine(x1, y1, x2, y2)

        local red = getSandboxOptions():getOptionByName("NavigationR"):getValue()
        local green = getSandboxOptions():getOptionByName("NavigationG"):getValue()
        local blue = getSandboxOptions():getOptionByName("NavigationB"):getValue()

        for _, point in ipairs(points) do
          --print("x: " .. point[1] .. ", y: " .. point[2])
          local textureSymbol2 = symbol:addTexture("sq", map:uiToWorldX(point[1],point[2]), map:uiToWorldY(point[1],point[2]))

          textureSymbol2:setRGBA((red / 255), (green / 255), (blue / 255), 1.0)
          textureSymbol2:setAnchor(0.5, 0.5)
          textureSymbol2:setScale(0.3)
          arr.symbolCount = arr.symbolCount + 1;
        end

        local addMarker = markers:addGridSquareMarker(map:mouseToWorldX(), map:mouseToWorldY(), 0.5, (red / 255), (green / 255), (blue / 255), 0.5)
        table.insert(arr.markers, addMarker)
        if #arr.dis > 1 then
         getWorldMarkers():removeAllHomingPoints(playerObj);
         arr.homingPoint = getWorldMarkers():addPlayerHomingPoint(playerObj, tonumber(arr.symbolX[1]), tonumber(arr.symbolY[1]), (red / 255), (green / 255), (blue / 255), 1);
         else arr.homingPoint = getWorldMarkers():addPlayerHomingPoint(playerObj, map:mouseToWorldX(), map:mouseToWorldY(), (red / 255), (green / 255), (blue / 255), 1);
        end

      end

    end

    if vehicle and (isKeyPressed(Keyboard.KEY_LCONTROL) or (joypadData and isJoypadRightStickButtonPressed(joypadData.id))) and #arr.dis > 0 then     
    
      if not vehicle:isRegulator() then
       if getSandboxOptions():getOptionByName("NavigationVoice"):getValue() then
         NavUtils.playSound("auto_", NavUtils.getVol())
         else playerObj:Say(getText("IGUI_PlayerText_autoon"))
       end
       arr.auto = true;
       vehicle:setRegulator(true);
       vehicle:setRegulatorSpeed(round(vehicle:getCurrentSpeedKmHour(),0));
       getWorldMarkers():addDirectionArrow(playerObj, tonumber(arr.symbolX[1]), tonumber(arr.symbolY[1]), playerObj:getZ(), "arrow", 255, 0, 0, 0.5);
       else
       if getSandboxOptions():getOptionByName("NavigationVoice"):getValue() then
         NavUtils.playSound("autooff_", NavUtils.getVol())
         else playerObj:Say(getText("IGUI_PlayerText_auttooff"))
       end
       arr.auto = false;
       fx,fy = 0,0
       vehicle:setRegulator(false);
       vehicle:setRegulatorSpeed(0);
       getWorldMarkers():removeAllDirectionArrows(playerObj);
      end

    end

    if vehicle and arr.auto and vehicle:isRegulator() and arr.dis and #arr.dis > 0 then
      
      local playerX = playerObj:getX()
      local playerY = playerObj:getY()
      local targetX = arr.symbolX[1]
      local targetY = arr.symbolY[1]

      if fx == 0 and fy == 0 then
          fx = targetX
          fy = targetY
      end

      local distance = IsoUtils.DistanceTo(playerX, playerY, fx, fy)
      local playerDirection = playerObj:getForwardDirection()
      local objAngle1 = math.deg(playerDirection:getDirection() + math.pi / 2)
      if objAngle1 < 0 then objAngle1 = 360 + objAngle1 end

      local objAngle2 = NavUtils.getAngle2D(targetX, targetY, playerX, playerY)
      objAngle2 = objAngle2 - 360
      local offset2D = NavUtils.getAngleOffset2D(objAngle1, objAngle2)
      local sv = offset2D

      if vehicle:getAngleY() > 0 or math.abs(vehicle:getAngleX()) > 170 then
          offset2D = offset2D - math.abs(vehicle:getAngleY()) * 2
       else
          offset2D = offset2D + math.abs(vehicle:getAngleY()) * 2
      end

      local mxy = 0
      if math.abs(playerDirection:getX()) > math.abs(playerDirection:getY()) then
          mxy = math.abs(fx - playerX)
       else
          mxy = math.abs(fy - playerY)
      end

      if math.abs(mxy) < 1 and distance < 5 then
          if math.abs(sv) > 180 then sv = math.abs(sv) - 180 end
          if math.abs(playerDirection:getX()) > math.abs(playerDirection:getY()) then
              if targetY < playerY then
                  offset2D = math.abs(sv) + math.abs(vehicle:getAngleY())
               else
                  offset2D = math.abs(sv) - math.abs(vehicle:getAngleY())
              end
              if math.abs(offset2D) > 0 then
                  vehicle:setAngles(offset2D, 0, offset2D)
              end
             else
              local add = 1
              if targetX < playerX then
                  add = -1
              end
              offset2D = math.abs(sv) * add
              if math.abs(offset2D) > 0 then
                  vehicle:setAngles(vehicle:getAngleX(), offset2D, vehicle:getAngleZ())
              end
          end
          fx = targetX
          fy = targetY
      end

    end

    if SymbolData and arr.symbolCount > 0 then
      local idx = 0;

      for i = 0, SymbolData:getSymbolCount()-1 do
       local sy = SymbolData:getSymbolByIndex(i)
       if sy ~= nil and string.find(tostring(sy:getClass()), "WorldMapTextureSymbolV1") ~= nil and sy:getSymbolID() == "sq" then
         idx = i;
         break;
       end
      end

      local syy = SymbolData:getSymbolByIndex(idx)
      local sbD = IsoUtils.DistanceTo(playerObj:getX(), playerObj:getY(), syy:getWorldX(), syy:getWorldY());
      if sbD < 11 then
        SymbolData:removeSymbolByIndex(idx)
        if isClient() then NavUtils.removeSymbols(SymbolData, idx) end
        arr.symbolCount = arr.symbolCount-1;
      end
    end

    if #arr.markers > 1 then
      for i = 1, #arr.markers - 1 do
        local fds = IsoUtils.DistanceTo(playerObj:getX(), playerObj:getY(), tonumber(arr.symbolX[i]), tonumber(arr.symbolY[i])); 
        if fds and fds < 21 then
          arr.NavMiniMap.nRight:setVisible(false)
          arr.NavMiniMap.nLeft:setVisible(false)
          sensor = false;
          getWorldMarkers():removeAllHomingPoints(playerObj);
          arr.homingPoint = nil;
          local ssx, ssy = 0, 0;
          if i + 1 <= #arr.markers then
            ssx = arr.symbolX[2];
            ssy = arr.symbolY[2];
          end

          table.remove(arr.dis, 1); 
          arr.dis[1] = IsoUtils.DistanceTo(playerObj:getX(), playerObj:getY(), tonumber(arr.symbolX[i+1]), tonumber(arr.symbolY[i+1])); 
          MarkerData:removeMarker(arr.markers[i])
          --local xx = MapData:worldToUIX(arr.symbolX[i], arr.symbolY[i])
          --local yy = MapData:worldToUIY(arr.symbolX[i], arr.symbolY[i])
          --local scc = SymbolData:hitTest(xx, yy-5)
          --if scc then SymbolData:removeSymbolByIndex(scc) end
          --if isClient() then NavUtils.removeSymbols(symbol, scc) end
          if ssx ~= 0 and ssy ~= 0 then
             local xx = MapData:worldToUIX(arr.symbolX[i], arr.symbolY[i])
             local yy = MapData:worldToUIY(arr.symbolX[i], arr.symbolY[i])
             local scc = SymbolData:hitTest(xx, yy-5)
             for i=scc-1,0,-1 do
               local sy = SymbolData:getSymbolByIndex(i)
               if sy ~= nil and string.find(tostring(sy:getClass()), "WorldMapTextureSymbolV1") ~= nil and (sy:getSymbolID() == "sq" or sy:getSymbolID() == "des") then
                 SymbolData:removeSymbolByIndex(i)
                 if isClient() then NavUtils.removeSymbols(SymbolData, i) end
                 arr.symbolCount = arr.symbolCount-1;
               end
             end
          end
          table.remove(arr.symbolX, 1); 
          table.remove(arr.symbolY, 1); 
          table.remove(arr.markers, 1); 
          local red = getSandboxOptions():getOptionByName("NavigationR"):getValue()
          local green = getSandboxOptions():getOptionByName("NavigationG"):getValue()
          local blue = getSandboxOptions():getOptionByName("NavigationB"):getValue()  
          if ssx ~= 0 and ssy ~= 0 then arr.homingPoint = getWorldMarkers():addPlayerHomingPoint(playerObj, tonumber(ssx), tonumber(ssy), (red / 255), (green / 255), (blue / 255), 1); end
         end
      end
    end

    local addspd = 0;
    local enddis,enddis2;
    if vehicle and round(vehicle:getCurrentSpeedKmHour(),0) > 49 then addspd = round(round(vehicle:getCurrentSpeedKmHour(),0)/5,0); end
    if arr.dis and #arr.dis > 0 then 
      enddis = IsoUtils.DistanceTo(playerObj:getX(), playerObj:getY(), tonumber(arr.symbolX[1]), tonumber(arr.symbolY[1])); 
      enddis2 = IsoUtils.DistanceTo(playerObj:getX(), playerObj:getY(), tonumber(arr.symbolX[#arr.symbolX]), tonumber(arr.symbolY[#arr.symbolY])); 
      if stopCount == 0 then stopCount = Calendar.getInstance():getTimeInMillis() end
      local cal = Calendar.getInstance();
      cal:setTimeInMillis(Calendar.getInstance():getTimeInMillis() - stopCount)
      local sec = cal:get(Calendar.SECOND);

      if sec > 5 and arr.dis[1] < enddis and (enddis - arr.dis[1]) > 10 then
        NavUtils.selectplaySound("outwarning", NavUtils.getVol())
        for i=1, 5 do
         arr.NavMiniMap.mMap:setVisible(false)
         arr.NavMiniMap.mMap:setVisible(true)
        end
        playerObj:Say(getText("IGUI_PlayerText_Navout"))
        stopCount = Calendar.getInstance():getTimeInMillis()
      end
    end
  
    if enddis and #arr.dis > 1 and enddis < 45 + addspd and arr.markers and not sensor then
      local playerPos = Vector2.new(playerObj:getX(), playerObj:getY())
      local symbolPos = Vector2.new(tonumber(arr.symbolX[2]), tonumber(arr.symbolY[2]))

      local forwardDir = playerObj:getForwardDirection()
      local forwardVec = Vector2.new(forwardDir:getX(), forwardDir:getY())

      local toSymbolVec = Vector2.new(symbolPos:getX() - playerPos:getX(), symbolPos:getY() - playerPos:getY())

      local crossProduct = forwardVec:getX() * toSymbolVec:getY() - forwardVec:getY() * toSymbolVec:getX()

      sensor = true;
      local land = ZombRand(100)

      if not getSandboxOptions():getOptionByName("NavigationVoice"):getValue() then NavUtils.selectplaySound("bb", NavUtils.getVol()) end
      if crossProduct > 15 then
        -- 심볼이 오른쪽에 있을 경우
        arr.NavMiniMap.nRight:setVisible(true)
        if getSandboxOptions():getOptionByName("NavigationVoice"):getValue() then
          if NavUtils.getGTA4() then
              if land < 51 then
                  NavUtils.selectplaySound("GTA4/gta4_right", NavUtils.getVol())
              else
                  NavUtils.selectplaySound("GTA4/gta4_right_bing", NavUtils.getVol())
              end
          else
              NavUtils.playSound("right_", NavUtils.getVol())
          end
         else
          playerObj:Say(getText("IGUI_PlayerText_right"))
        end
       elseif crossProduct < -15 then
        -- 심볼이 왼쪽에 있을 경우
        arr.NavMiniMap.nLeft:setVisible(true)
        if getSandboxOptions():getOptionByName("NavigationVoice"):getValue() then
            if NavUtils.getGTA4() then
                if land < 51 then
                    NavUtils.selectplaySound("GTA4/gta4_left", NavUtils.getVol())
                 else
                    NavUtils.selectplaySound("GTA4/gta4_left_bing", NavUtils.getVol())
                end
             else
                NavUtils.playSound("left_", NavUtils.getVol())
            end
         else
            playerObj:Say(getText("IGUI_PlayerText_left"))
        end
      end
    end

    if enddis2 and enddis2 < 30 and enddis2 > 5 and near == 1 then
      if getSandboxOptions():getOptionByName("NavigationVoice"):getValue() then
        if NavUtils.getGTA4() then
          NavUtils.selectplaySound("GTA4/gta4_in", NavUtils.getVol())
          else NavUtils.playSound("in_", NavUtils.getVol())
        end
        else playerObj:Say(getText("IGUI_PlayerText_in"))
      end
      near = 2;
    end

    if enddis2 and enddis2 < 6 and near == 2 then
      arr.NavMiniMap.nRight:setVisible(false)
      arr.NavMiniMap.nLeft:setVisible(false)
      if vehicle and arr.auto and vehicle:isRegulator() then
         fx,fy = 0,0
         arr.auto = false
         vehicle:setRegulator(false);
         vehicle:setRegulatorSpeed(0);
         vehicle:setForceBrake()
         getWorldMarkers():removeAllDirectionArrows(playerObj);
      end
      if getSandboxOptions():getOptionByName("NavigationVoice"):getValue() then
          if NavUtils.getGTA4() then
            NavUtils.selectplaySound("GTA4/gta4_en", NavUtils.getVol())
            else NavUtils.playSound("en_", NavUtils.getVol())
          end
          else playerObj:Say(getText("IGUI_PlayerText_end"))
      end
      near = 1;
      NAV2_CLEAR(MarkerData, SymbolData)
   end
  end
 end
end

--Events.OnTick.Add(NAV2_MAIN)