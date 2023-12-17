require 'Items/SuburbsDistributions'
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

local FAKegSpawnChance = SandboxVars.FunctionalAppliances.BeerKegsChance; 
local FASyrupsSpawnChance = SandboxVars.FunctionalAppliances.SyrupsChance; 
local FATheatreSpawnChance = SandboxVars.FunctionalAppliances.FATheatreChance; 
local FAFreshTheatreSpawnChance = SandboxVars.FunctionalAppliances.FAFreshTheatreChance; 
local FAZombieItemsSpawn = SandboxVars.FunctionalAppliances.FAZombieItemsSpawn; 
local FASapphsCookingTheatreSpawnChance = SandboxVars.FunctionalAppliances.FASapphsCookingTheatreChance; 
local FASapphsCookingFreshTheatreSpawnChance = SandboxVars.FunctionalAppliances.FASapphsCookingFreshTheatreChance; 
local FACCSTheatreSpawnChance = SandboxVars.FunctionalAppliances.FACCSTheatreChance; 


if (FAKegSpawnChance == 6) then
	FAKegSpawnChance = 0;
end

if (FASyrupsSpawnChance == 6) then
	FASyrupsSpawnChance = 0;
end

if (FATheatreSpawnChance == 6) then
	FATheatreSpawnChance = 0;
end

if (FAFreshTheatreSpawnChance == 6) then
	FAFreshTheatreSpawnChance = 0;
end

if (FASapphsCookingTheatreSpawnChance == 6) then
	FASapphsCookingTheatreSpawnChance = 0;
end

if (FASapphsCookingFreshTheatreSpawnChance == 6) then
	FASapphsCookingFreshTheatreSpawnChance = 0;
end

if (FACCSTheatreSpawnChance == 6) then
	FACCSTheatreSpawnChance = 0;
end

table.insert(VehicleDistributions["GloveBox"].items, "FunctionalAppliances.FAFountainCup");
table.insert(VehicleDistributions["GloveBox"].items, 0.01);

table.insert(SuburbsDistributions["all"]["bin"].items, "FunctionalAppliances.FAFountainCup");
table.insert(SuburbsDistributions["all"]["bin"].items, 0.01);

if FAZombieItemsSpawn then
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "FunctionalAppliances.FAFountainCup");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.01);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "FunctionalAppliances.FABucketofButteredPopcorn");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.01);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "FunctionalAppliances.FABucketofPopcorn");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.01);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "FunctionalAppliances.FAFountainCupOrangeSoda");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.01);

	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "FunctionalAppliances.FAFountainCup");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.01);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "FunctionalAppliances.FABucketofButteredPopcorn");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.01);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "FunctionalAppliances.FABucketofPopcorn");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.01);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "FunctionalAppliances.FAFountainCupOrangeSoda");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.01);
end

table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "FunctionalAppliances.FAFountainCupOrangeSoda");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 10);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "FunctionalAppliances.FAFountainCupColaSoda");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 10);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "FunctionalAppliances.FAFountainCupLemonlimeSoda");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 10);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "FunctionalAppliances.FAFountainCupRootBeerSoda");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 10);

table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, "Base.Sausage");
table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, 20);
table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, "Base.Sausage");
table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, 10);
table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, "Base.BreadSlices");
table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, 10);
table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, "Base.Bread");
table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, 10);
table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, "Base.Butter");
table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, 10);

table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "FunctionalAppliances.FAFountainCup");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "FunctionalAppliances.FABucketofPopcorn");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "FunctionalAppliances.FABucketofButteredPopcorn");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);

table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, "FunctionalAppliances.FABucketofPopcorn");
table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, 10);
table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, "FunctionalAppliances.FABucketofButteredPopcorn");
table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, 10);
table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, "Base.Butter");
table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, 20);
table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, "FunctionalAppliances.FAEmptyBucketPopcorn");
table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, 10);

table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "FunctionalAppliances.FATheaterPopcorn");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 10);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "FunctionalAppliances.FAFriedPotatoSkins");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 10);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "FunctionalAppliances.FAFriedBloomingOnion");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 10);

table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "FunctionalAppliances.FAFountainCup");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, 5);

table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "FunctionalAppliances.FAFountainCupLemonLimeSoda");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, 10);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "FunctionalAppliances.FAFountainCupOrangeSoda");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, 10);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "FunctionalAppliances.FAFountainCupColaSoda");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, 10);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "FunctionalAppliances.FAFountainCupRootBeerSoda");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, 10);

table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "FunctionalAppliances.FAFountainCup");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, 10);
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "FunctionalAppliances.FAFountainCupOrangeSoda");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, 10);
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "FunctionalAppliances.FAFountainCupColaSoda");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, 10);
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "FunctionalAppliances.FAFountainCupLemonLimeSoda");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, 10);
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "FunctionalAppliances.FAFountainCupRootBeerSoda");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, 10);
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "FunctionalAppliances.FAFriedChickenTenders");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, 10);
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "FunctionalAppliances.FAFriedCheeseSticks");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, 10);
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "FunctionalAppliances.FAFriedBloomingOnion");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, 10);

table.insert(ProceduralDistributions["list"]["StoreCounterCleaning"].items, "Base.TinOpener");
table.insert(ProceduralDistributions["list"]["StoreCounterCleaning"].items, 10);

table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "FunctionalAppliances.FAFountainCup");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, 10);
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "FunctionalAppliances.FAEmptySodaSyrupBox");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, 1);
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "FunctionalAppliances.EmptyFACO2Tank");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, 1);

table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, "FunctionalAppliances.FAFountainCup");
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, 10);
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, "FunctionalAppliances.FAEmptySodaSyrupBox");
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, 1);
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, "FunctionalAppliances.EmptyFACO2Tank");
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, 1);
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, "FunctionalAppliances.FAFriedChickenTenders");
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, 5);
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, "FunctionalAppliances.FAFriedChickenFillet");
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, 5);
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, "FunctionalAppliances.FAFriedBloomingOnion");
table.insert(ProceduralDistributions["list"]["JaysKitchenBags"].items, 5);

table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "FunctionalAppliances.FAPopBottleLemonLime");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 10);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "FunctionalAppliances.FAPopBottleCola");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 10);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "FunctionalAppliances.FAPopBottleRootBeer");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 10);

table.insert(ProceduralDistributions["list"]["GigamartBottles"].items, "FunctionalAppliances.FAPopBottleLemonLime");
table.insert(ProceduralDistributions["list"]["GigamartBottles"].items, 10);
table.insert(ProceduralDistributions["list"]["GigamartBottles"].items, "FunctionalAppliances.FAPopBottleCola");
table.insert(ProceduralDistributions["list"]["GigamartBottles"].items, 10);
table.insert(ProceduralDistributions["list"]["GigamartBottles"].items, "FunctionalAppliances.FAPopBottleRootBeer");
table.insert(ProceduralDistributions["list"]["GigamartBottles"].items, 10);

table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "FunctionalAppliances.FAPopBottleLemonLime");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 10);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "FunctionalAppliances.FAPopBottleCola");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 10);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "FunctionalAppliances.FAPopBottleRootBeer");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 10);

table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "FunctionalAppliances.FABeerMug");
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, 20);
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "FunctionalAppliances.FAPlasticCup");
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, 10);
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "FunctionalAppliances.FAEmptyKeg");
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, 1);

table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "FunctionalAppliances.FABubBeerBottle");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 10);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "FunctionalAppliances.FABubLiteBeerBottle");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 10);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "FunctionalAppliances.FASwillerBeerBottle");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 10);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "FunctionalAppliances.FASwillerLiteBeerBottle");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 10);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "FunctionalAppliances.FAEmptyKeg");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 1);

table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "FunctionalAppliances.FABubBeerBottle");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 10);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "FunctionalAppliances.FABubLiteBeerBottle");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 10);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "FunctionalAppliances.FASwillerBeerBottle");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 10);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "FunctionalAppliances.FASwillerLiteBeerBottle");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 10);

table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "FunctionalAppliances.FABubBeerBottle");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 10);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "FunctionalAppliances.FABubLiteBeerBottle");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 10);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "FunctionalAppliances.FASwillerBeerBottle");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 10);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "FunctionalAppliances.FASwillerLiteBeerBottle");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 10);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "Base.Yeast");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 10);

function isFriendlyModEnabled(modname)
    local actmods = getActivatedMods();
    for i=0, actmods:size()-1, 1 do
        if actmods:get(i) == modname then
            return true;
        end
    end
    return false;
end

if isFriendlyModEnabled("sapphcooking") then
	table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, "SapphCooking.ViennaSausage");
	table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, 20);
	table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, "SapphCooking.FrankfurterSausage");
	table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, 20);
	table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, "SapphCooking.HotdogBun");
	table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, "SapphCooking.BagofHotdogBuns");
	table.insert(ProceduralDistributions["list"]["TheatreKitchenFreezer"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, "SapphCooking.CannedSausages");
	table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, "SapphCooking.CanofKernelCorn");
	table.insert(ProceduralDistributions["list"]["TheatrePopcorn"].items, 10);
end

if isFriendlyModEnabled("CCS") then
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.Snackers");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.Leeroy");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.ChitChat");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.Tittles");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.4muskepeers");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.Almondjaws");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.ZersheyBar");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.Mounds");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.PayDay");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.Kwix");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.BagofRollys");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCS.SweetTreats");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
end

if isFriendlyModEnabled("CCSFixed") then
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.Snackers");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.Leeroy");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.ChitChat");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.Tittles");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.4muskepeers");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.Almondjaws");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.ZersheyBar");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.Mounds");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.PayDay");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.Kwix");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.BagofRollys");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "CCSFixed.SweetTreats");
	table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 10);
end

--table.insert(SuburbsDistributions["theatre"]["counter"].procList, {name="TheatreSnacks", min=0, max=99, forceForTiles="location_shop_accessories_01_0;location_shop_accessories_01_1;location_shop_accessories_01_2;location_shop_accessories_01_3;location_shop_accessories_01_20;location_shop_accessories_01_21;location_shop_accessories_01_22;location_shop_accessories_01_23;fixtures_sinks_01_0;fixtures_sinks_01_1;fixtures_sinks_01_2;fixtures_sinks_01_3;fixtures_sinks_01_4;fixtures_sinks_01_5;fixtures_sinks_01_6;fixtures_sinks_01_7;fixtures_sinks_01_8;fixtures_sinks_01_9;fixtures_sinks_01_10;fixtures_sinks_01_11;fixtures_sinks_01_16;fixtures_sinks_01_17;fixtures_sinks_01_18;fixtures_sinks_01_19"});
--table.insert(SuburbsDistributions["theatre"]["counter"].procList, name="TheatreSnacks");
--table.insert(SuburbsDistributions["theatre"]["counter"].procList, min=0);
--table.insert(SuburbsDistributions["theatre"]["counter"].procList, max=99);
--table.insert(SuburbsDistributions["theatre"]["counter"].procList, weightChance=60);
--table.insert(SuburbsDistributions["theatre"]["counter"]["procList"].items, name="TheatreSnacks");
--table.insert(SuburbsDistributions["theatre"]["counter"]["procList"].items, min=0);
--table.insert(SuburbsDistributions["theatre"]["counter"]["procList"].items, max=99);
--table.insert(SuburbsDistributions["theatre"]["counter"]["procList"].items, weightChance=60);
--table.insert(SuburbsDistributions["theatre"]["counter"].procList, {name="TheatreSnacks", min=0, max=99, weightChance=60});

local FABaseCandyList = {
	"Base.Chocolate",
	"Base.CandyPackage",
	"Base.HardCandies",
	"Base.LicoriceRed",
	"Base.LicoriceBlack",
	"Base.GummyBears",
	"Base.Modjeska",
	"Base.Jujubes",
	"Base.ChocolateCoveredCoffeeBeans",
	"Base.GummyWorms",
}

local FAPopcornList = {
	"FunctionalAppliances.FABucketofButteredPopcorn",
	"FunctionalAppliances.FABucketofPopcorn",
	"Base.Butter",
	"Base.Popcorn",
	"FunctionalAppliances.FAEmptyBucketPopcorn",
	"FunctionalAppliances.FAFountainCup",
}

local FAFreshList = {
	"Base.Butter",
	"FunctionalAppliances.FAFountainCupOrangeSoda",
	"FunctionalAppliances.FAFountainCupColaSoda",
	"FunctionalAppliances.FAFountainCupLemonLimeSoda",
	"FunctionalAppliances.FAFountainCupRootBeerSoda",
	"FunctionalAppliances.FAHotdog",
	"Base.Sausage",
	"Base.BreadSlices",
}

local FABarTapsKegsList = {
	"FunctionalAppliances.FABubKeg",
	"FunctionalAppliances.FABubLiteKeg",
	"FunctionalAppliances.FASwillerKeg",
	"FunctionalAppliances.FASwillerLiteKeg",
}

local FASodaFountainSyrupsList = {
	"FunctionalAppliances.FACO2Tank",
	"FunctionalAppliances.FAOrangeSodaSyrupBox",
	"FunctionalAppliances.FALemonLimeSodaSyrupBox",
	"FunctionalAppliances.FARootBeerSodaSyrupBox",
	"FunctionalAppliances.FAColaSodaSyrupBox",
}

local FASapphsList = {
	"SapphCooking.CanofKernelCorn",
	"SapphCooking.CannedSausages",
}

local FASapphsFreshList = {
	"SapphCooking.BagofHotdogBuns",
	"SapphCooking.HotdogBun",
	"SapphCooking.FrankfurterSausage",
	"SapphCooking.ViennaSausage",
}

local FACCSCandyList = {
	"CCS.Snackers",
	"CCS.Leeroy",
	"CCS.ChitChat",
	"CCS.Tittles",
	"CCS.4muskepeers",
	"CCS.Leeroy",
	"CCS.Almondjaws",
	"CCS.ZersheyBar",
	"CCS.Mounds",
	"CCS.PayDay",
	"CCS.Kwix",
	"CCS.BagofRollys",
	"CCS.SweetTreats",
}

local FACCSFixedCandyList = {
	"CCSFixed.Snackers",
	"CCSFixed.Leeroy",
	"CCSFixed.ChitChat",
	"CCSFixed.Tittles",
	"CCSFixed.4muskepeers",
	"CCSFixed.Leeroy",
	"CCSFixed.Almondjaws",
	"CCSFixed.ZersheyBar",
	"CCSFixed.Mounds",
	"CCSFixed.PayDay",
	"CCSFixed.Kwix",
	"CCSFixed.BagofRollys",
	"CCSFixed.SweetTreats",
}

local FATheatrespawns = {
	theatrestorage = {shelves=60,crate=60,counter=60,fridge=60},
    	theatre = {counter=60,fridge=60,crate=60,freezer=60},
   	theatrekitchen = {counter=60,crate=60,fridge=60,metal_shelves=60}
}


local FABarTapsspawns = {
	bar = {counter=60}
}

local FASyrupsspawns = {
	jayschicken_kitchen = {counter=60},
	zippeestore = {counter=60},
	zippeestorage = {metal_shelves=60},
	theatrestorage = {shelves=60,crate=60,counter=60},
    	theatre = {counter=60,crate=60},
  	theatrekitchen = {counter=60,crate=60,metal_shelves=60},
	spiffo_dining = {counter=60},
	spiffosstorage = {crate=60,metal_shelves=60},
    	spiffoskitchen = {crate=60,metal_shelves=60},
	gasstorage = {crate=60,metal_shelves=60}
}

local function FAApplySpawnChance(value)
	if ZombRand(100)+1 >= (100 - value) then
		return true;
	else
		return false;
	end
end

local function FAPickOne(index)
	return ZombRand(index)+1
end

local function FASpawn(roomName, containerType, containerFilled)
	if (FATheatrespawns[roomName] == nil and FABarTapsspawns[roomName] == nil and FASyrupsspawns[roomName] == nil) then
		return;
	end

	local RollRand = 0
	
	if (FATheatrespawns[roomName] ~= nil) and (FATheatrespawns[roomName][containerType] ~= nil) then
		if FAApplySpawnChance(FATheatrespawns[roomName][containerType]) then
			if isFriendlyModEnabled("sapphcooking") then
				if containerType == "fridge" then
					RollRand = ZombRand(1,100)+(FASapphsCookingFreshTheatreSpawnChance*10)
					if RollRand >= 101 then
						containerFilled:AddItem(FASapphsFreshList[FAPickOne(#FASapphsFreshList)]);
						if RollRand >= 121 then
							containerFilled:AddItem(FASapphsFreshList[FAPickOne(#FASapphsFreshList)]);
							if RollRand >= 131 then
								containerFilled:AddItem(FASapphsFreshList[FAPickOne(#FASapphsFreshList)]);
							end
						end
					end
				else
					RollRand = ZombRand(1,100)+(FASapphsCookingFreshTheatreSpawnChance*10)
					if RollRand >= 101 then
						containerFilled:AddItem(FASapphsFreshList[FAPickOne(#FASapphsFreshList)]);
						if RollRand >= 121 then
							containerFilled:AddItem(FASapphsFreshList[FAPickOne(#FASapphsFreshList)]);
						end
					end
					RollRand = ZombRand(1,100)+(FASapphsCookingTheatreSpawnChance*10)
					if RollRand >= 101 then
						containerFilled:AddItem(FASapphsList[FAPickOne(#FASapphsList)]);
						if RollRand >= 121 then
							containerFilled:AddItem(FASapphsList[FAPickOne(#FASapphsList)]);
							if RollRand >= 131 then
								containerFilled:AddItem(FASapphsList[FAPickOne(#FASapphsList)]);
							end
						end
					end
				end
			end

			if isFriendlyModEnabled("CCSFixed") and containerType == "counter" then
				RollRand = ZombRand(1,100)+(FACCSTheatreSpawnChance*10)
				if RollRand >= 101 then
					containerFilled:AddItem(FACCSFixedCandyList[FAPickOne(#FACCSFixedCandyList)]);
					if RollRand >= 121 then
						containerFilled:AddItem(FACCSFixedCandyList[FAPickOne(#FACCSFixedCandyList)]);
						if RollRand >= 131 then
							containerFilled:AddItem(FACCSFixedCandyList[FAPickOne(#FACCSFixedCandyList)]);
						end
					end
				end
			elseif isFriendlyModEnabled("CCS") and containerType == "counter" then
				RollRand = ZombRand(1,100)+(FACCSTheatreSpawnChance*10)
				if RollRand >= 101 then
					containerFilled:AddItem(FACCSCandyList[FAPickOne(#FACCSCandyList)]);
					if RollRand >= 121 then
						containerFilled:AddItem(FACCSCandyList[FAPickOne(#FACCSCandyList)]);
						if RollRand >= 131 then
							containerFilled:AddItem(FACCSCandyList[FAPickOne(#FACCSCandyList)]);
						end
					end
				end
			end

			if containerType == "fridge" then
				RollRand = ZombRand(1,100)+(FAFreshTheatreSpawnChance*10)
				if RollRand >= 101 then
					containerFilled:AddItem(FAFreshList[FAPickOne(#FAFreshList)]);
					if RollRand >= 121 then
						containerFilled:AddItem(FAFreshList[FAPickOne(#FAFreshList)]);
						if RollRand >= 131 then
							containerFilled:AddItem(FAFreshList[FAPickOne(#FAFreshList)]);
						end
					end
				end
			else
				RollRand = ZombRand(1,100)+(FAFreshTheatreSpawnChance*10)
				if RollRand >= 101 then
					containerFilled:AddItem(FAFreshList[FAPickOne(#FAFreshList)]);
					if RollRand >= 121 then
						containerFilled:AddItem(FAFreshList[FAPickOne(#FAFreshList)]);
					end
				end
				RollRand = ZombRand(1,100)+(FATheatreSpawnChance*10)
				if RollRand >= 101 then
					containerFilled:AddItem(FAPopcornList[FAPickOne(#FAPopcornList)]);
					if RollRand >= 121 then
						containerFilled:AddItem(FAPopcornList[FAPickOne(#FAPopcornList)]);
						if RollRand >= 131 then
							containerFilled:AddItem(FAPopcornList[FAPickOne(#FAPopcornList)]);
						end
					end
				end
				RollRand = ZombRand(1,100)+(FATheatreSpawnChance*10)
				if RollRand >= 101 then
					containerFilled:AddItem(FABaseCandyList[FAPickOne(#FABaseCandyList)]);
					if RollRand >= 121 then
						containerFilled:AddItem(FABaseCandyList[FAPickOne(#FABaseCandyList)]);
						if RollRand >= 131 then
							containerFilled:AddItem(FABaseCandyList[FAPickOne(#FABaseCandyList)]);
						end
					end
				end
			end

		end
	end

	if (FABarTapsspawns[roomName] ~= nil) and (FABarTapsspawns[roomName][containerType] ~= nil) then
		if FAApplySpawnChance(FABarTapsspawns[roomName][containerType]) then
			RollRand = ZombRand(1,100)+(FAKegSpawnChance*10)
			if RollRand >= 101 then
				containerFilled:AddItem(FABarTapsKegsList[FAPickOne(#FABarTapsKegsList)]);
				if RollRand >= 121 then
					containerFilled:AddItem(FABarTapsKegsList[FAPickOne(#FABarTapsKegsList)]);
				end
			end
		end
	end

	if (FASyrupsspawns[roomName] ~= nil) and (FASyrupsspawns[roomName][containerType] ~= nil) then
		if FAApplySpawnChance(FASyrupsspawns[roomName][containerType]) then
			RollRand = ZombRand(1,100)+(FASyrupsSpawnChance*10)
			if RollRand >= 101 then
				containerFilled:AddItem(FASodaFountainSyrupsList[FAPickOne(#FASodaFountainSyrupsList)]);
				if RollRand >= 121 then
					containerFilled:AddItem(FASodaFountainSyrupsList[FAPickOne(#FASodaFountainSyrupsList)]);
				end
			end
		end
	end

end

Events.OnFillContainer.Add(FASpawn)