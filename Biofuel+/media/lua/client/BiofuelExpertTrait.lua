require('NPCs/MainCreationMethods');
local function initBiofuelExpertTrait()	
	local BiofuelExpert = TraitFactory.addTrait("BiofuelExpert", getText("UI_trait_BiofuelExpert"), 6, getText("UI_traitdesc_BiofuelExpert"), false, false);
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Cabbages");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Potatos");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Radishes");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Carrots");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Tomatos");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Broccoli");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Strawberries");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Corn");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Onions");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Bell Peppers");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Eggplants");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Leeks");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Lettuce");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Zucchinis");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Apples");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Bananas");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Cherrys");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Grapefruit");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Grapes");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Mangos");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Oranges");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Peachs");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Pears");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Pineapples");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Pumpkin");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Watermelon");
		BiofuelExpert:getFreeRecipes():add("Make Biofuel From Avaocados");

		local BiofuelMaster = TraitFactory.addTrait("BiofuelMaster", getText("UI_trait_BiofuelMaster"), 10, getText("UI_traitdesc_BiofuelMaster"), false, false);
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Cabbages");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Potatos");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Radishes");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Carrots");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Tomatos");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Broccoli");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Strawberries");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Corn");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Onions");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Bell Peppers");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Eggplants");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Leeks");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Lettuce");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Zucchinis");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Apples");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Bananas");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Cherrys");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Grapefruit");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Grapes");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Mangos");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Oranges");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Peachs");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Pears");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Pineapples");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Pumpkin");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Watermelon");
		BiofuelMaster:getFreeRecipes():add("Make Biofuel From Avaocados");
		BiofuelMaster:addXPBoost(Perks.Cooking, 4)
		
		TraitFactory.setMutualExclusive("BiofuelExpert", "BiofuelMaster");
end

Events.OnGameBoot.Add(initBiofuelExpertTrait);