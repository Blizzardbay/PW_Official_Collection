function NoXP_OnGiveXP(recipe, ingredients, result, player)
end

--[[thanks to Glytch3r for the help optimizing the code!!

--sapph: Hi... i guess it's been a while since i last did something with this mod, (this is sapph from june 2023, hello!), so
 i should probably explain this .lua file.
 anyhow, the way Zomboid works (in 2023), it can only give the player, one result item at a time.
 this code is for giving the player more result itens and some other stuff.
 i'm not that good at explaining it am i?
 well, you'll probably get it if you take a look around!
 see ya! --]]

--[[sapph: so... i kinda mess up everything, so a big thanks to Gravy and Poltergeist for the help, so yeah, learn to test vanila recipes on your mods!
never know when you'll break them!]]

require "recipecode"

--Recipes that adds on the inventory. 
function recipe_PeelPotato(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.PotatoPeel");
end

function recipe_BrewClothfilter(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.DirtyClothFilter");
end

function recipe_SaucepanBowl(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Saucepan");
end

function recipe_FryingpanBowl(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Pan");
end

function recipe_FryingpanBowl2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Pan");
	inv:AddItem("Base.Bowl");
end

function recipe_EggYolk(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.EggYolk");
end

function recipe_ChurnMilk(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.Churn_Buttermilk");
end

--Sachets!
function recipe_Noodles1(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.NoodleSachet_Beef");
end

function recipe_Noodles2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.NoodleSachet_Chicken");
end


--MRE opening spawns.
--You can get two varieties of items.
--OPTION 1 MRE
local items_to_add = {
  "SapphCooking.SaltPacket",
  "SapphCooking.Mouth_Toothpick",
  "SapphCooking.SugarPacket",
  "SapphCooking.Drinkmix_Lemon",
  "SapphCooking.PlasticSpork",
  "SapphCooking.Mustard_Sachet",
  "SapphCooking.PeanutButter_Sachet",
  "SapphCooking.Tomato_Sachet",
  "SapphCooking.HotsaucePacket",
  "SapphCooking.MRE_FlamelessRationHeater",
  "Base.Teabag",
  "Base.Matches",
  "Base.Crackers",
  "Base.Gum",
}

function recipe_MREopen1(items, result, player)
  local inv = player:getInventory()
  for _, item_name in pairs(items_to_add) do
    inv:AddItem(item_name)
  end
end

--OPTION 2 MRE
local items_to_add2 = {
  "SapphCooking.SaltPacket",
  "SapphCooking.SugarPacket",
  "SapphCooking.Mouth_Toothpick",
  "SapphCooking.Drinkmix_Orange",
  "SapphCooking.PlasticSpork",
  "SapphCooking.PeanutButter_Sachet",
  "SapphCooking.Tomato_Sachet",
  "SapphCooking.HotsaucePacket",
  "SapphCooking.MRE_FlamelessRationHeater",
  "SapphCooking.CoffeePacket",
  "Base.Matches",
  "Base.GrahamCrackers",
  "Base.Gum",
}

function recipe_MREopen2(items, result, player)
  local inv = player:getInventory()
  for _, item_name in pairs(items_to_add2) do
    inv:AddItem(item_name)
  end
end

function recipe_EmptyBottle(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.WaterBottleEmpty");
	end


function recipe_BowlStack(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Bowl");
end

	--Tag Recipes

function Recipe.GetItemTypes.SapphCookingOil(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingOil"));
    scriptItems:addAll(getScriptManager():getItemsTag("Oil"));
 end

 
 function Recipe.GetItemTypes.SapphCookingBread(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingBread"));
    scriptItems:addAll(getScriptManager():getItemsTag("Bread"));
 end

 function Recipe.GetItemTypes.SapphCookingKnifes(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingKnife"));
    scriptItems:addAll(getScriptManager():getItemsTag("SharpKnife"));
    scriptItems:addAll(getScriptManager():getItemsTag("DullKnife"));
 end

 function Recipe.GetItemTypes.SapphCookingTomatoSauce(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingKetchup"));
    scriptItems:addAll(getScriptManager():getItemsTag("Ketchup"));
    scriptItems:addAll(getScriptManager():getItemsTag("TomatoKetchup"));
 end


 function Recipe.GetItemTypes.SapphCookingMincedMeat(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingMincedMeat"));
    scriptItems:addAll(getScriptManager():getItemsTag("MincedMeat"));
 end

 function Recipe.GetItemTypes.SapphCookingBroth(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingBroth"));
    scriptItems:addAll(getScriptManager():getItemsTag("Broth"));
 end

 function Recipe.GetItemTypes.SapphCookingAlcoholic(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingAlcohol"));
    scriptItems:addAll(getScriptManager():getItemsTag("Alcoholic"));
    scriptItems:addAll(getScriptManager():getItemsTag("Alcohol"));
 end



 function Recipe.GetItemTypes.SapphCookingMinceMeat(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingMinceMeat"));
    scriptItems:addAll(getScriptManager():getItemsTag("MinceMeat"));
 end

 function Recipe.GetItemTypes.SapphCookingThermos(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingThermos"));
    scriptItems:addAll(getScriptManager():getItemsTag("Thermos"));
 end


function Recipe.GetItemTypes.SapphCookingRice(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingRice"));
	scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingRiceBowl"));
	scriptItems:addAll(getScriptManager():getItemsTag("CookedRice"));
end

function Recipe.GetItemTypes.SapphCookingSoysauce(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingSoysauce"));
	scriptItems:addAll(getScriptManager():getItemsTag("Soysauce"));
end

function Recipe.GetItemTypes.SapphCookingCitrus(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingCitrus"));
	scriptItems:addAll(getScriptManager():getItemsTag("Citrus"));
end

	function Recipe.GetItemTypes.SapphCookingRiceBowl(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingRiceBowl"));
	scriptItems:addAll(getScriptManager():getItemsTag("RiceBowl"));
end

function Recipe.GetItemTypes.SapphCookingEgg(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingEgg"));
	scriptItems:addAll(getScriptManager():getItemsTag("Egg"));
end

function Recipe.GetItemTypes.SapphCookingCheese(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingCheese"));
	scriptItems:addAll(getScriptManager():getItemsTag("Cheese"));
	scriptItems:addAll(getScriptManager():getItemsTag("Cheeses"));
end

function Recipe.GetItemTypes.SapphCookingMilk(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingMilk"));
	scriptItems:addAll(getScriptManager():getItemsTag("Milk"));
end

function Recipe.GetItemTypes.SapphCookingSausages(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingSausages"));
	scriptItems:addAll(getScriptManager():getItemsTag("Sausages"));
	scriptItems:addAll(getScriptManager():getItemsTag("Sausage"));
end

function Recipe.GetItemTypes.SapphCookingChicken(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingChicken"));
	scriptItems:addAll(getScriptManager():getItemsTag("Chicken"));
end

function Recipe.GetItemTypes.SapphCookingSugar(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingSugar"));
	scriptItems:addAll(getScriptManager():getItemsTag("Sugar"));
end

function Recipe.GetItemTypes.SapphCookingPepper(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingPepper"));
	scriptItems:addAll(getScriptManager():getItemsTag("Pepper"));
end

function Recipe.GetItemTypes.SapphCookingSalt(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingSalt"));
	scriptItems:addAll(getScriptManager():getItemsTag("Salt"));
end

function Recipe.GetItemTypes.SapphCookingPasta(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingPasta"));
	scriptItems:addAll(getScriptManager():getItemsTag("Pasta"));
end

function Recipe.GetItemTypes.SapphCookingSliced(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingSlicedVegetables"));
	scriptItems:addAll(getScriptManager():getItemsTag("SlicedVegetables"));
end

function Recipe.GetItemTypes.SapphCookingCoffeeCup(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("CoffeeCup"));
end

function Recipe.GetItemTypes.SapphCookingMeltedChocolate(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("MeltedChocolate"));
	scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingMeltedChocolate"));
end

	-- Adding Candles on cakes.
	--  sapph: So... wasn't sure why i added this.
    -- someone a few months ago said they had their birthday on zomboid,
    -- so i guess this was made with that in mind, some way of adding candles on a cakes
    -- birthdays should be fun, so hopefully this can help with that.
    -- heh, only time will tell.
function LightCakeCandle_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "Candle" then
            result:setUsedDelta(item:getUsedDelta());
            result:setCondition(item:getCondition());
            result:setFavorite(item:isFavorite());
            if player:getPrimaryHandItem() == player:getSecondaryHandItem() then
                player:setPrimaryHandItem(nil)
            end
            player:setSecondaryHandItem(result);
            result:setActivated(true); --ensure the candle emits light upon creation
        end
    end
end

function ExtinguishCarrotCakeCandle_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "CarrotCake_CandleLit" then
            result:setUsedDelta(item:getUsedDelta());
            result:setCondition(item:getCondition());
            result:setFavorite(item:isFavorite());
        end
    end
	--remove candle
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.CarrotCake");
end

function ExtinguishChocolateCakeCandle_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "ChocolateCake_CandleLit" then
            result:setUsedDelta(item:getUsedDelta());
            result:setCondition(item:getCondition());
            result:setFavorite(item:isFavorite());
        end
    end
	--remove candle
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.ChocolateCake");
end

	--cutting cakes.
	--Gives 5 pieces of cake.
function recipe_CarrotCake(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.CakeCarrot", 5);
end


function recipe_ChocolateCake(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.CakeChocolate", 5);
end


--Tests to see if a food has been eaten before crafting it.
function Recipe.OnTest.WholeSlicedVegetables(item)
	if item:isCooked() then return false end
	if not item:hasTag("SlicedVegetables") then return true end
	local baseHunger = math.abs(item:getBaseHunger())
	local hungerChange = math.abs(item:getHungerChange())
    if item:isFresh() then return not (baseHunger > hungerChange) end
    return not ((baseHunger * 0.75) > hungerChange)
end


--Adds the code to make Wok/Frying Pan Evolved Bowls... or pieces.
--sapph: Okay... so... what this does is, it first checks what type of pan the player has using "addType", then,
-- it creates a condition with a set value, that way  whatever condition the pan was, it will still stay the same.
-- after that, it checks every item in the recipe, and checks if the item type matches the recipe type.
-- it divides the values by 2 or 4, depending on how many bowls the player will get.
-- this is mainly for evolved recipes, where the player adds stuff on something.
-- anyhow, thanks! see ya around!

--Woks--
function Recipe.OnCreate.MakeBowlofFood2Wok(items, result, player)
    local addType = "SapphCooking.WokPan"
    local condition = 10;
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "WokPanwithFriedRice" or item:getType() == "WokFriedRiceEvolved" or item:getType() == "WokPan_Yakisoba" or item:getType() == "WokPan_YakisobaEvolved" then
            result:setBaseHunger(item:getBaseHunger() / 2);
            result:setHungChange(item:getHungChange() / 2);
            result:setThirstChange(item:getThirstChangeUnmodified() / 2);
            result:setBoredomChange(item:getBoredomChangeUnmodified() / 2);
            result:setUnhappyChange(item:getUnhappyChangeUnmodified() / 2);
            result:setCarbohydrates(item:getCarbohydrates() / 2);
            result:setLipids(item:getLipids() / 2);
            result:setProteins(item:getProteins() / 2);
            result:setCalories(item:getCalories() / 2);
            result:setTaintedWater(item:isTaintedWater());
            result:setCooked(item:isCooked());
            condition = item:getCondition();
        end
    end
    local pot = player:getInventory():AddItem(addType);
    pot:setCondition(condition);
end

function Recipe.OnCreate.MakeBowlofFood4Wok(items, result, player)
    local addType = "SapphCooking.WokPan"
    local condition = 10;
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "WokPanwithFriedRice" or item:getType() == "WokFriedRiceEvolved" or item:getType() == "WokPan_Yakisoba" or item:getType() == "WokPan_YakisobaEvolved" then
            result:setBaseHunger(item:getBaseHunger() / 4);
            result:setHungChange(item:getHungChange() / 4);
            result:setThirstChange(item:getThirstChangeUnmodified() / 4);
            result:setBoredomChange(item:getBoredomChangeUnmodified() / 4);
            result:setUnhappyChange(item:getUnhappyChangeUnmodified() / 4);
            result:setCarbohydrates(item:getCarbohydrates() / 4);
            result:setLipids(item:getLipids() / 4);
            result:setProteins(item:getProteins() / 4);
            result:setCalories(item:getCalories() / 4);
            result:setTaintedWater(item:isTaintedWater());
            result:setCooked(item:isCooked());
            condition = item:getCondition();
        end
    end
    local pot = player:getInventory():AddItem(addType);
    pot:setCondition(condition);
end

--Frying Pans
function Recipe.OnCreate.MakeBowlofFood2Pan(items, result, player)
    local addType = "Base.Pan"
    local condition = 10;
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "FryingPanwithFriedRice" or item:getType() == "FryingPanFriedRiceEvolved" then
            result:setBaseHunger(item:getBaseHunger() / 2);
            result:setHungChange(item:getHungChange() / 2);
            result:setThirstChange(item:getThirstChangeUnmodified() / 2);
            result:setBoredomChange(item:getBoredomChangeUnmodified() / 2);
            result:setUnhappyChange(item:getUnhappyChangeUnmodified() / 2);
            result:setCarbohydrates(item:getCarbohydrates() / 2);
            result:setLipids(item:getLipids() / 2);
            result:setProteins(item:getProteins() / 2);
            result:setCalories(item:getCalories() / 2);
            result:setTaintedWater(item:isTaintedWater());
            result:setCooked(item:isCooked());
            condition = item:getCondition();
        end
    end
    local pot = player:getInventory():AddItem(addType);
    pot:setCondition(condition);
end

function Recipe.OnCreate.MakeBowlofFood4Pan(items, result, player)
    local addType = "Base.Pan"
    local condition = 10;
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "FryingPanwithFriedRice" or item:getType() == "FryingPanFriedRiceEvolved" then
            result:setBaseHunger(item:getBaseHunger() / 4);
            result:setHungChange(item:getHungChange() / 4);
            result:setThirstChange(item:getThirstChangeUnmodified() / 4);
            result:setBoredomChange(item:getBoredomChangeUnmodified() / 4);
            result:setUnhappyChange(item:getUnhappyChangeUnmodified() / 4);
            result:setCarbohydrates(item:getCarbohydrates() / 4);
            result:setLipids(item:getLipids() / 4);
            result:setProteins(item:getProteins() / 4);
            result:setCalories(item:getCalories() / 4);
            result:setTaintedWater(item:isTaintedWater());
            result:setCooked(item:isCooked());
            condition = item:getCondition();
        end
    end
    local pot = player:getInventory():AddItem(addType);
    pot:setCondition(condition);
end

--Saucepans
function Recipe.OnCreate.MakeBowlofFood2Saucepan(items, result, player)
    local addType = "Base.Saucepan"
    local condition = 10;
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "SaucepanwithRavioli" or item:getType() == "SaucepanwithSpaguetti" or item:getType() == "SaucepanwithUncookedSpaguetti" or item:getType() == "Saucepan_InstantNoodlesEvolved" or item:getType() == "Saucepan_InstantNoodles" or item:getType() == "SaucepanwithTortellini" or item:getType() == "Saucepan_ArrozLeche" or item:getType() == "Saucepan_ArrozLecheUn" then
            result:setBaseHunger(item:getBaseHunger() / 2);
            result:setHungChange(item:getHungChange() / 2);
            result:setThirstChange(item:getThirstChangeUnmodified() / 2);
            result:setBoredomChange(item:getBoredomChangeUnmodified() / 2);
            result:setUnhappyChange(item:getUnhappyChangeUnmodified() / 2);
            result:setCarbohydrates(item:getCarbohydrates() / 2);
            result:setLipids(item:getLipids() / 2);
            result:setProteins(item:getProteins() / 2);
            result:setCalories(item:getCalories() / 2);
            result:setCooked(item:isCooked());
        end
    end
    local pot = player:getInventory():AddItem(addType);
end

--Lasagna/Ratatouille  Pieces 
--sapph: so... this checks if the item name is lasagna or ratattouile, then divides it by x amount.
function Recipe.OnCreate.CutLasagna4Pieces(items, result, player)
    local addType = "Base.RoastingPan"
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "RoastingpanwithLasagna" or item:getType() == "RoastingpanwithUncookedLasagna" or item:getType() == "RoastingpanwithRatatouilleUn" or item:getType() == "RoastingpanwithRatatouilleCooked" then
            result:setBaseHunger(item:getBaseHunger() / 4);
            result:setHungChange(item:getHungChange() / 4);
            result:setThirstChange(item:getThirstChangeUnmodified() / 4);
            result:setBoredomChange(item:getBoredomChangeUnmodified() / 4);
            result:setUnhappyChange(item:getUnhappyChangeUnmodified() / 4);
            result:setCarbohydrates(item:getCarbohydrates() / 4);
            result:setLipids(item:getLipids() / 4);
            result:setProteins(item:getProteins() / 4);
            result:setCalories(item:getCalories() / 4);
        end
    end
    local pot = player:getInventory():AddItem(addType);
end

function Recipe.OnCreate.CutLasagna8Pieces(items, result, player)
    local addType = "Base.RoastingPan"
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "RoastingpanwithLasagna" or item:getType() == "RoastingpanwithUncookedLasagna" or item:getType() == "RoastingpanwithRatatouilleUn" or item:getType() == "RoastingpanwithRatatouilleCooked" then
            result:setBaseHunger(item:getBaseHunger() / 8);
            result:setHungChange(item:getHungChange() / 8);
            result:setThirstChange(item:getThirstChangeUnmodified() / 8);
            result:setBoredomChange(item:getBoredomChangeUnmodified() / 8);
            result:setUnhappyChange(item:getUnhappyChangeUnmodified() / 8);
            result:setCarbohydrates(item:getCarbohydrates() / 8);
            result:setLipids(item:getLipids() / 8);
            result:setProteins(item:getProteins() / 8);
            result:setCalories(item:getCalories() / 8);
        end
    end
    local pot = player:getInventory():AddItem(addType);
end

--Thermos Soup
--sapph:code that transfer every stats of a soup pot, into a thermos can!
function Recipe.OnCreate.SoupThermos(items, result, player)
    local addType = "Base.Pot"
    local condition = 10;
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "PotOfSoup" or item:getType() == "PotOfSoupRecipe" then
            result:setBaseHunger(item:getBaseHunger());
            result:setHungChange(item:getHungChange());
            result:setThirstChange(item:getThirstChangeUnmodified());
            result:setBoredomChange(item:getBoredomChangeUnmodified());
            result:setUnhappyChange(item:getUnhappyChangeUnmodified());
            result:setCarbohydrates(item:getCarbohydrates());
            result:setLipids(item:getLipids());
            result:setProteins(item:getProteins());
            result:setCalories(item:getCalories());
            result:setTaintedWater(item:isTaintedWater());
            result:setCooked(item:isCooked());
            condition = item:getCondition();
            if string.contains(item:getType(), "Pan") or string.contains(item:getType(), "Saucepan") then
                addType = "Base.Saucepan"
            end
        end
    end
    local pot = player:getInventory():AddItem(addType);
    pot:setCondition(condition)
end


--Hotdogs
--sapph:code for custom hotdogs.
function Recipe.OnCreate.HotdogEvolved(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "Sausage" or item:getType() == "FrankfurterSausage" or item:getType() == "ViennaSausage" or item:getType() == "SausageEvolved" then
            result:setBaseHunger(item:getBaseHunger());
            result:setHungChange(item:getHungChange());
            result:setThirstChange(item:getThirstChangeUnmodified());
            result:setBoredomChange(item:getBoredomChangeUnmodified());
            result:setUnhappyChange(item:getUnhappyChangeUnmodified());
            result:setCarbohydrates(item:getCarbohydrates());
            result:setLipids(item:getLipids());
            result:setProteins(item:getProteins());
            result:setCalories(item:getCalories() + 200);
        end
    end
end

--Stock
--sapph:code for custom vegetable broths
function Recipe.OnCreate.StockBottle(items, result, player)
    local addType = "Base.Pot"
    local condition = 10;
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "PotofVegetableStock" then
            result:setBaseHunger(item:getBaseHunger());
            result:setHungChange(item:getHungChange());
            result:setThirstChange(item:getThirstChangeUnmodified());
            result:setBoredomChange(item:getBoredomChangeUnmodified());
            result:setUnhappyChange(item:getUnhappyChangeUnmodified());
            result:setCarbohydrates(item:getCarbohydrates());
            result:setLipids(item:getLipids());
            result:setProteins(item:getProteins());
            result:setCalories(item:getCalories());
            result:setWeight(item:getWeight());
            result:setActualWeight(item:getActualWeight())
            condition = item:getCondition();
        end
    end
    local pot = player:getInventory():AddItem(addType);
    pot:setCondition(condition)
end


--GRIND Meat

function Recipe.OnCreate.GrindMeat(items, result, player)
    --sapph: this code is being used in tenderizing meat as well, since it uses the same base items
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "Sausage" or item:getType() == "Chicken" or item:getType() == "Smallanimalmeat" or item:getType() == "Smallbirdmeat" or item:getType() == "SlicedChicken" or item:getType() == "SlicedChickenBatter" or item:getType() == "FrankfurterSausage" or item:getType() == "ViennaSausage" or item:getType() == "MuttonChop" or item:getType() == "SlicedSteak" or item:getType() == "Steak" or item:getType() == "PorkChop" or item:getType() == "Rabbitmeat" or item:getType() == "MincedMeat" or item:getType() == "MincedMeat_Chicken"then
            result:setBaseHunger(item:getBaseHunger());
            result:setHungChange(item:getHungChange());
            result:setThirstChange(item:getThirstChangeUnmodified());
            result:setBoredomChange(item:getBoredomChangeUnmodified());
            result:setUnhappyChange(item:getUnhappyChangeUnmodified());
            result:setCarbohydrates(item:getCarbohydrates());
            result:setLipids(item:getLipids());
            result:setProteins(item:getProteins());
            result:setCalories(item:getCalories());
            result:setWeight(item:getWeight());
            result:setActualWeight(item:getActualWeight())

        end
    end
end

function Recipe.OnCreate.PreparePasta(items, result, player)

    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "Ravioli" or item:getType() == "RolledPastaDough" or item:getType() == "Tortellini" or item:getType() == "FilledMeatPastaDough" or item:getType() == "SlicedChicken" or item:getType() == "SlicedChickenBatter" or item:getType() == "FrankfurterSausage" or item:getType() == "ViennaSausage" or item:getType() == "MuttonChop" or item:getType() == "SlicedSteak" or item:getType() == "Steak" or item:getType() == "PorkChop" or item:getType() == "Rabbitmeat" or item:getType() == "MincedMeat" or item:getType() == "MincedMeat_Chicken" then
            result:setBaseHunger(item:getBaseHunger());
            result:setHungChange(item:getHungChange());
            result:setThirstChange(item:getThirstChangeUnmodified());
            result:setBoredomChange(item:getBoredomChangeUnmodified());
            result:setUnhappyChange(item:getUnhappyChangeUnmodified());
            result:setCarbohydrates(item:getCarbohydrates());
            result:setLipids(item:getLipids());
            result:setProteins(item:getProteins());
            result:setCalories(item:getCalories());

        end
    end
end
function Recipe.OnCreate.FillPasta(items, result, player)
--sapph: so, i just decided to hard code it, since it seems it overlaps the current calorie intake of the pasta!
--since its only used in one recipe, i think this is a way that works, until a smart and better way is done!
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() =="MincedMeat" or item:getType() == "MincedMeat_Chicken" then
            result:setBaseHunger(item:getBaseHunger() * 1.5);
            result:setHungChange(item:getHungChange() * 1.5);
            result:setThirstChange(item:getThirstChangeUnmodified());
            result:setBoredomChange(item:getBoredomChangeUnmodified());
            result:setUnhappyChange(item:getUnhappyChangeUnmodified());
            result:setCarbohydrates(item:getCarbohydrates());
            result:setLipids(item:getLipids() + 6);
            result:setProteins(item:getProteins() + 17);
            result:setCalories(item:getCalories() + 532);

        end
    end
end


--Batter/Fry Recipes
function Recipe.OnCreate.FryingBatter(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "TenderizedMeat" or item:getType() == "BreadedTenderizedMeat" or item:getType() == "FishFilletinBatter" or item:getType() == "SapphFishFried" or item:getType() == "Schnitzel" or item:getType() == "Smallbirdmeat" or item:getType() == "SmallbirdmeatinBatter" or item:getType() == "FishFillet" then
            result:setBaseHunger(item:getBaseHunger());
            result:setHungChange(item:getHungChange());
            result:setThirstChange(item:getThirstChangeUnmodified());
            result:setBoredomChange(item:getBoredomChangeUnmodified());
            result:setUnhappyChange(item:getUnhappyChangeUnmodified());
            result:setCarbohydrates(item:getCarbohydrates());
            result:setLipids(item:getLipids());
            result:setProteins(item:getProteins());
            result:setCalories(item:getCalories());
        end
    end
end

--Coffee Thermos 
--sapph: decided to only get calories,proteins and stuff like that, so the original result doenst stay too far off the correct values.
function Recipe.OnCreate.ThermosCups(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "ThermosCoffee" or item:getType() == "ThermosCoffeeEvolved" or item:getType() == "ThermosBeverage" then
            result:setCarbohydrates(item:getCarbohydrates() / 2);
            result:setLipids(item:getLipids() / 2);
            result:setProteins(item:getProteins() / 2);
            result:setCalories(item:getCalories() / 2);
            result:setWeight(item:getWeight()/2);
            result:setActualWeight(item:getActualWeight()/2)

        end
    end
end

--Sausages Casings.
--sapph:this is basically the original butchering animal code...but it gives you sausage casings at the end.


function Recipe.OnCreate.MakeSausagesCasing(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        local new_hunger = anim:getHungChange() * 1.05;
        if(new_hunger < -100) then
            new_hunger = -100;
        end
        result:setBaseHunger(new_hunger);
        result:setHungChange(new_hunger);

        result:setCustomWeight(true);
        result:setWeight(anim:getWeight() * 0.7);
        result:setActualWeight(anim:getActualWeight() * 0.7);

        result:setLipids(anim:getLipids() * 0.75);
        result:setProteins(anim:getProteins() * 0.75);
        result:setCalories(anim:getCalories() * 0.75);
        result:setCarbohydrates(anim:getCarbohydrates() * 0.75);
    end
    local inv = player:getInventory();
	inv:AddItem("SapphCooking.SausageCasing", 3);
end


function Recipe.OnCreate.DrinkMixCups(items, result, player)

    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "CocktailMixerEvolved" or item:getType() == "CocktailMixerPrep" then
            result:setName(item:getName());
            result:setBaseHunger(item:getBaseHunger());
            result:setHungChange(item:getHungChange());
            result:setThirstChange(item:getThirstChangeUnmodified());
            result:setBoredomChange(item:getBoredomChangeUnmodified());
            result:setUnhappyChange(item:getUnhappyChangeUnmodified());
            result:setCarbohydrates(item:getCarbohydrates());
            result:setLipids(item:getLipids());
            result:setProteins(item:getProteins());
            result:setCalories(item:getCalories());
        end
    end
    local inv = player:getInventory();
	inv:AddItem("SapphCooking.CocktailMixer");
end

function Recipe.OnCreate.ChurnBottle(items, result, player)

    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "Churn_Buttermilk" or item:getType() == "Churn_Wine" then
            result:setBaseHunger(item:getBaseHunger());
            result:setHungChange(item:getHungChange());
            result:setThirstChange(item:getThirstChangeUnmodified());
            result:setBoredomChange(item:getBoredomChangeUnmodified());
            result:setUnhappyChange(item:getUnhappyChangeUnmodified());
            result:setCarbohydrates(item:getCarbohydrates());
            result:setLipids(item:getLipids());
            result:setProteins(item:getProteins());
            result:setCalories(item:getCalories());
        end
    end
    local inv = player:getInventory();
	inv:AddItem("SapphCooking.ButterChurn");
end
