-- Container Tags
-- Author: Dismellion


CTags = {}
CTags.version = '2.0.0';
CTags.tagsVersion = '2';
CTags.build = '41.78';

function CTags:isMultiplayer() return getCore():getGameMode() == "Multiplayer" end

function CTags:tableContains(t, e)
	for _, value in pairs(t) do
		if value == e then
			return true
		end
	end
	return false
end

function CTags:splitString(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

function CTags:sleepDo(seconds, func, condition)
	local time = os.time();
	local targetTime = time + seconds;
	if condition == nil then condition = true end; -- Optional 


	local function OnSleepTick()
		local timeNew = os.time();
		if not condition then 
			Events.OnTick.Remove(OnSleepTick);
			return
		end
		if timeNew >= targetTime then
			Events.OnTick.Remove(OnSleepTick);
			func();
		end
	end
	Events.OnTick.Add(OnSleepTick)
end

function CTags:getFaction()
	local player = getPlayer();
	return Faction.getPlayerFaction(player);
end

function CTags:getCustomName(obj, translated)
	if not obj then return nil end
	if not obj:getSprite() then return nil end
	local props = obj:getSprite():getProperties()
	if props:Is("CustomName") then
		if props:Is("CustomName") then
			if translated then return Translator.getMoveableDisplayName(props:Val("CustomName")) end
			return props:Val("CustomName")
		end
	end
	return ""
end

function CTags:getCustomGroup(obj, translated)
	if not obj then return nil end
	if not obj:getSprite() then return nil end
	local props = obj:getSprite():getProperties()
	if props:Is("GroupName") then
		if translated then return Translator.getMoveableDisplayName(props:Val("GroupName")) end
		return props:Val("GroupName")
	end
	return ""
end

function CTags:getSquareFromScreen()
	local player = getPlayer();
	local playerNum = player:getPlayerNum();
	local worldX = screenToIsoX(playerNum, getMouseX(), getMouseY(), 0)
	local worldY = screenToIsoY(playerNum, getMouseX(), getMouseY(), 0)
	return getCell():getGridSquare(worldX, worldY, player:getZ());
end

function CTags:formSquareID(square, offset, spriteName)
	if square and offset and spriteName then
		local ID = "" .. square:getX() .. "." .. square:getY() .. "." .. square:getZ() .. '.' .. offset .. '.' .. spriteName;
		return ID
	end
end
