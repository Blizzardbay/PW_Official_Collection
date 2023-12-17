require "ISUI/ISInventoryPaneContextMenu"

-- I need a copy of this I guess
local function predicateNotBroken(item)
	return not item:isBroken()
end

VFEContext = {}

VFEContext.inventoryMenu = function(playerid, context, items)
	local player = getSpecificPlayer(playerid)
	for _, v in ipairs(items) do
		local item = v
		if not instanceof(v, "InventoryItem") then
			item = v.items[1]
		end
		local isInInventory = item:getContainer() == player:getInventory()
		-- Bayonet weapons
		for index, preset in ipairs(VFEBayonetSet) do
			if index % 3 > 0 and preset == item:getFullType() then
				local isInInventory = item:getContainer() == player:getInventory()
				VFEContext:Bayonet(item, index, player, context, isInInventory)
			end
		end
		-- Folding weapon stock and upgrade actions
		for index, preset in ipairs(VFEFoldingWeaponPair) do
			if preset == item:getFullType() then
				local indexMod = (index % 2) * 2 - 1 -- 1 if stock can be folded, -1 if stock can be extended
				VFEContext:Stock(item, index, indexMod, player, context, isInInventory)
				-- If the stock is folded add a custom upgrade context using the unfolded counterpart's parts list
				VFEContext:Upgrade(item, index, indexMod, player, context)	
			end	
		end
		
		local blacklisted = false
		-- Sling
		if item:isTwoHandWeapon() then
			blacklisted = false
			for index, preset in ipairs(VFESlingBlacklist) do
				if preset == item:getFullType() then
					blacklisted = true
					break
				end	
			end
		else
			blacklisted = true
		end
		if not blacklisted then
			VFEContext:UpgradeSling(item, index, indexMod, player, context)	
			VFEContext:UpgradeSling2(item, index, indexMod, player, context)	
		end
		
		blacklisted = false
		-- Improved Irons
		for index, preset in ipairs(VFEImprovedIronsBlacklist) do
			if preset == item:getFullType() then
				blacklisted = true
				break
			end	
		end
		if not blacklisted then
			VFEContext:UpgradeIrons(item, index, indexMod, player, context)	
		end
		
		return
	end
end

function VFEContext:Stock(item, index, indexMod, player, context, enabled)
	local actionString = ""
	if (indexMod > 0) then
		actionString = getText("IGUI_FirearmRadial_FoldStock")
	else
		actionString = getText("IGUI_FirearmRadial_UnfoldStock")
	end
	local listEntry = context:addOption(actionString, item, VFEStockContext.callAction, index + indexMod, player)
	
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	tooltip.description = ""
	if (indexMod > 0) then
		getText("IGUI_ContextMenu_FoldStockArg", item:getDisplayName())
	else
		getText("IGUI_ContextMenu_UnfoldStockArg", item:getDisplayName())
	end
	tooltip:setName(tostring(actionString .. "\n"))
	tooltip.texture = item:getTex()
	
	if enabled then
		if (indexMod > 0) then
			tooltip.description = tooltip.description .. getText("IGUI_ContextMenu_AddSlingDescription") -- This happens so be the thing
		else
			tooltip.description = tooltip.description .. getText("IGUI_ContextMenu_RestoreStock")
		end
	else 
		listEntry.notAvailable = true
		tooltip.description = tooltip.description .. getText("IGUI_ContextMenu_MoveToInv")
	end

	listEntry.toolTip = tooltip;
end

function VFEContext:Upgrade(item, index, indexMod, player, context)
	local hasScrewdriver = player:getInventory():containsTagEvalRecurse("Screwdriver", predicateNotBroken)
	if item and instanceof(item, "HandWeapon") and hasScrewdriver then
		-- add parts
		local weaponParts = player:getInventory():getItemsFromCategory("WeaponPart");
		if weaponParts and not weaponParts:isEmpty() then
			local subMenuUp = context:getNew(context);
			local doIt = false;
			local addOption = false;
			local alreadyDoneList = {};
			for i=0, weaponParts:size() - 1 do
				local part = weaponParts:get(i);
				if part:getMountOn():contains(VFEFoldingWeaponPair[index + indexMod]) and not alreadyDoneList[part:getName()] then
					if (part:getPartType() == "Scope") and not item:getScope() then
						addOption = true;
					elseif (part:getPartType() == "Clip") and not item:getClip() then
						addOption = true;
					elseif (part:getPartType() == "Sling") and not item:getSling() then
						addOption = true;
					elseif (part:getPartType() == "Stock") and not item:getStock() then
						addOption = true;
					elseif (part:getPartType() == "Canon") and not item:getCanon() then
						addOption = true;
					elseif (part:getPartType() == "RecoilPad") and not item:getRecoilpad() then
						addOption = true;
					end
				end
				if addOption then
					doIt = true;
					subMenuUp:addOption(weaponParts:get(i):getName(), item, ISInventoryPaneContextMenu.onUpgradeWeapon, part, player);
					addOption = false;
					alreadyDoneList[part:getName()] = true;
				end
			end
			if doIt then
				local upgradeOption = context:addOption(getText("ContextMenu_Add_Weapon_Upgrade"), items, nil);
				context:addSubMenu(upgradeOption, subMenuUp);
			end
		end
	end
end

function VFEContext:UpgradeIrons(item, index, indexMod, player, context)
	local hasScrewdriver = player:getInventory():containsTagEvalRecurse("Screwdriver", predicateNotBroken)
	if item and instanceof(item, "HandWeapon") and item:isRanged() and hasScrewdriver then
		-- add parts
		local weaponParts = player:getInventory():getItemsFromCategory("WeaponPart");
		if weaponParts and not weaponParts:isEmpty() then
			for i=0, weaponParts:size() - 1 do
				local part = weaponParts:get(i);
				if (part:getType() == "IronSight") and not item:getScope() then
					-- To do: Localization
					local listEntry = context:addOption(getText("IGUI_ContextMenu_AddSights"), item, ISInventoryPaneContextMenu.onUpgradeWeapon, part, player);
					local tooltip = ISInventoryPaneContextMenu.addToolTip();
					tooltip.description = getText("IGUI_ContextMenu_AddSightsDescription")
					tooltip:setName(part:getDisplayName())
					tooltip.texture = part:getTex()
					listEntry.toolTip = tooltip;
					break
				end
			end
		end
	end
end

function VFEContext:UpgradeSling(item, index, indexMod, player, context)
	local hasScrewdriver = player:getInventory():containsTagEvalRecurse("Screwdriver", predicateNotBroken)
	if item and instanceof(item, "HandWeapon") and item:isRanged() and hasScrewdriver then
		-- add parts
		local weaponParts = player:getInventory():getItemsFromCategory("WeaponPart");
		if weaponParts and not weaponParts:isEmpty() then
			for i=0, weaponParts:size() - 1 do
				local part = weaponParts:get(i);
				if (part:getType() == "Sling") and not item:getSling() then
					-- To do: Localization
					local listEntry = context:addOption(getText("IGUI_ContextMenu_AddSling"), item, ISInventoryPaneContextMenu.onUpgradeWeapon, part, player);
					local tooltip = ISInventoryPaneContextMenu.addToolTip();
					tooltip.description = getText("IGUI_ContextMenu_AddSlingDescription")
					tooltip:setName(part:getDisplayName())
					tooltip.texture = part:getTex()
					listEntry.toolTip = tooltip;
					break
				end
			end
		end
	end
end

function VFEContext:UpgradeSling2(item, index, indexMod, player, context)
	local hasScrewdriver = player:getInventory():containsTagEvalRecurse("Screwdriver", predicateNotBroken)
	if item and instanceof(item, "HandWeapon") and item:isRanged() and hasScrewdriver then
		-- add parts
		local weaponParts = player:getInventory():getItemsFromCategory("WeaponPart");
		if weaponParts and not weaponParts:isEmpty() then
			for i=0, weaponParts:size() - 1 do
				local part = weaponParts:get(i);
				if (part:getType() == "Sling2") and not item:getSling() then
					-- To do: Localization
					local listEntry = context:addOption(getText("IGUI_ContextMenu_AddSling2"), item, ISInventoryPaneContextMenu.onUpgradeWeapon, part, player);
					local tooltip = ISInventoryPaneContextMenu.addToolTip();
					tooltip.description = getText("IGUI_ContextMenu_AddSlingDescription")
					tooltip:setName(part:getDisplayName())
					tooltip.texture = part:getTex()
					listEntry.toolTip = tooltip;
					break
				end
			end
		end
	end
end

function VFEContext:Bayonet(item, index, player, context, enabled)
	local bayonetFound
	local bayonet = nil
	local bayonetScript = nil
	if index % 3 == 1 then
		if VFEBayonetSet[index + 2] ~= "NULL" then
			bayonetScript = getScriptManager():getItem(VFEBayonetSet[index + 2])
			local playerItems = player:getInventory():getItems()
			for i=1,playerItems:size() do
				bayonet = playerItems:get(i-1)
				if bayonet:getFullType() == VFEBayonetSet[index + 2] and not bayonet:isBroken() then
					bayonetFound = true
					break
				end
			end
		else
			bayonetFound = true
		end
	else
		if VFEBayonetSet[index + 1] ~= "NULL" then
			bayonetScript = getScriptManager():getItem(VFEBayonetSet[index + 1])
		end
		bayonetFound = true
	end

	local actionString = ""
	if item:getSubCategory() == "Firearm" then
		actionString = getText("IGUI_FirearmRadial_UseBayonet")
	else
		actionString = getText("IGUI_FirearmRadial_UseRifle")
	end
	
	local listEntry = context:addOption(actionString, item, VFEBayonetContext.callAction, index, player, bayonet)
	
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	tooltip.description = ""
	tooltip:setName(tostring(actionString))
	if bayonetScript then
		tooltip.texture = getTexture("media/textures/Item_" .. bayonetScript:getIcon() .. ".png")
	else
		tooltip.texture = item:getTex()
	end
	
	if enabled then
		if bayonetFound then
			if item:getSubCategory() == "Firearm" then
				tooltip.description = tooltip.description .. getText("IGUI_ContextMenu_AttackBayonet")
			else
				tooltip.description = tooltip.description .. getText("IGUI_ContextMenu_AttackRifle")
			end
		else
			listEntry.notAvailable = true
			tooltip.description = tooltip.description .. getText("IGUI_ContextMenu_RequiresBayonet", bayonetScript:getDisplayName())
		end
	else 
		listEntry.notAvailable = true
		tooltip.description = tooltip.description .. getText("IGUI_ContextMenu_MoveToInv")
	end

	listEntry.toolTip = tooltip;
end


Events.OnPreFillInventoryObjectContextMenu.Add(VFEContext.inventoryMenu)