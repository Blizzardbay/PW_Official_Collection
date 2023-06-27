require "Items/ProceduralDistributions"

-- ty for junkfoods for base script <3

local i, j, d

local distTable = {
  "DinerKitchenFridge",2,
  "KitchenCannedFood",2,
  "KitchenDryFood", 2,
  "KitchenRandom",1,
  "CrateCannedFood",8, 
  "KitchenBreakfast",8, 
  "KitchenBaking",8, 
}

local distTableBakery = {
  "BakeryCake",2,
  "BakeryDoughnuts", 2,
  "BakeryPie",1,
  "BakeryMisc",3, 
}

local distTable2 = {
  "KitchenBaking",8, 
  "KitchenRandom",1,
}

local distGenericTable = {
  "ShelfGeneric",2, 
  "GigamartCannedFood",8,
  "GigamartDryGoods",8,  
}

local distTableMilitary = {
  "ArmySurplusMisc",2, 
  "ArmySurplusTools",8,
  "CampingStoreGear",8,  
  "ClothingStorageWinter",8,  
}


for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.ChocolateTruffles")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable2[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.GingerbreadMan")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.Pudding")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end
for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.BlueLollipop")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end
for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.LemonLollipop")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end
for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.JellyWorms")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end
for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.SugarSticks")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end
for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.VanillaCream")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end




for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.ChocolateSwissRoll")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end

for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.VanillaSwissRoll")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end

for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.ChocolateEgg")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end

for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.BubbleTea")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end

for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.Wafers")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.EvaporatedMilk")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.IcedCoffee")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.InstantNoodles")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.HeartLollipop")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end
for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.ChocolateSticks")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end
for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.Churros")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end
for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.ChocolateEclair")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end
for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.Macaroon")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end
for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.ToffeeApple")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end
for i = 1, #distTableBakery, 2 do 
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, "JunkFoodsPH.ChocoBalls")
  table.insert(ProceduralDistributions.list[distTableBakery[i]].items, distTableBakery[i+1])
end


for i = 1, #distTableMilitary, 2 do 
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, "JunkFoodsPH.MRE1")
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, distTableMilitary[i+1])
end
for i = 1, #distTableMilitary, 2 do 
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, "JunkFoodsPH.MRE2")
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, distTableMilitary[i+1])
end
for i = 1, #distTableMilitary, 2 do 
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, "JunkFoodsPH.MRE3")
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, distTableMilitary[i+1])
end
for i = 1, #distTableMilitary, 2 do 
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, "JunkFoodsPH.MRE4")
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, distTableMilitary[i+1])
end
for i = 1, #distTableMilitary, 2 do 
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, "JunkFoodsPH.MRE5")
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, distTableMilitary[i+1])
end
for i = 1, #distTableMilitary, 2 do 
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, "JunkFoodsPH.MRE6")
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, distTableMilitary[i+1])
end
for i = 1, #distTableMilitary, 2 do 
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, "JunkFoodsPH.MRE7")
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, distTableMilitary[i+1])
end
for i = 1, #distTableMilitary, 2 do 
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, "JunkFoodsPH.MRE8")
  table.insert(ProceduralDistributions.list[distTableMilitary[i]].items, distTableMilitary[i+1])
end