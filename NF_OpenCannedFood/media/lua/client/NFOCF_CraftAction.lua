local RECIPE_NAMES = {
    'Make Pot of Soup',
    'Open Canned Soup',
    'Open Canned Beans',
    'Open Dog Food',
    'Make Bowl of Beans',
    'Open Canned Corn',
    'Open Canned Bolognese',
    'Open Canned Chili',
    'Open Canned Mushroom Soup',
    'Open Canned Peas',
    'Open Canned Potato',
    'Open Canned Tomato',
    'Open Canned Carrots'
}

local function isKnifeUsable(container, itemType)
    local knives = container:getItemsFromType(itemType)
    for i = 0, knives:size() - 1 do
        if knives:get(i):getCondition() >= 1 then return true end
    end
    return false
end

local original_function = ISCraftAction.new
function ISCraftAction:new(character, item, time, recipe, container, containers)
    local o = original_function(self, character, item, time, recipe, container, containers)
    if recipe and recipe.getOriginalname then
        for _, name in ipairs(RECIPE_NAMES) do
            if recipe:getOriginalname() == name then
                local foundOpener = false
                local foundKnife = false
                -- Check all containers first
                for i = 0, containers:size() - 1 do
                    local itemContainer = containers:get(i)
                    if itemContainer:contains("Base.TinOpener") then
                        foundOpener = true
                        break
                    end
                    if itemContainer:contains("Base.KitchenKnife") then
                        foundKnife = isKnifeUsable(itemContainer, "Base.KitchenKnife")
                    end
                    if itemContainer:contains("Base.HuntingKnife") then
                        foundKnife = isKnifeUsable(itemContainer, "Base.HuntingKnife")
                    end
                end
                -- Set the correct time
                if foundKnife and not foundOpener then
                    o.maxTime = time + 80
                elseif not foundKnife and not foundOpener then
                    o.maxTime = time + 240
                end
            end
        end
    end
    return o
end