
-- Jar Lid MOD

-- 2022-01-04 Version 2.02

-- Log display processing

print("************************************************************");
print("*                                                          *");
print("*  Jar Lid MOD                                             *");
print("*  2022-01-04 Version 2.02 (Compatible with build 41)      *");
print("*  Mods have been added to the game system.                *");
print("*                                                          *");
print("************************************************************");


-- Add items processing

require"ProceduralDistributions"

-- Procedural Lists

-- JarLidMod.JarLidBoxs

-- ProceduralDistributions

table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "JarLidMod.JarLidBoxs");
table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 5);

table.insert(ProceduralDistributions.list["KitchenDishes"].items, "JarLidMod.JarLidBoxs");
table.insert(ProceduralDistributions.list["KitchenDishes"].items, 2);

table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "JarLidMod.JarLidBoxs");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 2);

table.insert(ProceduralDistributions.list["KitchenRandom"].items, "JarLidMod.JarLidBoxs");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 2);
