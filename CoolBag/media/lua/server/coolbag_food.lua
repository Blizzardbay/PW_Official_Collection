
require "coolbag"

-- -- tools stuff for debug
-- local function printThisObject(o)
    -- if type(o) == 'table' then
        -- local s = '{\n';
        -- for k,v in pairs(o) do
            -- if type(k) == 'table' then
                -- s = s .. printThisObject(k) .. "\n";
            -- else
                -- s = s .. tostring(k) .. " " .. tostring(v or 'nil') .. "\n";
            -- end
        -- end
        -- return s .. '}\n'
    -- else
        -- if type(o) == "string" then return '"'..tostring(o)..'"' end
        -- return tostring(o)
    -- end
-- end

function Coolbag.getFridgeFactor()
    if (SandboxVars.FridgeFactor == 1) then return 0.4; end
    if (SandboxVars.FridgeFactor == 2) then return 0.3; end
    if (SandboxVars.FridgeFactor == 4) then return 0.1; end
    if (SandboxVars.FridgeFactor == 5) then return 0.03; end
    return 0.2;
end
function Coolbag.getFoodRotSpeed()
    if (SandboxVars.FoodRotSpeed == 1) then return 1.7; end
    if (SandboxVars.FoodRotSpeed == 2) then return 1.7; end
    if (SandboxVars.FoodRotSpeed == 4) then return 0.7; end
    if (SandboxVars.FoodRotSpeed == 5) then return 0.4; end
    return 1.0;
end

local foodList = {}
function Coolbag.getFoodListToUpdate()--todo correct here for multiplayer
    return foodList;
end

function Coolbag.addToFoodListToUpdate(foodItemToAdd)
    for it,foodItem in pairs(Coolbag.getFoodListToUpdate()) do
        if foodItem and foodItemToAdd == foodItem then
            return
        end
    end
    --print ("addToFoodListToUpdate insert "..tostring(foodItemToAdd).." "..foodItemToAdd:getName());
    table.insert(Coolbag.getFoodListToUpdate(), foodItemToAdd);
end
function Coolbag.removeFromFoodListToUpdate(foodItemToRemove)
    for it,foodItem in pairs(Coolbag.getFoodListToUpdate()) do
        if foodItem and foodItemToRemove == foodItem then
            --print ("removeFromFoodListToUpdate remove "..tostring(foodItemToRemove).." "..foodItemToRemove:getName());
            foodItemToRemove:getModData().Coolbag = nil;--removed from coolbag ? reset and let normal aging process go
            local container = foodItem:getContainer();
            if container then 
                foodItem:setHeat(container:getTemprature());--get new container heat
            end
            table.remove(Coolbag.getFoodListToUpdate(), it);
            return
        end
    end
    --print ("removeFromFoodListToUpdate noThere "..tostring(foodItemToRemove).." "..foodItemToRemove:getName());
end

function Coolbag.computeNewFoodAgeInCoolbag(foodItem, doAdd)
    local foodModData = foodItem:getModData();
    local currentTime = getGameTime():getWorldAgeHours();
    if not foodModData.Coolbag then foodModData.Coolbag = {} end
    if not foodModData.Coolbag.ageLastUpdate then foodModData.Coolbag.ageLastUpdate = foodItem:getAge() end
    if not foodModData.Coolbag.worldTimeLastUpdate then foodModData.Coolbag.worldTimeLastUpdate = currentTime end
    
    --algo copied from Food class / setAutoAge() method / fridge case / no discovery case
    local agingPerHour = Coolbag.getFridgeFactor() * Coolbag.getFoodRotSpeed() / 24.0;
    foodModData.Coolbag.ageLastUpdate = foodModData.Coolbag.ageLastUpdate + agingPerHour * (currentTime - foodModData.Coolbag.worldTimeLastUpdate);
    foodModData.Coolbag.worldTimeLastUpdate = currentTime;
    --set the food item
    foodItem:setAge(foodModData.Coolbag.ageLastUpdate);
    foodItem:setLastAged(foodModData.Coolbag.worldTimeLastUpdate);
    local container = foodItem:getContainer();
    if container then 
        foodItem:setHeat(container:getTemprature());--get coolbag heat
        --foodItem:updateFreezing(container);
    else
        foodItem:setHeat(0.2);--todo get coolbag heat
    end
    --print ("computeNewFoodAgeInCoolbag "..tostring(foodItem).." "..tostring(foodItem:getAge()).." "..tostring(foodItem:getLastAged()).." "..tostring(foodItem:getHeat()))
    if doAdd then Coolbag.addToFoodListToUpdate(foodItem) end
end


function Coolbag.updateFoodList()
    for it,foodItem in pairs(Coolbag.getFoodListToUpdate()) do
        if foodItem then
            if Coolbag.isCoolingContainer(foodItem:getContainer()) then
                if Coolbag.OPTIONS.Verbose then print ("Coolbag.updateFoodList compute "..foodItem:getName() ); end
                Coolbag.computeNewFoodAgeInCoolbag(foodItem,false);
            else
                --todo check if the container was cooling. if it was, make him stop
                if Coolbag.OPTIONS.Verbose then print ("Coolbag.updateFoodList remove "..foodItem:getName() ); end
                Coolbag.removeFromFoodListToUpdate(foodItem);
            end
        end
    end
end

