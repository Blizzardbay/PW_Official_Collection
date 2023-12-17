require "Items/ProceduralDistributions"
require "Items/Distributions"
require "Vehicles/VehicleDistributions"

local k, v, i, j

local OPTIONS = HanabSnacks.OPTIONS

local removevanilladuplicates =   true



if ModOptions and ModOptions.getInstance then
  local settings = ModOptions:getInstance(OPTIONS, "HanabSnacks", "Hanabi's Snacks")
  
  ModOptions:loadFile()
  
  removevanilladuplicates = OPTIONS.removevanilladuplicates
end

local removeItemFromPopTable = {
  "Crisps",
  "Crisps2",
  "Crisps3",
  "Crisps4",
  "HiHis",
  "Plonkies",
  "QuaggaCakes",
  "ChocoCakes",
  "SnoGlobes",
  "Plonkies",
  "Cereal",
}

local removeItemFromBeerTable = {
}

local proceduralDistPopLocations = {
  "BarCounterMisc",
  "BarCounterMisc",
  "BarCounterMisc",
  "BarCounterMisc",
  "BreakRoomCounter",
  "BreakRoomCounter",
  "BreakRoomCounter",
  "BreakRoomCounter",
  "BreakRoomShelves",
  "BreakRoomShelves",
  "BreakRoomShelves",
  "BreakRoomShelves",
  "CrateCereal",
  "CrateCereal",
  "CrateCereal",
  "CrateCereal",
  "GigamartDryGoods",
  "GigamartDryGoods",
  "GigamartDryGoods",
  "GigamartDryGoods",
  "CafeteriaSnacks",
  "CafeteriaSnacks",
  "CafeteriaSnacks",
  "CafeteriaSnacks",
  "ClassroomDesk",
  "ClassroomDesk",
  "ClassroomDesk",
  "ClassroomDesk",
  "CrateChips",
  "CrateChips",
  "CrateChips",
  "CrateChips",
  "GasStorageCombo",
  "GasStorageCombo",
  "GasStorageCombo",
  "GasStorageCombo",
  "GigamartCrisps",
  "GigamartCrisps",
  "GigamartCrisps",
  "GigamartCrisps",
  "GroceryStorageCrate1",
  "GroceryStorageCrate1",
  "GroceryStorageCrate1",
  "GroceryStorageCrate1",
  "PrisonCellRandom",
  "PrisonCellRandom",
  "PrisonCellRandom",
  "PrisonCellRandom",
  "KitchenBreakfast",
  "KitchenBreakfast",
  "KitchenBreakfast",
  "KitchenBreakfast",
  "KitchenDryFood",
  "KitchenDryFood",
  "KitchenDryFood",
  "KitchenDryFood",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfSnacks",
  "StoreShelfSnacks",
  "StoreShelfSnacks",
  "StoreShelfSnacks",
}


local distPopLocations = {
}


local vehDistPopLocations = {
}

if(removevanilladuplicates)then
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
