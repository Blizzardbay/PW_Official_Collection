
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
                container:Remove(pocketItem);--remove old object from container
                local icePocket = container:AddItem("IcePocket");--add new object to container
                if icePocket then
                    Coolbag.initColdSourceItem(icePocket,currentTime);--init new item
                else
                    print ("Coolbag.updatePocket Cannot Add IcePocket, WaterPocket is lost.");
                end
                changedContainer = true;
            end
        end
    else 
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.updatePocket NOT isFreezing "..pocketItem:getType().." "..tostring(pocketItem) ); end
        pocketModData.freezingRatio = pocketModData.freezingRatio - (currentTime - pocketModData.freezingTimeRef) / Coolbag.getMeltingTime()
        if pocketModData.freezingRatio <= 0 then
            pocketModData.freezingRatio = 0;
            if pocketItem:getType() == "IcePocket" then--detect change from ice to water => replace item
                local container = pocketItem:getContainer();
                container:Remove(pocketItem);--remove old object from container
                local waterPocket = container:AddItem("WaterPocket");--add new object to container
                if waterPocket then
                    Coolbag.initColdSourceItem(waterPocket,currentTime);--init new item
                else
                    print ("Coolbag.updatePocket Cannot Add WaterPocket, IcePocket is lost.");
                end
                changedContainer = true;
            end
        end
    end
    pocketModData.freezingTimeRef = currentTime;
    return changedContainer;
end

