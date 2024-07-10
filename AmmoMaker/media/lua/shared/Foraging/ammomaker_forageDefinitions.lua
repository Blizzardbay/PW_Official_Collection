--Ammo Maker by STIMP_TM, based on Project Zomboid forageDefinitions by eris

require 'Foraging/forageSystem'

Events.onAddForageDefs.Add(function()

	local ammomaker_BirdExcrement = {
		type = "ammomaker.ammomaker_BirdExcrement",
		minCount = SandboxVars.ammomakerOptions.BirdExSpawnMin,
		maxCount = SandboxVars.ammomakerOptions.BirdExSpawnMax,
		xp = 0.2,
		categories = { "Stones" },
		zones = {
			DeepForest      = 5,
			Forest          = 5,
			Vegitation      = 5,
			FarmLand        = 5,
			Farm            = 5,
			TrailerPark     = 5,
			TownZone        = 5,
			Nav             = 5,
		},
		months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		itemSizeModifier = 0.6,
	};

	local ammomaker_BirdFeather = {
		type = "ammomaker.ammomaker_BirdFeather",
		minCount = SandboxVars.ammomakerOptions.BirdFeatherSpawnMin,
		maxCount = SandboxVars.ammomakerOptions.BirdFeatherSpawnMax,
		xp = 0.2,
		categories = { "Stones" },
		zones = {
			DeepForest      = 5,
			Forest          = 5,
			Vegitation      = 5,
			FarmLand        = 5,
			Farm            = 5,
			TrailerPark     = 5,
			TownZone        = 5,
			Nav             = 5,
		},
		months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		itemSizeModifier = 0.6,
	};

forageSystem.addItemDef(ammomaker_BirdExcrement);

if SandboxVars.ammomakerOptions.ActivateArchery == true or getActivatedMods():contains("Arsenal(26)GunFighter") or getActivatedMods():contains("Arsenal(26)GunFighter[MAIN MOD 2.0]") then

	forageSystem.addItemDef(ammomaker_BirdFeather);

end;

forageSystem.generateLootTable()

end)