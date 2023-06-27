-- Return true if recipe is valid, false otherwise
function OnTest_DrillBatteryRemoval (sourceItem, result)
	--return sourceItem:getUsedDelta() > 0;
end

-- When creating item in result box of crafting panel.
function OnCreate_DrillBatteryRemoval(items, result, player)
	for i=0, items:size()-1 do
		local item = items:get(i)
		-- we found the battery, we change his used delta according to the battery
		if item:getType() == "CordlessDrill" then
			result:setUsedDelta(item:getUsedDelta());
			-- then we empty the torch used delta (his energy)
			item:setUsedDelta(0);
		end
	end
	player:getInventory():AddItem("CordlessDrillWithoutBattery")
end


-- Return true if recipe is valid, false otherwise
function OnTest_DrillBatteryInsert(sourceItem, result)
	--if sourceItem:getType() == "Torch" or sourceItem:getType() == "HandTorch" or sourceItem:getType() == "Rubberducky2" then
		--return sourceItem:getUsedDelta() == 0; -- Only allow the battery inserting if the flashlight has no battery left in it.
	--end
	return true -- the battery
end

-- When creating item in result box of crafting panel.
function OnCreate_DrillBatteryInsert(items, result, player)
  for i=0, items:size()-1 do
	-- we found the battery, we change his used delta according to the battery
	if items:get(i):getType() == "CordlessDrillBattery" then
		result:setUsedDelta(items:get(i):getUsedDelta());
	end
  end
end