require "Items/ProceduralDistributions"
require "Items/Distributions"
require "Vehicles/VehicleDistributions"

local k, v, i, j

local OPTIONS = CAR.OPTIONS

local removevanilladrinks =   true



if ModOptions and ModOptions.getInstance then
  local settings = ModOptions:getInstance(OPTIONS, "CAR", "Hanabi's Drinks")
  
  ModOptions:loadFile()
  
  removevanilladrinks = OPTIONS.removevanilladrinks
end

local removeItemFromPopTable = {
  "Pop",
  "Pop2",
  "Pop3",
  "PopBottle",
  "PopEmpty",
  "PopBottleEmpty",
}

local removeItemFromBeerTable = {
}

local proceduralDistPopLocations = {
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BarCounterMisc",
  "BarCounterMisc",
  "BarCounterMisc",
  "BarCounterMisc",
  "BinBar",
  "BinGeneric",
  "BinGeneric",
  "CafeteriaDrinks",
  "CafeteriaDrinks",
  "CafeteriaDrinks",
  "CafeteriaDrinks",
  "ClassroomDesk",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateSodaBottles",
  "CrateSodaBottles",
  "CrateSodaBottles",
  "CrateSodaBottles",
  "CrateSodaBottles",
  "CrateSodaCans",
  "CrateSodaCans",
  "CrateSodaCans",
  "CrateSodaCans",
  "CrateSodaCans",
  "CrateSodaCans",
  "FridgeBottles",
  "FridgeBottles",
  "FridgeBottles",
  "FridgeBottles",
  "FridgeBreakRoom",
  "FridgeBreakRoom",
  "FridgeBreakRoom",
  "FridgeBreakRoom",
  "FridgeGeneric",
  "FridgeOffice",
  "FridgeOffice",
  "FridgeOffice",
  "FridgeOffice",
  "FridgeRich",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeTrailerPark",
  "FridgeTrailerPark",
  "FridgeTrailerPark",
  "FridgeTrailerPark",
  "GasStorageCombo",
  "GasStorageCombo",
  "GasStorageCombo",
  "GasStorageCombo",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartCrisps",
  "KitchenBottles",
  "KitchenBottles",
  "KitchenBottles",
  "KitchenBottles",
  "KitchenBottles",
  "MotelFridge",
  "MotelFridge",
  "MotelFridge",
  "MotelFridge",
  "MotelFridge",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
}

local proceduralDistBeerLocations = {
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BinBar",
  "BinBar",
  "BinBar",
  "BinBar",
  "BinBar",
  "BinBar",
  "BinGeneric",
  "BinGeneric",
  "BreweryBottles",
  "BreweryBottles",
  "BreweryBottles",
  "BreweryBottles",
  "BreweryBottles",
  "BreweryCans",
  "BreweryCans",
  "BreweryCans",
  "BreweryCans",
  "BreweryCans",
  "BreweryEmptyBottles",
  "BreweryEmptyBottles",
  "BreweryEmptyBottles",
  "BreweryEmptyBottles",
  "BreweryEmptyBottles",
  "CrateEmptyBottles1",
  "CrateEmptyBottles1",
  "CrateEmptyBottles1",
  "CrateEmptyBottles1",
  "CrateEmptyBottles1",
  "DrugShackDrugs",
  "DrugShackDrugs",
  "DrugShackDrugs",
  "DrugShackDrugs",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeGeneric",
  "FridgeGeneric",
  "FridgeRich",
  "FridgeTrailerPark",
  "KitchenBottles",
  "KitchenBottles",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
}

local distPopLocations = {
  "bin",
  "bin",
  "vendingpop",
  "vendingpop",
  "vendingpop",
  "vendingpop",
}

local distPopLocations2 = {
  "Bag_Schoolbag",
  "GroceryBag1",
  "GroceryBag1",
  "GroceryBag1",
  "GroceryBag1",
  "GroceryBag3",
  "GroceryBag3",
  "GroceryBag3",
  "GroceryBag3",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "Bag_Satchel",
}

local distBeerLocations = {
  "bin",
  "bin",
  "Outfit_Biker",
  "Outfit_Punk",
  "Outfit_Punk",
  "Outfit_Redneck",
  "Outfit_Rocker",
}

local vehDistPopLocations = {
  "TrunkStandard",
  "TrunkStandard",
  "TrunkHeavy",
  "TrunkHeavy",
  "TrunkSports",
  "TrunkSports",
  "SurvivalistTruckBed",
  "SurvivalistTruckBed",
  "FishermanTruckBed",
  "FishermanTruckBed",
  "GroceriesTruckBed",
  "GroceriesTruckBed",
  "GolfTruckBed",
  "GolfTruckBed",
  "ClothingTruckBed",
  "ClothingTruckBed",
  "CarpenterTruckBed",
  "CarpenterTruckBed",
  "ElectricianTruckBed",
  "FarmerTruckBed",
  "MetalWelderTruckBed",
  "DoctorTruckBed",
  "RadioTruckBed",
  "PainterTruckBed",
  "ConstructionWorkerTruckBed",
  "TaxiTruckBed",
  "PoliceTruckBed",
  "RangerTruckBed",
  "FossoilTruckBed",
  "PostalTruckBed",
  "SpiffoTruckBed",
  "MassGenFacTruckBed",
  "TransitTruckBed",
  "DistilleryTruckBed",
  "HeraldsTruckBed",
  "AmbulanceTruckBed",
  "ElectricianTruckBed",
  "FarmerTruckBed",
  "MetalWelderTruckBed",
  "DoctorTruckBed",
  "RadioTruckBed",
  "PainterTruckBed",
  "ConstructionWorkerTruckBed",
  "TaxiTruckBed",
  "PoliceTruckBed",
  "RangerTruckBed",
  "FossoilTruckBed",
  "PostalTruckBed",
  "SpiffoTruckBed",
  "SpiffoTruckBed",
  "SpiffoTruckBed",
  "MassGenFacTruckBed",
  "TransitTruckBed",
  "DistilleryTruckBed",
  "HeraldsTruckBed",
  "AmbulanceTruckBed",
}

if(removevanilladrinks)then
  for i = 1, #removeItemFromPopTable do
      for j = 1, #proceduralDistPopLocations do
        for k,v in ipairs(ProceduralDistributions.list[proceduralDistPopLocations[j]].items) do
          if(ProceduralDistributions.list[proceduralDistPopLocations[j]].items[k] == removeItemFromPopTable[i]) then
            table.remove(ProceduralDistributions.list[proceduralDistPopLocations[j]].items,k+1)
            table.remove(ProceduralDistributions.list[proceduralDistPopLocations[j]].items,k)
          end
        end
      end
    end
    
    --Remove Beers from ProceduralDistributions
    --All credits to VacWave from Vacs Drinks
    for i = 1, #removeItemFromBeerTable do
      for j = 1, #proceduralDistBeerLocations do
        for k,v in ipairs(ProceduralDistributions.list[proceduralDistBeerLocations[j]].items) do
          if(ProceduralDistributions.list[proceduralDistBeerLocations[j]].items[k] == removeItemFromBeerTable[i]) then
            table.remove(ProceduralDistributions.list[proceduralDistBeerLocations[j]].items,k+1)
            table.remove(ProceduralDistributions.list[proceduralDistBeerLocations[j]].items,k)
          end
        end
      end
    end
  
    --Remove Pops from SuburbsDistributions
    --All credits to VacWave from Vacs Drinks
    for i = 1, #removeItemFromPopTable do
      for j = 1, #distPopLocations do
        for k,v in ipairs(SuburbsDistributions["all"][distPopLocations[j]].items) do
          if(SuburbsDistributions["all"][distPopLocations[j]].items[k] == removeItemFromPopTable[i]) then
            table.remove(SuburbsDistributions["all"][distPopLocations[j]].items,k+1)
            table.remove(SuburbsDistributions["all"][distPopLocations[j]].items,k)
          end
        end
      end
    end
  
    --Remove Pops from SuburbsDistributions
    --All credits to VacWave from Vacs Drinks
    for i = 1, #removeItemFromPopTable do
      for j = 1, #distPopLocations2 do
        for k,v in ipairs(SuburbsDistributions[distPopLocations2[j]].items) do
          if(SuburbsDistributions[distPopLocations2[j]].items[k] == removeItemFromPopTable[i]) then
            table.remove(SuburbsDistributions[distPopLocations2[j]].items,k+1)
            table.remove(SuburbsDistributions[distPopLocations2[j]].items,k)
          end
        end
      end
    end
  
    --Remove Beers from SuburbsDistributions
    --All credits to VacWave from Vacs Drinks
    for i = 1, #removeItemFromBeerTable do
      for j = 1, #distBeerLocations do
        for k,v in ipairs(SuburbsDistributions["all"][distBeerLocations[j]].items) do
          if(SuburbsDistributions["all"][distBeerLocations[j]].items[k] == removeItemFromBeerTable[i]) then
            table.remove(SuburbsDistributions["all"][distBeerLocations[j]].items,k+1)
            table.remove(SuburbsDistributions["all"][distBeerLocations[j]].items,k)
          end
        end
      end
    end
  
    --Remove Pops from VehicleDistributions
    --All credits to VacWave from Vacs Drinks
    for i = 1, #removeItemFromPopTable do
      for j = 1, #vehDistPopLocations do
        for k,v in ipairs(VehicleDistributions[vehDistPopLocations[j]].items) do
          if(VehicleDistributions[vehDistPopLocations[j]].items[k] == removeItemFromPopTable[i]) then
            table.remove(VehicleDistributions[vehDistPopLocations[j]].items,k+1)
            table.remove(VehicleDistributions[vehDistPopLocations[j]].items,k)
          end
        end
      end
    end
  end
