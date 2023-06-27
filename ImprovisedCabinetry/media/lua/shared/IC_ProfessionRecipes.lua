
-- On Player Load, check their professions and if it matches
-- one we're expecting, add some free recipes to their character
function ICAddRecipesToExistingPlayers(id, player)
    local profession = player:getDescriptor():getProfession();

    -- Carpenters Get all the Recipes
    if profession == "carpenter" then
        player:learnRecipe("ICMakeCabinetShop4");
        player:learnRecipe("ICMakeCabinetShop4Corner");
        player:learnRecipe("ICMakeCabinetRestaurant4");
        player:learnRecipe("ICMakeCabinetRestaurant4Corner");
        player:learnRecipe("ICMakeCabinetTheater1");
        player:learnRecipe("ICMakeCabinetTheater2");
        player:learnRecipe("ICMakeCabinetTheater3");
        player:learnRecipe("ICMakeCabinetRestaurant1");
        player:learnRecipe("ICMakeCabinetRestaurant1Corner");
        player:learnRecipe("ICMakeCabinetRestaurant5");
        player:learnRecipe("ICMakeCabinetRestaurant5Corner");
        player:learnRecipe("ICMakeCabinetRestaurant3");
        player:learnRecipe("ICMakeCabinetRestaurant3Corner");
    end

    -- Metalworkers get metalworking recipes
    if profession == "metalworker" then
        player:learnRecipe("ICMakeLargeMetalShelves1");
        player:learnRecipe("ICMakeMetalCabinet1");
    end

    -- If the Improvised Glass mod is installed, You get Glass Cabinets
    if getActivatedMods():contains("ImprovisedGlass") then
        player:learnRecipe("ICMakeCabinetImprovisedGlass1");
        player:learnRecipe("ICMakeCabinetImprovisedGlass1Corner");
        player:learnRecipe("ICMakeCabinetImprovisedGlass2");
    else 
        player:getKnownRecipes():remove("ICMakeCabinetImprovisedGlass1");
        player:getKnownRecipes():remove("ICMakeCabinetImprovisedGlass1Corner");
        player:getKnownRecipes():remove("ICMakeCabinetImprovisedGlass2");
    end
end

-- Character loads into the world
Events.OnCreatePlayer.Add(ICAddRecipesToExistingPlayers);
