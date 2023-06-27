
require ("Coolbag_shared")

local function nil2false(param)
    if not param then return false end
    return param
end

function Coolbag.setCooling(itemContainer, isCooling)
    local modDataCarrier = itemContainer:getContainingItem();--bag mod data is in ContainingItem
    if not modDataCarrier then
        modDataCarrier = itemContainer:getParent();--furniture mod data is in parent
    end
    if isCooling then
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.setCooling from ".. tostring(nil2false(modDataCarrier:getModData().isCooling) and "true" or "false").." to "..tostring(isCooling and "true" or "false") ); end
        itemContainer:setCustomTemperature(0.2);--fridge like temprature
        itemContainer:setAgeFactor(0.02);--fridge like aging
        itemContainer:setCookingFactor(0.0);--fridge like cooking
        if modDataCarrier then
            modDataCarrier:getModData().isCooling = true;
        end
    else
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.setCooling from ".. tostring(nil2false(modDataCarrier:getModData().isCooling) and "true" or "false").." to "..tostring(isCooling and "true" or "false") ); end
        itemContainer:setCustomTemperature(1.);--fridge like temprature
        itemContainer:setAgeFactor(1.0);--fridge like aging
        itemContainer:setCookingFactor(1.0);--fridge like cooking
        if modDataCarrier then
            modDataCarrier:getModData().isCooling = nil;
        end
    end
    
    --instanceFoodItem:getOutermostContainer().getParent().getSprite().getProperties().Is("IsFridge")
end

Coolbag.coolerContainers = {}
function Coolbag.addCoolerContainerType(typeStr)--override that function to add cooling containers.
    for it,typeCooler in pairs(Coolbag.coolerContainers) do
        if typeCooler == typeStr then
            if Coolbag.OPTIONS.Verbose then print ("Coolbag.addCoolerContainerType type already added "..tostring(typeStr or "nil") ); end
            return
        end
    end
    if Coolbag.OPTIONS.Verbose then print ("Coolbag.addCoolerContainerType add container type "..tostring(typeStr or "nil") ); end
    table.insert(Coolbag.coolerContainers,typeStr);
end

Coolbag.addCoolerContainerType("Cooler");
Coolbag.addCoolerContainerType("fridge");
Coolbag.addCoolerContainerType("freezer");
Coolbag.addCoolerContainerType("Lunchbox");
Coolbag.addCoolerContainerType("Lunchbox2");
Coolbag.addCoolerContainerType("Coolbag");


function Coolbag.isCoolerContainer(container)--override that function to add cooling containers.
--remember that a true will provoke override of vanilla temperature management. we do NOT want this for freezer and fridge and cooking heat sources !
    if not container then return false end
    --print ("Coolbag.isCoolerContainer "..container:getType());
    local containerType = container:getType()
    for it,typeCooler in pairs(Coolbag.coolerContainers) do
        if typeCooler == containerType then
            return not container:isPowered();--if it is not a powered container it is a cooler container
        end
    end
    return false
end

function Coolbag.isFreezerContainer(container)--override that function to add cooling containers.
--remember that a true will provoke override of vanilla temperature management. we do NOT want this for freezer and fridge and cooking heat sources !
    if not container then return false end
    if container:getType() == "freezer" then return true end
    return false
end

function Coolbag.isInACoolerContainer(item)--this function encapsulate the limitation : only one layer of container is checked for refrigeration.
    if not item then return false end
    return Coolbag.isCoolerContainer(item:getContainer());
end

function Coolbag.updateCoolerContainer(container,isNowCooling)
    if not container then return false end
    local containingItem = container:getContainingItem();
    local parent = container:getParent();
    local isAlreadyCooling = false;
    if containingItem then--bags are associated to containing intems
        isAlreadyCooling = containingItem:getModData().isCooling == true;
    elseif parent then
        isAlreadyCooling = parent:getModData().isCooling == true;
    end
    if isNowCooling ~= isAlreadyCooling then
        Coolbag.setCooling(container, isNowCooling);
        return true;
    end
    return false
end
function Coolbag.isCoolingContainer(container)
    if not container then return false end
    if not Coolbag.isCoolerContainer(container) then return false end
    local isCoolerThanBeingCool = false;
    if Coolbag.getMode() == 2 then--cheatin' mode
        isCoolerThanBeingCool = true;
    else--normal mode
        local nbIcePocket = container:getNumberOfItem("Base.IcePocket");
        if nbIcePocket == 0 then return false end
        local maxCapacity = container:getCapacity();
        local nbIcePocketRequired = math.ceil(maxCapacity/Coolbag.NBKgRefrigeratedPerPocket);--one Pocket per 10kg
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.isCooling container = "..tostring(container or "nil").." "..container:getType().." "..nbIcePocket.."/"..nbIcePocketRequired.." "..maxCapacity.."/"..Coolbag.NBKgRefrigeratedPerPocket ); end
        isCoolerThanBeingCool = nbIcePocket >= nbIcePocketRequired;--ICE COLD !
    end
    Coolbag.updateCoolerContainer(container,isCoolerThanBeingCool);--this is bad "sugar" design. I'll regret it, I know it.--remove cooling property when IcePocket melts.
    return isCoolerThanBeingCool;
end

function Coolbag.isFreezing(item)--this function encapsulate the limitation : it is not (and should be) freezing outside in winter
    --print ("Coolbag.isFreezing "..tostring(item or "nil") );
    if not item then return false end
    local container = item:getContainer()
    if Coolbag.OPTIONS.Verbose then print ("Coolbag.isFreezing container = "..tostring(container or "nil") ); end
    if Coolbag.isFreezerContainer(container) then
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.isFreezing isFreezerContainer getTemprature = "..tostring(container:getTemprature() or "nil") .." "..tostring(container:isPowered() and "powered" or "not powered") ); end
        if container:getTemprature() < Coolbag.FreezingThreshold_InFreezer or (container and container:isPowered()) then return true end--todo: understand container temprature values
        local outermostcontainer = item:getOutermostContainer();
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.isFreezing isFreezerContainer getSourceGrid():haveElectricity() = "..tostring(outermostcontainer and outermostcontainer:getSourceGrid() and outermostcontainer:getSourceGrid():haveElectricity() and "true" or "false") ); end
        if outermostcontainer and outermostcontainer:getSourceGrid() and outermostcontainer:getSourceGrid():haveElectricity() then return true end
    end
    
    
    local itemContainer = item:getOutermostContainer();
    local square = nil
    if itemContainer then
        square = itemContainer:getSourceGrid()--furniture square
        if not square then--if there is no furniture square, look for world item square
            local containingItem = itemContainer:getContainingItem()
            if containingItem then
                local worldItem = containingItem:getWorldItem();
                if worldItem then
                    square = worldItem:getSquare();
                end
            end
            --if not a furniture or world item, it is probably on a character (we could get the square but we consider the player is producing eat)
        end
    end
    
    if square then--we check the square temperature
        local temperature = Coolbag.getLocalTemperature(nil, square, nil);
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.isFreezing worldItem temperature = "..tostring(temperature or "nil").." "..tostring(Coolbag.FreezingThreshold_WorldItem or "nil") ); end
        return temperature < Coolbag.FreezingThreshold_WorldItem;
    end
    
    if Coolbag.OPTIONS.Verbose then print ("Coolbag.isFreezing default = false"); end
    return false
end

-- tools stuff for debug
local function printThisObject(o)
    if type(o) == 'table' then
        local s = '{\n';
        for k,v in pairs(o) do
            if type(k) == 'table' then
                s = s .. printThisObject(k) .. "\n";
            else
                s = s .. tostring(k) .. " " .. tostring(v or 'nil') .. "\n";
            end
        end
        return s .. '}\n'
    else
        if type(o) == "string" then return '"'..tostring(o)..'"' end
        return tostring(o)
    end
end

function Coolbag.OnRefreshInventoryWindowContainers(container,stepStr)
    if stepStr ~= "end" then return end
    
    if container and container.inventory then
        if Coolbag.OPTIONS.Verbose then
            local containerType = container.inventory:getType()
            print ("Coolbag.OnRefreshInventoryWindowContainers "..containerType);
        end
        local currentTime = getGameTime():getWorldAgeHours();--set once per loop
        local containedItems = container.inventory:getItems();
        
        -- manage contained pockets
        local changedContainer = false
        for j=1, containedItems:size() do
            local item = containedItems:get(j-1);
            if Coolbag.isPocket(item) then
                changedContainer = Coolbag.UpdatePocket(item, currentTime);--update melting/freezing process if not already started
            end
            if changedContainer then break end
        end
        
        -- manage cooling container
        if Coolbag.isCoolingContainer(container.inventory) then
            Coolbag.setCooling(container.inventory,true);
            --parse all items
            for j=1, containedItems:size() do
                local item = containedItems:get(j-1);
                if item:IsFood() then
                    Coolbag.computeNewFoodAgeInCoolbag(item, true)--start custom aging process if not already started
                end
            end
        elseif Coolbag.isCoolerContainer(container.inventory) then
            Coolbag.setCooling(container.inventory,false);--remove cooling property when IcePocket is removed
        end
    end
end

function Coolbag.getLocalTemperature(playerObj, square, vehicle)--Celsius if I can believe java methods names
    if square and not playerObj then return getClimateManager():getAirTemperatureForSquare(square, vehicle) end
    return getClimateManager():getAirTemperatureForCharacter(playerObj);
end


function Coolbag.OnContainerUpdate(param1)
    if not param1 or not instanceof(param1, "Food") or false == param1:IsFood() then return end--if this is not a food item
    
    --if food is contained in a Cooler, override temperature with frozen value
    local container = param1:getContainer();
    if container then
        if Coolbag.OPTIONS.Verbose then print ("Coolbag.OnContainerUpdate "..tostring(container:getType() or "nil").." "..tostring(containingItem or "nil")); end
        local foodModData = param1:getModData();
        if foodModData then
            if Coolbag.OPTIONS.Verbose then print ("Coolbag.OnContainerUpdate "..printThisObject(foodModData)); end
            if Coolbag.isCoolingContainer(container) then
                Coolbag.computeNewFoodAgeInCoolbag(param1,true);
            elseif foodModData.Coolbag then
                Coolbag.removeFromFoodListToUpdate(param1);
            end
        end
    end
end


function Coolbag.OnTick()
    Coolbag.updateFoodList();
end


Events.OnRefreshInventoryWindowContainers.Add(Coolbag.OnRefreshInventoryWindowContainers);
Events.OnContainerUpdate.Add(Coolbag.OnContainerUpdate);
Events.OnTick.Add(Coolbag.OnTick);

