require('recipecode')

function Recipe.OnTest.NavGPSbatteryInsert(sourceItem, result)
	if sourceItem:getModule() == "NAV" and sourceItem:getType() == "GPS" then
		return sourceItem:getUsedDelta() == 0; -- Only allow the battery inserting if the flashlight has no battery left in it.
	end
	return true -- the battery
end

function Recipe.OnCreate.NavGPSbatteryInsert(items, result, player)
  for i=0, items:size()-1 do
	-- we found the battery, we change his used delta according to the battery
	if items:get(i):getType() == "Battery" then
		result:setUsedDelta(items:get(i):getUsedDelta());
	end
  end
end

function Recipe.OnTest.NavGPSBatteryRemoval (sourceItem, result)
	return sourceItem:getUsedDelta() > 0;
end

function Recipe.OnCreate.NavGPSBatteryRemoval(items, result, player)
	for i=0, items:size()-1 do
		local item = items:get(i)
		-- we found the battery, we change his used delta according to the battery
		if item:getModule() == "NAV" and item:getType() == "GPS" then
			result:setUsedDelta(item:getUsedDelta());
			-- then we empty the torch used delta (his energy)
			item:setUsedDelta(0);
		end
	end
end

function Recipe.OnCreate.DismantleNavGPS(items, result, player)
	for i=1,items:size() do
		local item = items:get(i-1)
		if item:getModule() == "NAV" and item:getType() == "GPS" then
			if item:getUsedDelta() > 0 then
				local battery = player:getInventory():AddItem("Base.Battery")
				if battery then
					battery:setUsedDelta(item:getUsedDelta())
				end
			end
			break
		end
	end
end