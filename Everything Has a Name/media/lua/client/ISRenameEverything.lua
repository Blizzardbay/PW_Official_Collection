ISRenameEverything = ISRenameEverything or {};

require "ISInventoryPaneContextMenu"

ISRenameEverything.isRenameable = function(item)
	local isRenameable = true

	if instanceof(item, "MapItem") then
		isRenameable = false
	elseif instanceof(item, "InventoryContainer") then
		isRenameable = false
	end

	return isRenameable
end

ISRenameEverything.createMenu = function(player, context, items)
	local canBeRenamed = nil;

	for i, v in ipairs(items) do
		local item = v;
		
		if not instanceof(v, "InventoryItem") then
			item = v.items[1];
		end
		
		if ISRenameEverything.isRenameable(item) then
			canBeRenamed = item;
		end
	end

	if canBeRenamed then
		if SandboxVars.EverythingHasAName.OnlyAdminCanRenameItems == true then
			if isAdmin() or isDebugEnabled() then
				context:addOption(getText("ContextMenu_renameButton"), canBeRenamed, ISRenameEverything.onRenameItem, player);

				--Check if the item is a stack and if true, add option to rename whole stack
				similarItems = getSpecificPlayer(player):getInventory():getItemsFromType(canBeRenamed:getType())
				if similarItems:size() > 1 then
					context:addOption("Rename Stack", similarItems, ISRenameEverything.onRenameStack, player);
				end
			end
		else
			--Rename Single item
			context:addOption(getText("ContextMenu_renameButton"), canBeRenamed, ISRenameEverything.onRenameItem, player);

			--Check if the item is a stack and if true, add option to rename whole stack
			similarItems = getSpecificPlayer(player):getInventory():getItemsFromType(canBeRenamed:getType())
			if similarItems:size() > 1 then
				context:addOption("Rename Stack", similarItems, ISRenameEverything.onRenameStack, player);
			end
		end
	end
end

--Logic for renaming one single item
ISRenameEverything.onRenameItem = function(item, player)
    local modal = ISTextBox:new(0, 0, 280, 180, getText("ContextMenu_label_items"), item:getName(), nil, ISRenameEverything.onRenameItemClick, player, getSpecificPlayer(player), item);
    modal:initialise();
    modal:addToUIManager();
    modal.entry:focus();
end

function ISRenameEverything:onRenameItemClick(button, player, item)
    if button.internal == "OK" then
        if button.parent.entry:getText() and button.parent.entry:getText() ~= "" then
        	newName = button.parent.entry:getText()

        	if instanceof(item, "Moveable") then
				item:getModData().renameEverything_name = newName
			elseif instanceof(item, "Radio") then
				item:getModData().renameEverything_name = newName
			else
            	item:setName(button.parent.entry:getText());
            	if isServer() then
            		sendClientCommand('RenameEverything', 'changeItemName', {item})
            	end
            end
            item:setCustomName(true)
            local pdata = getPlayerData(player:getPlayerNum());
            pdata.playerInventory:refreshBackpacks();
            pdata.lootInventory:refreshBackpacks();
        end
    end
end

--Logic for renaming a stack
ISRenameEverything.onRenameStack = function(items, player)
	for j=1, items:size() do
		local item = items:get(j-1)
		firstItemName = item:getName()
    	break
	end

    local modal = ISTextBox:new(0, 0, 280, 180, "Rename Stack", firstItemName, nil, ISRenameEverything.onRenameStackClick, player, getSpecificPlayer(player), items);
    modal:initialise();
    modal:addToUIManager();
    modal.entry:focus();
end

function ISRenameEverything:onRenameStackClick(button, player, items)
    if button.internal == "OK" then
        if button.parent.entry:getText() and button.parent.entry:getText() ~= "" then
        	newName = button.parent.entry:getText()

        	for j=1, items:size() do
        		local item = items:get(j-1)
        		if instanceof(item, "Moveable") then
					item:getModData().renameEverything_name = newName
				elseif instanceof(item, "Radio") then
					item:getModData().renameEverything_name = newName
				else
	            	item:setName(button.parent.entry:getText());
	            	if isServer() then
	            		sendClientCommand('RenameEverything', 'changeItemName', {item})
	            	end
	            end
	            item:setCustomName(true)
	        end
            local pdata = getPlayerData(player:getPlayerNum());
            pdata.playerInventory:refreshBackpacks();
            pdata.lootInventory:refreshBackpacks();
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(ISRenameEverything.createMenu);