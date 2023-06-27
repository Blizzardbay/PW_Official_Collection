function CanMetalworkStation(item, result)
	--print("can sew?")
	if not item then return false end
	local power = nil
	local workbench = nil
	local player = getSpecificPlayer(0)
	local square = nil
	--workbench = FindWorkbench(player, "Metalwork Station")
	--if not workbench then workbench = FindAppliance(player, "Metalwork Station") end
	workbench = FindAppliance(player, "Metalwork Station")
	if workbench then square = workbench:getSquare() end
	if square and (getGameTime():getNightsSurvived() < getSandboxOptions():getElecShutModifier())
	and not square:isOutside() then
		power = true
	end	
	if square and square:haveElectricity() then			
		power = true
	end
	if (not workbench)
	--or (not AdjacentFreeTileFinder.isTileOrAdjacent(getSpecificPlayer(0):getCurrentSquare(), sewingMachine:getSquare()))
	--or ( square and not player:CanSee(square))
	--or not player:isCanSee(square)
	--or not square:isCanSee(0)
	--or LosUtil():lineClearCollide(player:getX(), player:getY(), player:getZ(),square:getX(), square:getY(), square:getZ(),nil)
	then
		power = false
	end
	if workbench and power then
		local vektor = nil
		vektor = player:getDirectionAngle()
		--vektor = Vector2():set(square:getX()-player:getX(), square:getY()-player:getY())
		--print("vektor: " .. tostring(vektor))
	
	end
	if square then 
		--print("Can See1: " .. tostring(square:isCanSee(0)))
		--print("Can See2: " .. tostring(player:CanSee(workbench)))
	end
	--print("Power? " .. tostring(power))
	if power then return true end
	return false
end


-- -- Return true if recipe is valid, false otherwise
-- function OnTest_DrillBatteryRemoval (sourceItem, result)
	-- --return sourceItem:getUsedDelta() > 0;
-- end

-- -- When creating item in result box of crafting panel.
-- function OnCreate_DrillBatteryRemoval(items, result, player)
	-- for i=0, items:size()-1 do
		-- local item = items:get(i)
		-- -- we found the battery, we change his used delta according to the battery
		-- if item:getType() == "CordlessDrill" then
			-- result:setUsedDelta(item:getUsedDelta());
			-- -- then we empty the torch used delta (his energy)
			-- item:setUsedDelta(0);
		-- end
	-- end
	-- player:getInventory():AddItem("CordlessDrillWithoutBattery")
-- end


-- -- Return true if recipe is valid, false otherwise
-- function OnTest_DrillBatteryInsert(sourceItem, result)
	-- --if sourceItem:getType() == "Torch" or sourceItem:getType() == "HandTorch" or sourceItem:getType() == "Rubberducky2" then
		-- --return sourceItem:getUsedDelta() == 0; -- Only allow the battery inserting if the flashlight has no battery left in it.
	-- --end
	-- return true -- the battery
-- end

-- -- When creating item in result box of crafting panel.
-- function OnCreate_DrillBatteryInsert(items, result, player)
  -- for i=0, items:size()-1 do
	-- -- we found the battery, we change his used delta according to the battery
	-- if items:get(i):getType() == "CordlessDrillBattery" then
		-- result:setUsedDelta(items:get(i):getUsedDelta());
	-- end
  -- end
-- end

-- function WhatDirection()
	-- --if waypoint then
		-- local x = math.abs(playerObj:getX()-waypoint.beaconLock_X)
		-- local y = math.abs(playerObj:getY()-waypoint.beaconLock_Y)
			-- local distance = ((x*x) + (y*y) )
			-- distance = math.floor(math.sqrt(distance))
		-- local kilos = false
		-- local kdistance = nil
		-- if distance > 1000 then			
			-- kilos = true
			-- kdistance = ((math.floor(distance/100)))
			-- kdistance = kdistance/10
		-- elseif distance > 100 then
			-- distance = ((math.floor(distance/10)) * 10)
		-- end
		
		
		
		-- local x = math.floor(waypoint.beaconLock_X)
		-- local y = math.floor(waypoint.beaconLock_Y)
		-- local text = ("Direction: " .. tostring(distance) .. " meters")
		-- if kilos then text = (("Waypoint: " .. tostring(kdistance) .. " km")) end
		-- local x = math.floor(playerObj:getX()-waypoint.beaconLock_X)
		-- local y =  math.floor(playerObj:getY()-waypoint.beaconLock_Y)
		-- local north = nil
		-- local south = nil
		-- local east = nil
		-- local west = nil
		-- if y < 0 then
			-- south = math.abs(y)
		-- end
		-- if y > 0 then
			-- north = math.abs(y)
		-- end
		-- if x > 0 then
			-- west = math.abs(x)
		-- end
		-- if x < 0 then
			-- east = math.abs(x)
		-- end
		-- if distance > 0 then
			-- if south then
				-- if west and west > (south*2) then
					-- text = (text .. " West")
				-- elseif west and west > (south/2) then
					-- text = (text .. " Southwest")
				-- elseif east and east > (south*2) then
					-- text = (text .. " East")
				-- elseif east and east > (south/2) then
					-- text = (text .. " Southeast")
				-- else
					-- text = (text .. " South")
				-- end
			-- elseif north then	
				-- if west and west > (north*2) then
					-- text = (text .. " West")
				-- elseif west and west > (north/2) then
					-- text = (text .. " Northwest")
				-- elseif east and east > (north*2) then
					-- text = (text .. " East")
				-- elseif east and east > (north/2) then
					-- text = (text .. " Northeast")
				-- else	
					-- text = (text .. " North")
				-- end
			-- elseif west then
					-- text = (text .. " West")
			-- elseif east then
				-- text = (text .. " East")
			-- end
		-- end
	-- print(text)
		-- --context:addOption(getText((text)))
		-- --context:addOption(getText(distortText(text)))-- , items, ISInventoryPaneContextMenu.onWearItems, player);
					-- text = nil
   -- -- end
-- end