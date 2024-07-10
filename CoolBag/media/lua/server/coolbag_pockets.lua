
require "coolbag"
Coolbag.PocketList = nil

-- -- tools stuff for debug
-- local function printThisObject(o)
	-- if type(o) == 'table' then
		-- local s = '{\n';
		-- for k,v in pairs(o) do
            -- if type(k) == 'table' then
                -- s = s .. printThisObject(k) .. "\n";
            -- else
				-- s = s .."["..k.."] = ".. printThisObject(v) .."\n";
            -- end
		-- end
		-- return s .. '}\n'
	-- else
		-- if type(o) == "string" then return '"'..tostring(o)..'"' end
		-- return tostring(o)
	-- end
-- end

function Coolbag.isPocket(item)
    if not item then return false end
    local itemType = item:getType()
    return itemType == "IcePocket" or itemType == "WaterPocket";
end

function Coolbag.initColdSourceItem(pocketItem, currentTime)
    local pocketModData = pocketItem:getModData();
    if pocketModData.freezingRatio == nil then
        pocketModData.freezingRatio = 0.0;
        if pocketItem:getType() == "IcePocket" then pocketModData.freezingRatio = 1.0 end
        pocketModData.freezingTimeRef = currentTime;
    elseif pocketModData.freezingTimeRef == nil then--handle reloading bugged save
        pocketModData.freezingTimeRef = currentTime;
    end
end

function Coolbag.UpdatePocket(pocketItem, currentTime)
    Coolbag.initColdSourceItem(pocketItem, currentTime)
    local pocketModData = pocketItem:getModData();
    local changedContainer = false
    if Coolbag.isFreezing(pocketItem) then
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.updatePocket isFreezing "..pocketItem:getType().." "..tostring(pocketItem) ); end
        pocketModData.freezingRatio = pocketModData.freezingRatio + (currentTime - pocketModData.freezingTimeRef) / Coolbag.getFreezingTime();
        if pocketModData.freezingRatio >= 1 then
            pocketModData.freezingRatio = 1;
            if pocketItem:getType() == "WaterPocket" then--detect change from water to ice => replace item
                local container = pocketItem:getContainer();
                local worldItemPos = Coolbag.RemoveItem(pocketItem);--remove old object from container
                local newPocketItem = nil
                if worldItemPos then
                    local resultSquare = getCell():getGridSquare(worldItemPos.x, worldItemPos.y, worldItemPos.z)
                    newPocketItem = resultSquare:AddWorldInventoryItem("IcePocket", worldItemPos.x-resultSquare:getX(), worldItemPos.y-resultSquare:getY(), worldItemPos.z-resultSquare:getZ())
                    if newPocketItem then
                        if Coolbag.OPTIONS.Verbose then print ("Coolbag.updatePocket created IcePocket WorldItem "..newPocketItem:getType().." "..tostring(newPocketItem) ); end
                        newPocketItem:getWorldItem():transmitCompleteItemToServer();
                        newPocketItem:getWorldItem():setIgnoreRemoveSandbox(true);
                        if worldItemPos.azimuth then--available with TchernoLib
                            newPocketItem:setWorldZRotation(worldItemPos.azimuth);
                        end
                    else
                        if Coolbag.OPTIONS.Verbose then print ("Coolbag.updatePocket FAILED creating IcePocket WorldItem "); end
                    end
                else
                    newPocketItem = container:AddItem("IcePocket");--add new object to container
                end
                if newPocketItem then
                    Coolbag.initColdSourceItem(newPocketItem,currentTime);--init new item
                else
                    print ("Coolbag.updatePocket Cannot Add IcePocket, WaterPocket is lost.");
                end
                changedContainer = true;
                ISInventoryPage.renderDirty = true
            end
        end
    else 
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.updatePocket NOT isFreezing "..pocketItem:getType().." "..tostring(pocketItem) ); end
        pocketModData.freezingRatio = pocketModData.freezingRatio - (currentTime - pocketModData.freezingTimeRef) / Coolbag.getMeltingTime()
        if pocketModData.freezingRatio <= 0 then
            pocketModData.freezingRatio = 0;
            if pocketItem:getType() == "IcePocket" then--detect change from ice to water => replace item
                local container = pocketItem:getContainer();
                local worldItemPos = Coolbag.RemoveItem(pocketItem);--remove old object from container
                local newPocketItem = nil
                if worldItemPos then
                    local resultSquare = getCell():getGridSquare(worldItemPos.x, worldItemPos.y, worldItemPos.z)
                    newPocketItem = resultSquare:AddWorldInventoryItem("WaterPocket", worldItemPos.x-resultSquare:getX(), worldItemPos.y-resultSquare:getY(), worldItemPos.z-resultSquare:getZ())
                    if newPocketItem then
                        if Coolbag.OPTIONS.Verbose then print ("Coolbag.updatePocket created WaterPocket WorldItem "..newPocketItem:getType().." "..tostring(newPocketItem) ); end
                        newPocketItem:getWorldItem():transmitCompleteItemToServer();
                        newPocketItem:getWorldItem():setIgnoreRemoveSandbox(true);
                        if worldItemPos.azimuth then--available with TchernoLib
                            newPocketItem:setWorldZRotation(worldItemPos.azimuth);
                        end
                    else
                        if Coolbag.OPTIONS.Verbose then print ("Coolbag.updatePocket FAILED creating WaterPocket WorldItem "); end
                    end
                else
                    if Coolbag.OPTIONS.Verbose then print ("Coolbag.updatePocket adding WaterPocket to container"); end
                    newPocketItem = container:AddItem("WaterPocket");--add new object to container
                end
                if newPocketItem then
                    Coolbag.initColdSourceItem(newPocketItem,currentTime);--init new item
                else
                    print ("Coolbag.updatePocket Cannot Add WaterPocket, IcePocket is lost.");
                end
                changedContainer = true;
                ISInventoryPage.renderDirty = true
            end
        end
    end
    pocketModData.freezingTimeRef = currentTime;
    return changedContainer;
end

function Coolbag.RemoveItem(item)--inspired from ISRemoveItemTool.lua but returning x,y,z (WorldItem) or nil (not WorldItem)
    local playerObj = nil
    local omc = item:getOutermostContainer()
    if omc then
        local containerParent = omc:getParent()
        if containerParent and instanceof(containerParent, "IsoPlayer") then
            playerObj = containerParent;
        end
    end

    if item:getWorldItem() ~= nil then--World Item case--ISRemoveItemTool.lua is not enough
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.RemoveItem from WorldItem."); end
        local result = {x=item:getWorldItem():getWorldPosX(),y=item:getWorldItem():getWorldPosY(),z=item:getWorldItem():getWorldPosZ()}
        if getPublicFieldValue then--get azimuth from TchernoLib if available
            result.azimuth=getPublicFieldValue(item,"worldZRotation")
            if Coolbag.OPTIONS.Verbose then print ("Coolbag.RemoveItem from WorldItem with azimuth."..tostring(result.azimuth or 'nil')); end
        end
        local square = item:getWorldItem():getSquare()
        if square then
            if Coolbag.OPTIONS.Verbose then print ("Coolbag.RemoveItem from WorldItem with square."); end
            square:transmitRemoveItemFromSquare(item:getWorldItem());
            square:removeWorldObject(item:getWorldItem());
        end
        item:getWorldItem():removeFromWorld()
        item:getWorldItem():removeFromSquare()
        item:getWorldItem():setSquare(nil)
        item:setWorldItem(nil);
        
        local container = item:getContainer()
        if container then
            if Coolbag.OPTIONS.Verbose then print ("Coolbag.RemoveItem from WorldItem with container."); end
            if isClient() and not playerObj and container:getType()~="floor" then--MP Server handled item case
                container:removeItemOnServer(item);
            end
            
            container:DoRemoveItem(item);--Locally handled case (SingleP and MP)
        end

        if playerObj then
            getPlayerLoot(playerObj):refreshBackpacks()
        end
        
        return result
    else
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.RemoveItem from Container."); end
        local container = item:getContainer()
        if container then
            if item:isEquipped() then--Equipped case
                container:setDrawDirty(true);
                item:setJobDelta(0.0);
                playerObj:removeWornItem(item)

                local hotbar = getPlayerHotbar(playerObj:getPlayerNum())
                local fromHotbar = false;
                if hotbar then
                    fromHotbar = hotbar:isItemAttached(item);
                end

                if fromHotbar then
                    hotbar.chr:setAttachedItem(item:getAttachedToModel(), item);
                    playerObj:resetEquippedHandsModels()
                end

                if item == playerObj:getPrimaryHandItem() then
                    if (item:isTwoHandWeapon() or item:isRequiresEquippedBothHands()) and item == playerObj:getSecondaryHandItem() then
                        playerObj:setSecondaryHandItem(nil);
                    end
                    playerObj:setPrimaryHandItem(nil);
                end
                if item == playerObj:getSecondaryHandItem() then
                    if (item:isTwoHandWeapon() or item:isRequiresEquippedBothHands()) and item == playerObj:getPrimaryHandItem() then
                        playerObj:setPrimaryHandItem(nil);
                    end
                    playerObj:setSecondaryHandItem(nil);
                end
            end

            if isClient() and not playerObj and container:getType()~="floor" then--MP Server handled item case
                container:removeItemOnServer(item);
            end
            
            container:DoRemoveItem(item);--Locally handled case (SingleP and MP)
        end
        return nil
    end
end
