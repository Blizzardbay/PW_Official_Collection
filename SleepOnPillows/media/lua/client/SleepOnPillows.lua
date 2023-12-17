local Functions = require "SleepOnPillows/Functions"

function startSOPsentry()
	Events.EveryOneMinute.Add(SOPsleepcheck)
end

function SOPsleepcheck()
	local player = getPlayer()
	if player:isAsleep() then
		local playerInventory = player:getInventory();
		local pillowinInventory = false
			pillowinInventory = playerInventory:contains("Base.Pillow");
		local pillowinVicinity = false

		if not pillowinInventory then
			pillowinVicinity = Functions.searchSurrounding(player, "Base.Pillow")
		end

		if pillowinInventory or pillowinVicinity then
			local fatMin = (player:getStats():getFatigue() - .0005)
			player:getStats():setFatigue(math.max(0, fatMin))
			if player:getStats():getFatigue() <= 0 then
				player:forceAwake()
			end
		end
	end
end

Events.OnGameStart.Add(startSOPsentry)