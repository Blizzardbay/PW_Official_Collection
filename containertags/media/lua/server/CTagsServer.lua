-- No client
if not isServer() and CTags:isMultiplayer() then return end

function CTags:tagsManagerServer()
	CTags:sleepDo(1, CTags.tagsManagerServer);

	local CTagsData = ModData.getOrCreate("ContainerTagDataFaction");
	-- Version mismatch or fresh server
	if not CTagsData.version or CTagsData.version ~= CTags.tagsVersion then
		CTagsData = {};
		CTagsData.version = CTags.tagsVersion;
		CTagsData.tags = {}
		ModData.add("ContainerTagDataFaction", CTagsData);
		ModData.transmit("ContainerTagDataFaction");
		print('Version mismatch for container tags, resetting.')
		return
	end

	-- Align faction data to tag data
	local tagsKeyset = {};
	local factionsKeyset = {};
	local factions = Faction.getFactions();
	local n = 0;

	for k, v in pairs(CTagsData.tags) do
		n = n + 1
		tagsKeyset[n]= k
	end
	for i = 0, factions:size()-1 do
		local faction = factions:get(i);
		local name = faction:getName();
		table.insert(factionsKeyset, name);
	end

	-- Check stale faction data
	local cleanup = false;
	for i, tag in pairs(tagsKeyset) do 
		if not CTags:tableContains(factionsKeyset, tag) then
			print('Removing stale tag data: ' .. tag);
			CTagsData.tags[tag] = nil;
			cleanup = true;
		end
	end

	-- Remove it
	if cleanup then
		ModData.add("ContainerTagDataFaction", CTagsData);
		ModData.transmit("ContainerTagDataFaction");
	end		
end 

local function Init()
	CTags:sleepDo(0, CTags.tagsManagerServer);
end 

Events.OnInitGlobalModData.Add(Init);

local function remoteExecServer(module, command, player, args)
	if module ~= "CTags" then return end;
	local CTagsData = ModData.getOrCreate("ContainerTagDataFaction");

	local factionName = args.factionName;
	local playerName = player:getUsername();
	local squareCoords = args.square;
	local spriteName = args.spriteName;
	local squareID = CTags:formSquareID(getCell():getGridSquare(squareCoords[1], squareCoords[2], squareCoords[3]), squareCoords[4], spriteName)
	if not squareID then return end; -- Something is wrong
	if not CTagsData.tags[factionName] then CTagsData.tags[factionName] = {} end;

	if command == "update" then
		local text = args.tag;
		local color = args.color;

		-- Update
		CTagsData.tags[factionName][squareID] = { ['square'] = {squareCoords[1], squareCoords[2], squareCoords[3], squareCoords[4]}, ['tag'] = text, ['color'] = {color[1], color[2], color[3]}, ['spriteName'] = spriteName, ['playerName'] = playerName }; 
	end 

	if command == "delete" then
		CTagsData.tags[factionName][squareID] = { ['playerName'] = playerName }; 
	end 

	-- Transmit
	ModData.add("ContainerTagDataFaction", CTagsData);
	ModData.transmit("ContainerTagDataFaction");	
end
Events.OnClientCommand.Add(remoteExecServer);