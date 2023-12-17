--This code is for adding evolved recipes.
--this way it's not necessary to overlap the existing vanila items.

--Thanks Glytch3r, Poltergeist, Gravy, Blair Algol, Albion, and everyone on the official pz discord that helps everyone solving problems (it helps lurkers like me :D)!!!

--Sapph: Hi, i guess i should explain what this file does, basically, it changes a few lines on several foods, that way they can
-- be used on other recipes(using the "Tags" system) or evolved recipes!

-- this file is reading "evolvedrecipes" on the scripts folder, for the evolved recipes bits, so things like skewers and fried rice are being done there,
-- and that file reads the items scripts, it's pretty confusing, but yeah, it is what it is!

-- also, most of my coding is done while i'm sleep deprived, so yeah! i'ts pretty impressive it all works honestly.



local Rice =
{
	"SapphCooking.ArborioRice",
	"Base.Rice",
	"SapphCooking.BrownRice",
}

local Bread =
{
	"SapphCooking.HotdogBun",
	"Base.Bread",
	"Base.BreadSlices",
	"Base.Baguette",
}
local Citrus =
{
	"Base.Lemon",
	"Base.Lime",
	"SapphCooking.BottleofLemonJuice",
}
local ChickenMeat =
{
	"Base.Chicken",
	"Base.Smallbirdmeat",
	"SapphCooking.SlicedChicken",
	"SapphCooking.SlicedChickenBatter",
	"SapphCooking.Seitan",
}
local BeefMeat =
{
	"Base.Steak",
	"Base.MuttonChop",
	"Base.PorkChop",
	"Base.Sausage",
	"Base.Rabbitmeat",
	"Base.Smallanimalmeat",
	"SapphCooking.SlicedSteak",
	"SapphCooking.ViennaSausage",
	"SapphCooking.FrankfurterSausage",
}
local Sausages =
{
	"Base.Sausage",
	"SapphCooking.ViennaSausage",
	"SapphCooking.FrankfurterSausage",
}

local MincedMeat =
{
	"Base.MincedMeat",
	"SapphCooking.MincedMeat_Chicken",
}
local TomatoSauce =
{
	"Base.Ketchup",
	"SapphCooking.HomemadeKetchup",
	"SapphCooking.Tomato_Sachet",
}

local Alcoholic =
{
	"Base.BeerBottle",
	"Base.BeerCan",
	"Base.WhiskeyFull",
	"Base.Wine2",
	"Base.Wine",
	"SapphCooking.TequilaFull",
	"SapphCooking.SakeFull",
	"SapphCooking.VodkaFull",
	"SapphCooking.GinFull",
	"SapphCooking.CachacaFull",
	"SapphCooking.Vermouth",
}


local function TweakRecipes()

local manager = getScriptManager()
for _,type in ipairs(ChickenMeat) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("Chicken")
	end
end

for _,type in ipairs(Alcoholic) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("Alcohol")
	end
end

for _,type in ipairs(TomatoSauce) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("TomatoKetchup")
	end
end

for _,type in ipairs(Rice) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("SapphCookingRice")
	end
end

for _,type in ipairs(Sausages) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("Sausage")
	end
end

for _,type in ipairs(BeefMeat) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("MinceMeat")
	end
end

for _,type in ipairs(Citrus) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("Citrus")
	end
end

for _,type in ipairs(MincedMeat) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("MincedMeat")
	end
end

for _,type in ipairs(Bread) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("Bread")
	end
end

--Chicken Tags

--BaseItems Tags.
	local item = ScriptManager.instance:getItem("Base.Lard")
	if item then
		item:getTags():add("Oil")
	end

	item = ScriptManager.instance:getItem("Base.Soysauce")
	if item then
		item:getTags():add("Soysauce")
	end

	item = ScriptManager.instance:getItem("Base.Pasta")
	if item then
		item:getTags():add("Pasta")
	end

	item = ScriptManager.instance:getItem("Base.Ramen")
	if item then
		item:getTags():add("Pasta")
	end

	item = ScriptManager.instance:getItem("Base.RiceBowl")
	if item then
		item:getTags():add("RiceBowl")
	end

	--BaseItems Spices Evolved Recipes

	

	local item = ScriptManager.instance:getItem("SapphCooking.NoodleSachet_Beef")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpaguettiEvolved:4;SapphCooking.InstantNoodles:4;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.NoodleSachet_Chicken")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpaguettiEvolved:4;SapphCooking.InstantNoodles:4;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Salt")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Pepper")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Ketchup")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Sandwich:2;Sandwich Baguette:2;Burger:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Hotsauce")
	if item then
		item:getTags():add("Pepper")
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:1;Pizza:4;Omelette:2;Sandwich:2;Sandwich Baguette:2;Burger:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;Beverage:1;Beverage2:1;Stir fry:4;Stir fry Griddle Pan:4;Beer:1;Beer2:1;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:2;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Honey")
	if item then
		item:DoParam("EvolvedRecipe =  SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.SpringrollEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.ShavedIceEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.CoffeeThermosEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;Beverage:2;Beverage2:2;Cake:5;Sandwich:2;Sandwich Baguette:2;FruitSalad:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Pancakes:2;Waffles:2;ConeIcecream:2;PieSweet:5;Toast:2;Oatmeal:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.Syrup_Chocolate")
	if item then
		item:DoParam("EvolvedRecipe =  SapphCooking.CocktailMix:2;SapphCooking.SpringrollEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.CoffeeThermosEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;Beverage:2;Beverage2:2;Cake:5;Sandwich:2;Sandwich Baguette:2;FruitSalad:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Pancakes:2;Waffles:2;ConeIcecream:2;PieSweet:5;Toast:2;Oatmeal:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.Syrup_Strawberry")
	if item then
		item:DoParam("EvolvedRecipe =  SapphCooking.CocktailMix:2;SapphCooking.SpringrollEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.CoffeeThermosEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;Beverage:2;Beverage2:2;Cake:5;Sandwich:2;Sandwich Baguette:2;FruitSalad:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Pancakes:2;Waffles:2;ConeIcecream:2;PieSweet:5;Toast:2;Oatmeal:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.Syrup_Caramel")
	if item then
		item:DoParam("EvolvedRecipe =  SapphCooking.CocktailMix:2;SapphCooking.SpringrollEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.CoffeeThermosEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;Beverage:2;Beverage2:2;Cake:5;Sandwich:2;Sandwich Baguette:2;FruitSalad:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Pancakes:2;Waffles:2;ConeIcecream:2;PieSweet:5;Toast:2;Oatmeal:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("Base.PeanutButter")
	if item then
		item:DoParam("EvolvedRecipe =  SapphCooking.CocktailMix:2;SapphCooking.InstantNoodles:2;SapphCooking.SpringrollEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:1;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;Soup:5;Stir fry Griddle Pan:5;Stir fry:5;Sandwich:5;Sandwich Baguette:5;Toast:5;ConeIcecream:5;SapphCooking.SkewersInsect:3;SapphCooking.SkewersMeat:3;SapphCooking.SkewersVegetable:3;SapphCooking.SapphCrackers:3;SapphCooking.SapphCrackers2:3")
	end

	local item = ScriptManager.instance:getItem("Base.Butter")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:4;SapphCooking.SpringrollEvolved:2;SapphCooking.ArrozLecheEvolved:4;SapphCooking.PoutineEvolved:4;SapphCooking.CevicheEvolved:4;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:4;SapphCooking.StockEvolved:4;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:4;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:4;SapphCooking.BakedPotatoEvolved:4;SapphCooking.LasagnaEvolved:4;SapphCooking.RatatouilleEvolved:4;SapphCooking.FriedRiceWok:4;Pancakes:4;Waffles:4;Sandwich:4;Sandwich Baguette:4;Stir fry Griddle Pan:4;Stir fry:4;Roasted Vegetables:4;PastaPot:4;PastaPan:4;Taco:4;Burrito:4;Toast:4;Oatmeal:4;Soup:4;Stew:4")
	end

	--Eggs
	local item = ScriptManager.instance:getItem("Base.Egg")
	if item then---
		item:DoParam("EvolvedRecipe	= SapphCooking.HR1:7;SapphCooking.HR2:7;SapphCooking.HR3:7;SapphCooking.HR4:7;SapphCooking.SpaguettiEvolved:7;SapphCooking.InstantNoodles:7;SapphCooking.FryingPanwithFriedRice:7;SapphCooking.SpringrollEvolved:7;SapphCooking.PoutineEvolved:7;SapphCooking.YakisobaEvolved:10;SapphCooking.BakedPotatoEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.RatatouilleEvolved:7;SapphCooking.FriedRiceWok:10;Stir fry Griddle Pan:10;Stir fry:10;Sandwich:10|Cooked;Sandwich Baguette:10|Cooked;Burger:10;Salad:10|Cooked;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BrownEgg")
	if item then---
		item:DoParam("EvolvedRecipe	= SapphCooking.HR1:7;SapphCooking.HR2:7;SapphCooking.HR3:7;SapphCooking.HR4:7;SapphCooking.SpaguettiEvolved:7;SapphCooking.InstantNoodles:7;SapphCooking.FryingPanwithFriedRice:7;SapphCooking.SpringrollEvolved:7;SapphCooking.PoutineEvolved:7;SapphCooking.YakisobaEvolved:10;SapphCooking.BakedPotatoEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.RatatouilleEvolved:7;SapphCooking.FriedRiceWok:10;Stir fry Griddle Pan:10;Stir fry:10;Sandwich:10|Cooked;Sandwich Baguette:10|Cooked;Burger:10;Salad:10|Cooked;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end
	local item = ScriptManager.instance:getItem("SapphCooking.ScotchEgg")
	if item then---
		item:DoParam("EvolvedRecipe	= SapphCooking.HR1:12;SapphCooking.HR2:12;SapphCooking.HR3:12;SapphCooking.HR4:12;SapphCooking.SpaguettiEvolved:12;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:12;SapphCooking.PoutineEvolved:12;SapphCooking.YakisobaEvolved:15;SapphCooking.BakedPotatoEvolved:15;SapphCooking.LasagnaEvolved:15;SapphCooking.RatatouilleEvolved:15;SapphCooking.FriedRiceWok:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:15;Sandwich Baguette:15;Burger:15;Salad:15;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15")
	end

	--Fruits
	item = ScriptManager.instance:getItem("Base.Apple")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	item = ScriptManager.instance:getItem("Base.Banana")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	item = ScriptManager.instance:getItem("Base.Grapefruit")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	item = ScriptManager.instance:getItem("Base.Grapes")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	item = ScriptManager.instance:getItem("Base.Lemon")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	item = ScriptManager.instance:getItem("Base.Lime")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	item = ScriptManager.instance:getItem("Base.Orange")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	item = ScriptManager.instance:getItem("Base.Peach")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	item = ScriptManager.instance:getItem("Base.Pear")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	
	item = ScriptManager.instance:getItem("Base.Pineapple")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	item = ScriptManager.instance:getItem("farming.Strewberrie")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	item = ScriptManager.instance:getItem("Base.WatermelonSmashed")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	item = ScriptManager.instance:getItem("Base.WatermelonSliced")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end


	--Berries

	local item = ScriptManager.instance:getItem("Base.BerryBlack")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryBlue")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryGeneric1")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryGeneric2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryGeneric3")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryGeneric4")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryGeneric5")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryPoisonIvy")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end

	--Ramen

	--[[local item = ScriptManager.instance:getItem("Base.Ramen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.InstantNoodles:10")
	end
	--]]


	--Pans
	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanwithArborioRice")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:10;SapphCooking.HotdogSandwich:10;Taco:10;Burrito:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanwithBrownRice")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;Taco:10;Burrito:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanwithSpaguetti")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.HotdogEvolved:8;Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanwithSpaguettiandMeatballs")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.HotdogEvolved:8;Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanwithBeefStew")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:9;Taco:9;Burrito:18")
	end

			--Bowls

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofChickenStroganoff")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.InstantNoodles:4;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:9;SapphCooking.HotdogSandwich:9;Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofYakisoba")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:10;SapphCooking.HotdogSandwich:10;Taco:10;Burrito:15")
	end


	local item = ScriptManager.instance:getItem("SapphCooking.ArborioRiceBowl")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:10;Taco:10;Burrito:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BrownRiceBowl")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:10;Taco:10;Burrito:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofBeefStew")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpringrollEvolved:8;SapphCooking.HotdogEvolved:8;Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofGuacamole")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:9;SapphCooking.HotdogEvolved:8;Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofQueso")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.HotdogEvolved:8;SapphCooking.LasagnaEvolved:9;Taco:9;Burrito:18;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofRefriedBeans")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:5;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofSpaguetti")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpringrollEvolved:8;SapphCooking.HotdogEvolved:8;Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofSpaguettiandMeatballs")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpringrollEvolved:8;SapphCooking.HotdogEvolved:8;Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofChili")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.SpringrollEvolved:8;SapphCooking.CevicheEvolved:5;SapphCooking.HotdogEvolved:8;Taco:9;Burrito:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.RiceBeanBowl")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.SpringrollEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.HotdogEvolved:8;Taco:15;Burrito:15;SapphCooking.BakedPotatoEvolved:10")
	end



	--Thermos

	

	local item = ScriptManager.instance:getItem("SapphCooking.BottleofLemonJuice")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.ShavedIceEvolved:5;SapphCooking.CocktailMix:5;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BottleofGrapeJuice")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.ShavedIceEvolved:5;SapphCooking.CocktailMix:5;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BottleofAppleJuice")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.ShavedIceEvolved:5;SapphCooking.CocktailMix:5;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BottleofStrawberryJuice")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.ShavedIceEvolved:5;SapphCooking.CocktailMix:5;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BottleofOrangeJuice")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.ShavedIceEvolved:5;SapphCooking.CocktailMix:5;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BottleofPeachJuice")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.ShavedIceEvolved:5;SapphCooking.CocktailMix:5;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BottleofWatermelonJuice")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.ShavedIceEvolved:5;SapphCooking.CocktailMix:5;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end


	local item = ScriptManager.instance:getItem("SapphCooking.IceCubes")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:1;SapphCooking.CoffeeThermosEvolved:1;HotDrink:1;HotDrinkRed:1;HotDrinkWhite:1;HotDrinkSpiffo:1;HotDrinkTea:1;SapphCooking.ThermosBeverage:1")
	end

	local item = ScriptManager.instance:getItem("Base.Coffee2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:1;SapphCooking.ShavedIceEvolved:1;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.Teabag2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:5;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.Sugar")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:1;SapphCooking.SpringrollEvolved:1;SapphCooking.ArrozLecheEvolved:1;SapphCooking.ShavedIceEvolved:1;SapphCooking.CoffeeThermosEvolved:1;HotDrink:1;HotDrinkRed:1;HotDrinkWhite:1;HotDrinkSpiffo:1;HotDrinkTea:1;Toast:1;Oatmeal:1;Beverage:1;Beverage2:1;SapphCooking.ThermosBeverage:1")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.CoffeePacket")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:1;SapphCooking.ShavedIceEvolved:1;SapphCooking.CoffeeThermosEvolved:1;HotDrink:1;HotDrinkRed:1;HotDrinkWhite:1;HotDrinkSpiffo:1;HotDrinkTea:1;Toast:1;Oatmeal:1;Beverage:1;Beverage2:1;SapphCooking.ThermosBeverage:1")
	end

	local item = ScriptManager.instance:getItem("Base.SugarBrown")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:1;SapphCooking.SpaguettiEvolved:1;SapphCooking.SpringrollEvolved:1;SapphCooking.ArrozLecheEvolved:1;SapphCooking.ShavedIceEvolved:1;SapphCooking.CoffeeThermosEvolved:1;HotDrink:1;HotDrinkRed:1;HotDrinkWhite:1;HotDrinkSpiffo:1;HotDrinkTea:1;Toast:1;Oatmeal:1;Beverage:1;Beverage2:1;SapphCooking.ThermosBeverage:1")
	end

	local item = ScriptManager.instance:getItem("Base.SugarPacket")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:1;SapphCooking.SpaguettiEvolved:1;SapphCooking.SpringrollEvolved:1;SapphCooking.ArrozLecheEvolved:1;SapphCooking.ShavedIceEvolved:1;HotDrink:1;HotDrinkRed:1;HotDrinkWhite:1;HotDrinkSpiffo:1;HotDrinkTea:1;Toast:1;Oatmeal:1;Beverage:1;Beverage2:1;SapphCooking.ThermosBeverage:1")
	end

	local item = ScriptManager.instance:getItem("Base.CocoaPowder")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpringrollEvolved:4;SapphCooking.ArrozLecheEvolved:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;ConeIcecream:5;Pancakes:5;Waffles:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.WhiskeyFull")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:4;SapphCooking.FryingPanwithFriedRice:4;SapphCooking.ArrozLecheEvolved:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;Beverage:4;Beverage2:4;HotDrink:4;HotDrinkRed:4;HotDrinkWhite:4;HotDrinkSpiffo:4;HotDrinkTea:4;SapphCooking.ThermosBeverage:4")
	end


	local item = ScriptManager.instance:getItem("Base.Milk")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:2;Beverage2:2;Oatmeal:2;Soup:5;Stew:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.BeerBottle")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;Soup:9;Stew:9;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:9")
	end

	local item = ScriptManager.instance:getItem("Base.BeerCan")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;Soup:9;Stew:9;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:9")
	end

	local item = ScriptManager.instance:getItem("Base.CannedMilkOpen")
	if item then
	item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:5;SapphCooking.ArrozLecheEvolved:5;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanHotChocolate")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:10;HotDrink:10;HotDrinkRed:10;HotDrinkWhite:10;HotDrinkSpiffo:10;HotDrinkTea:10;SapphCooking.ThermosBeverage:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.AlmondMilk")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BottlewithMilk")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.PopbottlewithMilk")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ColaBottlewithMilk")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ColaBottlewithProteinShake")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BleachBottlewithProteinShake")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.PopBottlewithProteinShake")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BottlewithProteinShake")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.StrawberryMilk")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.TequilaFull")
	if item then
	item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.FryingPanwithFriedRice:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:5;Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.VodkaFull")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.FryingPanwithFriedRice:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:5;Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.CachacaFull")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.FryingPanwithFriedRice:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:5;Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.GinFull")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.FryingPanwithFriedRice:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:5;Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SakeFull")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.FryingPanwithFriedRice:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:5;Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.RumFull")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.FryingPanwithFriedRice:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:5;Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ColaBottle")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.EnergyDrink")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:4;SapphCooking.CoffeeThermosEvolved:5;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:2;Beverage2:2;Oatmeal:2;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.PopBottle")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:4;SapphCooking.CoffeeThermosEvolved:5;Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Pop")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:4;SapphCooking.CoffeeThermosEvolved:5;Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Pop2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:4;SapphCooking.CoffeeThermosEvolved:5;Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Pop3")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:4;SapphCooking.CoffeeThermosEvolved:5;Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end


	local item = ScriptManager.instance:getItem("Base.Wine")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:4;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.ShavedIceEvolved:4;Beverage:4;Beverage2:4;WineInGlass:4;PastaPot:4;PastaPan:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Wine2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:4;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.ShavedIceEvolved:4;Beverage:4;Beverage2:4;WineInGlass:4;PastaPot:4;PastaPan:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.PotatoPeel")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StockEvolved:1;Stew:1;Soup:1")
	end


	--Insects
	--Stuff here: 
	--1.Skewers_Insect
	--2.Lasagna, cause why not


	local item = ScriptManager.instance:getItem("Base.Cockroach")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:1;SapphCooking.HR2:1;SapphCooking.HR3:1;SapphCooking.HR4:1;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SausageEvolved:10;SapphCooking.DumplingsEvolved:2;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:11")
	end

	local item = ScriptManager.instance:getItem("Base.Grasshopper")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:1;SapphCooking.HR2:1;SapphCooking.HR3:1;SapphCooking.HR4:1;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:2;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:7")
	end

	local item = ScriptManager.instance:getItem("Base.Cricket")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:1;SapphCooking.HR2:1;SapphCooking.HR3:1;SapphCooking.HR4:1;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:2;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:6")
	end





--Mainly MEAT
	local item = ScriptManager.instance:getItem("Base.MincedMeat")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:15|Cooked;SapphCooking.HR2:15|Cooked;SapphCooking.HR3:15|Cooked;SapphCooking.HR4:15|Cooked;SapphCooking.SpaguettiEvolved:15;SapphCooking.InstantNoodles:15;SapphCooking.FryingPanwithFriedRice:15;SapphCooking.SpringrollEvolved:15;SapphCooking.PoutineEvolved:15;SapphCooking.SausageEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.HotdogSandwich:15;SapphCooking.HotdogEvolved:15;SapphCooking.SushiEvolved:15;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Pizza:20;Stew:20;Pie:20;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Taco:10|Cooked;Burrito:10|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.MincedMeat_Chicken")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:15|Cooked;SapphCooking.HR2:15|Cooked;SapphCooking.HR3:15|Cooked;SapphCooking.HR4:15|Cooked;SapphCooking.SpaguettiEvolved:15;SapphCooking.InstantNoodles:15;SapphCooking.FryingPanwithFriedRice:15;SapphCooking.SpringrollEvolved:15;SapphCooking.PoutineEvolved:15;SapphCooking.SausageEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.HotdogSandwich:15;SapphCooking.HotdogEvolved:15;SapphCooking.SushiEvolved:15;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Pizza:20;Stew:20;Pie:20;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Taco:10|Cooked;Burrito:10|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10")
	end

	local item = ScriptManager.instance:getItem("Base.FishFillet")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.CevicheEvolved:15;SapphCooking.SausageEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.HotdogSandwich:15;SapphCooking.HotdogEvolved:15;SapphCooking.SushiEvolved:15;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Pizza:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:10|Cooked;Burrito:15|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10")
	end

	local item = ScriptManager.instance:getItem("Base.Salmon")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:12;SapphCooking.InstantNoodles:12;SapphCooking.FryingPanwithFriedRice:12;SapphCooking.SpringrollEvolved:12;SapphCooking.PoutineEvolved:10;SapphCooking.CevicheEvolved:10;SapphCooking.SausageEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.HotdogSandwich:10;SapphCooking.HotdogEvolved:10;SapphCooking.SushiEvolved:10;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Pizza:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:8|Cooked;Burrito:16|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.Rabbitmeat")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:10;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.Smallanimalmeat")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:10;SapphCooking.HotdogEvolved:10;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.Sausage")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:15;SapphCooking.HotdogEvolved:15;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:20;Pizza:20;Stew:20;Stir fry Griddle Pan:20;Stir fry:20;Burger:20|Cooked;Roasted Vegetables:20;PastaPot:20;PastaPan:20;RicePot:20;RicePan:20;Taco:5|Cooked;Burrito:10|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end
	
	local item = ScriptManager.instance:getItem("SapphCooking.SausageEvolved")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:15;SapphCooking.HotdogEvolved:15;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:20;Pizza:20;Stew:20;Stir fry Griddle Pan:20;Stir fry:20;Burger:20|Cooked;Roasted Vegetables:20;PastaPot:20;PastaPan:20;RicePot:20;RicePan:20;Taco:5|Cooked;Burrito:10|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SlicedSteak")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:15;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.SkewersMeat:10;Pizza:15;Stew:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Salad:10|Cooked;Roasted Vegetables:15;PastaPot:15;PastaPan:15;RicePot:15;RicePan:15;Taco:15|Cooked;Burrito:15|Cooked;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.Steak")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:15;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("farming.Bacon")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:15;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end


	local item = ScriptManager.instance:getItem("SapphCooking.SlicedChicken")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:10;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.SkewersMeat:10;Pizza:12;Soup:15;Stew:15;Pie:12;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:6|Cooked;Sandwich Baguette:6|Cooked;Burger:12|Cooked;Salad:6|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:6|Cooked;Burrito:12|Cooked;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end



	--VEGETABLES/Cheese

	local item = ScriptManager.instance:getItem("SapphCooking.DicedBroccoli")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:4;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersVegetable:8;Pizza:8;Omelette:8;Soup:16;Stew:16;Pie:16;Stir fry Griddle Pan:16;Stir fry:16;Burger:8;Sandwich:4;Sandwich Baguette:4;Salad:8;Roasted Vegetables:16;RicePot:16;RicePan:16;PastaPot:16;PastaPan:16;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric1")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:6;SapphCooking.HotdogEvolved:6;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:6;SapphCooking.RatatouilleEvolved:6;SapphCooking.LasagnaEvolved:6;SapphCooking.SkewersInsect:6;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric3")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:6;SapphCooking.HotdogEvolved:6;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:6;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:5;SapphCooking.SkewersMeat:5;Pizza:15;Burger:15;Omelette:15;Stir fry Griddle Pan:15;Stir fry:15;Stew:15;Pie:15;Soup:15;Sandwich:15;Sandwich Baguette:15;Salad:15;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric4")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric5")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:6;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:6;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:15;Burger:15;Omelette:15;Stir fry Griddle Pan:15;Stir fry:15;Stew:15;Pie:15;Soup:15;Sandwich:15;Sandwich Baguette:15;Salad:15;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric6")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric7")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.Seitan")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:10;SapphCooking.RatatouilleEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:10;SapphCooking.SkewersMeat:10;Pizza:12;Soup:15;Stew:15;Pie:12;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:6|Cooked;Sandwich Baguette:6|Cooked;Burger:12|Cooked;Salad:6|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:6|Cooked;Burrito:12|Cooked")
	end

	local item = ScriptManager.instance:getItem("Base.Cheese")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.HotdogSandwich:4;SapphCooking.HotdogEvolved:4;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersVegetable:5;SapphCooking.SkewersMeat:5;SapphCooking.SkewersInsect:5;Pizza:15;Soup:10;Sandwich:5;Sandwich Baguette:5;Burger:5;Salad:5;PastaPot:10;PastaPan:10;Taco:5;Burrito:5;Bread:5;Toast:5;SapphCooking.BakedPotatoEvolved:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ParmesanCheese")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.DumplingsEvolved:4;SapphCooking.HotdogSandwich:4;SapphCooking.HotdogEvolved:4;SapphCooking.SushiEvolved:2;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersVegetable:5;SapphCooking.SkewersMeat:5;SapphCooking.SkewersInsect:5;Pizza:15;Soup:10;Sandwich:5;Sandwich Baguette:5;Burger:5;Salad:5;PastaPot:10;PastaPan:10;Taco:5;Burrito:5;Bread:5;Toast:5;SapphCooking.BakedPotatoEvolved:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.MozzarelaCheese")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.DumplingsEvolved:4;SapphCooking.HotdogSandwich:4;SapphCooking.HotdogEvolved:4;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersVegetable:5;SapphCooking.SkewersMeat:5;SapphCooking.SkewersInsect:5;Pizza:15;Soup:10;Sandwich:5;Sandwich Baguette:5;Burger:5;Salad:5;PastaPot:10;PastaPan:10;Taco:5;Burrito:5;Bread:5;Toast:5;SapphCooking.BakedPotatoEvolved:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SlicedEggplant")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:4;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersVegetable:8;Pizza:8;Omelette:8;Soup:16;Stew:16;Pie:16;Stir fry Griddle Pan:16;Stir fry:16;Burger:8;Sandwich:4;Sandwich Baguette:4;Salad:8;Roasted Vegetables:16;RicePot:16;RicePan:16;PastaPot:16;PastaPan:16;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SlicedZucchini")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:10;SapphCooking.CevicheEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.StockEvolved:10;SapphCooking.HotdogSandwich:10;SapphCooking.HotdogEvolved:10;SapphCooking.SushiEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.RatatouilleEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.SkewersVegetable:10;Pizza:10;Soup:10;Stew:10;Pie:10;Stir fry Griddle Pan:10;Stir fry:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10;Sandwich:5;Sandwich Baguette:5;Omelette:5;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SlicedTomato")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:12;SapphCooking.InstantNoodles:12;SapphCooking.FryingPanwithFriedRice:12;SapphCooking.SpringrollEvolved:12;SapphCooking.PoutineEvolved:12;SapphCooking.CevicheEvolved:12;SapphCooking.DumplingsEvolved:12;SapphCooking.StockEvolved:12;SapphCooking.HotdogSandwich:12;SapphCooking.HotdogEvolved:12;SapphCooking.SushiEvolved:12;SapphCooking.YakisobaEvolved:12;SapphCooking.RatatouilleEvolved:12;SapphCooking.LasagnaEvolved:12;SapphCooking.SkewersVegetable:4;Omelette:12;Soup:12;Stew:12;Pie:12;Stir fry Griddle Pan:12;Stir fry:12;Sandwich:6;Sandwich Baguette:6;Burger:6;Salad:12;Roasted Vegetables:12;RicePot:12;RicePan:12;PastaPot:12;PastaPan:12;Taco:12;Burrito:12;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SlicedCarrots")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersVegetable:4;Soup:8;Stew:8;Pie:8;Stir fry Griddle Pan:8;Stir fry:8;Sandwich:8;Sandwich Baguette:8;Salad:8;Roasted Vegetables:8;RicePot:8;RicePan:8;PastaPot:8;PastaPan:8;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SlicedBellPepper")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersVegetable:4;Omelette:8;Soup:8;Pie:8;Stir fry Griddle Pan:8;Stir fry:8;Sandwich:8;Sandwich Baguette:8;Burger:8;Salad:8;Roasted Vegetables:8;RicePot:8;RicePan:8;PastaPot:8;PastaPan:8;Taco:8;Burrito:8;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.PeeledPotato")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:15;SapphCooking.HotdogEvolved:15;SapphCooking.SushiEvolved:15;SapphCooking.YakisobaEvolved:15;SapphCooking.RatatouilleEvolved:15;SapphCooking.LasagnaEvolved:15;SapphCooking.SkewersVegetable:4;Omelette:8;Soup:8;Pie:8;Stir fry Griddle Pan:8;Stir fry:8;Sandwich:8;Sandwich Baguette:15;Burger:15;Salad:12;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:15;Burrito:15;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.CutPeeledPotato")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:15;SapphCooking.HotdogEvolved:15;SapphCooking.SushiEvolved:15;SapphCooking.YakisobaEvolved:15;SapphCooking.RatatouilleEvolved:15;SapphCooking.LasagnaEvolved:15;SapphCooking.SkewersVegetable:4;Omelette:8;Soup:8;Pie:8;Stir fry Griddle Pan:8;Stir fry:8;Sandwich:8;Sandwich Baguette:15;Burger:15;Salad:12;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:15;Burrito:15;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.Lettuce")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:4;SapphCooking.RatatouilleEvolved:2;SapphCooking.YakisobaEvolved:3;SapphCooking.SushiEvolved:3;SapphCooking.HotdogEvolved:2;SapphCooking.HotdogSandwich:3;SapphCooking.StockEvolved:2;Sandwich:3;Burger:3;Salad:5;Sandwich Baguette:3;Taco:3;Burrito:3")
	end

	--Sachets
	--I may re-do this in the future

		local item = ScriptManager.instance:getItem("SapphCooking.SaltPacket")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.BakedPotatoEvolved:2;SapphCooking.FriedRiceWok:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.HotsaucePacket")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.BakedPotatoEvolved:2;SapphCooking.FriedRiceWok:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.Tomato_Sachet")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.BakedPotatoEvolved:2;SapphCooking.FriedRiceWok:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SoySauce_Sachet")
	if item then

		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.Mustard_Sachet")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.PeanutButter_Sachet")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:2")
	end

	--Oils
	local item = ScriptManager.instance:getItem("SapphCooking.PeanutOil")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.BakedPotatoEvolved:2;SapphCooking.FriedRiceWok:2")
	end

	local item = ScriptManager.instance:getItem("Base.OilOlive")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.BakedPotatoEvolved:2;SapphCooking.FriedRiceWok:2")
	end

	local item = ScriptManager.instance:getItem("Base.OilVegetable")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.BakedPotatoEvolved:2;SapphCooking.FriedRiceWok:2")
	end


	local item = ScriptManager.instance:getItem("Base.Tortilla")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5")
	end
end

TweakRecipes()
--Events.OnInitGlobalModData.Add(TweakRecipes)
