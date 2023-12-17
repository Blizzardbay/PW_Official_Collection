require "TimedActions/ISBaseTimedAction"

PLL_BodyCraftMenu = {};

PLL_BodyCraftMenu.doCraftMenu = function(player,context, items)
	local playerObj = getSpecificPlayer(player);
    local playerInv = getSpecificPlayer(player):getInventory();
	local canheatsink = nil;                  
	local canpainstopper = nil;        
--print(items);
	for i,v in ipairs(items) do
--print(v);		
        local testItem = v;
		
		if not instanceof(v, "InventoryItem") then
            testItem = v.items[1];
			print(testItem);
        end		

		if testItem:getType() == "aresbody" then    
			canheatsink = true;
			canpainstopper = true;
		end		

		if canheatsink and playerObj:getStats():getEndurance() < 0.10 then
		playerObj:getEmitter():playSound("offline", true);     
		end

		if canheatsink and playerObj:getStats():getEndurance() > 0.10 then
		context:addOption(getText("Open Heat Sink"), items, PLL_BodyCraftMenu.onheatsink, player);
		end

		if canpainstopper and playerObj:getStats():getEndurance() > 0.45 then
		context:addOption(getText("Blending Focus"), items, PLL_BodyCraftMenu.onpainstopper, player);
		end
			
	end


end

PLL_BodyCraftMenu.onheatsink = function(a, player)
	for i,k in pairs(a) do
        if not instanceof(k, "InventoryItem") then
            for i2,k2 in ipairs(k.items) do

                if i2 ~= 1 then
                    PLL_BodyCraftMenu.heatsink(k2, player);
					break;
                end
            end
        else
			PLL_BodyCraftMenu.heatsink(k, player);
        end
		break;
    end
end

PLL_BodyCraftMenu.onpainstopper = function(a, player)
	for i,k in pairs(a) do
        if not instanceof(k, "InventoryItem") then
            for i2,k2 in ipairs(k.items) do

                if i2 ~= 1 then
                    PLL_BodyCraftMenu.painstopper(k2, player);
					break;
                end
            end
        else
			PLL_BodyCraftMenu.painstopper(k, player);
        end
		break;
    end
end

PLL_BodyCraftMenu.heatsink = function(item, player)

	local playerObj = getSpecificPlayer(player)
	if luautils.haveToBeTransfered(playerObj, item) then
        ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
    end

	ISTimedActionQueue.add(ISheatsink:new(playerObj, item, 400));
end

PLL_BodyCraftMenu.painstopper = function(item, player)

	local playerObj = getSpecificPlayer(player)
	if luautils.haveToBeTransfered(playerObj, item) then
        ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
    end

	ISTimedActionQueue.add(ISpainstopper:new(playerObj, item, 250));
end

Events.OnFillInventoryObjectContextMenu.Add(PLL_BodyCraftMenu.doCraftMenu);