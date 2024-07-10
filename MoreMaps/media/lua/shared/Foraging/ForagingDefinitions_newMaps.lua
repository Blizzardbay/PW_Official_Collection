require "Foraging/forageDefinitions";

forageDefs = forageDefs or {};


local function doGenericItemSpawn(_character, _inventory, _itemDef, _items)
	for item in iterList(_items) do
		if item:IsDrainable() then
			item:setUsedDelta(ZombRandFloat(0.0, 1.0)); -- Randomize the item uses remaining
		end;
		local conditionMax = item:getConditionMax();
		if conditionMax > 0 then
			item:setCondition(ZombRand(conditionMax) + 1); -- Randomize the weapon condition
		end;
	end;
	return _items; --custom spawn scripts must return an arraylist of items (or nil)
end

local function addMapToForageDefs(_map, _chance )
    local tweakableMultiplier = 0.5
    local actualChance = math.floor(_chance * tweakableMultiplier * SandboxVars.MoreMaps.MapLootMultiplier)
    forageDefs[_map] = {
        type = "Base.".._map,
        skill = 4,
        xp = 50,
        categories = { "Junk" },
        zones = {
            Forest      = actualChance,
            DeepForest  = actualChance,
            Vegitation  = actualChance,
            FarmLand    = actualChance,
            Farm        = actualChance,
            TrailerPark = actualChance,
            TownZone    = actualChance,
            Nav         = actualChance,
        },
        spawnFuncs = { doGenericItemSpawn },
        forceOutside = false,
        canBeAboveFloor = true,
        itemSizeModifier = 1.0,
        isItemOverrideSize = true,
    };
end

local function initForageableMaps()
    if SandboxVars.MoreMaps.ForageableMaps then
        if SandboxVars.MoreMaps.EkronMap then
            addMapToForageDefs("EkronMap", 20);
        end
        if SandboxVars.MoreMaps.TrailerParkMaps then
            addMapToForageDefs("DixieMap", 20);
            addMapToForageDefs("ScenicGroveMap", 20);
        end
        if SandboxVars.MoreMaps.RiversideCountryClubMap then
            addMapToForageDefs("CountryClubMap", 20);
        end
        if SandboxVars.MoreMaps.PonyRoamOMap then
            addMapToForageDefs("PonyRoamOMap", 20);
        end
        if SandboxVars.MoreMaps.MuldraughRailyardMap then
            addMapToForageDefs("MuldraughRailyardMap", 20);
        end
        if SandboxVars.MoreMaps.EasternSummerCampMap then
            addMapToForageDefs("EasternSummerCampMap", 20);
        end
        if SandboxVars.MoreMaps.LouisVilleCompleteMap then
            addMapToForageDefs("LouisvilleMap", 10);
        end
        if SandboxVars.MoreMaps.LouisVilleDistrictMaps then
            addMapToForageDefs("LouisvilleIroquoisMap", 20);
            addMapToForageDefs("LouisvilleAudubonMap", 20);
            addMapToForageDefs("LouisvilleCentralMap", 20);
            addMapToForageDefs("LouisvilleEvergreenHillMap", 20);
            addMapToForageDefs("LouisvilleOldMap", 20);
            addMapToForageDefs("LouisvillePhoenixHillMap", 20);
            addMapToForageDefs("LouisvilleGatedCommunityMap", 20);
            addMapToForageDefs("LouisvilleNorthCommercialDistrictMap", 20);
            addMapToForageDefs("LouisvillePortlandMap", 20);
            addMapToForageDefs("LouisvilleLSUMap", 20);
            addMapToForageDefs("LouisvilleSouthMap", 20);
            addMapToForageDefs("LouisvilleLeafhillHeightsMap", 20);
            addMapToForageDefs("LouisvilleChapelmountDownsMap", 20);
            addMapToForageDefs("LouisvilleScarletOakMap", 20);
            addMapToForageDefs("LouisvilleEastMap", 20);
        end
        if SandboxVars.MoreMaps.ValleyStationMap then
            addMapToForageDefs("ValleyStationMap", 20);
        end
        if SandboxVars.MoreMaps.ValleyStationMallAreaMap then
            addMapToForageDefs("ValleyStationMallAreaMap", 20);
        end
        if SandboxVars.MoreMaps.EasternSummerCampMap then
            addMapToForageDefs("EasternSummerCampMap", 30);
        end
        if SandboxVars.MoreMaps.CampGroundsLocation then
            addMapToForageDefs("CampGroundsLocation", 30);
        end
        if SandboxVars.MoreMaps.AbandonedFactoryMap then
            addMapToForageDefs("AbandonedFactoryMap", 20);
        end
        if SandboxVars.MoreMaps.CabinLocations then
            addMapToForageDefs("CabinLocation1", 30);
            addMapToForageDefs("CabinLocation2", 30);
            if not getActivatedMods():contains("lakeivytownship") then -- compatibility with lake ivy township
                addMapToForageDefs("CabinLocation3", 30);
            end
            addMapToForageDefs("CabinLocation4", 30);
            if not getActivatedMods():contains("Chinatown") then -- compatibility with chinatown
                addMapToForageDefs("CabinLocation5", 30);
            end
        end
        -------------------
        -- MILITARY MAPS --
        -------------------
        if SandboxVars.MoreMaps.MilitaryMaps then
            if getActivatedMods():contains("rbr") then --research facility mod
                -- addMapToForageDefs("ResearchFacilityMap", 10);
            else
                addMapToForageDefs("MilitaryBaseMap", 10);
            end
            if SandboxVars.MoreMaps.WeatherStationLocations and getActivatedMods():contains("SaveOurStation_KnoxCountry")  then
                addMapToForageDefs("StationZULULocation", 10);
            end
            if SandboxVars.MoreMaps.MilitaryAirportMap and getActivatedMods():contains("Militaryairport")  then
                addMapToForageDefs("MilitaryAirportMap", 20);
            end
            if SandboxVars.MoreMaps.FortRedstoneMap and getActivatedMods():contains("FORTREDSTONE") then
                addMapToForageDefs("FortRedstoneMap", 10);
            end
            if SandboxVars.MoreMaps.FortKnoxMaps and getActivatedMods():contains("FortKnoxLinked") then
                addMapToForageDefs("FK_FortKnoxMap", 20);
            end
            if SandboxVars.MoreMaps.FortBenningMap and getActivatedMods():contains("Fort Benning") then
                addMapToForageDefs("FortBenningMap", 20);
            end
            if SandboxVars.MoreMaps.FortRockRidgeMap and getActivatedMods():contains("Fort Rock Ridge") then
                addMapToForageDefs("FortRockRidgeMap", 20);
            end
            if SandboxVars.MoreMaps.MuldraughMilitaryBaseMap and getActivatedMods():contains("muldraughmilitarybase") then
                addMapToForageDefs("MuldraughMilitaryBaseMap", 20);
            end
            if SandboxVars.MoreMaps.FortWaterfrontMap and getActivatedMods():contains("Fort Waterfront") then
                addMapToForageDefs("FortWaterfrontMap", 20);
            end
            if SandboxVars.MoreMaps.WesternMilitaryComplexMap and getActivatedMods():contains("MilitaryComplex") then
                addMapToForageDefs("WesternMilitaryComplexMap", 20);
            end
            if SandboxVars.MoreMaps.FortLoidMap and getActivatedMods():contains("FortLoid") then
                addMapToForageDefs("FortLoidMap", 20);
            end
        end
        if SandboxVars.MoreMaps.GrapeseedMap and getActivatedMods():contains("Grapeseed") then
            addMapToForageDefs("GrapeseedMap", 20);
        end
        if SandboxVars.MoreMaps.BlackwoodMap and getActivatedMods():contains("Blackwood") then
            addMapToForageDefs("BlackwoodMap", 20);
        end
        if SandboxVars.MoreMaps.PitstopMap and getActivatedMods():contains("Pitstop") then
            addMapToForageDefs("PitstopMap", 15);
        end
        if SandboxVars.MoreMaps.LakeIvyMap and getActivatedMods():contains("lakeivytownship") then
            addMapToForageDefs("LakeIvyMap2", 20);
        end
        if SandboxVars.MoreMaps.OverTheRiverMap and getActivatedMods():contains("Otr") then
            addMapToForageDefs("OverTheRiverMap", 20);
        end
        if SandboxVars.MoreMaps.WeatherStationLocations and getActivatedMods():contains("SaveOurStation_KnoxCountry") then
            addMapToForageDefs("StationRIVS500Location", 10);
            addMapToForageDefs("StationWESTP88Location", 10);
            addMapToForageDefs("StationROSE099Location", 10);
            addMapToForageDefs("StationMULD650Location", 10);
        end
		if SandboxVars.MoreMaps.MarchRidgeExpansionMap and getActivatedMods():contains("MRE") then
            addMapToForageDefs("MarchRidgeExpansionMap", 20);
        end
		if SandboxVars.MoreMaps.CONResearchMap and getActivatedMods():contains("CONRTF") then
            addMapToForageDefs("CONResearchMap", 20);
        end
        if SandboxVars.MoreMaps.RosewoodExpansionMap and getActivatedMods():contains("pz_rosewoodexp_map") then
            addMapToForageDefs("RosewoodExpansionMap", 20);
        end
        if SandboxVars.MoreMaps.LittleTownshipMap and getActivatedMods():contains("LittleTownship") then
            addMapToForageDefs("LittleTownshipMap", 20);
        end
        if SandboxVars.MoreMaps.LindenMap and getActivatedMods():contains("Linden") then
            addMapToForageDefs("LindenMap", 20);
        end
        if SandboxVars.MoreMaps.RefordvilleMap and getActivatedMods():contains("Refordville") then
            addMapToForageDefs("RefordvilleMap", 20);
        end
        if SandboxVars.MoreMaps.ChinatownMap and getActivatedMods():contains("Chinatown") then
            addMapToForageDefs("ChinatownMap", 20);
        end
        if SandboxVars.MoreMaps.ChernavilleMap and getActivatedMods():contains("Chernaville") then
            addMapToForageDefs("ChernavilleMap", 20);
        end
        if SandboxVars.MoreMaps.BlueberryMap and getActivatedMods():contains("Blueberry") then
            addMapToForageDefs("BlueberryMap", 20);
        end
		-- if SandboxVars.MoreMaps.WestPointFireDepartmentMap and getActivatedMods():contains("West Point Fire Department") then
            -- addMapToForageDefs("WestPointFireDepartmentMap", 20);
        -- end
        if SandboxVars.MoreMaps.WestPointSouthTrailerParkMap and getActivatedMods():contains("WestPointTrailerParkAndVhsStore") then
            addMapToForageDefs("WestPointSouthTrailerParkMap", 20);
        end
        if SandboxVars.MoreMaps.KingsmouthMap and getActivatedMods():contains("KingsmouthKY") then
            addMapToForageDefs("KingsmouthMap", 20);
        end
        if SandboxVars.MoreMaps.SurvivorWarehouseLocation and getActivatedMods():contains("survivorwarehouse") then
            addMapToForageDefs("SurvivorWarehouseLocation", 20);
        end
        if SandboxVars.MoreMaps.CompleteRavenCreekMap and getActivatedMods():contains("RavenCreek") then
            addMapToForageDefs("CompleteRavenCreekMap", 10);
        end
        if SandboxVars.MoreMaps.RavenCreekDistrictMaps and getActivatedMods():contains("RavenCreek") then
            addMapToForageDefs("NorthRavenCreekMap", 20);
            addMapToForageDefs("SouthEastRavenCreekMap", 20);
            addMapToForageDefs("RavenCreekPortFacilitiesMap", 20);
            addMapToForageDefs("RavenCreekSouthernTownMap", 20);
        end
		if SandboxVars.MoreMaps.GreenleafMap and getActivatedMods():contains("Greenleaf") then
            addMapToForageDefs("GreenleafMap", 20);
        end
		if SandboxVars.MoreMaps.CoryerdonMap and getActivatedMods():contains("coryerdon") then
            addMapToForageDefs("EastCoryerdonMap", 20);
            addMapToForageDefs("SouthCoryerdonMap", 20);
            addMapToForageDefs("CenterCoryerdonMap", 20);
        end
		if SandboxVars.MoreMaps.OldParkTownMap and getActivatedMods():contains("ParkingLot") then
            addMapToForageDefs("OldParkTownMap", 20);
        end
        if SandboxVars.MoreMaps.CompleteEerieCountryMap and getActivatedMods():contains("EerieCountry") then
            addMapToForageDefs("EC_CompleteMap", 10);
        end
        if SandboxVars.MoreMaps.EerieCountryDifferentMaps and getActivatedMods():contains("EerieCountry") then
            addMapToForageDefs("EC_CustomsBorderZoneMap", 20);
            addMapToForageDefs("EC_CentraliaMap", 20);
            addMapToForageDefs("EC_TrainStationMap", 20);
            addMapToForageDefs("EC_DarkFallsMap", 20);
            addMapToForageDefs("DixieMap", 20);
            addMapToForageDefs("EC_SanDitoAirportMap", 20);
            addMapToForageDefs("EC_LakeHeisenbergMap", 20);
            addMapToForageDefs("EC_ErenCityMap", 20);
            addMapToForageDefs("EC_IrvingtonMap", 20);
            addMapToForageDefs("EC_RuralZoneMap", 20);
        end
        if SandboxVars.MoreMaps.SlocanLakeMaps and (getActivatedMods():contains("SlocanLake") or getActivatedMods():contains("RavenCreekEerieCompatibleSlocanLake")) then
            addMapToForageDefs("SL_NewDenverMap", 20);
            addMapToForageDefs("SL_RoseberyMap", 20);
            addMapToForageDefs("SL_SilvertonMap", 20);
        end
        if SandboxVars.MoreMaps.FortKnoxMaps and getActivatedMods():contains("FortKnoxLinked") then
            addMapToForageDefs("FK_QuitmanMap", 20);
        end
        if SandboxVars.MoreMaps.BillionaireSafehouseLocation and getActivatedMods():contains("BillionaireSafehouse") then
            addMapToForageDefs("BillionaireSafehouseLocation", 20);
        end
        if SandboxVars.MoreMaps.WildberriesMap and getActivatedMods():contains("wildberries") then
            addMapToForageDefs("WildberriesMap", 20);
        end
        if SandboxVars.MoreMaps.TugalandMap and getActivatedMods():contains("Tugaland") then
            addMapToForageDefs("TugalandMap", 20);
        end
        if SandboxVars.MoreMaps.RemusMap and getActivatedMods():contains("RemusMapMod") then
            addMapToForageDefs("RemusMap", 20);
        end
        if SandboxVars.MoreMaps.TrimbleCountyMaps and getActivatedMods():contains("TrimbleCountyPowerStation") then
            addMapToForageDefs("TrimbleCountyPowerStationMap", 20);
            addMapToForageDefs("TrimbleCountyLaGrangeMap", 20);
        end
        if SandboxVars.MoreMaps.EZPZCommunityCenterMap and getActivatedMods():contains("EZPZCenter") then
            addMapToForageDefs("EZPZCommunityCenterMap", 20);
        end
        if SandboxVars.MoreMaps.OldPineVillageMap and getActivatedMods():contains("Old Pine Village") then
            addMapToForageDefs("OldPineVillageMap", 20);
        end
        if SandboxVars.MoreMaps.ChristmasVillageMap and getActivatedMods():contains("ChristmasVillage") then
            addMapToForageDefs("ChristmasVillageMap", 20);
        end
        if SandboxVars.MoreMaps.HyruleCountyMap and getActivatedMods():contains("Hyrule County") then
            addMapToForageDefs("HyruleCountyMap", 20);
        end
        -- SNAKE MOD PACK maps
        if SandboxVars.MoreMaps.MansionAdress and getActivatedMods():contains("SnakeMansion") then
            addMapToForageDefs("MansionAdress", 10);
        end
        if SandboxVars.MoreMaps.ConstructionFactoryMap and getActivatedMods():contains("Factory") then
            addMapToForageDefs("ConstructionFactoryMap", 15);
        end







        if SandboxVars.MoreMaps.WestwoodMap and getActivatedMods():contains("westwoodremake") then
            addMapToForageDefs("WestwoodMap", 20);
        end
        
    
        if SandboxVars.MoreMaps.AnthemMap and getActivatedMods():contains("Anthem") then
            addMapToForageDefs("AnthemMap", 20);
        end
        
        if SandboxVars.MoreMaps.AshenwoodMap and getActivatedMods():contains("Ashenwood") then
            addMapToForageDefs("AshenwoodMap", 20);
        end
        
        if SandboxVars.MoreMaps.ElysiumIslandMap and getActivatedMods():contains("Elysium_Island") then
            addMapToForageDefs("ElysiumIslandMap", 20);
        end
        
        if SandboxVars.MoreMaps.HopewellMap and (getActivatedMods():contains("hopewell_eng_orig") or getActivatedMods():contains("hopewell_eng_zombies") or getActivatedMods():contains("hopewell_esp_zombies") or getActivatedMods():contains("hopewell_esp_orig")) then
            addMapToForageDefs("HopewellMap", 20);
        end
        
        if SandboxVars.MoreMaps.HeavensHillMansionAddress and getActivatedMods():contains("Heavens Hill") then
            addMapToForageDefs("HeavensHillMansionAddress", 20);
        end
        
        if SandboxVars.MoreMaps.ChestownMap and getActivatedMods():contains("Chestown") then
            addMapToForageDefs("ChestownMap", 20);
        end
        
        if SandboxVars.MoreMaps.NashvilleMap and getActivatedMods():contains("Nashville") then
            addMapToForageDefs("NashvilleMap", 20);
        end
        
        if SandboxVars.MoreMaps.OverlookHotelMap and getActivatedMods():contains("OverlookHotel") then
            addMapToForageDefs("OverlookHotelMap", 20);
        end
        
        if SandboxVars.MoreMaps.PerfectShelterMap and getActivatedMods():contains("MiikluxaUltraSafe") then
            addMapToForageDefs("PerfectShelterMap", 20);
        end
        
        if SandboxVars.MoreMaps.OConnorFarmAddress and getActivatedMods():contains("O'Connor Farm") then
            addMapToForageDefs("OConnorFarmAddress", 20);
        end
        
        if SandboxVars.MoreMaps.LincolnRegionalAirportMap and getActivatedMods():contains("LincolnRegionalAirport") then
        addMapToForageDefs("LincolnRegionalAirportMap", 20);
        end
        
        if SandboxVars.MoreMaps.MuldraughWesternShippingCompanyMap and getActivatedMods():contains("Muldraugh-Westoutskirts ShippingCo") then
            addMapToForageDefs("MuldraughWesternShippingCompanyMap", 20);
        end
        
        if SandboxVars.MoreMaps.RosewoodMilitaryHospitalMap and getActivatedMods():contains("RMH") then
            addMapToForageDefs("RosewoodMilitaryHospitalMap", 20);
        end
        
        if SandboxVars.MoreMaps.TheMuseumMap and getActivatedMods():contains("TheMuseumID") then
            addMapToForageDefs("TheMuseumMap", 20);
        end
        
        if SandboxVars.MoreMaps.TheEyeLakeMap and getActivatedMods():contains("TheEyeLake") then
            addMapToForageDefs("TheEyeLakeMap", 20);
        end
        
        if SandboxVars.MoreMaps.AddamsFamilyMansionMap and getActivatedMods():contains("AddamsMansion") then
            addMapToForageDefs("AddamsFamilyMansionMap", 20);
        end
        
        if SandboxVars.MoreMaps.JeffersonvilleMap and getActivatedMods():contains("LVRiverExpN") then
            addMapToForageDefs("JeffersonvilleMap", 20);
        end
        
        if SandboxVars.MoreMaps.CherokeeLakeMap and getActivatedMods():contains("CherokeeLake") then
            addMapToForageDefs("CherokeeLakeMap", 20);
        end
        
        if SandboxVars.MoreMaps.RiversideMansionMap and getActivatedMods():contains("RiversidemansionBrang") then
            addMapToForageDefs("RiversideMansionMap", 20);
        end
        
        if SandboxVars.MoreMaps.FinneganMentalAsylumMap and getActivatedMods():contains("FinneganMentalAsylum") then
            addMapToForageDefs("FinneganMentalAsylumMap", 20);
        end
        
        if SandboxVars.MoreMaps.PapavilleMap and getActivatedMods():contains("Papaville") then
            addMapToForageDefs("PapavilleMap", 20);

        end
        
        if SandboxVars.MoreMaps.SouthTownMap and getActivatedMods():contains("SouthTown") then
            addMapToForageDefs("SouthTownMap", 20);
        end
        
        if SandboxVars.MoreMaps.ChinatownMapExpansionMap and getActivatedMods():contains("Chinatown expansion") then
            addMapToForageDefs("ChinatownMapExpansionMap", 20);
        end
        
        if SandboxVars.MoreMaps.LouisvilleBunkerLocationMap and getActivatedMods():contains("LVBunker") then
            addMapToForageDefs("LouisvilleBunkerLocationMap", 20);
        end
        
        if SandboxVars.MoreMaps.OrchidwoodMap and (getActivatedMods():contains("Orchidwood(official version)") or getActivatedMods():contains("orchidwood(legacy version)")) then
            addMapToForageDefs("OrchidwoodMap", 20);
        end
        
        if SandboxVars.MoreMaps.WinchesterMap and (getActivatedMods():contains("Winchester")) then
            addMapToForageDefs("WinchesterMap", 20);
        end
        
        if SandboxVars.MoreMaps.BreakpointMap and getActivatedMods():contains("Breakpoint") then
            addMapToForageDefs("BreakpointMap", 20);
        end
        
        if SandboxVars.MoreMaps.WilboreMap and getActivatedMods():contains("wilboreky") then
            addMapToForageDefs("WilboreMap", 20);
        end
        
        if SandboxVars.MoreMaps.PetrovilleMap and getActivatedMods():contains("Petroville") then
            addMapToForageDefs("PetrovilleMap", 20);
        end
        
        if SandboxVars.MoreMaps.CedarHillMap and getActivatedMods():contains("CedarHill") then
            addMapToForageDefs("CedarHillMap", 20);
        end
        
        if SandboxVars.MoreMaps.CathayaValleyMap and getActivatedMods():contains("Cathaya Valley") then
            addMapToForageDefs("CathayaValleyMap", 20);
        end
        
        if SandboxVars.MoreMaps.SpringwoodMap and getActivatedMods():contains("Springwood1") then
            addMapToForageDefs("SpringwoodMap", 20);
        end
        
        if SandboxVars.MoreMaps.NaturesVengeanceTownshipMap and getActivatedMods():contains("nv_township_v1") then
            addMapToForageDefs("NaturesVengeanceTownshipMap", 20);
        end
        
        if SandboxVars.MoreMaps.BigBearLakeMaps and getActivatedMods():contains("BBL") then
            addMapToForageDefs("BigBearLakeEastMap", 20);
            addMapToForageDefs("BigBearLakeWestMap", 20);
            addMapToForageDefs("BigBearLakeMap", 20);
        end
        
        
        if SandboxVars.MoreMaps.SimsZomboidMap and getActivatedMods():contains("The Sims Zomboid") then
            addMapToForageDefs("SimsZomboidMap", 20);
        end
        
        if SandboxVars.MoreMaps.DirkerdamMaps and getActivatedMods():contains("Dirkerdam") then
            addMapToForageDefs("FloriusMap", 20);
            addMapToForageDefs("PertvilleMap", 20);
            addMapToForageDefs("TashtegoMap", 20);
            addMapToForageDefs("FallenSurvivorColonyMap", 20);
            addMapToForageDefs("DirkerdamWestMap", 20);
            addMapToForageDefs("DirkerdamEastMap", 20);
            addMapToForageDefs("DirkerdamMap", 20);
        end
        
        if SandboxVars.MoreMaps.LakeCumberlandMaps and (getActivatedMods():contains("LCv2") or getActivatedMods():contains("LC")) then
            addMapToForageDefs("LakeCumberlandWestMapNew", 20);
            addMapToForageDefs("LakeCumberlandNorthEastMapNew", 20);
            addMapToForageDefs("LakeCumberlandSouthEastMapNew", 20);
            addMapToForageDefs("LakeCumberlandMapNew", 10);
            addMapToForageDefs("LakeCumberlandWestMapOld", 20);
            addMapToForageDefs("LakeCumberlandNorthEastMapOld", 20);
            addMapToForageDefs("LakeCumberlandSouthEastMapOld", 20);
            addMapToForageDefs("LakeCumberlandMapOld", 10);
        end
        
        if SandboxVars.MoreMaps.PharmaceuticalFactoryMap and getActivatedMods():contains("Waterlocked Pharmaceutical Factory") then
            addMapToForageDefs("PharmaceuticalFactoryMap", 20);
        end
        
        if SandboxVars.MoreMaps.NettleTownshipMap and getActivatedMods():contains("Nettle Township") then
            addMapToForageDefs("NettleTownshipMap", 20);
        end
        
        if SandboxVars.MoreMaps.StMooseHospitalMap and (getActivatedMods():contains("MKHospitalArea_Normal") or getActivatedMods():contains("MKHospitalArea_Horde")) then
            addMapToForageDefs("StMooseHospitalMap", 20);
        end
        
        if SandboxVars.MoreMaps.ShortrestCountyMap and getActivatedMods():contains("Shortrest_County") then
            addMapToForageDefs("ShortrestCountyMap", 20);
        end
        
        if SandboxVars.MoreMaps.LeavenburgMap and getActivatedMods():contains("Leavenburg") then
            addMapToForageDefs("LeavenburgMap", 20);
        end
        
        if SandboxVars.MoreMaps.BunkerDayOfTheDeadMap and getActivatedMods():contains("BunkerDayOfTheDead") then
            addMapToForageDefs("BunkerDayOfTheDeadMap", 20);
        end
        
        if SandboxVars.MoreMaps.SuperGigaMartMap and getActivatedMods():contains("SuperGigaMart") then
            addMapToForageDefs("SuperGigaMartMap", 20);
        end
        
        if SandboxVars.MoreMaps.ZtardewValleyMap and getActivatedMods():contains("Ztardew") then
            addMapToForageDefs("ZtardewValleyMap", 20);
        end
        
        if SandboxVars.MoreMaps.TheWalkingDeadPrisonMap and getActivatedMods():contains("TWDprison") then
            addMapToForageDefs("TheWalkingDeadPrisonMap", 20);
        end
        
        if SandboxVars.MoreMaps.TheWalkingDeadTerminusMap and getActivatedMods():contains("TWDterminus") then
            addMapToForageDefs("TheWalkingDeadTerminusMap", 20);
        end
        
        if SandboxVars.MoreMaps.HuntersBaseMap and getActivatedMods():contains("Hunter'sBase") then
            addMapToForageDefs("HuntersBaseMap", 20);
        end
        
        if SandboxVars.MoreMaps.PortCityMap and getActivatedMods():contains("PortCityKYAbisimod") then
            addMapToForageDefs("PortCityMap", 20);

        end
        
        if SandboxVars.MoreMaps.SpringValleyMap and getActivatedMods():contains("SpringValleyKYAbisiMod") then
            addMapToForageDefs("SpringValleyMap", 20);
        end
        
        if SandboxVars.MoreMaps.OakshireMap and getActivatedMods():contains("Oakshire") then
            addMapToForageDefs("OakshireMap", 20);
        end
        
        if SandboxVars.MoreMaps.RangersHomesteadMap and getActivatedMods():contains("Ranger'sHomestead") then
            addMapToForageDefs("RangersHomesteadMap", 20);
        end
        
        if SandboxVars.MoreMaps.FrigateMap and getActivatedMods():contains("The Frigate") then
            addMapToForageDefs("FrigateMap", 10);
        end
        
        if SandboxVars.MoreMaps.BunkerLastMinutePrepperMap and getActivatedMods():contains("LastMinutePrepperReloaded") or getActivatedMods():contains("LastMinutePrepper") then
            addMapToForageDefs("BunkerLastMinutePrepperMap", 10);
        end
        
        if SandboxVars.MoreMaps.LouisvilleQuarantineZoneMap and getActivatedMods():contains("Louisville_Quarantine_Zone") then
            addMapToForageDefs("LouisvilleQuarantineZoneMap", 20);
        end
        
        if SandboxVars.MoreMaps.LVInternationalAirport and getActivatedMods():contains("SimonMDLVInternationalAirport") then
            addMapToForageDefs("LVInternationalAirport", 20);
        end
        
        if SandboxVars.MoreMaps.MuldraughCheckpointMap and (getActivatedMods():contains("MuldraughCheckpoint") or getActivatedMods():contains("MuldraughCheckpoint[HARDMODE]")) then
            addMapToForageDefs("MuldraughCheckpointMap", 20);

        end
        
        if SandboxVars.MoreMaps.SpeckMap and getActivatedMods():contains("Speck_Map") then
            addMapToForageDefs("SpeckMap", 20);
        end
        
        if SandboxVars.MoreMaps.HomesteadWindyMap and getActivatedMods():contains("HomesteadWindy") then
            addMapToForageDefs("HomesteadWindyMap", 20);
        end
        
        if SandboxVars.MoreMaps.MilitaryFuelDepotMap and getActivatedMods():contains("military fuel depot") then
            addMapToForageDefs("MilitaryFuelDepotMap", 10);
        end
        
        if SandboxVars.MoreMaps.SpencerMansionMap and (getActivatedMods():contains("SimonMDSpencerMansionLootable") or getActivatedMods():contains("SpencerMansionMap") ) then
            addMapToForageDefs("SpencerMansionMap", 20);

        end
        
        if SandboxVars.MoreMaps.UncleRedsBunkerMap and (getActivatedMods():contains("UncleRedsBunker") or getActivatedMods():contains("UncleRedsBunkerRedux") ) then
            addMapToForageDefs("UncleRedsBunkerMap", 10);
        end
        
        if SandboxVars.MoreMaps.HopefallsMap and getActivatedMods():contains("Hopefalls") then
            addMapToForageDefs("HopefallsMap", 20);
        end
        
        if SandboxVars.MoreMaps.VineGroveMap and getActivatedMods():contains("Legacy_Vinegrove") then
            addMapToForageDefs("VineGroveMap", 20);
        end
        if SandboxVars.MoreMaps.LouisianaMap and getActivatedMods():contains("Legacy_Louisiana") then
            addMapToForageDefs("LouisianaMap", 20);
        end
        if SandboxVars.MoreMaps.CaliforniaMaps and getActivatedMods():contains("Legacy_California") then
            addMapToForageDefs("CaliforniaMap", 10);
            addMapToForageDefs("CaliforniaMapNorth", 20);
            addMapToForageDefs("CaliforniaMapSouth", 20);
        end
        
        if SandboxVars.MoreMaps.WeyhausenMap and getActivatedMods():contains("WeyhausenByCallnmx") then
            addMapToForageDefs("WeyhausenMap", 20);
        end
        
        if SandboxVars.MoreMaps.DaisyCountyMap and getActivatedMods():contains("Daisy County") then
            addMapToForageDefs("DaisyCountyMap", 20);
        end
        
        
        if SandboxVars.MoreMaps.McCoysBunkerMap and getActivatedMods():contains("McCoysBunker") then
            addMapToForageDefs("McCoysBunkerMap", 10);
        end
    
        if SandboxVars.MoreMaps.OtterCreekMap and getActivatedMods():contains("OtterCreek") then
            addMapToForageDefs("OtterCreekMap", 20);
        end
        
        if SandboxVars.MoreMaps.WellsburgLakeMap and getActivatedMods():contains("Wellsburg") then
            addMapToForageDefs("WellsburgLakeMap", 20);
        end
        
        if SandboxVars.MoreMaps.FortBoonesboroughMap and getActivatedMods():contains("Fort_Boonesborough") then
            addMapToForageDefs("FortBoonesboroughMap", 20);
        end

        
        if SandboxVars.MoreMaps.CrowlakeMap and getActivatedMods():contains("Crowlake") then
            addMapToForageDefs("CrowlakeMap", 20);
        end

        if SandboxVars.MoreMaps.GustonMap and getActivatedMods():contains("Guston") then
            addMapToForageDefs("GustonMap", 20);
        end

        if SandboxVars.MoreMaps.JaspervilleMap and getActivatedMods():contains("Jasperville") then
            addMapToForageDefs("JaspervilleMap", 20);
            addMapToForageDefs("JaspervilleTrainStationMap", 20);
            addMapToForageDefs("JaspervilleIndustrialMap", 20);
        end
        
        if SandboxVars.MoreMaps.YakamaStateParkMap and getActivatedMods():contains("YakamaStatePark") then
            addMapToForageDefs("YakamaStateParkMap", 20);
        end
        
        if SandboxVars.MoreMaps.ValuTechAmusementParkMap and getActivatedMods():contains("SimonMDValuTechAmusementPark") then
            addMapToForageDefs("ValuTechAmusementParkMap", 20);
        end
        
        if SandboxVars.MoreMaps.CanvasbackStudiosMap and getActivatedMods():contains("Canvasback Studios") then
            addMapToForageDefs("CanvasbackStudiosMap", 20);
        end
        
        if SandboxVars.MoreMaps.PlefordSpringsMap and getActivatedMods():contains("PlefordSpringsMapMod") then
            addMapToForageDefs("PlefordSpringsMap", 20);
        end
        
        
        if SandboxVars.MoreMaps.FoxWoodMap and getActivatedMods():contains("One cell life") then
            addMapToForageDefs("FoxWoodMap", 20);
        end
        
        if SandboxVars.MoreMaps.BrazilMap and getActivatedMods():contains("mapa brasil") then
            addMapToForageDefs("BrazilMap", 20);
        end
        
        
        if SandboxVars.MoreMaps.HavenRidgeMap and getActivatedMods():contains("LastOfUs") then
            addMapToForageDefs("HavenRidgeMap", 20);
        end



        

        -------------------------------
        ---- Already existing maps ----
        -------------------------------
        if getActivatedMods():contains("Trelai_4x4_Steam") then
            addMapToForageDefs("trelaimap", 10);
            addMapToForageDefs("trelaimap4", 20);
            addMapToForageDefs("trelaimap3", 20);
        end
        if getActivatedMods():contains("BedfordFalls") then 
            addMapToForageDefs("BedfordMap", 20);
        end
        if getActivatedMods():contains("Fantasiado ST. Bernard's Hill") then
            addMapToForageDefs("STBernardHillMap", 20);
        end
        if getActivatedMods():contains("MonmouthCounty") then
            addMapToForageDefs("monmouthcountymap", 20);
        end
        if getActivatedMods():contains("Taylorsville") then 
            addMapToForageDefs("TaylorsvilleMap", 20);
        end
        if getActivatedMods():contains("pineville") then 
            addMapToForageDefs("PinevilleMap", 20);
        end
        if getActivatedMods():contains("RabbitHashKY") then
            addMapToForageDefs("RabbitHashMap", 20);
        end
        -- if getActivatedMods():contains("DeadinHongKong") then
        --     addMapToForageDefs("HongKongYauMaTeiMap", 20);
        -- end
        if getActivatedMods():contains("Bourstrange") then 
            addMapToForageDefs("BourstrangeMap", 20);
        end
        if getActivatedMods():contains("NewTersh") then 
            addMapToForageDefs("NewTershLootableMap", 20);
        end
        if getActivatedMods():contains("Tandil") then 
            addMapToForageDefs("TandilLootableMap", 20);
        end
        if getActivatedMods():contains("Myhometown") then
            addMapToForageDefs("Homepie", 20);
        end
        if getActivatedMods():contains("tikitown") then
            addMapToForageDefs("Tikitown.TikitownLootableMap", 20);
        end
        if getActivatedMods():contains("Greenport") then
            addMapToForageDefs("Base.GreenportLootableMap", 20);
        end
        if getActivatedMods():contains("SPH") then
            addMapToForageDefs("Base.StPauloHammerMap", 20);
        end
        if getActivatedMods():contains("Utopia") then
            addMapToForageDefs("Base.UtopiaMap", 20);
        end
        if getActivatedMods():contains("Diggertown") then
            addMapToForageDefs("DTownRoadMap", 20);
            addMapToForageDefs("DTownTunnelMap", 20);
        end
    end
end

Events.preAddItemDefs.Add(initForageableMaps);