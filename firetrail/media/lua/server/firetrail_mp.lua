local commands = {}

local randDurationFireEnergy = {250,300,350}
function commands.StartFire(args)
	local sq = getCell():getGridSquare(args.square_x, args.square_y, args.square_z)
	IsoFireManager.StartFire(getCell(), sq, true, 100, randDurationFireEnergy[ZombRand(3)+1]);
end
local function onClientCommand(module, command, player, args)
	if module == "firetrail" then
		commands[command](args)
		--Commands.object.addFireOnSquare(player, args) --almost can use it, but will lost the random energy trigger effect, that can happens and be customized tweaked
		
	end
end

Events.OnClientCommand.Add(onClientCommand)


--[[
Commands.object.addFireOnSquare = function(player, args)
	local sq = getCell():getGridSquare(args.x, args.y, args.z)
	IsoFireManager.StartFire(getCell(), sq, true, 100, 500);
end

old start fire

	--local square = nil
	--if args.squareServer == nil then 
	----return
	--	local x = args.square_x
	--	local y = args.square_y
	--	local z = args.square_z
	--	square = getCell():getGridSquare(x, y, z)
	--else
	--	square = args.squareServer
	--end
	--
	--IsoFireManager.StartFire(square:getCell(), square, true, 100, randDurationFireEnergy[ZombRand(3)+1]);
	
	--from Commands.object.addFireOnSquare
]]