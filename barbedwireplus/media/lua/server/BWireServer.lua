-- No client
if not isServer() and BWirePlus:isMultiplayer() then return end

BWirePlus.zombieTargets = {};

function BWirePlus:zombieTicksServer()
	BWirePlus:sleepDo(SandboxVars.BarbedWirePlus.ZombieTickTime or 0.25, BWirePlus.zombieTicksServer);
	for i,data in pairs(BWirePlus.zombieTargets) do
		if data.zombie then
			sendServerCommand(data.player, "BWirePlus","handicapZombie", { ['target'] = data.id } );
		end
	end 

	BWirePlus.zombieTargets = {};
end

local function Init()
	BWirePlus:sleepDo(SandboxVars.BarbedWirePlus.ZombieTickTime or 0.25, BWirePlus.zombieTicksServer);
end

Events.OnInitGlobalModData.Add(Init);

local function remoteExecServer(module, command, player, args)
	if module ~= "BWirePlus" then return end;

	if command == "validateZombie" then
		if args then
			if args.target then
				local zombie = BWirePlus:getZombieByID(args.target);
				if zombie then
					BWirePlus.zombieTargets[args.target] = { ['zombie'] = zombie, ['player'] = player, ['id'] = args.target } ; 
				end
			end
		end
	end 
end
Events.OnClientCommand.Add(remoteExecServer);