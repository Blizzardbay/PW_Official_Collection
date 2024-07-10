if isServer() then return end

-- Add context action
local function contextFunc(player, context, worldobjects, test)
	CTags:contextFunction(player, context, worldobjects, test)
end
Events.OnFillWorldObjectContextMenu.Add(contextFunc);

function CTags:formDrawData(data, faction)
	local player = getPlayer();

	for i, tag in pairs(data) do 
		local squareCoords = tag.square;
		local isPresent = false;

		if squareCoords then
			-- Player is on the same Z level
			if player:getZ() == squareCoords[3] then
				-- Find square
				local square = getCell():getGridSquare(squareCoords[1], squareCoords[2], squareCoords[3]);

				-- Square is existing
				if square then 
					local objects = square:getObjects(); -- All square objects for comparison.
					local renderOffsetData = (squareCoords[4] or 0); -- Elevation of the object in question.
					local spriteNameData = (tag.spriteName or "None"); -- Sprite name of the object in question.
					local squareID = CTags:formSquareID(square, renderOffsetData, spriteNameData);

					-- Iterate
					for j=0, objects:size()-1 do
						local object = objects:get(j);
						local spriteName = object:getSprite():getName();
						local renderOffset = object:getRenderYOffset();
						
						-- Its still here
						if spriteName == spriteNameData and renderOffset == renderOffsetData then
							isPresent = true;
							break
						end

					end

					-- Present
					if isPresent then
						-- Conditionals
						local isSquareVisible = square:getCanSee(player:getPlayerNum()); -- Checks for line of sight mode
						local squareDistance = IsoUtils.DistanceTo(player:getX(), player:getY(), square:getX(), square:getY()); -- Between player and square
						local hoveredSquare = CTags:getSquareFromScreen(); -- Square to align with in hovering mode						
						local canSee = true;
						local closeEnough = true;
						local hovered = true;

						-- Verify conditions
						if CTags.settings.isLineOfSight then canSee = isSquareVisible end;
						if CTags.settings.maxRange then closeEnough = squareDistance <= CTags.settings.maxRange end;
						if CTags.settings.isOnHover then hovered = IsoUtils.DistanceTo(square:getX(), square:getY(), hoveredSquare:getX(), hoveredSquare:getY()) <= 2 end;

						-- Confirm and add						
						if canSee and closeEnough and hovered then
							CTags.drawData:add({ ['square'] = square, ['coords'] = squareCoords, ['text'] = tag.tag, ['color'] = tag.color });
						end
					else 
						-- Not present
						if squareID then
							if faction then 
								local factionName = faction:getName();
								sendClientCommand(player, "CTags", "delete", { ['factionName'] = factionName, ['square'] = squareCoords, ['spriteName'] = tag.spriteName });
							else
								local tagData = ModData.getOrCreate("ContainerTagData");
								tagData.tags[squareID] = {};
							end 
						end
					end 
				end			
			end
		end
	end
end 

-- Tag tracker
function CTags:tagTracker()
	CTags:sleepDo(0.1, CTags.tagTracker);

	-- Clear drawData
	CTags.drawData = ArrayList.new(); 

	-- Disabled, exit
	if CTags.mode == 0 then return end;
	local player = getPlayer();

	-- Check if faction was disbanded or if you are in (tag anything mode)
	if CTags.mode == 2 and not CTags:getFaction() then
		CTags.mode = 1;
		CTagsPanel.button:setImage(getTexture("media/textures/note.png"));
	end

	-- Personal tags only
	if CTags.mode == 1 then 
		local tagData = ModData.getOrCreate("ContainerTagData");
		if not tagData.version or tagData.version ~= CTags.tagsVersion then
			-- Version mismatch
			tagData = {};
			tagData.version = CTags.tagsVersion;
			tagData.tags = {};
			ModData.add("ContainerTagData", tagData);
			print('Version mismatch for container tags, resetting.')
		end

		local data = tagData.tags;
		CTags:formDrawData(data);
	end 
	-- Faction tags only
	if CTags.mode == 2 then
		local faction = CTags:getFaction(); 

		if faction then 
			local factionName = faction:getName();
			local tagData = ModData.getOrCreate("ContainerTagDataFaction");
			if not tagData.tags then tagData.tags = {} end;
			if not tagData.tags[factionName] then tagData.tags[factionName] = {} end;
			local data = tagData.tags[factionName];
			CTags:formDrawData(data, faction);
		end 
	end 

	-- Run overlays
	if getPlayer() and not CTagsOverlay.window then
		CTagsOverlay:make()
	end 

	if getPlayer() and not CTagsPanel.window then
		local faction = CTags:getFaction()
		if faction then 
			CTags.mode = 2;
		else 
			CTags.mode = 1;
		end		
		CTagsPanel:make()
	end
end

function CTags:readSettings()
	local strm = getFileReader("ctagssettings.cfg", true);
	local settingsJSON = ""

	while true do
		local line = strm:readLine()
		if line == nil then break
		else
			settingsJSON = settingsJSON .. line .. "\r\n"
		end
	end

	local code = loadstring("data = " .. settingsJSON);
	if code then
		code();
		return data
	else
		print("getModFileReader: Failed to compile /Zomboid/Lua/ctagssettings.cfg");
	-- 	return nil
	end
end

function CTags:writeSettings(json)
	local fileWriter = getFileWriter("ctagssettings.cfg", true, false)
	local n = 0

	local function dump(o)
		if type(o) == 'table' then
			local s = '{ '
			for k,v in pairs(o) do
				if type(k) ~= 'number' then k = '"'..k..'"' end
				if type(v) == 'string' then v = '"'..v..'"' end
				s = s .. '['..k..'] = ' .. dump(v) .. ', '
			end
			return s .. '} '
		else
			return tostring(o)
		end
	end	

	-- Save
	local jsonFormatted = dump(json);
	fileWriter:write(jsonFormatted);
	fileWriter:close();
end

-- Runtime
CTags.settings = CTags:readSettings();

-- First timer
if not CTags.settings then
	CTags.settings = {
		["maxRange"] = 10,
		["fontBig"] = "Large",
		["fontSmall"] = "Small",
		["isLineOfSight"] = true,
		["isOnHover"] = false,
		["isTagAnything"] = false,
		["actionPriority"] = true,
		["ui_x"] = 20,
		["ui_y"] = 670
	};

	CTags:writeSettings(CTags.settings);
end

local function OnInitGlobalModData(isNewGame)
	ModData.request("ContainerTagDataFaction");
	CTags:sleepDo(0, CTags.tagTracker);
end	
Events.OnInitGlobalModData.Add(OnInitGlobalModData)

local function OnReceiveGlobalModData(module, packet)
	if module == "ContainerTagDataFaction" then
		if packet then
			ModData.add(module, packet)
		end
	end	
end

Events.OnReceiveGlobalModData.Add(OnReceiveGlobalModData)
