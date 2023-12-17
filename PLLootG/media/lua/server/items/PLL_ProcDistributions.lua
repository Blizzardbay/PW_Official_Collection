require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Items/VehicleDistributions"
require "Items/ItemPicker"	

table.insert(ProceduralDistributions.list["WardrobeMan"].items, "Base.m32r");
table.insert(ProceduralDistributions.list["WardrobeMan"].items, 1.5);

table.insert(ProceduralDistributions.list["WardrobeMan"].items, "Base.Bullets38Box");
table.insert(ProceduralDistributions.list["WardrobeMan"].items, 2.0);

table.insert(ProceduralDistributions.list["WardrobeWoman"].items, "Base.m32r");
table.insert(ProceduralDistributions.list["WardrobeWoman"].items, 1.5);

table.insert(ProceduralDistributions.list["WardrobeWoman"].items, "Base.Bullets38Box");
table.insert(ProceduralDistributions.list["WardrobeWoman"].items, 2.0);

table.insert(ProceduralDistributions.list["MeleeWeapons"].items, "Base.medbag2");
table.insert(ProceduralDistributions.list["MeleeWeapons"].items, 1.0);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.MVest");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1.0);

table.insert(ProceduralDistributions.list["MeleeWeapons"].items, "Base.strapchest");
table.insert(ProceduralDistributions.list["MeleeWeapons"].items, 1.0);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.ClericRevolver");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1.5);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.500Box");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 2.0);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.500Box");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 2.0);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Lewis");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.LewisDrum");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 2.0);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.m79");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1.0);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.40Clip");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 2.0);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.40Clip");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 2.0);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.TKShotgun");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1.0);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.p88p");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 3.5);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.m32r");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 6.0);

table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.HolsterPLL2");
table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 5.0);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "Base.TKSword2");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 2.5);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "Base.RogueSword2");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 3.5);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "Base.ClericMace");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 3.0);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "Vest_RogueVest");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 3.5);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "RogueWaist");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 3.5);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "RogueArms");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 3.5);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "RogueGreaves");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 3.5);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "Gloves_Rogue");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 4.0);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "Shoes_Rogue");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 4.0);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "Base.smallback");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 5.0);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "RogueMask");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 4.0);

table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, "RogueHoodie");
table.insert(ProceduralDistributions["list"]["MeleeWeapons"].items, 3.5);

	
--	table.insert(Distributions, 1, distributionTable);
	
	
	local function isMod(mod_Name)
		local mods = getActivatedMods();
		for i=0, mods:size()-1, 1 do
			if mods:get(i) == mod_Name then
				return true;
			end
		end
		return false;
	end
	