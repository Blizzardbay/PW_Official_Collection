require "ISUI/ISInventoryPaneContextMenu"

-- I need a copy of this I guess
local function predicateNotBroken(item)
	return not item:isBroken()
end

VFESilencerContext = {}

VFESilencerContext.inventoryMenu = function(playerid, context, items)
    local player = getSpecificPlayer(playerid)
    for _, v in ipairs(items) do
		local item = v
		if not instanceof(v, "InventoryItem") then
			item = v.items[1]
		end

        local blacklisted = false
        -- Silencer
        for index, preset in ipairs(VFESilencerBlacklist) do
            if preset == item:getFullType() then
                blacklisted = true
                break
            end	
        end
        if not blacklisted then
            VFESilencerContext:UpgradeSilencer(item, index, player, context)
        end

		local blacklisted = false
        -- Crafted Silencer
        for index, preset in ipairs(VFECraftedSilencerBlacklist) do
            if preset == item:getFullType() then
                blacklisted = true
                break
            end	
        end
        if not blacklisted then
            VFESilencerContext:UpgradeCraftedSilencer(item, index, player, context)
        end
    end
end

function VFESilencerContext:UpgradeSilencer(item, index, player, context)
	local hasScrewdriver = player:getInventory():containsTagEvalRecurse("Screwdriver", predicateNotBroken)
	if item and instanceof(item, "HandWeapon") and item:isRanged() and hasScrewdriver then
		-- add parts
		local weaponParts = player:getInventory():getItemsFromCategory("WeaponPart");
		if weaponParts and not weaponParts:isEmpty() then
			local silencerFlag = false
			local metalSilencerFlag = false
			for i=0, weaponParts:size() - 1 do
				local part = weaponParts:get(i);
				if (part:getType() == "Silencer") and not item:getCanon() and not silencerFlag then
					-- To do: Localization
					local listEntry = context:addOption(getText("IGUI_ContextMenu_AddSilencer"), item, ISInventoryPaneContextMenu.onUpgradeWeapon, part, player);
					local tooltip = ISInventoryPaneContextMenu.addToolTip();
					tooltip.description = getText("IGUI_ContextMenu_AddSilencerDescription")
					tooltip:setName(part:getDisplayName())
					tooltip.texture = part:getTex()
					listEntry.toolTip = tooltip;
					silencerFlag = true
				elseif (part:getType() == "MetalPipeSilencer") and not item:getCanon() and not metalSilencerFlag then
					-- To do: Localization
					local listEntry = context:addOption(getText("IGUI_ContextMenu_AddMetalPipeSilencer"), item, ISInventoryPaneContextMenu.onUpgradeWeapon, part, player);
					local tooltip = ISInventoryPaneContextMenu.addToolTip();
					tooltip.description = getText("IGUI_ContextMenu_AddMetalPipeSilencerDescription")
					tooltip:setName(part:getDisplayName())
					tooltip.texture = part:getTex()
					listEntry.toolTip = tooltip;
					metalSilencerFlag = true
				end
			end
		end
	end
end

function VFESilencerContext:UpgradeCraftedSilencer(item, index, player, context)
	local hasScrewdriver = player:getInventory():containsTagEvalRecurse("Screwdriver", predicateNotBroken)
	if item and instanceof(item, "HandWeapon") and item:isRanged() and hasScrewdriver then
		-- add parts
		local weaponParts = player:getInventory():getItemsFromCategory("WeaponPart");
		if weaponParts and not weaponParts:isEmpty() then
			local torchSilencerFlag = false
			local bottleSilencerFlag = false
			for i=0, weaponParts:size() - 1 do
				local part = weaponParts:get(i);
				if (part:getType() == "TorchSilencer") and not item:getCanon() and not torchSilencerFlag then
					-- To do: Localization
					local listEntry = context:addOption(getText("IGUI_ContextMenu_AddTorchSilencer"), item, ISInventoryPaneContextMenu.onUpgradeWeapon, part, player);
					local tooltip = ISInventoryPaneContextMenu.addToolTip();
					tooltip.description = getText("IGUI_ContextMenu_AddTorchSilencerDescription")
					tooltip:setName(part:getDisplayName())
					tooltip.texture = part:getTex()
					listEntry.toolTip = tooltip;
					torchSilencerFlag = true
				elseif (part:getType() == "WaterBottleSilencer") and not item:getCanon() and not bottleSilencerFlag then
					-- To do: Localization
					local listEntry = context:addOption(getText("IGUI_ContextMenu_AddWaterBottleSilencer"), item, ISInventoryPaneContextMenu.onUpgradeWeapon, part, player);
					local tooltip = ISInventoryPaneContextMenu.addToolTip();
					tooltip.description = getText("IGUI_ContextMenu_AddWaterBottleSilencerDescription")
					tooltip:setName(part:getDisplayName())
					tooltip.texture = part:getTex()
					listEntry.toolTip = tooltip;
					bottleSilencerFlag = true
				end
			end
		end
	end
end

Events.OnPreFillInventoryObjectContextMenu.Add(VFESilencerContext.inventoryMenu)