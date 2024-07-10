function CTags:contextFunction(player, context, worldobjects, test)
	local player = getPlayer();
	local playerNumber = player:getPlayerNum();
	local playerName = player:getFullName();
	local tagData = ModData.getOrCreate("ContainerTagData");
	if not tagData.tags then tagData.tags = {} end;

	-- Not in vehicle
	if player:getVehicle() then return end
	if CTags.mode == 0 then return end
	local uniqueObjects = ArrayList:new();

	local function contextCallback(isoSquare, object, objectName, squareID, renderOffset, spriteName, playerName)
		local x = isoToScreenX(playerNumber, isoSquare:getX(), isoSquare:getY(), isoSquare:getZ());
		local y = isoToScreenY(playerNumber, isoSquare:getX(), isoSquare:getY(), isoSquare:getZ());					
		CTagsUI.makeWindow(x + 10, y + 10, object, objectName, squareID, renderOffset, spriteName, playerName)
	end

	for i, object in ipairs(worldobjects) do
		-- Limit search
		if i >= 10 then break end
		local spriteName = object:getSprite():getName();
		local square = object:getSquare();
		local container = object:getContainer();
		local renderOffset = object:getRenderYOffset() or 0;

		if not uniqueObjects:contains(object) and (container or CTags.settings.isTagAnything) and spriteName then
			local squareID = CTags:formSquareID(square, renderOffset, spriteName);
			local objectName = object:getName() or ((CTags:getCustomGroup(object) or "") .. ' ' .. (CTags:getCustomName(object) or ""));
			if string.len(objectName:gsub(" ", "")) == 0 then objectName = spriteName end;
			if renderOffset and renderOffset > 0 then objectName = objectName .. ' (' .. math.ceil(renderOffset / 32) .. ')' end;
			uniqueObjects:add(object);

			if squareID then
				if CTags.settings.actionPriority then
					thisContext = context:addOptionOnTop(objectName, object, function () contextCallback(square, object, objectName, squareID, renderOffset, spriteName, playerName) end);
				else 
					thisContext = context:addOption(objectName, object, function () contextCallback(square, object, objectName, squareID, renderOffset, spriteName, playerName) end);
				end
			end
			
			thisContext.iconTexture = getTexture("media/textures/note.png");
		end
	end	
end 

