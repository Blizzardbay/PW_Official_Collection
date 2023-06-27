
-- Bottling of Meat MOD

-- 2022-01-04 Version 2.03


-- Log display processing

print("************************************************************");
print("*                                                          *");
print("*  Bottling of Meat MOD                                    *");
print("*  2022-01-04 Version 2.03 (Compatible with build 41)      *");
print("*  Mods have been added to the game system.                *");
print("*                                                          *");
print("************************************************************");


-- Add items processing

require"SuburbsDistributions"
require"ProceduralDistributions"

-- Procedural Lists

-- Bottling.BottlingChicken
-- Bottling.BottlingSteak
-- Bottling.BottlingFrogMeat
-- Bottling.BottlingMeatPatty
-- Bottling.BottlingMuttonChop
-- Bottling.BottlingPorkChop
-- Bottling.BottlingRabbitmeat
-- Bottling.BottlingSmallanimalmeat
-- Bottling.BottlingSmallbirdmeat
-- Bottling.BottlingBacon
-- Bottling.BottlingBaconBits
-- Bottling.BottlingBaconRashers
-- Bottling.BottlingHam


-- ProceduralDistributions

table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingChicken");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingSteak");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingFrogMeat");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingMeatPatty");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingMuttonChop");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingPorkChop");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingRabbitmeat");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingSmallanimalmeat");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingSmallbirdmeat");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingBacon");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingBaconBits");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingBaconRashers");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Bottling.BottlingHam");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Salt");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 2.0);
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "Sugar");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 2.0);

table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingChicken");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingSteak");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingFrogMeat");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingMeatPatty");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingMuttonChop");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingPorkChop");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingRabbitmeat");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingSmallanimalmeat");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingSmallbirdmeat");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingBacon");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingBaconBits");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingBaconRashers");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Bottling.BottlingHam");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Salt");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 2.0);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Sugar");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 2.0);

table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingChicken");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingSteak");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingFrogMeat");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingMeatPatty");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingMuttonChop");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingPorkChop");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingRabbitmeat");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingSmallanimalmeat");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingSmallbirdmeat");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingBacon");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingBaconBits");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingBaconRashers");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Bottling.BottlingHam");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Salt");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 2.0);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Sugar");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 2.0);

-- Distributions

--Survivor

table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingChicken");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingSteak");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingFrogMeat");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingMeatPatty");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingMuttonChop");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingPorkChop");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingRabbitmeat");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingSmallanimalmeat");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingSmallbirdmeat");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingBacon");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingBaconBits");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingBaconRashers");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Bottling.BottlingHam");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);

table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingChicken");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingSteak");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingFrogMeat");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingMeatPatty");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingMuttonChop");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingPorkChop");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingRabbitmeat");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingSmallanimalmeat");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingSmallbirdmeat");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingBacon");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingBaconBits");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingBaconRashers");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Bottling.BottlingHam");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);

table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingChicken");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingSteak");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingFrogMeat");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingMeatPatty");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingMuttonChop");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingPorkChop");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingRabbitmeat");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingSmallanimalmeat");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingSmallbirdmeat");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingBacon");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingBaconBits");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingBaconRashers");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Bottling.BottlingHam");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
