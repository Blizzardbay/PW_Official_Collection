--This code is for adding evolved recipes.
--this way it's not necessary to overlap the existing vanila items.

--Thanks Glytch3r, Poltergeist, Gravy, Blair Algol, Albion, and everyone on the official pz discord that helps everyone solving problems (it helps lurkers like me :D)!!!

--Sapph: Hi, i guess i should explain what this file does, basically, it changes a few lines on several foods, that way they can
-- be used on other recipes(using the "Tags" system) or evolved recipes!

-- this file is reading "evolvedrecipes" on the scripts folder, for the evolved recipes bits, so things like skewers and fried rice are being done there,
-- and that file reads the items scripts, it's pretty confusing, but yeah, it is what it is!

-- also, most of my coding is done while i'm sleep deprived, so yeah! i'ts pretty impressive it all works honestly.

-- 06/10/23 - 
-- hm... its always weird to come back here after an update, life happens so fast, but you know, it makes it worth i guess?
-- things in my life have been... difficult, yet i keep thinking about what or how to add something.
-- so yeah! thanks for everything.

--31/12/23 - 
-- so, i decided to separate this file between base items and custom items, this should help with organizing stuff!
-- this means anything with the modID: "Base" will be here!


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

local Beans =
{
	"Base.DriedLentils",
	"Base.DriedSplitPeas",
	"Base.DriedChickpeas",
	"Base.DriedKidneyBeans",
	"Base.DriedBlackBeans",
	"Base.DriedWhiteBeans",

}

local Writing =
{
	"Base.Crayons",
	"Base.Pen",
	"Base.RedPen",
	"Base.BluePen",
	"Base.Pencil",

}


local function TweakRecipes()

local manager = getScriptManager()
for _,type in ipairs(ChickenMeat) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("Chicken")
	end
end

local manager = getScriptManager()
for _,type in ipairs(Writing) do
	local item = manager:getItem(type)
	if item then
		item:DoParam("AttachmentType = Pencil")

	end
end

local manager = getScriptManager()
for _,type in ipairs(Beans) do
	local item = manager:getItem(type)
	if item then
		item:getTags():add("Beans")
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
	local itemSapph = ScriptManager.instance:getItem("Base.Lard")
	if itemSapph then
		itemSapph:getTags():add("Oil")
	end

	itemSapph = ScriptManager.instance:getItem("Base.Soysauce")
	if itemSapph then
		itemSapph:getTags():add("Soysauce")
	end

	itemSapph = ScriptManager.instance:getItem("Base.Pasta")
	if itemSapph then
		itemSapph:getTags():add("Pasta")
	end

	itemSapph = ScriptManager.instance:getItem("Base.Ramen")
	if itemSapph then
		itemSapph:getTags():add("Pasta")
	end

	itemSapph = ScriptManager.instance:getItem("Base.RiceBowl")
	if itemSapph then
		itemSapph:getTags():add("RiceBowl")
	end

	local itemSapph = ScriptManager.instance:getItem("Base.Peas")
	if itemSapph then
		itemSapph:getTags():add("Peas")
	end

	--BaseItems Spices Evolved Recipes

	

	local item = ScriptManager.instance:getItem("Base.Salt")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end


	local item = ScriptManager.instance:getItem("Base.Pepper")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end
	local item = ScriptManager.instance:getItem("Base.PepperJalapeno")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end
	local item = ScriptManager.instance:getItem("Base.PepperHabanero")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Ketchup")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.LasagnaEvolved:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	
	local item = ScriptManager.instance:getItem("Base.Margerine")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Marinara")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:3;SapphCooking.FlatbreadEvolved:3;SapphCooking.WokRoastVeg:3;SapphCooking.BorschtEvolved:3;SapphCooking.HR1:3;SapphCooking.HR2:3;SapphCooking.HR3:3;SapphCooking.HR4:3;SapphCooking.CocktailMix:3;SapphCooking.SpaguettiEvolved:3;SapphCooking.InstantNoodles:3;SapphCooking.FryingPanwithFriedRice:3;SapphCooking.SpringrollEvolved:3;SapphCooking.PoutineEvolved:3;SapphCooking.CevicheEvolved:3;SapphCooking.SausageEvolved:3;SapphCooking.DumplingsEvolved:3;SapphCooking.HotdogSandwich:3;SapphCooking.HotdogEvolved:3;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:3;Pizza:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:2;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;Beverage:2;Beverage2:2;Beer:2;Beer2:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:2;SapphCooking.BakedPotatoEvolved:2")
	end
	
	local item = ScriptManager.instance:getItem("Base.Wasabi")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:3;SapphCooking.FlatbreadEvolved:3;SapphCooking.WokRoastVeg:3;SapphCooking.BorschtEvolved:3;SapphCooking.HR1:3;SapphCooking.HR2:3;SapphCooking.HR3:3;SapphCooking.HR4:3;SapphCooking.CocktailMix:3;SapphCooking.SpaguettiEvolved:3;SapphCooking.InstantNoodles:3;SapphCooking.FryingPanwithFriedRice:3;SapphCooking.SpringrollEvolved:3;SapphCooking.PoutineEvolved:3;SapphCooking.CevicheEvolved:3;SapphCooking.SausageEvolved:3;SapphCooking.DumplingsEvolved:3;SapphCooking.HotdogSandwich:3;SapphCooking.HotdogEvolved:3;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:3;Pizza:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:2;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;Beverage:2;Beverage2:2;Beer:2;Beer2:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:2;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Tomatopaste")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:3;SapphCooking.FlatbreadEvolved:3;SapphCooking.WokRoastVeg:3;SapphCooking.BorschtEvolved:3;SapphCooking.HR1:3;SapphCooking.HR2:3;SapphCooking.HR3:3;SapphCooking.HR4:3;SapphCooking.CocktailMix:3;SapphCooking.SpaguettiEvolved:3;SapphCooking.InstantNoodles:3;SapphCooking.FryingPanwithFriedRice:3;SapphCooking.SpringrollEvolved:3;SapphCooking.PoutineEvolved:3;SapphCooking.CevicheEvolved:3;SapphCooking.SausageEvolved:3;SapphCooking.DumplingsEvolved:3;SapphCooking.HotdogSandwich:3;SapphCooking.HotdogEvolved:3;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:3;Pizza:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:2;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;Beverage:2;Beverage2:2;Beer:2;Beer2:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:2;SapphCooking.BakedPotatoEvolved:2")
	end


	local item = ScriptManager.instance:getItem("Base.Mustard")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Sandwich:2;Sandwich Baguette:2;Burger:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end



	local item = ScriptManager.instance:getItem("farming.MayonnaiseFull")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Sandwich:2;Sandwich Baguette:2;Burger:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("farming.RemouladeFull")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LettuceWrapEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Sandwich:2;Sandwich Baguette:2;Burger:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end


	local item = ScriptManager.instance:getItem("Base.Hotsauce")
	if item then
		item:getTags():add("Pepper")
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.CornCob:2;SapphCooking.LasagnaEvolved:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:1;Pizza:4;Omelette:2;Sandwich:2;Sandwich Baguette:2;Burger:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;Beverage:1;Beverage2:1;Stir fry:4;Stir fry Griddle Pan:4;Beer:1;Beer2:1;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:2;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Honey")
	if item then
		item:getTags():add("Syrup")
		item:DoParam("EvolvedRecipe =  SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.ChurrosEvolved:2;SapphCooking.ChurrosChocolateEvolved:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.FrenchToastEvolved:2;SapphCooking.BowlSorbet:2;SapphCooking.WokRoastVeg:2;SapphCooking.BlenderShake:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.SpringrollEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.ShavedIceEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.CoffeeThermosEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;Beverage:2;Beverage2:2;Cake:5;Sandwich:2;Sandwich Baguette:2;FruitSalad:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Pancakes:2;Waffles:2;ConeIcecream:2;PieSweet:5;Toast:2;Oatmeal:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	itemSapph = ScriptManager.instance:getItem("Base.MapleSyrup")
	if itemSapph then
		item:getTags():add("Syrup")
		item:DoParam("EvolvedRecipe =  SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.ChurrosEvolved:2;SapphCooking.ChurrosChocolateEvolved:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.FrenchToastEvolved:2;SapphCooking.BowlSorbet:2;SapphCooking.WokRoastVeg:2;SapphCooking.BlenderShake:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.SpringrollEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.ShavedIceEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.CoffeeThermosEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;Beverage:2;Beverage2:2;Cake:5;Sandwich:2;Sandwich Baguette:2;FruitSalad:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Pancakes:2;Waffles:2;ConeIcecream:2;PieSweet:5;Toast:2;Oatmeal:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end


	local item = ScriptManager.instance:getItem("Base.PeanutButter")
	if item then
		item:DoParam("EvolvedRecipe =  SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.ChurrosEvolved:2;SapphCooking.ChurrosChocolateEvolved:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.CornCob:4;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.FrenchToastEvolved:5;SapphCooking.BowlSorbet:5;SapphCooking.WokRoastVeg:5;SapphCooking.BlenderShake:5;SapphCooking.CocktailMix:5;SapphCooking.InstantNoodles:5;SapphCooking.SpringrollEvolved:5;SapphCooking.ArrozLecheEvolved:5;SapphCooking.ShavedIceEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.SkewersInsect:3;SapphCooking.SkewersMeat:3;SapphCooking.SkewersVegetable:3;SapphCooking.SapphCrackers:3;SapphCooking.SapphCrackers2:3")
	end

	local item = ScriptManager.instance:getItem("Base.JamMarmalade")
	if item then
		item:DoParam("EvolvedRecipe =  SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.CornCob:4;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.FrenchToastEvolved:5;SapphCooking.BowlSorbet:5;SapphCooking.WokRoastVeg:5;SapphCooking.BlenderShake:5;SapphCooking.CocktailMix:5;SapphCooking.InstantNoodles:5;SapphCooking.SpringrollEvolved:5;SapphCooking.ArrozLecheEvolved:5;SapphCooking.ShavedIceEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.SkewersInsect:3;SapphCooking.SkewersMeat:3;SapphCooking.SkewersVegetable:3;SapphCooking.SapphCrackers:3;SapphCooking.SapphCrackers2:3")
	end



	local item = ScriptManager.instance:getItem("Base.Butter")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CornCob:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.FrenchToastEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BlenderShake:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:4;SapphCooking.SpringrollEvolved:2;SapphCooking.ArrozLecheEvolved:4;SapphCooking.PoutineEvolved:4;SapphCooking.CevicheEvolved:4;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:4;SapphCooking.StockEvolved:4;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:4;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:4;SapphCooking.BakedPotatoEvolved:4;SapphCooking.LasagnaEvolved:4;SapphCooking.RatatouilleEvolved:4;SapphCooking.FriedRiceWok:4;Pancakes:4;Waffles:4;Sandwich:4;Sandwich Baguette:4;Stir fry Griddle Pan:4;Stir fry:4;Roasted Vegetables:4;PastaPot:4;PastaPan:4;Taco:4;Burrito:4;Toast:4;Oatmeal:4;Soup:4;Stew:4")
	end

	--Foraging Spices
	local item = ScriptManager.instance:getItem("Base.Cilantro")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.CornCob:1;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Oregano")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.CornCob:1;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Parsley")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.CornCob:1;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Chives")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.CornCob:1;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Basil")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.CornCob:1;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Rosemary")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.CornCob:1;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Sage")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.CornCob:1;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.Thyme")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.CornCob:1;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end

	local item = ScriptManager.instance:getItem("Base.GingerRoot")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.StuffedPepperEvolved:1;SapphCooking.CornCob:1;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.CocktailMix:2;SapphCooking.SpaguettiEvolved:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.RatatouilleEvolved:1;SapphCooking.LasagnaEvolved:1;Sandwich:2;Sandwich Baguette:2;Burger:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:2")
	end







	--Eggs
	local item = ScriptManager.instance:getItem("Base.Egg")
	if item then---
		item:DoParam("EvolvedRecipe	= SapphCooking.StuffedPepperEvolved:7;SapphCooking.FlatbreadEvolved:7;SapphCooking.WokRoastVeg:7;SapphCooking.BlenderShake:7;SapphCooking.BorschtEvolved:7;SapphCooking.HR1:7;SapphCooking.HR2:7;SapphCooking.HR3:7;SapphCooking.HR4:7;SapphCooking.SpaguettiEvolved:7;SapphCooking.InstantNoodles:7;SapphCooking.FryingPanwithFriedRice:7;SapphCooking.SpringrollEvolved:7;SapphCooking.PoutineEvolved:7;SapphCooking.YakisobaEvolved:10;SapphCooking.BakedPotatoEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.RatatouilleEvolved:7;SapphCooking.FriedRiceWok:10;Stir fry Griddle Pan:10;Stir fry:10;Sandwich:10|Cooked;Sandwich Baguette:10|Cooked;Burger:10;Salad:10|Cooked;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end
	local item = ScriptManager.instance:getItem("Base.WildEggs")
	if item then---
		item:DoParam("EvolvedRecipe	= SapphCooking.StuffedPepperEvolved:7;SapphCooking.FlatbreadEvolved:7;SapphCooking.WokRoastVeg:7;SapphCooking.BlenderShake:7;SapphCooking.BorschtEvolved:7;SapphCooking.HR1:7;SapphCooking.HR2:7;SapphCooking.HR3:7;SapphCooking.HR4:7;SapphCooking.SpaguettiEvolved:7;SapphCooking.InstantNoodles:7;SapphCooking.FryingPanwithFriedRice:7;SapphCooking.SpringrollEvolved:7;SapphCooking.PoutineEvolved:7;SapphCooking.YakisobaEvolved:10;SapphCooking.BakedPotatoEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.RatatouilleEvolved:7;SapphCooking.FriedRiceWok:10;Stir fry Griddle Pan:10;Stir fry:10;Sandwich:10|Cooked;Sandwich Baguette:10|Cooked;Burger:10;Salad:10|Cooked;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end


	--Fruits
	itemSapph = ScriptManager.instance:getItem("Base.Apple")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.WokRoastVeg:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	itemSapph = ScriptManager.instance:getItem("Base.Banana")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	itemSapph = ScriptManager.instance:getItem("Base.Grapefruit")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	itemSapph = ScriptManager.instance:getItem("Base.Grapes")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	itemSapph = ScriptManager.instance:getItem("Base.Lemon")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.CornCob:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.WokRoastVeg:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	itemSapph = ScriptManager.instance:getItem("Base.Lime")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.CornCob:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.WokRoastVeg:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	itemSapph = ScriptManager.instance:getItem("Base.Orange")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	itemSapph = ScriptManager.instance:getItem("Base.Peach")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	itemSapph = ScriptManager.instance:getItem("Base.Pear")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	
	itemSapph = ScriptManager.instance:getItem("Base.Pineapple")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	itemSapph = ScriptManager.instance:getItem("farming.Strewberrie")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	itemSapph = ScriptManager.instance:getItem("Base.WatermelonSmashed")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	itemSapph = ScriptManager.instance:getItem("Base.WatermelonSliced")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end

	itemSapph = ScriptManager.instance:getItem("Base.Mango")
	if itemSapph then
		itemSapph:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:4;SapphCooking.MacaronRed:4;SapphCooking.MacaronBlue:4;SapphCooking.MacaronGreen:4;SapphCooking.MacaronYellow:4;SapphCooking.MacaronPurple:4;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderShake:12;SapphCooking.BlenderJuice:12;SapphCooking.CrepesEvolved:12;SapphCooking.FlatbreadEvolved:12;SapphCooking.FrenchToastEvolved:12;SapphCooking.BowlSorbet:12;SapphCooking.BlenderShake:12;SapphCooking.SpringrollEvolved:12;SapphCooking.ShavedIceEvolved:12;SapphCooking.ArrozLecheEvolved:12")
	end


	--Berries

	local item = ScriptManager.instance:getItem("Base.BerryBlack")
	if item then
		item:getTags():add("Berry;Berries")
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderPuree:8;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryBlue")
	if item then
		item:getTags():add("Berry;Berries")
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderPuree:8;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryGeneric1")
	if item then
		item:getTags():add("Berry;Berries")
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderPuree:8;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryGeneric2")
	if item then
		item:getTags():add("Berry;Berries")
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderPuree:8;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryGeneric3")
	if item then
		item:getTags():add("Berry;Berries")
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderPuree:8;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryGeneric4")
	if item then
		item:getTags():add("Berry;Berries")
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderPuree:8;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryGeneric5")
	if item then
		item:getTags():add("Berry;Berries")
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderPuree:8;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end
	local item = ScriptManager.instance:getItem("Base.BerryPoisonIvy")
	if item then
		item:getTags():add("Berry;Berries")
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderPuree:8;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:5")
	end

	--Ramen

	--[[local item = ScriptManager.instance:getItem("Base.Ramen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.InstantNoodles:10")
	end
	--]]

	--Thermos



	local item = ScriptManager.instance:getItem("Base.Coffee2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.BlenderShake:1;SapphCooking.CocktailMix:1;SapphCooking.ShavedIceEvolved:1;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.Teabag2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CocktailMix:5;SapphCooking.CoffeeThermosEvolved:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.WhiskeyFull")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LowballCupEvolved:4;SapphCooking.CocktailCupEvolved:4;SapphCooking.BlenderShake:4;SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:4;SapphCooking.FryingPanwithFriedRice:4;SapphCooking.ArrozLecheEvolved:4;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;Beverage:4;Beverage2:4;HotDrink:4;HotDrinkRed:4;HotDrinkWhite:4;HotDrinkSpiffo:4;HotDrinkTea:4;SapphCooking.ThermosBeverage:4")
	end


	local item = ScriptManager.instance:getItem("Base.Milk")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LowballCupEvolved:4;SapphCooking.CocktailCupEvolved:4;SapphCooking.BlenderShake:4;SapphCooking.BorschtEvolved:2;SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:2;Beverage2:2;Oatmeal:2;Soup:5;Stew:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.BeerBottle")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LowballCupEvolved:4;SapphCooking.CocktailCupEvolved:4;SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;Soup:9;Stew:9;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:9")
	end

	local item = ScriptManager.instance:getItem("Base.BeerCan")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.WokRoastVeg:2;SapphCooking.BorschtEvolved:2;SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:2;SapphCooking.ArrozLecheEvolved:2;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;Soup:9;Stew:9;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:9")
	end

	local item = ScriptManager.instance:getItem("Base.CannedMilkOpen")
	if item then
	item:DoParam("EvolvedRecipe = SapphCooking.BlenderShake:4;SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:5;SapphCooking.ArrozLecheEvolved:5;SapphCooking.ShavedIceEvolved:5;SapphCooking.CoffeeThermosEvolved:4;FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.PopBottle")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LowballCupEvolved:4;SapphCooking.CocktailCupEvolved:4;SapphCooking.BowlSorbet:4;SapphCooking.BlenderShake:4;SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:4;SapphCooking.CoffeeThermosEvolved:5;Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Pop")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LowballCupEvolved:4;SapphCooking.CocktailCupEvolved:4;SapphCooking.BowlSorbet:4;SapphCooking.BlenderShake:4;SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:4;SapphCooking.CoffeeThermosEvolved:5;Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Pop2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LowballCupEvolved:4;SapphCooking.CocktailCupEvolved:4;SapphCooking.BowlSorbet:4;SapphCooking.BlenderShake:4;SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:4;SapphCooking.CoffeeThermosEvolved:5;Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Pop3")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LowballCupEvolved:4;SapphCooking.CocktailCupEvolved:4;SapphCooking.BowlSorbet:4;SapphCooking.BlenderShake:4;SapphCooking.CocktailMix:4;SapphCooking.ShavedIceEvolved:4;SapphCooking.CoffeeThermosEvolved:5;Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end


	local item = ScriptManager.instance:getItem("Base.Wine")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.BowlSorbet:4;SapphCooking.WokRoastVeg:2;SapphCooking.BlenderShake:4;SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:4;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.ShavedIceEvolved:4;Beverage:4;Beverage2:4;WineInGlass:4;PastaPot:4;PastaPan:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Wine2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.BowlSorbet:4;SapphCooking.WokRoastVeg:2;SapphCooking.BlenderShake:4;SapphCooking.CocktailMix:4;SapphCooking.SpaguettiEvolved:4;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.ShavedIceEvolved:4;Beverage:4;Beverage2:4;WineInGlass:4;PastaPot:4;PastaPan:4;SapphCooking.ThermosBeverage:4")
	end


	--Insects
	--Stuff here: 
	--1.Skewers_Insect
	--2.Lasagna, cause why not


	local item = ScriptManager.instance:getItem("Base.Cockroach")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:2;SapphCooking.LettuceWrapEvolved:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BlenderShake:2;SapphCooking.HR1:1;SapphCooking.HR2:1;SapphCooking.HR3:1;SapphCooking.HR4:1;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SausageEvolved:10;SapphCooking.DumplingsEvolved:2;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:11")
	end

	local item = ScriptManager.instance:getItem("Base.Grasshopper")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LettuceWrapEvolved:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.BlenderShake:2;SapphCooking.HR1:1;SapphCooking.HR2:1;SapphCooking.HR3:1;SapphCooking.HR4:1;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:2;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:7")
	end

	local item = ScriptManager.instance:getItem("Base.Cricket")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LettuceWrapEvolved:2;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.WokRoastVeg:1;SapphCooking.BlenderShake:1;SapphCooking.HR1:1;SapphCooking.HR2:1;SapphCooking.HR3:1;SapphCooking.HR4:1;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:2;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:6")
	end

	local item = ScriptManager.instance:getItem("Base.Centipede")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.WokRoastVeg:1;SapphCooking.BlenderShake:1;SapphCooking.HR1:1;SapphCooking.HR2:1;SapphCooking.HR3:1;SapphCooking.HR4:1;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:2;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:6")
	end

	local item = ScriptManager.instance:getItem("Base.Centipede2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.WokRoastVeg:1;SapphCooking.BlenderShake:1;SapphCooking.HR1:1;SapphCooking.HR2:1;SapphCooking.HR3:1;SapphCooking.HR4:1;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:2;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:6")
	end

	local item = ScriptManager.instance:getItem("Base.Termites")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CrepesEvolved:2;SapphCooking.FlatbreadEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.WokRoastVeg:1;SapphCooking.BlenderShake:1;SapphCooking.HR1:1;SapphCooking.HR2:1;SapphCooking.HR3:1;SapphCooking.HR4:1;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:2;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:6")
	end



--Mainly MEAT
	local item = ScriptManager.instance:getItem("Base.MincedMeat")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:15;SapphCooking.WokRoastVeg:15;SapphCooking.BorschtEvolved:15|Cooked;SapphCooking.HR1:15|Cooked;SapphCooking.HR2:15|Cooked;SapphCooking.HR3:15|Cooked;SapphCooking.HR4:15|Cooked;SapphCooking.SpaguettiEvolved:15;SapphCooking.InstantNoodles:15;SapphCooking.FryingPanwithFriedRice:15;SapphCooking.SpringrollEvolved:15;SapphCooking.PoutineEvolved:15;SapphCooking.SausageEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.HotdogSandwich:15|Cooked;SapphCooking.HotdogEvolved:15|Cooked;SapphCooking.SushiEvolved:15;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Pizza:20;Stew:20;Pie:20;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Taco:10|Cooked;Burrito:10|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10")
	end

	local item = ScriptManager.instance:getItem("Base.FishFillet")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:15;SapphCooking.WokRoastVeg:10;SapphCooking.BorschtEvolved:10|Cooked;SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.CevicheEvolved:15;SapphCooking.SausageEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.HotdogSandwich:15|Cooked;SapphCooking.HotdogEvolved:15|Cooked;SapphCooking.SushiEvolved:15;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Pizza:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:10|Cooked;Burrito:15|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10")
	end

	local item = ScriptManager.instance:getItem("Base.Salmon")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:15;SapphCooking.WokRoastVeg:10;SapphCooking.BorschtEvolved:10|Cooked;SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:12;SapphCooking.InstantNoodles:12;SapphCooking.FryingPanwithFriedRice:12;SapphCooking.SpringrollEvolved:12;SapphCooking.PoutineEvolved:10;SapphCooking.CevicheEvolved:10;SapphCooking.SausageEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.HotdogSandwich:10|Cooked;SapphCooking.HotdogEvolved:10|Cooked;SapphCooking.SushiEvolved:10;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Pizza:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:8|Cooked;Burrito:16|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.Rabbitmeat")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:15;SapphCooking.WokRoastVeg:10;SapphCooking.BorschtEvolved:10|Cooked;SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:10|Cooked;SapphCooking.HotdogEvolved:5|Cooked;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.Smallanimalmeat")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:15;SapphCooking.WokRoastVeg:10;SapphCooking.BorschtEvolved:10|Cooked;SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:10|Cooked;SapphCooking.HotdogEvolved:10|Cooked;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.Smallbirdmeat")
	if item then
		item:getTags():add("FriedChickenRecipe")
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:15;SapphCooking.WokRoastVeg:10;SapphCooking.BorschtEvolved:10|Cooked;SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:10|Cooked;SapphCooking.HotdogEvolved:10|Cooked;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.Chicken")
	if item then
		item:getTags():add("FriedChickenRecipe")
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:15;SapphCooking.WokRoastVeg:10;SapphCooking.BorschtEvolved:10|Cooked;SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:10|Cooked;SapphCooking.HotdogEvolved:10|Cooked;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("Base.Shrimp")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:15;SapphCooking.WokRoastVeg:10;SapphCooking.BorschtEvolved:10|Cooked;SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.CevicheEvolved:15;SapphCooking.SausageEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.HotdogSandwich:15|Cooked;SapphCooking.HotdogEvolved:15|Cooked;SapphCooking.SushiEvolved:15;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:15;Pizza:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:10|Cooked;Burrito:15|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10")
	end


	

	local item = ScriptManager.instance:getItem("Base.Sausage")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:10|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.BorschtEvolved:10|Cooked;SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:15|Cooked;SapphCooking.HotdogEvolved:15|Cooked;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:15;SapphCooking.LasagnaEvolved:20;Pizza:20;Stew:20;Stir fry Griddle Pan:20;Stir fry:20;Burger:20|Cooked;Roasted Vegetables:20;PastaPot:20;PastaPan:20;RicePot:20;RicePan:20;Taco:5|Cooked;Burrito:10|Cooked;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:10;SapphCooking.BakedPotatoEvolved:10")
	end
	

	local item = ScriptManager.instance:getItem("Base.Steak")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:10|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.BorschtEvolved:10|Cooked;SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:15|Cooked;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("farming.Bacon")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:10|Cooked;SapphCooking.CrepesEvolved:10|Cooked;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.BorschtEvolved:10|Cooked;SapphCooking.HR1:10|Cooked;SapphCooking.HR2:10|Cooked;SapphCooking.HR3:10|Cooked;SapphCooking.HR4:10|Cooked;SapphCooking.SpaguettiEvolved:10;SapphCooking.InstantNoodles:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:15;SapphCooking.DumplingsEvolved:15;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:15|Cooked;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.SkewersMeat:10;SapphCooking.FriedRiceWok:15;SapphCooking.BakedPotatoEvolved:10")
	end

	local item = ScriptManager.instance:getItem("farming.BaconBits")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:1;SapphCooking.LettuceWrapEvolved:1|Cooked;SapphCooking.CrepesEvolved:1|Cooked;SapphCooking.FlatbreadEvolved:1;SapphCooking.WokRoastVeg:1;SapphCooking.BorschtEvolved:1|Cooked;SapphCooking.HR1:1|Cooked;SapphCooking.HR2:1|Cooked;SapphCooking.HR3:1|Cooked;SapphCooking.HR4:1|Cooked;SapphCooking.SpaguettiEvolved:1;SapphCooking.InstantNoodles:1;SapphCooking.FryingPanwithFriedRice:1;SapphCooking.SpringrollEvolved:1;SapphCooking.PoutineEvolved:1;SapphCooking.DumplingsEvolved:1;SapphCooking.StockEvolved:1;SapphCooking.HotdogSandwich:1|Cooked;SapphCooking.SushiEvolved:1;SapphCooking.YakisobaEvolved:1;SapphCooking.LasagnaEvolved:1;SapphCooking.SkewersMeat:1;SapphCooking.FriedRiceWok:1;SapphCooking.BakedPotatoEvolved:1")
	end




	--VEGETABLES/Cheese

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric1")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:6;SapphCooking.HotdogEvolved:6;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:6;SapphCooking.RatatouilleEvolved:6;SapphCooking.LasagnaEvolved:6;SapphCooking.SkewersInsect:6;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric3")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:6;SapphCooking.HotdogEvolved:6;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:6;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:5;SapphCooking.SkewersMeat:5;Pizza:15;Burger:15;Omelette:15;Stir fry Griddle Pan:15;Stir fry:15;Stew:15;Pie:15;Soup:15;Sandwich:15;Sandwich Baguette:15;Salad:15;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric4")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric5")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:6;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:6;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:15;Burger:15;Omelette:15;Stir fry Griddle Pan:15;Stir fry:15;Stew:15;Pie:15;Soup:15;Sandwich:15;Sandwich Baguette:15;Salad:15;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric6")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric7")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.Cheese")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.WokRoastVeg:5;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.HotdogSandwich:4;SapphCooking.HotdogEvolved:4;SapphCooking.SushiEvolved:2;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersVegetable:5;SapphCooking.SkewersMeat:5;SapphCooking.SkewersInsect:5;Pizza:15;Soup:10;Sandwich:5;Sandwich Baguette:5;Burger:5;Salad:5;PastaPot:10;PastaPan:10;Taco:5;Burrito:5;Bread:5;Toast:5;SapphCooking.BakedPotatoEvolved:5")
	end

	local item = ScriptManager.instance:getItem("Base.Lettuce")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:5;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.SpaguettiEvolved:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:5;SapphCooking.CevicheEvolved:5;SapphCooking.SausageEvolved:5;SapphCooking.DumplingsEvolved:5;SapphCooking.StockEvolved:5;SapphCooking.HotdogSandwich:5;SapphCooking.HotdogEvolved:5;SapphCooking.SushiEvolved:5;SapphCooking.YakisobaEvolved:5;SapphCooking.RatatouilleEvolved:5;SapphCooking.LasagnaEvolved:5;SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13")
	end

	--Vegetables!	
	local item = ScriptManager.instance:getItem("Base.Avocado")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.BlenderPuree:8;SapphCooking.DumplingsEvolved:8;SapphCooking.CrepesEvolved:5;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:4;SapphCooking.RatatouilleEvolved:2;SapphCooking.YakisobaEvolved:3;SapphCooking.SushiEvolved:3;SapphCooking.HotdogEvolved:2;SapphCooking.HotdogSandwich:3;SapphCooking.StockEvolved:2;Sandwich:3;Burger:3;Salad:5;Sandwich Baguette:3;Taco:3;Burrito:3")
	end


	local item = ScriptManager.instance:getItem("Base.BellPepper")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LettuceWrapEvolved:8;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end


	local item = ScriptManager.instance:getItem("Base.Broccoli")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end

	local item = ScriptManager.instance:getItem("Base.Carrots")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.Cake_Chocolate:5;SapphCooking.Cake_Carrot:5;SapphCooking.Cake_BlackForest:5;SapphCooking.Cake_RedVelvet:5;SapphCooking.Cake_Strawberry:5;SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end

	local item = ScriptManager.instance:getItem("Base.Eggplant")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end

	local item = ScriptManager.instance:getItem("Base.Pickles")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end


	local item = ScriptManager.instance:getItem("Base.Tomato")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end

	local item = ScriptManager.instance:getItem("Base.Zucchini")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end

	local item = ScriptManager.instance:getItem("Base.Onion")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end

	local item = ScriptManager.instance:getItem("Base.Potato")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end

	local item = ScriptManager.instance:getItem("Base.Pumpkin")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:2;SapphCooking.Cake_Carrot:2;SapphCooking.Cake_BlackForest:2;SapphCooking.Cake_RedVelvet:2;SapphCooking.Cake_Strawberry:2;SapphCooking.BlenderPuree:14;SapphCooking.CrepesEvolved:14;SapphCooking.FlatbreadEvolved:14;SapphCooking.WokRoastVeg:14;SapphCooking.HR1:14;SapphCooking.HR2:14;SapphCooking.HR3:14;SapphCooking.HR4:14;SapphCooking.SpaguettiEvolved:14;SapphCooking.InstantNoodles:14;SapphCooking.FryingPanwithFriedRice:14;SapphCooking.SpringrollEvolved:14;SapphCooking.PoutineEvolved:14;SapphCooking.CevicheEvolved:14;SapphCooking.SausageEvolved:14;SapphCooking.DumplingsEvolved:14;SapphCooking.StockEvolved:14;SapphCooking.HotdogSandwich:14;SapphCooking.HotdogEvolved:14;SapphCooking.SushiEvolved:14;SapphCooking.YakisobaEvolved:14;SapphCooking.RatatouilleEvolved:14;SapphCooking.LasagnaEvolved:14;SapphCooking.SkewersInsect:14;SapphCooking.SkewersVegetable:14;SapphCooking.SkewersMeat:14;Pizza:20;Burger:20;Omelette:20;Stir fry Griddle Pan:20;Stir fry:20;Stew:20;Pie:20;Soup:20;Sandwich:20;Sandwich Baguette:20;Salad:20;Roasted Vegetables:20;RicePot:20;RicePan:20;PastaPot:20;PastaPan:20")
	end

	local item = ScriptManager.instance:getItem("Base.Corn")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:8;SapphCooking.BlenderPuree:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end

	local item = ScriptManager.instance:getItem("farming.RedRadish")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LettuceWrapEvolved:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end

	local item = ScriptManager.instance:getItem("farming.Cabbage")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LettuceWrapEvolved:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:8;SapphCooking.HR2:8;SapphCooking.HR3:8;SapphCooking.HR4:8;SapphCooking.SpaguettiEvolved:8;SapphCooking.InstantNoodles:8;SapphCooking.FryingPanwithFriedRice:8;SapphCooking.SpringrollEvolved:8;SapphCooking.PoutineEvolved:8;SapphCooking.CevicheEvolved:8;SapphCooking.SausageEvolved:8;SapphCooking.DumplingsEvolved:8;SapphCooking.StockEvolved:8;SapphCooking.HotdogSandwich:8;SapphCooking.HotdogEvolved:8;SapphCooking.SushiEvolved:8;SapphCooking.YakisobaEvolved:8;SapphCooking.RatatouilleEvolved:8;SapphCooking.LasagnaEvolved:8;SapphCooking.SkewersInsect:8;SapphCooking.SkewersVegetable:8;SapphCooking.SkewersMeat:8;Pizza:10;Burger:10;Omelette:10;Stir fry Griddle Pan:10;Stir fry:10;Stew:10;Pie:10;Soup:10;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:10;RicePot:10;RicePan:10;PastaPot:10;PastaPan:10")
	end


	--Chips!

	local item = ScriptManager.instance:getItem("Base.Crisps")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:4;SapphCooking.RatatouilleEvolved:2;SapphCooking.YakisobaEvolved:3;SapphCooking.SushiEvolved:3;SapphCooking.HotdogEvolved:2;SapphCooking.HotdogSandwich:3;SapphCooking.StockEvolved:2;Sandwich:3;Burger:3;Salad:5;Sandwich Baguette:3;Taco:3;Burrito:3")
	end
	
	local item = ScriptManager.instance:getItem("Base.Crisps2")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:4;SapphCooking.RatatouilleEvolved:2;SapphCooking.YakisobaEvolved:3;SapphCooking.SushiEvolved:3;SapphCooking.HotdogEvolved:2;SapphCooking.HotdogSandwich:3;SapphCooking.StockEvolved:2;Sandwich:3;Burger:3;Salad:5;Sandwich Baguette:3;Taco:3;Burrito:3")
	end

	local item = ScriptManager.instance:getItem("Base.Crisps3")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:4;SapphCooking.RatatouilleEvolved:2;SapphCooking.YakisobaEvolved:3;SapphCooking.SushiEvolved:3;SapphCooking.HotdogEvolved:2;SapphCooking.HotdogSandwich:3;SapphCooking.StockEvolved:2;Sandwich:3;Burger:3;Salad:5;Sandwich Baguette:3;Taco:3;Burrito:3")
	end

	local item = ScriptManager.instance:getItem("Base.Crisps4")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:5;SapphCooking.LettuceWrapEvolved:5;SapphCooking.FlatbreadEvolved:8;SapphCooking.WokRoastVeg:8;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5;SapphCooking.InstantNoodles:5;SapphCooking.FryingPanwithFriedRice:5;SapphCooking.SpringrollEvolved:5;SapphCooking.PoutineEvolved:4;SapphCooking.RatatouilleEvolved:2;SapphCooking.YakisobaEvolved:3;SapphCooking.SushiEvolved:3;SapphCooking.HotdogEvolved:2;SapphCooking.HotdogSandwich:3;SapphCooking.StockEvolved:2;Sandwich:3;Burger:3;Salad:5;Sandwich Baguette:3;Taco:3;Burrito:3")
	end



	--Canned Food!

	local item = ScriptManager.instance:getItem("Base.OpenBeans")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:10;SapphCooking.LettuceWrapEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10;Sandwich:10;Burger:10;Salad:10;Sandwich Baguette:10;Taco:10;Burrito:10")
	end

	local item = ScriptManager.instance:getItem("Base.DogfoodOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LettuceWrapEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10")
	end

	local item = ScriptManager.instance:getItem("Base.CannedCarrotsOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:10;SapphCooking.LettuceWrapEvolved:10;SapphCooking.BlenderPuree:10;SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.SpaguettiEvolved:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10;Sandwich:10;Burger:10;Salad:10;Sandwich Baguette:10;Taco:10;Burrito:10")
	end
	local item = ScriptManager.instance:getItem("Base.CannedChiliOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:10;SapphCooking.LettuceWrapEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.SpaguettiEvolved:10;PastaPot:10;PastaPan:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10;Sandwich:10;Burger:10;Salad:10;Sandwich Baguette:10;Taco:10;Burrito:10")
	end
	local item = ScriptManager.instance:getItem("Base.CannedCornOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:10;SapphCooking.LettuceWrapEvolved:10;SapphCooking.BlenderPuree:10;SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10;Sandwich:10;Burger:10;Salad:10;Sandwich Baguette:10;Taco:10;Burrito:10")
	end
	local item = ScriptManager.instance:getItem("Base.CannedCornedBeefOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:10;SapphCooking.LettuceWrapEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10;Sandwich:10;Burger:10;Salad:10;Sandwich Baguette:10;Taco:10;Burrito:10")
	end
	local item = ScriptManager.instance:getItem("Base.CannedPeasOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:10;SapphCooking.BlenderPuree:10;SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10;Sandwich:10;Burger:10;Salad:10;Sandwich Baguette:10;Taco:10;Burrito:10")
	end
	local item = ScriptManager.instance:getItem("Base.CannedPotatoOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:10;SapphCooking.BlenderPuree:10;SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10;Sandwich:10;Burger:10;Salad:10;Sandwich Baguette:10;Taco:10;Burrito:10")
	end
	local item = ScriptManager.instance:getItem("Base.CannedTomatoOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:10;SapphCooking.BlenderPuree:10;SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.SpaguettiEvolved:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10;Sandwich:10;Burger:10;Salad:10;Sandwich Baguette:10;Taco:10;Burrito:10")
	end
	local item = ScriptManager.instance:getItem("Base.CannedBologneseOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.StuffedPepperEvolved:10;SapphCooking.LettuceWrapEvolved:10;SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.SpaguettiEvolved:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10;Sandwich:10;Burger:10;Salad:10;Sandwich Baguette:10;Taco:10;Burrito:10")
	end
	local item = ScriptManager.instance:getItem("Base.TunaTinOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LasagnaEvolved:10;SapphCooking.DumplingsEvolved:10;SapphCooking.FlatbreadEvolved:10;SapphCooking.WokRoastVeg:10;SapphCooking.HR1:10;SapphCooking.HR2:10;SapphCooking.HR3:10;SapphCooking.HR4:10;SapphCooking.FryingPanwithFriedRice:10;SapphCooking.SpringrollEvolved:10;SapphCooking.PoutineEvolved:10;SapphCooking.YakisobaEvolved:10;SapphCooking.HotdogEvolved:10;SapphCooking.HotdogSandwich:10;Sandwich:10;Burger:10;Salad:10;Sandwich Baguette:10;Taco:10;Burrito:10")
	end
	local item = ScriptManager.instance:getItem("Base.CannedPineappleOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.LasagnaEvolved:10;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end
	local item = ScriptManager.instance:getItem("Base.CannedPeachesOpen")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.MacaronPink:2;SapphCooking.MacaronRed:2;SapphCooking.MacaronBlue:2;SapphCooking.MacaronGreen:2;SapphCooking.MacaronYellow:2;SapphCooking.MacaronPurple:2;SapphCooking.Cake_Chocolate:8;SapphCooking.Cake_Carrot:8;SapphCooking.Cake_BlackForest:8;SapphCooking.Cake_RedVelvet:8;SapphCooking.Cake_Strawberry:8;SapphCooking.BagelPlainEvolved:2;SapphCooking.EclairEvolved:2;SapphCooking.EclairChocolateEvolved:2;SapphCooking.EclairWhiteChocolateEvolved:2;SapphCooking.DoughnutsEvolved:2;SapphCooking.DoughnutsChocolateEvolved:2;SapphCooking.LasagnaEvolved:10;SapphCooking.BlenderJuice:8;SapphCooking.CrepesEvolved:8;SapphCooking.FlatbreadEvolved:8;SapphCooking.FrenchToastEvolved:8;SapphCooking.BowlSorbet:8;SapphCooking.Mochi:8;SapphCooking.CocktailMix:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	end





	--Sachets
	--I may re-do this in the future

	local item = ScriptManager.instance:getItem("Base.OilOlive")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.WokRoastVeg:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.BakedPotatoEvolved:2;SapphCooking.FriedRiceWok:2")
	end

	local item = ScriptManager.instance:getItem("Base.OilVegetable")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.LasagnaEvolved:2;SapphCooking.WokRoastVeg:2;SapphCooking.HR1:2;SapphCooking.HR2:2;SapphCooking.HR3:2;SapphCooking.HR4:2;SapphCooking.InstantNoodles:2;SapphCooking.FryingPanwithFriedRice:2;SapphCooking.SpringrollEvolved:2;SapphCooking.PoutineEvolved:2;SapphCooking.CevicheEvolved:2;SapphCooking.SausageEvolved:2;SapphCooking.DumplingsEvolved:2;SapphCooking.HotdogSandwich:2;SapphCooking.HotdogEvolved:2;SapphCooking.YakisobaEvolved:2;SapphCooking.RatatouilleEvolved:2;SapphCooking.LasagnaEvolved:2;Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.BakedPotatoEvolved:2;SapphCooking.FriedRiceWok:2")
	end

	local item = ScriptManager.instance:getItem("Base.Tortilla")
	if item then
		item:DoParam("EvolvedRecipe = SapphCooking.FlatbreadEvolved:5;SapphCooking.WokRoastVeg:5;SapphCooking.HR1:5;SapphCooking.HR2:5;SapphCooking.HR3:5;SapphCooking.HR4:5")
	end


	--kinda of a prefab(fruit)
	
	--itemSapph = ScriptManager.instance:getItem("")
	--if itemSapph then
	--	itemSapph:DoParam("EvolvedRecipe = SapphCooking.WokRoastVeg:8;SapphCooking.BlenderShake:8;SapphCooking.Mochi:8;SapphCooking.SpringrollEvolved:8;SapphCooking.ShavedIceEvolved:8;SapphCooking.ArrozLecheEvolved:8")
	--end


end



TweakRecipes()
Events.OnInitGlobalModData.Add(TweakRecipes)
