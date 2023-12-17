PLL_BodyCraftMenu2 = {};

PLL_BodyCraftMenu2.doCraftMenu2 = function(player,context, items)
	local playerObj = getSpecificPlayer(player);
    local playerInv = getSpecificPlayer(player):getInventory();
	local cansoothe = nil;              
--print(items);
	for i,v in ipairs(items) do
--print(v);		
        local testItem = v;
		
		if not instanceof(v, "InventoryItem") then
            testItem = v.items[1];
			print(testItem);
		end		

		if testItem:getType() == "Animask23" then    
			cansoothe = true;
		end		

		if cansoothe then
		context:addOption(getText("Soothe Mind"), items, PLL_BodyCraftMenu2.onsoothe, player);
		end
			
	end


end

PLL_BodyCraftMenu2.onsoothe = function(a, player)
	for i,k in pairs(a) do
        if not instanceof(k, "InventoryItem") then
            for i2,k2 in ipairs(k.items) do

                if i2 ~= 1 then
                    PLL_BodyCraftMenu2.soothe(k2, player);
					break;
                end
            end
        else
			PLL_BodyCraftMenu2.soothe(k, player);
        end
		break;
    end
end



PLL_BodyCraftMenu2.soothe = function(item, player)

	local playerObj = getSpecificPlayer(player)
	if luautils.haveToBeTransfered(playerObj, item) then
        ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
    end

	ISTimedActionQueue.add(ISsoothe:new(playerObj, item, 300));
end

Events.OnFillInventoryObjectContextMenu.Add(PLL_BodyCraftMenu2.doCraftMenu2);