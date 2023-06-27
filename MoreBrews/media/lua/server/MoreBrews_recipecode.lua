require "recipecode"

MoreBrews = MoreBrews or {}

MoreBrews.beerOptions = {
    Hops1 = {"HopsHallertau", "HopsCascade"},
    Hops2 = {"HopsSimcoe", "HopsMosaic", "HopsCitra"},
    Hops3 = { "HopsMosaic", "HopsCitra", "HopsCentennial"},
    Hops4 = {"HopsGolding", "HopsNugget"},
    Extract = {"MaltExtractLight", "MaltExtractDark", "MaltExtractDark", "MaltExtractDark", "MaltExtractDark"},
    Magazines = {"MagazineHomeBrew1", "MagazineHomeBrew2", "MagazineHomeBrew3", "MagazineHomeBrew4", "MagazineHomeBrew5"},
    Tools = {"BottleCapper", "CanSealer", "BottleCapsBag"}
}

-- Brewing Kit Unpack = 100% get Sugar, Yeast, & Pilsner supplies + a chance at 1 of the 8 malts+hops for other styles of beer + 
-- Less than  half Chance to get Bottle Capper OR Can Sealer tool + about a fifth chance to get recipe magazine

function MoreBrews.BrewingSupplies(items, result, player)
    local inventory = player:getInventory();
    local spawns = {
        "HopsSaaz",
        "MaltExtractLight",
    }

    function addRandomBrewingItem(oType, count)
        for i = 1, count or 1
        do
            table.insert(spawns, MoreBrews.beerOptions[oType][ZombRand(#MoreBrews.beerOptions[oType] + 1)]);
        end
    end

    local r = ZombRand(1, 100);
    local s = ZombRand(1, 100);
    local t = ZombRand(1, 100);

    if r <= 20
    then
        addRandomBrewingItem("Extract");
        addRandomBrewingItem("Hops1", 2);
    elseif r <= 40 
    then
        addRandomBrewingItem("Extract");
        addRandomBrewingItem("Hops2", 2);
    elseif r <= 60
    then
        addRandomBrewingItem("Extract");
        addRandomBrewingItem("Hops3", 2);
    elseif r <= 80
    then
        addRandomBrewingItem("Extract");
        addRandomBrewingItem("Hops4", 2);
    else
        addRandomBrewingItem("Extract");
    end

    if s <= 70
    then
        addRandomBrewingItem("Tools");
    end

    if t <= 33
    then
        addRandomBrewingItem("Magazines");
    end
    
    for i, itemId in ipairs(spawns)
    do
        inventory:AddItem("MoreBrews." .. itemId);
    end
    player:getInventory():AddItem("Sugar")
    player:getInventory():AddItem("Yeast")
end

-- Adds  empty cooking pot back to inventory after making primary fermenter
function GetPot(items, result, player)
    player:getInventory():AddItem("Pot")
end

-- Adds  empty Carboy pot back to inventory after making primary fermenter
function GetCarboy(items, result, player)
    player:getInventory():AddItem("MoreBrews.EmptyCarboy")
end

-- Wort needs to be cooked first
function Recipe.OnCanPerform.PrepFerment(recipe, playerObj, item)
    return item and item:isCooked();
end

-- Adds XP for Brewing to recipes
function Recipe.OnGiveXP.Brewing5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Brewing, 5);
end

function Recipe.OnGiveXP.Brewing10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Brewing, 10);
end

function Recipe.OnGiveXP.Brewing25(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Brewing, 25);
end

function Recipe.OnGiveXP.Brewing50(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Brewing, 50);
end

-- drinking crafted beer with brewer trait reduces boredom
function OnEat_Beer(food, character, player)
    local player = getPlayer();
    local stats = player:getStats();
    local bodyDamage = player:getBodyDamage();
    local brewing = player:getPerkLevel(Perks.Brewing);
    local script = food:getScriptItem();

    if brewing >= 7 then
        if stats:getHunger() > 0.05 then
            stats:setHunger(stats:getHunger() -0.02)
        end
        if stats:getThirst() > 0.05 then
            stats:setThirst(stats:getThirst() -0.02)
        end
    elseif brewing >= 4 then
        if stats:getHunger() > 0.05 then
            stats:setHunger(stats:getHunger() -0.01)
        end
        if stats:getThirst() > 0.05 then
            stats:setThirst(stats:getThirst() -0.01)
        end
    end

    if player:HasTrait("Brewer") and bodyDamage:getBoredomLevel() > 15 then
        bodyDamage:setBoredomLevel(bodyDamage:getBoredomLevel() - 10)
    end

    if getActivatedMods():contains("jiggasGreenfireMod") then
            OnDrink_Beer(food, character, percent) --launching the function of drinking beer to interact with alcoholic trait - GreenFire mod
        return
    end
    if getActivatedMods():contains("DynamicTraits") then
        function OnEat_Alcohol(food, player) --launching the function of OnEat_Alcohol to function with overdoes mechanic - Dynamic Traits Mod
        return
    end
end
end

local sVars = SandboxVars.MoreBrews;
sVars.BrewingBonus = sVars.BrewingBonus or 0;

function MoreBrews.onBrewerPerkCans(items, character, player)
    local player = getPlayer();
    local brewing = player:getPerkLevel(Perks.Brewing);

    if brewing >= 9 then
        player:getInventory():AddItems("Base.BeerCanEmpty", (3 + sVars.BrewingBonus))
    elseif brewing >= 6 then
        player:getInventory():AddItems("Base.BeerCanEmpty", (2 + sVars.BrewingBonus))
    elseif brewing >= 3 then
        player:getInventory():AddItems("Base.BeerCanEmpty", (1 + sVars.BrewingBonus))
    end
end

function MoreBrews.onBrewerPerkBottles(items, character, player)
    local player = getPlayer();
    local brewing = player:getPerkLevel(Perks.Brewing);

    if brewing >= 9 then
        player:getInventory():AddItems("Base.BeerEmpty", (3 + sVars.BrewingBonus))
    elseif brewing >= 6 then
        player:getInventory():AddItems("Base.BeerEmpty", (2 + sVars.BrewingBonus))
    elseif brewing >= 3 then
        player:getInventory():AddItems("Base.BeerEmpty", (1 + sVars.BrewingBonus))
    end
end

function MoreBrews.onBrewerPerkCaps(items, character, player)
    local player = getPlayer();
    local brewing = player:getPerkLevel(Perks.Brewing);

    if brewing >= 9 then
        player:getInventory():AddItems("MoreBrews.BottleCap", (3 + sVars.BrewingBonus))
    elseif brewing >= 6 then
        player:getInventory():AddItems("MoreBrews.BottleCap", (2 + sVars.BrewingBonus))
    elseif brewing >= 3 then
        player:getInventory():AddItems("MoreBrews.BottleCap", (1 + sVars.BrewingBonus))
    end
end