require 'recipecode'

MoreBrews = MoreBrews or {}
-- Wine Kit Unpack 

MoreBrews.wineOptions = {
    WineBase = {"RedWineBase", "WhiteWineBase"},
    Supplies = {"CorksBag", "EmptyGallonCarboy"},
    MeadCider = {"HoneyMeadBase", "HardCiderBase"},
    Magazines = {"MagazineWineMaking1", "MagazineWineMaking2", "MagazineWineMaking3", "MagazineWineMaking4", "MagazineWineMaking5"}
}

-- Wine Kit Unpack 

function MoreBrews.WineSupplies(items, result, player)
    local inventory = player:getInventory();
    local spawns = {
    }

    function addRandomWineItem(oType, count)
        for i = 1, count or 1
        do
            table.insert(spawns, MoreBrews.wineOptions[oType][ZombRand(#MoreBrews.wineOptions[oType] + 1)]);
        end
    end

    local r = ZombRand(1, 100);
    local s = ZombRand(1, 100);
    local t = ZombRand(1, 100);

    addRandomWineItem("WineBase");

    if r <= 60
    then
        addRandomWineItem("Supplies");
    elseif r <= 75
    then
        player:getInventory():AddItem("MoreBrews.Carboy")
    end

    if s <= 40
    then
        addRandomWineItem("MeadCider");
    end

    if t <= 33
    then
        addRandomWineItem("Magazines");
    end
    
    for i, itemId in ipairs(spawns)
    do
        inventory:AddItem("MoreBrews." .. itemId);
    end
    player:getInventory():AddItem("Sugar")
    player:getInventory():AddItem("Yeast")
end

function Recipe.GetItemTypes.EmptyWineBox(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("EmptyWineBox"))
end

function Recipe.GetItemTypes.EmptyWineBottle(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("EmptyWineBottle"))
end

function Recipe.GetItemTypes.WineBase(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("WineBase"))
end

function Recipe.GetItemTypes.FullLargeBarrel(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("FullLargeBarrel"))
end

function Recipe.GetItemTypes.FullSmallBarrel(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("FullSmallBarrel"))
end

function Recipe.GetItemTypes.FullGallonCarboy(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("FullGallonCarboy"))
end

function Recipe.GetItemTypes.FullCarboy(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("FullCarboy"))
end

-- Adds  empty Jar back to inventory after processing dry yeast product
function GetJar(items, result, player)
    player:getInventory():AddItem("EmptyJar")
    player:getInventory():AddItem("RubberBand")
    player:getInventory():AddItem("RippedSheetsDirty")
end

-- Adds  empty bowl back to inventory after making primary fermenter
function GetBowl(items, result, player)
    player:getInventory():AddItem("Bowl")
end

-- Adds empty bowls back to inventory after making LARGE carboy primary fermenter
function GetBowls(items, result, player)
    player:getInventory():AddItem("Bowl")
    player:getInventory():AddItem("Bowl")
    player:getInventory():AddItem("Bowl")
    player:getInventory():AddItem("Bowl")
end

-- Adds  empty Carboy back to inventory after processing dry yeast product
function GetCarboy(items, result, player)
    player:getInventory():AddItem("MoreBrews.EmptyCarboy")
end

-- Adds  empty Gallon Carboy back to inventory after processing dry yeast product
function GetGallonCarboy(items, result, player)
    player:getInventory():AddItem("MoreBrews.EmptyGallonCarboy")
end

-- Adds  empty Gallon Carboys back to inventory after processing dry yeast product
function GetGallonCarboys(items, result, player)
    player:getInventory():AddItem("MoreBrews.EmptyGallonCarboy")
    player:getInventory():AddItem("MoreBrews.EmptyGallonCarboy")
    player:getInventory():AddItem("MoreBrews.EmptyGallonCarboy")
    player:getInventory():AddItem("MoreBrews.EmptyGallonCarboy")
end

-- Adds XP for WineMaking to recipes
function Recipe.OnGiveXP.WineMaking5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.WineMaking, 5);
end

function Recipe.OnGiveXP.WineMaking10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.WineMaking, 10);
end

function Recipe.OnGiveXP.WineMaking25(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.WineMaking, 25);
end

function Recipe.OnGiveXP.WineMaking50(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.WineMaking, 50);
end

-- drinking crafted wine with Vintner trait reduces boredom
function OnEat_Wine(food, character, percent)
    local script = food:getScriptItem();
    local bodyDamage = character:getBodyDamage();
    local stats = character:getStats();
    if character:HasTrait("Vintner") then
        bodyDamage:setBoredomLevel(bodyDamage:getBoredomLevel() - (10 * percent));
        if bodyDamage:getBoredomLevel() > 100 then
            bodyDamage:setBoredomLevel(100);
        end
    end
    if getActivatedMods():contains("jiggasGreenfireMod") then
            OnDrink_Wine(food, character, percent) --launching the function of drinking beer - GreenFire mod
        return
    end
    if getActivatedMods():contains("DynamicTraits") then
        function OnEat_Alcohol(food, player) --launching the function of OnEat_Alcohol to function with overdoes mechanic - Dynamic Traits Mod
        return
    end
end
end

local sVars = SandboxVars.MoreBrewsWineMeUp;
sVars.WineMakingBonus = sVars.WineMakingBonus or 0;

function MoreBrews.onWineMakingPerkBoxes(items, character, player)
    local player = getPlayer();
    local WineMaking = player:getPerkLevel(Perks.WineMaking);

    if WineMaking >= 9 then
        player:getInventory():AddItems("MoreBrews.EmptyWineBoxSmall", (3 + sVars.WineMakingBonus))
    elseif WineMaking >= 6 then
        player:getInventory():AddItems("MoreBrews.EmptyWineBoxSmall", (2 + sVars.WineMakingBonus))
    elseif WineMaking >= 3 then
        player:getInventory():AddItems("MoreBrews.EmptyWineBoxSmall", (1 + sVars.WineMakingBonus))
    end
end

function MoreBrews.onWineMakingPerkBottles(items, character, player)
    local player = getPlayer();
    local WineMaking = player:getPerkLevel(Perks.WineMaking);

    if WineMaking >= 9 then
        player:getInventory():AddItems("Base.WineEmpty", (3 + sVars.WineMakingBonus))
    elseif WineMaking >= 6 then
        player:getInventory():AddItems("Base.WineEmpty", (2 + sVars.WineMakingBonus))
    elseif WineMaking >= 3 then
        player:getInventory():AddItems("Base.WineEmpty", (1 + sVars.WineMakingBonus))
    end
end

function MoreBrews.onWineMakingPerkCorks(items, character, player)
    local player = getPlayer();
    local WineMaking = player:getPerkLevel(Perks.WineMaking);

    if WineMaking >= 9 then
        player:getInventory():AddItems("Base.Cork", (3 + sVars.WineMakingBonus))
    elseif WineMaking >= 6 then
        player:getInventory():AddItems("Base.Cork", (2 + sVars.WineMakingBonus))
    elseif WineMaking >= 3 then
        player:getInventory():AddItems("Base.Cork", (1 + sVars.WineMakingBonus))
    end
end