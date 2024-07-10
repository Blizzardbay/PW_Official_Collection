require 'Items/ProceduralDistributions'
require 'Items/Distributions'
require 'Vehicles/Distributions'

SandboxVars = SandboxVars or {}

-- set up Item Tweaker if needed
if getActivatedMods():contains("ItemTweakerAPI") then
    require("ItemTweaker_Core");
else 
    --Initializes the tables needed for the code to run
    if not ItemTweaker then  ItemTweaker = {} end
    if not TweakItem then  TweakItem = {} end
    if not TweakItemData then  TweakItemData = {} end
    --Prep code to make the changes to all item in the TweakItemData table.
    function ItemTweaker.tweakItems()
        local item;
        for k,v in pairs(TweakItemData) do 
            for t,y in pairs(v) do 
                item = ScriptManager.instance:getItem(k);		
                if item ~= nil then
                    item:DoParam(t.." = "..y);
                    print(k..": "..t..", "..y);
                end
            end
        end
    end
    function TweakItem(itemName, itemProperty, propertyValue)
        if not TweakItemData[itemName] then
            TweakItemData[itemName] = {};
        end
        TweakItemData[itemName][itemProperty] = propertyValue;
    end
    Events.OnGameBoot.Add(ItemTweaker.tweakItems);
end



-- TODO : AUTHENTIC Z

-- TODO add doctorsoffice, pharmacy, hospitals loot
local function addMapToMedicalZombies(_map , _weightChance)
    table.insert(SuburbsDistributions["all"]["Outfit_AmbulanceDriver"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_AmbulanceDriver"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Doctor"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Doctor"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Nurse"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Nurse"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Pharmacist"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Pharmacist"].items, _weightChance);
    table.insert(SuburbsDistributions["Bag_MedicalBag"].items, _map);
    table.insert(SuburbsDistributions["Bag_MedicalBag"].items, _weightChance);
    table.insert(SuburbsDistributions["FirstAidKit"].items, _map);
    table.insert(SuburbsDistributions["FirstAidKit"].items, _weightChance);


    
end

local function addMapToTownZombies(_map , _weightChance)
    table.insert(SuburbsDistributions["all"]["Outfit_Mechanic"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Mechanic"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_ThunderGas"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_ThunderGas"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Gas2Go"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Gas2Go"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Fossoil"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Fossoil"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_AmbulanceDriver"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_AmbulanceDriver"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Cyclist"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Cyclist"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Postal"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Postal"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Trader"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Trader"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_AirCrew"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_AirCrew"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Tourist"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Tourist"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Police"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Police"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_PoliceState"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_PoliceState"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_PoliceRiot"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_PoliceRiot"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_PrisonGuard"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_PrisonGuard"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_PrivateMilitia"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_PrivateMilitia"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Raider"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Raider"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Biker"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Biker"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Bandit"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Bandit"].items, _weightChance);
    -- bags
    table.insert(SuburbsDistributions["Bag_DuffelBagTINT"].items, _map);
    table.insert(SuburbsDistributions["Bag_DuffelBagTINT"].items, _weightChance);
    table.insert(SuburbsDistributions["Bag_Schoolbag"].items, _map);
    table.insert(SuburbsDistributions["Bag_Schoolbag"].items, _weightChance);
    table.insert(SuburbsDistributions["Bag_Satchel"].items, _map);
    table.insert(SuburbsDistributions["Bag_Satchel"].items, _weightChance);
    table.insert(SuburbsDistributions["Bag_WorkerBag"].items, _map);
    table.insert(SuburbsDistributions["Bag_WorkerBag"].items, _weightChance);
    table.insert(SuburbsDistributions["Satchel"].items, _map);
    table.insert(SuburbsDistributions["Satchel"].items, _weightChance);
    table.insert(SuburbsDistributions["Briefcase"].items, _map);
    table.insert(SuburbsDistributions["Briefcase"].items, _weightChance);
    table.insert(SuburbsDistributions["Suitcase"].items, _map);
    table.insert(SuburbsDistributions["Suitcase"].items, _weightChance);
    table.insert(SuburbsDistributions["Handbag"].items, _map);
    table.insert(SuburbsDistributions["Handbag"].items, _weightChance);
    table.insert(SuburbsDistributions["Purse"].items, _map);
    table.insert(SuburbsDistributions["Purse"].items, _weightChance);
    -- outfits from expanded helicopter events 
    if getActivatedMods():contains("ExpandedHelicopterEvents") then
        table.insert(SuburbsDistributions["all"]["Outfit_EHENightwatchPilot"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHENightwatchPilot"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHECivilianPilot"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHECivilianPilot"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHESamaritanPilot"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHESamaritanPilot"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHERaider"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHERaider"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHERaiderLeader"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHERaiderLeader"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHEBlackPilot"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHEBlackPilot"].items, _weightChance);
    end
    if getActivatedMods():contains("Authentic Z - Current") or getActivatedMods():contains("AuthenticZLite") then
        table.insert(SuburbsDistributions["all"]["AuthenticPizzaDelivery"].items, _map);
        table.insert(SuburbsDistributions["all"]["AuthenticPizzaDelivery"].items, _weightChance);
    end
    
end


local function addMapToCountrySideZombies(_map , _weightChance)
    table.insert(SuburbsDistributions["all"]["Outfit_Hunter"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Hunter"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Camper"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Camper"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Survivalist"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Survivalist"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Survivalist02"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Survivalist02"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Survivalist03"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Survivalist03"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Fisherman"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Fisherman"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Raider"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Raider"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Biker"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Biker"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Bandit"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Bandit"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_ParkRanger"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_ParkRanger"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Ranger"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Ranger"].items, _weightChance);
    -- bags
    table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, _map);
    table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, _weightChance);
    table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, _map);
    table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, _weightChance);
    -- outfits from expanded helicopter events 
    if getActivatedMods():contains("ExpandedHelicopterEvents") then
        table.insert(SuburbsDistributions["all"]["Outfit_EHENightwatchPilot"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHENightwatchPilot"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHECivilianPilot"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHECivilianPilot"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHESamaritanPilot"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHESamaritanPilot"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHERaider"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHERaider"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHERaiderLeader"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHERaiderLeader"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHEBlackPilot"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHEBlackPilot"].items, _weightChance);
    end
    if getActivatedMods():contains("Authentic Z - Current") or getActivatedMods():contains("AuthenticZLite") then
        table.insert(SuburbsDistributions["all"]["AuthenticSurvivorRanger"].items, _map);
        table.insert(SuburbsDistributions["all"]["AuthenticSurvivorRanger"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["AuthenticTravelingBand"].items, _map);
        table.insert(SuburbsDistributions["all"]["AuthenticTravelingBand"].items, _weightChance);
    end
end

local function addMapToMilitaryZombies(_map , _weightChance)
    table.insert(SuburbsDistributions["all"]["Outfit_Veteran"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Veteran"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Ghillie"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Ghillie"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_ArmyInstructor"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_ArmyInstructor"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_ArmyCamoGreen"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_ArmyCamoGreen"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_ArmyCamoDesert"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_ArmyCamoDesert"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_ArmyServiceUniform"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_ArmyServiceUniform"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_HazardSuit"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_HazardSuit"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Police"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Police"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_PoliceOfficer"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_PoliceOfficer"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_PoliceState"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_PoliceState"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_PoliceRiot"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_PoliceRiot"].items, _weightChance);
    -- army containers
    table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, _map);
    table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, _weightChance/2);
    table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"]["junk"].items, _map);
    table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"]["junk"].items, _weightChance/2);
    -- outfits from expanded helicopter events 
    if getActivatedMods():contains("ExpandedHelicopterEvents") then
        table.insert(SuburbsDistributions["all"]["Outfit_EHEMilitaryPilot"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHEMilitaryPilot"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHEPolicePilot"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHEPolicePilot"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHESoldier"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHESoldier"].items, _weightChance);
        table.insert(SuburbsDistributions["all"]["Outfit_EHEPoliceOfficer"].items, _map);
        table.insert(SuburbsDistributions["all"]["Outfit_EHEPoliceOfficer"].items, _weightChance);
    end

end

-- military vehicle loot from Filibusters Used Cars
local function addMapToMilitaryVehicles(_map, _weightChance)
    if getActivatedMods():contains("FRUsedCars") then
        table.insert(VehicleDistributions["MilitaryGearTrunk"].items, _map);
        table.insert(VehicleDistributions["MilitaryGearTrunk"].items, _weightChance);
        table.insert(VehicleDistributions["MilitarySeat"].items, _map);
        table.insert(VehicleDistributions["MilitarySeat"].items, _weightChance);
    end
    if getActivatedMods():contains("92amgeneralM998") then
        table.insert(VehicleDistributions["M998"]["GloveBox"].items, _map);
        table.insert(VehicleDistributions["M998"]["GloveBox"], _weightChance/2);
        table.insert(VehicleDistributions["M998"]["GloveBox"]["junk"].items, _map);
        table.insert(VehicleDistributions["M998"]["GloveBox"]["junk"], _weightChance);
    end
    if getActivatedMods():contains("74amgeneralM151A2") then
        table.insert(VehicleDistributions["M151A2"]["GloveBox"].items, _map);
        table.insert(VehicleDistributions["M151A2"]["GloveBox"], _weightChance/2);
        table.insert(VehicleDistributions["M151A2"]["GloveBox"]["junk"].items, _map);
        table.insert(VehicleDistributions["M151A2"]["GloveBox"]["junk"], _weightChance);
    end
    if getActivatedMods():contains("67commando") then
        table.insert(VehicleDistributions["V100MilitaryStuff"]["GloveBox"].items, _map);
        table.insert(VehicleDistributions["V100MilitaryStuff"]["GloveBox"], _weightChance/2);
        table.insert(VehicleDistributions["V100MilitaryStuff"]["GloveBox"]["junk"].items, _map);
        table.insert(VehicleDistributions["V100MilitaryStuff"]["GloveBox"]["junk"], _weightChance);
        table.insert(VehicleDistributions["V100GloveBox"]["GloveBox"].items, _map);
        table.insert(VehicleDistributions["V100GloveBox"]["GloveBox"], _weightChance/2);
        table.insert(VehicleDistributions["V100GloveBox"]["GloveBox"]["junk"].items, _map);
        table.insert(VehicleDistributions["V100GloveBox"]["GloveBox"]["junk"], _weightChance);
    end
    if getActivatedMods():contains("86oshkoshP19A") then
        table.insert(VehicleDistributions["P19AGloveBox"].items, _map);
        table.insert(VehicleDistributions["P19AGloveBox"], _weightChance);
        table.insert(VehicleDistributions["P19AGloveBox"]["junk"].items, _map);
        table.insert(VehicleDistributions["P19AGloveBox"]["junk"], _weightChance);
        table.insert(VehicleDistributions["bigTrunk"].items, _map);
        table.insert(VehicleDistributions["bigTrunk"], _weightChance/2);
        table.insert(VehicleDistributions["bigTrunk"]["junk"].items, _map);
        table.insert(VehicleDistributions["bigTrunk"]["junk"], _weightChance);
        table.insert(VehicleDistributions["smallTrunk"].items, _map);
        table.insert(VehicleDistributions["smallTrunk"], _weightChance/2);
        table.insert(VehicleDistributions["smallTrunk"]["junk"].items, _map);
        table.insert(VehicleDistributions["smallTrunk"]["junk"], _weightChance);
    end
end


local function addMapToMagazineRacks(_map, _weightChance)
    table.insert(ProceduralDistributions["list"]["MagazineRackMaps"].items, _map);
    table.insert(ProceduralDistributions["list"]["MagazineRackMaps"].items, _weightChance);
    table.insert(ProceduralDistributions["list"]["MagazineRackMaps"].items, _map);
    table.insert(ProceduralDistributions["list"]["MagazineRackMaps"].items, _weightChance/2);
end

local function addMapToMapCratesFactories(_map, _weightChance)
    table.insert(ProceduralDistributions["list"]["CrateMaps"].items, _map);
    table.insert(ProceduralDistributions["list"]["CrateMaps"].items, _weightChance);
    table.insert(ProceduralDistributions["list"]["CrateMaps"].items, _map);
    table.insert(ProceduralDistributions["list"]["CrateMaps"].items, _weightChance*2/5); -- to respect ratio, vanilla chances are 50 and 20
end

local function addMapToNormalGlovebox(_map, _weightChance)
    table.insert(VehicleDistributions["GloveBox"]["junk"].items, _map);
    table.insert(VehicleDistributions["GloveBox"]["junk"].items, _weightChance);
end
local function addMapToPoliceGlovebox(_map, _weightChance)
    table.insert(VehicleDistributions["Police"]["GloveBox"]["junk"].items, _map);
    table.insert(VehicleDistributions["Police"]["GloveBox"]["junk"].items, _weightChance);
end
local function addMapToGloveboxes(_map, _weightChance)
    addMapToNormalGlovebox(_map, _weightChance);
    addMapToPoliceGlovebox(_map, _weightChance);
end

local function addMapToMechanics(_map, _weightChance)
    table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, _map);
    table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, _weightChance);
    table.insert(ProceduralDistributions["list"]["StoreShelfMechanics"].items, _map);
    table.insert(ProceduralDistributions["list"]["StoreShelfMechanics"].items, _weightChance);
end

local function addMapToSidetables(_map, _weightChance)
    table.insert(SuburbsDistributions["all"]["sidetable"]["junk"].items, _map);
    table.insert(SuburbsDistributions["all"]["sidetable"]["junk"].items, _weightChance);
end

local function addMapToCrateRandomJunk(_map, _weightChance)
    table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, _map);
    table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, _weightChance);
    table.insert(ProceduralDistributions["list"]["CrateRandomJunk"]["junk"].items, _map);
    table.insert(ProceduralDistributions["list"]["CrateRandomJunk"]["junk"].items, _weightChance/2);
end
local function addMapToSurvivorBag(_map, _weightChance)
    table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, _map);
    table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, _weightChance);
end
local function addMapToRadioTruck(_map, _weightChance)
    table.insert(VehicleDistributions["Radio"]["TruckBed"].items, _map);
    table.insert(VehicleDistributions["Radio"]["TruckBed"].items, _weightChance*3);
    table.insert(VehicleDistributions["Radio"]["GloveBox"].items, _map);
    table.insert(VehicleDistributions["Radio"]["GloveBox"].items, _weightChance);
    table.insert(VehicleDistributions["Radio"]["GloveBox"]["junk"].items, _map);
    table.insert(VehicleDistributions["Radio"]["GloveBox"]["junk"].items, _weightChance);
    table.insert(VehicleDistributions["Radio"]["SeatRearLeft"]["junk"].items, _map);
    table.insert(VehicleDistributions["Radio"]["SeatRearLeft"]["junk"].items, _weightChance/200);
    table.insert(VehicleDistributions["Radio"]["SeatRearRight"]["junk"].items, _map);
    table.insert(VehicleDistributions["Radio"]["SeatRearRight"]["junk"].items, _weightChance/200);
end


local function addMapToPrisonInmates(_map, _weightChance)
    table.insert(SuburbsDistributions["Bag_InmateEscapedBag"].items, _map);
    table.insert(SuburbsDistributions["Bag_InmateEscapedBag"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_Inmate"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_Inmate"].items, _weightChance/2);
    table.insert(SuburbsDistributions["all"]["Outfit_InmateEscaped"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_InmateEscaped"].items, _weightChance);
    table.insert(SuburbsDistributions["all"]["Outfit_InmateKhaki"].items, _map);
    table.insert(SuburbsDistributions["all"]["Outfit_InmateKhaki"].items, _weightChance/2);
end


local function multiplyLootChances(_containerKey, _containerTable)
    if _containerTable and _containerTable[1] and _containerTable[2] then 
        for i=2, #_containerTable, 2 do
            if _containerTable[i] and type(_containerTable[i]) == "number" then
                if _containerTable[i-1] and type(_containerTable[i-1]) == "string" then
                    local matches = {
                        LouisvilleMap1 = 1,
                        LouisvilleMap2 = 1,
                        LouisvilleMap3 = 1,
                        LouisvilleMap4 = 1,
                        LouisvilleMap5 = 1,
                        LouisvilleMap6 = 1,
                        LouisvilleMap7 = 1,
                        LouisvilleMap8 = 1,
                        LouisvilleMap9 = 1,
                    }
                    local matches2 = {
                        MuldraughMap = 1,
                        WestpointMap = 1,
                        MarchRidgeMap = 1,
                        RiversideMap = 1,
                        RosewoodMap = 1,
                    }

                    local itemChance = _containerTable[i];
                    local itemId = _containerTable[i-1]
                    if matches[itemId] then
                        if SandboxVars.MoreMaps.LouisVilleDistrictMaps then
                            _containerTable[i] = itemChance/200;
                        else
                            _containerTable[i] = itemChance/5;
                        end
                    end
                    if matches2[itemId] then
                        _containerTable[i] = itemChance/4;
                    end
                end
            end
        end
    end
end

local function loopOnTable(table)
    for zoneKey, zone in pairs(table) do
        if type(zone) == "table" then
            if zone and zone.items then
                if zone.items[2] then
                    multiplyLootChances(zoneKey, zone.items)
                end
                if zone.junk and zone.junk.items[2] then
                    multiplyLootChances(zoneKey, zone.junk.items)  
                end
            else
                if zone and not zone.procedural then
                    loopOnTable(zone)
                end
            end
        end
    end
end

local function loopOnVehicleTables(table)
    for zoneKey, zone in pairs(table) do
        if type(zone) == "table" then
            if zone and zone.items then
                if zone.items[2] then
                    multiplyLootChances(zoneKey, zone.items)
                end
                if zone.junk and zone.junk.items[2] then
                    multiplyLootChances(zoneKey, zone.junk.items)  
                end
            end
        end
    end
end

local function tweakVanillaLoot()
    ProceduralDistributions.betterSortingLootMultiplierTweaked = true;
    ProceduralDistributions.list = ProceduralDistributions.list or {}
    SandboxVars = SandboxVars or {}
    VehicleDistributions = VehicleDistributions or {}
    SuburbsDistributions = SuburbsDistributions or {}
    Distributions = Distributions or {}
    loopOnTable(SuburbsDistributions)
    loopOnTable(Distributions)
    loopOnTable(ProceduralDistributions.list)
    loopOnVehicleTables(VehicleDistributions)
end

local function initMapDistributions()
    ------------------------------------------------------------------------------------------
    ---------- MODIFY THESE VALUES TO TWEAK LOOT DISTRIBUTIONS -------------------------------
    -------- These are the chance for each map item, not the chance to get one map. ----------
    ------------------------------------------------------------------------------------------
    local globalLootTweaker = 0.3
    local baseChanceZombies = 0.4 * SandboxVars.MoreMaps.MapLootMultiplier * globalLootTweaker;
    local baseChanceMedicalZombies = 0.9 * SandboxVars.MoreMaps.MapLootMultiplier * globalLootTweaker;
    local baseChanceMilitaryZombies = 0.9 * SandboxVars.MoreMaps.MapLootMultiplier * globalLootTweaker;
    local baseChanceMagazineRacks = 10 * globalLootTweaker;
    local baseChanceMechanics = 1.2 * SandboxVars.MoreMaps.MapLootMultiplier * globalLootTweaker;
    local baseChanceGlovebox = 0.5 * SandboxVars.MoreMaps.MapLootMultiplier * globalLootTweaker; 
    local baseChanceSideTable = 0.1 * SandboxVars.MoreMaps.MapLootMultiplier * globalLootTweaker;
    local baseChanceSurvivorBag = 30 * SandboxVars.MoreMaps.MapLootMultiplier * globalLootTweaker;
    local baseChanceMapFactoryCrate = 30 * globalLootTweaker;
    local baseChanceCrateRandomJunk = 0.01 * SandboxVars.MoreMaps.MapLootMultiplier * globalLootTweaker;
    local baseChanceMilitaryVehicles = 1.2 * SandboxVars.MoreMaps.MapLootMultiplier * globalLootTweaker;
    -----------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------    
    -----------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------   
    -- definitions for failsafe and improve compatibility
    ProceduralDistributions = ProceduralDistributions or {};
    VehicleDistributions = VehicleDistributions or {};
    -- procedural
    ProceduralDistributions.list.CrateMechanics = ProceduralDistributions.list.CrateMechanics or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    ProceduralDistributions.list.MagazineRackMaps = ProceduralDistributions.list.MagazineRackMaps or {rolls = 6, items={}, junk= {rolls =1, items={}}};
    ProceduralDistributions.list.StoreShelfMechanics = ProceduralDistributions.list.StoreShelfMechanics or {rolls = 4, items={}, junk= {rolls =1, items={}}};
    ProceduralDistributions.list.CrateMaps = ProceduralDistributions.list.CrateMaps or {rolls = 6, items={}, junk= {rolls =1, items={}}};
    ProceduralDistributions.list.CrateRandomJunk = ProceduralDistributions.list.CrateRandomJunk or {rolls = 2, items={}, junk= {rolls =1, items={}}};
    ProceduralDistributions.list.LockerArmyBedroom = ProceduralDistributions.list.LockerArmyBedroom or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    ProceduralDistributions.list.ArmySurplusMisc = ProceduralDistributions.list.ArmySurplusMisc or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    ProceduralDistributions["list"]["CrateMaps"].rolls = 6; -- increase number of rolls
    ProceduralDistributions["list"]["MagazineRackMaps"].rolls = 6; -- increase number of rolls
    ProceduralDistributions["list"]["CrateRandomJunk"].rolls = 2; -- increase number of rolls

    -- vehicle
    VehicleDistributions.GloveBox = VehicleDistributions.GloveBox or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    VehicleDistributions.Police.GloveBox = VehicleDistributions.Police.GloveBox or {rolls = 1, items={}, junk= {rolls =1, items={}}};

    -- vehicles from some popular vehicle mods
    if getActivatedMods():contains("FRUsedCars") then
        VehicleDistributions.MilitaryGearTrunk = VehicleDistributions.MilitaryGearTrunk or {rolls = 1, items={}, junk= {rolls =1, items={}}};
        VehicleDistributions.MilitaryGearTrunk.junk= {rolls = 1, items={}}
        VehicleDistributions.MilitarySeat = VehicleDistributions.MilitaryGearTrunk or {rolls = 1, items={}, junk= {rolls =1, items={}}};
        VehicleDistributions.MilitarySeat.junk= {rolls = 1, items={}}
    end
    if getActivatedMods():contains("92amgeneralM998") then
        VehicleDistributions.M998.GloveBox = VehicleDistributions.M998.GloveBox or VehicleDistributions.GloveBox or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    end
    if getActivatedMods():contains("74amgeneralM151A2") then
        VehicleDistributions.M151A2.GloveBox = VehicleDistributions.M151A2.GloveBox or VehicleDistributions.GloveBox or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    end
    if getActivatedMods():contains("67commando") then
        VehicleDistributions.V100MilitaryStuff.GloveBox = VehicleDistributions.V100MilitaryStuff.GloveBox or {rolls = 2, items={}, junk= {rolls =1, items={}}};
        VehicleDistributions.V100MilitaryStuff.GloveBox.junk = {rolls = 1, items={}};
        VehicleDistributions.V100GloveBox.GloveBox = VehicleDistributions.V100GloveBox.GloveBox or {rolls = 3, items={}, junk= {rolls =1, items={}}};
        VehicleDistributions.V100GloveBox.GloveBox.junk = VehicleDistributions.V100GloveBox.GloveBox.junk or {rolls = 1, items={}};
    end
    if getActivatedMods():contains("86oshkoshP19A") then
        VehicleDistributions.P19AGloveBox = VehicleDistributions.V100MilitaryStuff or {rolls = 4, items={}, junk= {rolls =1, items={}}};
        VehicleDistributions.P19AGloveBox.junk = {rolls = 1, items={}};
        VehicleDistributions.bigTrunk = VehicleDistributions.V100GloveBox or {rolls = 2, items={}, junk= {rolls =1, items={}}};
        VehicleDistributions.bigTrunk.junk = {rolls = 1, items={}};
        VehicleDistributions.smallTrunk = VehicleDistributions.V100GloveBox or {rolls = 3, items={}, junk= {rolls =1, items={}}};
        VehicleDistributions.smallTrunk.junk = {rolls = 1, items={}};
    end
    --suburbs
    SuburbsDistributions = SuburbsDistributions or {};
    SuburbsDistributions.all = SuburbsDistributions.all or {};
    SuburbsDistributions.all.sidetable = SuburbsDistributions.all.sidetable or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    -- suburbs bags
    SuburbsDistributions.Bag_GolfBag = SuburbsDistributions.Bag_GolfBag or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Bag_GolfBag.maxMap=1;
    SuburbsDistributions.Bag_SurvivorBag = SuburbsDistributions.Bag_SurvivorBag or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Bag_SurvivorBag.maxMap=1;
    SuburbsDistributions.Bag_BigHikingBag = SuburbsDistributions.Bag_BigHikingBag or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Bag_BigHikingBag.maxMap=1;
    SuburbsDistributions.Bag_NormalHikingBag = SuburbsDistributions.Bag_NormalHikingBag or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Bag_NormalHikingBag.maxMap=1;
    SuburbsDistributions.Satchel = SuburbsDistributions.Satchel or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Satchel.maxMap=1;
    SuburbsDistributions.Bag_Satchel = SuburbsDistributions.Bag_Satchel or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Bag_Satchel.maxMap=1;
    SuburbsDistributions.Bag_DuffelBagTINT = SuburbsDistributions.Bag_DuffelBagTINT or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Bag_DuffelBagTINT.maxMap=1;
    SuburbsDistributions.Bag_Schoolbag = SuburbsDistributions.Bag_Schoolbag or {rolls = 1, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Bag_Schoolbag.maxMap=1;
    SuburbsDistributions.Briefcase = SuburbsDistributions.Briefcase or {rolls = 2, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Briefcase.maxMap=1;
    SuburbsDistributions.Handbag = SuburbsDistributions.Handbag or {rolls = 2, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Handbag.maxMap=1;
    SuburbsDistributions.Purse = SuburbsDistributions.Purse or {rolls = 2, items={}, junk= {rolls =1, items={}}};
    SuburbsDistributions.Purse.maxMap=1;
    -- suburbs zombie outfits
    SuburbsDistributions.all.Outfit_Mechanic = SuburbsDistributions.all.Outfit_Mechanic or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_ThunderGas = SuburbsDistributions.all.Outfit_ThunderGas or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Gas2Go = SuburbsDistributions.all.Outfit_Gas2Go or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Fossoil = SuburbsDistributions.all.Outfit_Fossoil or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_AmbulanceDriver = SuburbsDistributions.all.Outfit_AmbulanceDriver or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Police = SuburbsDistributions.all.Outfit_Police or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_PoliceOfficer = SuburbsDistributions.all.Outfit_PoliceOfficer or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_PoliceState = SuburbsDistributions.all.Outfit_PoliceState or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_PoliceRiot = SuburbsDistributions.all.Outfit_PoliceRiot or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_PrisonGuard = SuburbsDistributions.all.Outfit_PrisonGuard or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_PrivateMilitia = SuburbsDistributions.all.Outfit_PrivateMilitia or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Raider = SuburbsDistributions.all.Outfit_Raider or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Biker = SuburbsDistributions.all.Outfit_Biker or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Bandit = SuburbsDistributions.all.Outfit_Bandit or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Hunter = SuburbsDistributions.all.Outfit_Hunter or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Camper = SuburbsDistributions.all.Outfit_Camper or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Survivalist = SuburbsDistributions.all.Outfit_Survivalist or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Survivalist02 = SuburbsDistributions.all.Outfit_Survivalist02 or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Survivalist03 = SuburbsDistributions.all.Outfit_Survivalist03 or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Fisherman = SuburbsDistributions.all.Outfit_Fisherman or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_ParkRanger = SuburbsDistributions.all.Outfit_ParkRanger or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_ArmyCamoGreen = SuburbsDistributions.all.Outfit_ArmyCamoGreen or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_ArmyCamoDesert = SuburbsDistributions.all.Outfit_ArmyCamoDesert or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_ArmyServiceUniform = SuburbsDistributions.all.Outfit_ArmyServiceUniform or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_HazardSuit = SuburbsDistributions.all.Outfit_HazardSuit or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Student = SuburbsDistributions.all.Outfit_Student or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Teacher = SuburbsDistributions.all.Outfit_Teacher or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Golfer = SuburbsDistributions.all.Outfit_Golfer or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Cyclist = SuburbsDistributions.all.Outfit_Cyclist or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Postal = SuburbsDistributions.all.Outfit_Postal or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Ranger = SuburbsDistributions.all.Outfit_Ranger or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Tourist = SuburbsDistributions.all.Outfit_Tourist or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Trader = SuburbsDistributions.all.Outfit_Trader or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_AirCrew = SuburbsDistributions.all.Outfit_AirCrew or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_ArmyInstructor = SuburbsDistributions.all.Outfit_ArmyInstructor or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Ghillie = SuburbsDistributions.all.Outfit_Ghillie or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Veteran = SuburbsDistributions.all.Outfit_Veteran or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_Inmate = SuburbsDistributions.all.Outfit_Inmate or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_InmateEscaped = SuburbsDistributions.all.Outfit_InmateEscaped or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.all.Outfit_InmateKhaki = SuburbsDistributions.all.Outfit_InmateKhaki or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    SuburbsDistributions.Bag_InmateEscapedBag = SuburbsDistributions.Bag_InmateEscapedBag or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    -- suburbs zombie outfits from Expanded Helicopter Events mod
    if getActivatedMods():contains("ExpandedHelicopterEvents") then
        SuburbsDistributions.all.Outfit_EHEMilitaryPilot = SuburbsDistributions.all.Outfit_EHEMilitaryPilot or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.Outfit_EHEPolicePilot = SuburbsDistributions.all.Outfit_EHEPolicePilot or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.Outfit_EHESoldier = SuburbsDistributions.all.Outfit_EHESoldier or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.Outfit_EHEPoliceOfficer = SuburbsDistributions.all.Outfit_EHEPoliceOfficer or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.Outfit_EHENightwatchPilot = SuburbsDistributions.all.Outfit_EHENightwatchPilot or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.Outfit_EHECivilianPilot = SuburbsDistributions.all.Outfit_EHECivilianPilot or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.Outfit_EHESamaritanPilot = SuburbsDistributions.all.Outfit_EHESamaritanPilot or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.Outfit_EHERaider = SuburbsDistributions.all.Outfit_EHERaider or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.Outfit_EHERaiderLeader = SuburbsDistributions.all.Outfit_EHERaiderLeader or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.Outfit_EHEBlackPilot = SuburbsDistributions.all.Outfit_EHEBlackPilot or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    end
    if getActivatedMods():contains("Authentic Z - Current") or getActivatedMods():contains("AuthenticZLite") then
        SuburbsDistributions.all.AuthenticPizzaDelivery = SuburbsDistributions.all.AuthenticPizzaDelivery or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.AuthenticTravelingBand = SuburbsDistributions.all.AuthenticTravelingBand or {rolls = 1,items = {},junk= {rolls =1, items={}}};
        SuburbsDistributions.all.AuthenticSurvivorRanger = SuburbsDistributions.all.AuthenticSurvivorRanger or {rolls = 1,items = {},junk= {rolls =1, items={}}};
    end
    
    tweakVanillaLoot()

    addMapToTownZombies("Base.MuldraughMap", baseChanceZombies/2);
    addMapToCountrySideZombies("Base.MuldraughMap", baseChanceZombies/4);
    addMapToMechanics("Base.MuldraughMap", baseChanceMechanics/2);
    addMapToMagazineRacks("Base.MuldraughMap", baseChanceMagazineRacks/2);
    addMapToSidetables("Base.MuldraughMap", baseChanceSideTable/2);
    addMapToSurvivorBag("Base.MuldraughMap", baseChanceSurvivorBag/2);
    addMapToGloveboxes("Base.MuldraughMap", baseChanceGlovebox/2);
    addMapToMapCratesFactories("Base.MuldraughMap", baseChanceMapFactoryCrate/2);
    addMapToCrateRandomJunk("Base.MuldraughMap", baseChanceCrateRandomJunk/2);

    addMapToTownZombies("Base.WestpointMap", baseChanceZombies/2);
    addMapToCountrySideZombies("Base.WestpointMap", baseChanceZombies/4);
    addMapToMechanics("Base.WestpointMap", baseChanceMechanics/2);
    addMapToMagazineRacks("Base.WestpointMap", baseChanceMagazineRacks/2);
    addMapToSidetables("Base.WestpointMap", baseChanceSideTable/2);
    addMapToSurvivorBag("Base.WestpointMap", baseChanceSurvivorBag/2);
    addMapToGloveboxes("Base.WestpointMap", baseChanceGlovebox/2);
    addMapToMapCratesFactories("Base.WestpointMap", baseChanceMapFactoryCrate/2);
    addMapToCrateRandomJunk("Base.WestpointMap", baseChanceCrateRandomJunk/2);

    addMapToTownZombies("Base.RiversideMap", baseChanceZombies/2);
    addMapToCountrySideZombies("Base.RiversideMap", baseChanceZombies/4);
    addMapToMechanics("Base.RiversideMap", baseChanceMechanics/2);
    addMapToMagazineRacks("Base.RiversideMap", baseChanceMagazineRacks/2);
    addMapToSidetables("Base.RiversideMap", baseChanceSideTable/2);
    addMapToSurvivorBag("Base.RiversideMap", baseChanceSurvivorBag/2);
    addMapToGloveboxes("Base.RiversideMap", baseChanceGlovebox/2);
    addMapToMapCratesFactories("Base.RiversideMap", baseChanceMapFactoryCrate/2);
    addMapToCrateRandomJunk("Base.RiversideMap", baseChanceCrateRandomJunk/2);

    addMapToTownZombies("Base.RosewoodMap", baseChanceZombies/2);
    addMapToCountrySideZombies("Base.RosewoodMap", baseChanceZombies/4);
    addMapToMechanics("Base.RosewoodMap", baseChanceMechanics/2);
    addMapToMagazineRacks("Base.RosewoodMap", baseChanceMagazineRacks/2);
    addMapToSidetables("Base.RosewoodMap", baseChanceSideTable/2);
    addMapToSurvivorBag("Base.RosewoodMap", baseChanceSurvivorBag/2);
    addMapToGloveboxes("Base.RosewoodMap", baseChanceGlovebox/2);
    addMapToMapCratesFactories("Base.RosewoodMap", baseChanceMapFactoryCrate/2);
    addMapToCrateRandomJunk("Base.RosewoodMap", baseChanceCrateRandomJunk/2);

    addMapToTownZombies("Base.MarchRidgeMap", baseChanceZombies/2);
    addMapToCountrySideZombies("Base.MarchRidgeMap", baseChanceZombies/4);
    addMapToMechanics("Base.MarchRidgeMap", baseChanceMechanics/2);
    addMapToMagazineRacks("Base.MarchRidgeMap", baseChanceMagazineRacks/2);
    addMapToSidetables("Base.MarchRidgeMap", baseChanceSideTable/2);
    addMapToSurvivorBag("Base.MarchRidgeMap", baseChanceSurvivorBag/2);
    addMapToGloveboxes("Base.MarchRidgeMap", baseChanceGlovebox/2);
    addMapToMapCratesFactories("Base.MarchRidgeMap", baseChanceMapFactoryCrate/2);
    addMapToCrateRandomJunk("Base.MarchRidgeMap", baseChanceCrateRandomJunk/2);


    if SandboxVars.MoreMaps.KentuckyCompleteMap then -- very low chance
        addMapToMilitaryZombies("Base.KentuckyMap", baseChanceMilitaryZombies/100);
        addMapToMagazineRacks("Base.KentuckyMap", baseChanceMagazineRacks/100);
        addMapToMapCratesFactories("Base.KentuckyMap", baseChanceMapFactoryCrate/10);
        addMapToCrateRandomJunk("Base.KentuckyMap", baseChanceCrateRandomJunk/100);
    end
    if SandboxVars.MoreMaps.EkronMap then
             -- Ekron map
        addMapToTownZombies("Base.EkronMap", baseChanceZombies);
        addMapToCountrySideZombies("Base.EkronMap", baseChanceZombies/5);
        addMapToMechanics("Base.EkronMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.EkronMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.EkronMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.EkronMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.EkronMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.EkronMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.EkronMap", baseChanceCrateRandomJunk);
    end
   
    if SandboxVars.MoreMaps.TrailerParkMaps then
        --Dixie map
        addMapToTownZombies("Base.DixieMap", baseChanceZombies/2);
        addMapToCountrySideZombies("Base.DixieMap", baseChanceZombies/2);
        addMapToMechanics("Base.DixieMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.DixieMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.DixieMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.DixieMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.DixieMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.DixieMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.DixieMap", baseChanceCrateRandomJunk);
        --ScenicGroveMap map
        addMapToTownZombies("Base.ScenicGroveMap", baseChanceZombies/2);
        addMapToCountrySideZombies("Base.ScenicGroveMap", baseChanceZombies/2);
        addMapToMechanics("Base.ScenicGroveMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.ScenicGroveMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.ScenicGroveMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.ScenicGroveMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.ScenicGroveMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.ScenicGroveMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.ScenicGroveMap", baseChanceCrateRandomJunk);
    end

    if SandboxVars.MoreMaps.RiversideCountryClubMap then
        --CountryClubMap map
        addMapToTownZombies("Base.CountryClubMap", baseChanceZombies/5);
        table.insert(SuburbsDistributions["all"]["Outfit_Golfer"].items, "Base.CountryClubMap");
        table.insert(SuburbsDistributions["all"]["Outfit_Golfer"].items, baseChanceZombies*5);
        addMapToMechanics("Base.CountryClubMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.CountryClubMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.CountryClubMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.CountryClubMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.CountryClubMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.CountryClubMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.CountryClubMap", baseChanceCrateRandomJunk/2);
    end

    if SandboxVars.MoreMaps.PonyRoamOMap then
        --PonyRoamOMap map
        addMapToCountrySideZombies("Base.PonyRoamOMap", baseChanceZombies);
        addMapToMechanics("Base.PonyRoamOMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.PonyRoamOMap", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.PonyRoamOMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.PonyRoamOMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.PonyRoamOMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.PonyRoamOMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.PonyRoamOMap", baseChanceCrateRandomJunk/4);
    end

    if SandboxVars.MoreMaps.LouisVilleCompleteMap then
        --LouisvilleMap map
        addMapToMilitaryZombies("Base.LouisvilleMap", baseChanceMilitaryZombies/20);
        addMapToMechanics("Base.LouisvilleMap", baseChanceMechanics/20);
        addMapToMagazineRacks("Base.LouisvilleMap", baseChanceMagazineRacks/20);
        addMapToSidetables("Base.LouisvilleMap", baseChanceSideTable/20);
        addMapToSurvivorBag("Base.LouisvilleMap", baseChanceSurvivorBag/5);
        addMapToGloveboxes("Base.LouisvilleMap", baseChanceGlovebox/20);
        addMapToMapCratesFactories("Base.LouisvilleMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.LouisvilleMap", baseChanceCrateRandomJunk/20);
    end

    if SandboxVars.MoreMaps.LouisVilleDistrictMaps then



        --LouisvilleIroquoisMap map
        addMapToTownZombies("Base.LouisvilleIroquoisMap", baseChanceZombies/2);
        addMapToMagazineRacks("Base.LouisvilleIroquoisMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleIroquoisMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleIroquoisMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleIroquoisMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleIroquoisMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleIroquoisMap", baseChanceCrateRandomJunk/2);
        --LouisvilleAudubonMap map
        addMapToTownZombies("Base.LouisvilleAudubonMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleAudubonMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleAudubonMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleAudubonMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleAudubonMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleAudubonMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleAudubonMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleAudubonMap", baseChanceCrateRandomJunk/2);
        --LouisvilleCentralMap map
        addMapToTownZombies("Base.LouisvilleCentralMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleCentralMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleCentralMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleCentralMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleCentralMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleCentralMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleCentralMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleAudubonMap", baseChanceCrateRandomJunk/2);
        --LouisvilleEvergreenHillMap map
        addMapToTownZombies("Base.LouisvilleEvergreenHillMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleEvergreenHillMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleEvergreenHillMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleEvergreenHillMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleEvergreenHillMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleEvergreenHillMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleEvergreenHillMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleAudubonMap", baseChanceCrateRandomJunk/2);
        --LouisvilleOldMap map
        addMapToTownZombies("Base.LouisvilleOldMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleOldMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleOldMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleOldMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleOldMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleOldMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleOldMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleAudubonMap", baseChanceCrateRandomJunk/2);
        --LouisvillePhoenixHillMap map
        addMapToTownZombies("Base.LouisvillePhoenixHillMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvillePhoenixHillMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvillePhoenixHillMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvillePhoenixHillMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvillePhoenixHillMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvillePhoenixHillMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvillePhoenixHillMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleAudubonMap", baseChanceCrateRandomJunk/2);
        --LouisvilleGatedCommunityMap map
        addMapToTownZombies("Base.LouisvilleGatedCommunityMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleGatedCommunityMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleGatedCommunityMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleGatedCommunityMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleGatedCommunityMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleGatedCommunityMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleGatedCommunityMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleAudubonMap", baseChanceCrateRandomJunk/2);
        --LouisvilleNorthCommercialDistrictMap map
        addMapToTownZombies("Base.LouisvilleNorthCommercialDistrictMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleNorthCommercialDistrictMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleNorthCommercialDistrictMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleNorthCommercialDistrictMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleNorthCommercialDistrictMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleNorthCommercialDistrictMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleNorthCommercialDistrictMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleAudubonMap", baseChanceCrateRandomJunk/2);
        --LouisvillePortlandMap map
        addMapToTownZombies("Base.LouisvillePortlandMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvillePortlandMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvillePortlandMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvillePortlandMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvillePortlandMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvillePortlandMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvillePortlandMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleAudubonMap", baseChanceCrateRandomJunk/2);
        --LouisvilleLSUMap map
        addMapToTownZombies("Base.LouisvilleLSUMap", baseChanceZombies/2);
        table.insert(SuburbsDistributions["all"]["Outfit_Student"].items, "Base.LouisvilleLSUMap");
        table.insert(SuburbsDistributions["all"]["Outfit_Student"].items, baseChanceZombies*2);
        table.insert(SuburbsDistributions["all"]["Outfit_Teacher"].items, "Base.LouisvilleLSUMap");
        table.insert(SuburbsDistributions["all"]["Outfit_Teacher"].items, baseChanceZombies*2);
        table.insert(ProceduralDistributions["list"]["SchoolLockers"].items, "Base.LouisvilleLSUMap");
        table.insert(ProceduralDistributions["list"]["SchoolLockers"].items, 1);
        addMapToMechanics("Base.LouisvilleLSUMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleLSUMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleLSUMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleLSUMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleLSUMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleLSUMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleLSUMap", baseChanceCrateRandomJunk/2);
        --LouisvilleSouthMap map
        addMapToTownZombies("Base.LouisvilleSouthMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleSouthMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleSouthMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleSouthMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleSouthMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleSouthMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleSouthMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleSouthMap", baseChanceCrateRandomJunk/2);
        --LouisvilleLeafhillHeightsMap map
        addMapToTownZombies("Base.LouisvilleLeafhillHeightsMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleLeafhillHeightsMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleLeafhillHeightsMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleLeafhillHeightsMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleLeafhillHeightsMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleLeafhillHeightsMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleLeafhillHeightsMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleLeafhillHeightsMap", baseChanceCrateRandomJunk/2);
        --LouisvilleChapelmountDownsMap map
        addMapToTownZombies("Base.LouisvilleChapelmountDownsMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleChapelmountDownsMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleChapelmountDownsMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleChapelmountDownsMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleChapelmountDownsMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleChapelmountDownsMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleChapelmountDownsMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleChapelmountDownsMap", baseChanceCrateRandomJunk/2);
        --LouisvilleScarletOakMap map
        addMapToTownZombies("Base.LouisvilleScarletOakMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleScarletOakMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleScarletOakMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleScarletOakMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleScarletOakMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleScarletOakMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleScarletOakMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleScarletOakMap", baseChanceCrateRandomJunk/2);

        --LouisvilleEastMap map
        addMapToTownZombies("Base.LouisvilleEastMap", baseChanceZombies/2);
        addMapToMechanics("Base.LouisvilleEastMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.LouisvilleEastMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisvilleEastMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.LouisvilleEastMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LouisvilleEastMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisvilleEastMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.LouisvilleEastMap", baseChanceCrateRandomJunk/2);
    end

    if SandboxVars.MoreMaps.ValleyStationMap then
        --ValleyStationMap map
        addMapToTownZombies("Base.ValleyStationMap", baseChanceZombies/2);
        addMapToCountrySideZombies("Base.ValleyStationMap", baseChanceZombies/2);
        addMapToMechanics("Base.ValleyStationMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.ValleyStationMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.ValleyStationMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.ValleyStationMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.ValleyStationMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.ValleyStationMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.ValleyStationMap", baseChanceCrateRandomJunk/2);
    end
    if SandboxVars.MoreMaps.ValleyStationMallAreaMap then
        --ValleyStationMallAreaMap map
        addMapToTownZombies("Base.ValleyStationMallAreaMap", baseChanceZombies/4);
        addMapToCountrySideZombies("Base.ValleyStationMallAreaMap", baseChanceZombies/4);
        addMapToMechanics("Base.ValleyStationMallAreaMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.ValleyStationMallAreaMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.ValleyStationMallAreaMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.ValleyStationMallAreaMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.ValleyStationMallAreaMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.ValleyStationMallAreaMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.ValleyStationMallAreaMap", baseChanceCrateRandomJunk/4);
    end
    if SandboxVars.MoreMaps.MuldraughWarehouseComplexMap then
        addMapToTownZombies("Base.MuldraughWarehouseComplexMap", baseChanceZombies/4);
        addMapToMechanics("Base.MuldraughWarehouseComplexMap", baseChanceMechanics*2);
        -- addMapToMagazineRacks("Base.ValleyStationMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.MuldraughWarehouseComplexMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.MuldraughWarehouseComplexMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.MuldraughWarehouseComplexMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.MuldraughWarehouseComplexMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.MuldraughWarehouseComplexMap", baseChanceCrateRandomJunk/4);
    end
    if SandboxVars.MoreMaps.MilitaryMaps then
        if getActivatedMods():contains("rbr") then
            --ResearchFacility map
            -- addMapToMilitaryZombies("Base.ResearchFacilityMap", baseChanceMilitaryZombies/10);
            -- addMapToSurvivorBag("Base.ResearchFacilityMap", baseChanceSurvivorBag/4);
            -- addMapToPoliceGlovebox("Base.ResearchFacilityMap", baseChanceGlovebox/10);
            -- addMapToMilitaryVehicles("Base.ResearchFacilityMap", baseChanceMilitaryVehicles/4);
        else
            --MilitaryBaseMap map
            addMapToMilitaryZombies("Base.MilitaryBaseMap", baseChanceMilitaryZombies/10);
            addMapToSurvivorBag("Base.MilitaryBaseMap", baseChanceSurvivorBag/4);
            addMapToPoliceGlovebox("Base.MilitaryBaseMap", baseChanceGlovebox/10);
            addMapToMilitaryVehicles("Base.MilitaryBaseMap", baseChanceMilitaryVehicles/4);
        end
        
        if SandboxVars.MoreMaps.FortBenningMap and getActivatedMods():contains("Fort Benning") then
            addMapToMilitaryZombies("Base.FortBenningMap", baseChanceMilitaryZombies);
            addMapToSurvivorBag("Base.FortBenningMap", baseChanceSurvivorBag/2);
            addMapToPoliceGlovebox("Base.FortBenningMap", baseChanceGlovebox/4);
            addMapToMilitaryVehicles("Base.FortBenningMap", baseChanceMilitaryVehicles);
        end
        if SandboxVars.MoreMaps.FortRedstoneMap and getActivatedMods():contains("FORTREDSTONE") then
            addMapToMilitaryZombies("Base.FortRedstoneMap", baseChanceMilitaryZombies);
            addMapToSurvivorBag("Base.FortRedstoneMap", baseChanceSurvivorBag/2);
            addMapToPoliceGlovebox("Base.FortRedstoneMap", baseChanceGlovebox/4);
            addMapToMilitaryVehicles("Base.FortRedstoneMap", baseChanceMilitaryVehicles);
        end
        if SandboxVars.MoreMaps.WeatherStationLocations and getActivatedMods():contains("SaveOurStation_KnoxCountry") then
            --StationZULULocation map
            addMapToMilitaryZombies("Base.StationZULULocation", baseChanceMilitaryZombies);
            addMapToSurvivorBag("Base.StationZULULocation", baseChanceSurvivorBag/2);
            addMapToPoliceGlovebox("Base.StationZULULocation", baseChanceGlovebox/4);
            addMapToRadioTruck("Base.StationZULULocation", baseChanceGlovebox);
            addMapToMilitaryVehicles("Base.StationZULULocation", baseChanceMilitaryVehicles);
        end
        if SandboxVars.MoreMaps.MilitaryAirportMap and getActivatedMods():contains("Militaryairport") then
            addMapToMilitaryZombies("Base.MilitaryAirportMap", baseChanceMilitaryZombies);
            addMapToSurvivorBag("Base.MilitaryAirportMap", baseChanceSurvivorBag/2);
            addMapToPoliceGlovebox("Base.MilitaryAirportMap", baseChanceGlovebox/4);
            addMapToMilitaryVehicles("Base.MilitaryAirportMap", baseChanceMilitaryVehicles);
        end
        if SandboxVars.MoreMaps.FortKnoxMaps and getActivatedMods():contains("FortKnoxLinked") and getActivatedMods():contains("InGameMaps") then
            -- Full Fort Knox map
            addMapToMilitaryZombies("Base.FK_FortKnoxMap", baseChanceMilitaryZombies/4);
            addMapToSurvivorBag("Base.FK_FortKnoxMap", baseChanceSurvivorBag/4);
            addMapToPoliceGlovebox("Base.FK_FortKnoxMap", baseChanceGlovebox/4);
            addMapToMilitaryVehicles("Base.FK_FortKnoxMap", baseChanceMilitaryVehicles/4);
        end       
        if SandboxVars.MoreMaps.FortRockRidgeMap and getActivatedMods():contains("Fort Rock Ridge") then
            -- FortRockRidgeMap
            addMapToMilitaryZombies("Base.FortRockRidgeMap", baseChanceMilitaryZombies);
            addMapToSurvivorBag("Base.FortRockRidgeMap", baseChanceSurvivorBag/2);
            addMapToPoliceGlovebox("Base.FortRockRidgeMap", baseChanceGlovebox/2);
            addMapToMilitaryVehicles("Base.FortRockRidgeMap", baseChanceMilitaryVehicles);
        end       
        if SandboxVars.MoreMaps.FortWaterfrontMap and getActivatedMods():contains("Fort Waterfront") then
            addMapToMilitaryZombies("Base.FortWaterfrontMap", baseChanceMilitaryZombies);
            addMapToSurvivorBag("Base.FortWaterfrontMap", baseChanceSurvivorBag/2);
            addMapToPoliceGlovebox("Base.FortWaterfrontMap", baseChanceGlovebox/2);
            addMapToMilitaryVehicles("Base.FortWaterfrontMap", baseChanceMilitaryVehicles);
        end
        if SandboxVars.MoreMaps.MuldraughMilitaryBaseMap and getActivatedMods():contains("muldraughmilitarybase") then
            addMapToMilitaryZombies("Base.MuldraughMilitaryBaseMap", baseChanceMilitaryZombies);
            addMapToSurvivorBag("Base.MuldraughMilitaryBaseMap", baseChanceSurvivorBag/2);
            addMapToPoliceGlovebox("Base.MuldraughMilitaryBaseMap", baseChanceGlovebox/2);
            addMapToMilitaryVehicles("Base.MuldraughMilitaryBaseMap", baseChanceMilitaryVehicles);
        end
        if SandboxVars.MoreMaps.WesternMilitaryComplexMap and getActivatedMods():contains("MilitaryComplex") then
            -- WesternMilitaryComplexMap
            addMapToMilitaryZombies("Base.WesternMilitaryComplexMap", baseChanceMilitaryZombies);
            addMapToSurvivorBag("Base.MuldraughMilitaryBaseMap", baseChanceSurvivorBag/2);
            addMapToPoliceGlovebox("Base.MuldraughMilitaryBaseMap", baseChanceGlovebox/2);
            addMapToMilitaryVehicles("Base.MuldraughMilitaryBaseMap", baseChanceMilitaryVehicles);
        end

        
        if SandboxVars.MoreMaps.FortLoidMap and getActivatedMods():contains("FortLoid") then
            addMapToMilitaryZombies("Base.FortLoidMap", baseChanceZombies);
            addMapToSurvivorBag("Base.FortLoidMap", baseChanceSurvivorBag/2);
            addMapToPoliceGlovebox("Base.FortLoidMap", baseChanceGlovebox/2);
            addMapToMilitaryVehicles("Base.MuldraughMilitaryBaseMap", baseChanceMilitaryVehicles);
        end

        
    end
    if SandboxVars.MoreMaps.SmallTownWestMap then
        --SmallTownWestMap map
        addMapToTownZombies("Base.SmallTownWestMap", baseChanceZombies/4);
        addMapToCountrySideZombies("Base.SmallTownWestMap", baseChanceZombies/2);
        addMapToMechanics("Base.SmallTownWestMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.SmallTownWestMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.SmallTownWestMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.SmallTownWestMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.SmallTownWestMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.SmallTownWestMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.MuldraughWarehouseComplexMap", baseChanceCrateRandomJunk/2);
    end
    if SandboxVars.MoreMaps.CabinLocations then
        -- CabinLocation1
        addMapToCountrySideZombies("Base.CabinLocation1", baseChanceZombies/5);
        addMapToSurvivorBag("Base.CabinLocation1", baseChanceSurvivorBag/5);
        addMapToNormalGlovebox("Base.CabinLocation1", baseChanceGlovebox/10);
        -- CabinLocation2
        addMapToCountrySideZombies("Base.CabinLocation2", baseChanceZombies/5);
        addMapToSurvivorBag("Base.CabinLocation2", baseChanceSurvivorBag/5);
        addMapToNormalGlovebox("Base.CabinLocation2", baseChanceGlovebox/10);
        -- CabinLocation3
        if not getActivatedMods():contains("lakeivytownship") then -- compatibility with lake ivy township
            addMapToCountrySideZombies("Base.CabinLocation3", baseChanceZombies/5);
            addMapToSurvivorBag("Base.CabinLocation3", baseChanceSurvivorBag/5);
            addMapToNormalGlovebox("Base.CabinLocation3", baseChanceGlovebox/10);
        end
        -- CabinLocation4
        addMapToCountrySideZombies("Base.CabinLocation4", baseChanceZombies/5);
        addMapToSurvivorBag("Base.CabinLocation4", baseChanceSurvivorBag/5);
        addMapToNormalGlovebox("Base.CabinLocation4", baseChanceGlovebox/10);
        if not getActivatedMods():contains("Chinatown") then -- compatibility with chinatown
            -- CabinLocation5
            addMapToCountrySideZombies("Base.CabinLocation5", baseChanceZombies/5);
            addMapToSurvivorBag("Base.CabinLocation5", baseChanceSurvivorBag/5);
            addMapToNormalGlovebox("Base.CabinLocation5", baseChanceGlovebox/10);
        end
    end
    if SandboxVars.MoreMaps.CampGroundsLocation then
        --SmallTownWestMap map
        addMapToCountrySideZombies("Base.CampGroundsLocation", baseChanceZombies/5);
        addMapToMagazineRacks("Base.CampGroundsLocation", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.CampGroundsLocation", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.CampGroundsLocation", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.CampGroundsLocation", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.CampGroundsLocation", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.CampGroundsLocation", baseChanceCrateRandomJunk/4);
    end
    --AbandonedFactoryMap
    if SandboxVars.MoreMaps.AbandonedFactoryMap then
        --SmallTownWestMap map
        addMapToCountrySideZombies("Base.AbandonedFactoryMap", baseChanceZombies/5);
        addMapToSidetables("Base.AbandonedFactoryMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.AbandonedFactoryMap", baseChanceSurvivorBag/4);
        addMapToNormalGlovebox("Base.AbandonedFactoryMap", baseChanceGlovebox/4);
    end

    ------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------------------------------------------------
    --------------------- MOD MAPS -----------------------------------------------------------------------
    ------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------------------------------------------------
    
    ------------------------------------------------------------------------------------------------------
    -------------------- Distribution tweaks of the map items that already exist--------------------------
    ------------------------------------------------------------------------------------------------------
    if getActivatedMods():contains("BedfordFalls") then 
        addMapToTownZombies("Base.BedfordMap", baseChanceZombies/2);
        addMapToMechanics("Base.BedfordMap", baseChanceMechanics/2);
        addMapToSidetables("Base.BedfordMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.BedfordMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.BedfordMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.BedfordMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.BedfordMap", baseChanceCrateRandomJunk/2);
    end
    if getActivatedMods():contains("Fantasiado ST. Bernard's Hill") then
        addMapToTownZombies("Base.STBernardHillMap", baseChanceZombies/2);
        addMapToMechanics("Base.STBernardHillMap", baseChanceMechanics/2);
        addMapToSidetables("Base.STBernardHillMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.STBernardHillMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.STBernardHillMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.STBernardHillMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.STBernardHillMap", baseChanceCrateRandomJunk/2);
    end
    if getActivatedMods():contains("RabbitHashKY") then
        -- other containers are already done
        addMapToMapCratesFactories("Base.RabbitHashMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.RabbitHashMap", baseChanceCrateRandomJunk/2);
    end
    if getActivatedMods():contains("lakeivytownship") then
        addMapToTownZombies("Base.li_townshipmap", baseChanceZombies/2);
        addMapToCountrySideZombies("Base.li_townshipmap", baseChanceZombies);
        addMapToMechanics("Base.li_townshipmap", baseChanceMechanics);
        addMapToMagazineRacks("Base.li_townshipmap", baseChanceMagazineRacks);
        addMapToSidetables("Base.li_townshipmap", baseChanceSideTable);
        addMapToSurvivorBag("Base.li_townshipmap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.li_townshipmap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.li_townshipmap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.li_townshipmap", baseChanceCrateRandomJunk);
    end
    if getActivatedMods():contains("Utopia") then
        addMapToTownZombies("Base.UtopiaMap", baseChanceZombies/2);
        addMapToCountrySideZombies("Base.UtopiaMap", baseChanceZombies/2);
        addMapToMechanics("Base.UtopiaMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.UtopiaMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.UtopiaMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.UtopiaMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.UtopiaMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.UtopiaMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.UtopiaMap", baseChanceCrateRandomJunk);
    end
    if getActivatedMods():contains("MonmouthCounty_new") then
        addMapToTownZombies("Base.monmouthcountymap", baseChanceZombies/2);
        addMapToCountrySideZombies("Base.monmouthcountymap", baseChanceZombies/5);
        addMapToMechanics("Base.monmouthcountymap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.monmouthcountymap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.monmouthcountymap", baseChanceSideTable);
        addMapToSurvivorBag("Base.monmouthcountymap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.monmouthcountymap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.monmouthcountymap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.monmouthcountymap", baseChanceCrateRandomJunk);
    end
    if getActivatedMods():contains("SPH") then
        addMapToTownZombies("Base.StPauloHammerMap", baseChanceZombies/2);
        addMapToCountrySideZombies("Base.StPauloHammerMap", baseChanceZombies/5);
        addMapToMechanics("Base.StPauloHammerMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.StPauloHammerMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.StPauloHammerMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.StPauloHammerMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.StPauloHammerMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.StPauloHammerMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.StPauloHammerMap", baseChanceCrateRandomJunk);
    end
    if getActivatedMods():contains("Greenport") then
        addMapToTownZombies("Base.GreenportLootableMap", baseChanceZombies/2);
        addMapToCountrySideZombies("Base.GreenportLootableMap", baseChanceZombies/5);
        addMapToMechanics("Base.GreenportLootableMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.GreenportLootableMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.GreenportLootableMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.GreenportLootableMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.GreenportLootableMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.GreenportLootableMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.GreenportLootableMap", baseChanceCrateRandomJunk);
    end
    if getActivatedMods():contains("tikitown") then
        addMapToTownZombies("Tikitown.TikitownLootableMap", baseChanceZombies/5);
        addMapToCountrySideZombies("Tikitown.TikitownLootableMap", baseChanceZombies/10);
        addMapToMechanics("Tikitown.TikitownLootableMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Tikitown.TikitownLootableMap", baseChanceMagazineRacks/4);
        addMapToSidetables("Tikitown.TikitownLootableMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Tikitown.TikitownLootableMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Tikitown.TikitownLootableMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Tikitown.TikitownLootableMap", baseChanceMapFactoryCrate/4);
        addMapToCrateRandomJunk("Tikitown.TikitownLootableMap", baseChanceCrateRandomJunk/4);
    end
    if getActivatedMods():contains("Trelai_4x4_Steam") then
        addMapToTownZombies("Trelai.trelaimap", baseChanceZombies/10);
        addMapToCountrySideZombies("Trelai.trelaimap", baseChanceZombies/10);
        addMapToMechanics("Trelai.trelaimap", baseChanceMechanics/8);
        addMapToMagazineRacks("Trelai.trelaimap", baseChanceMagazineRacks/8);
        addMapToSidetables("Trelai.trelaimap", baseChanceSideTable/8);
        addMapToSurvivorBag("Trelai.trelaimap", baseChanceSurvivorBag/8);
        addMapToGloveboxes("Trelai.trelaimap", baseChanceGlovebox/8);
        addMapToMapCratesFactories("Trelai.trelaimap", baseChanceMapFactoryCrate/8);
        addMapToCrateRandomJunk("Trelai.trelaimap", baseChanceCrateRandomJunk/8);
        
        addMapToTownZombies("Trelai.trelaimap4", baseChanceZombies/5);
        addMapToCountrySideZombies("Trelai.trelaimap4", baseChanceZombies/5);
        addMapToMechanics("Trelai.trelaimap4", baseChanceMechanics/2);
        addMapToMagazineRacks("Trelai.trelaimap4", baseChanceMagazineRacks/2);
        addMapToSidetables("Trelai.trelaimap4", baseChanceSideTable/2);
        addMapToSurvivorBag("Trelai.trelaimap4", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Trelai.trelaimap4", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Trelai.trelaimap4", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Trelai.trelaimap4", baseChanceCrateRandomJunk/2);
        
        addMapToTownZombies("Trelai.trelaimap3", baseChanceZombies/5);
        addMapToCountrySideZombies("Trelai.trelaimap3", baseChanceZombies/5);
        addMapToMechanics("Trelai.trelaimap3", baseChanceMechanics/2);
        addMapToMagazineRacks("Trelai.trelaimap3", baseChanceMagazineRacks/2);
        addMapToSidetables("Trelai.trelaimap3", baseChanceSideTable/2);
        addMapToSurvivorBag("Trelai.trelaimap3", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Trelai.trelaimap3", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Trelai.trelaimap3", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Trelai.trelaimap3", baseChanceCrateRandomJunk/2);
    end
    if getActivatedMods():contains("Myhometown") then
        -- addMapToMedicalZombies("Base.Homepie", baseChanceZombies)
        addMapToTownZombies("Base.Homepie", baseChanceZombies/4)
        -- addMapToCountrySideZombies("Base.Homepie", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.Homepie", baseChanceZombies);
        addMapToMechanics("Base.Homepie", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.Homepie", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.Homepie", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.Homepie", baseChanceSurvivorBag/4);
        -- addMapToPoliceGlovebox("Base.Homepie", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.Homepie", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.Homepie", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.Homepie", baseChanceCrateRandomJunk/4);

    end

    if getActivatedMods():contains("Tandil") then
        addMapToTownZombies("Base.TandilLootableMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.TandilLootableMap", baseChanceZombies/4)
        addMapToMechanics("Base.TandilLootableMap", baseChanceMechanics/2);
        addMapToSidetables("Base.TandilLootableMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.TandilLootableMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.TandilLootableMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.TandilLootableMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.TandilLootableMap", baseChanceCrateRandomJunk);
    end
    if getActivatedMods():contains("NewTersh") then
        addMapToTownZombies("Base.NewTershLootableMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.NewTershLootableMap", baseChanceZombies/4)
        addMapToMechanics("Base.NewTershLootableMap", baseChanceMechanics/2);
        addMapToSidetables("Base.NewTershLootableMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.NewTershLootableMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.NewTershLootableMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.NewTershLootableMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.NewTershLootableMap", baseChanceCrateRandomJunk);
    end
    if getActivatedMods():contains("Bourstrange") then
        addMapToTownZombies("Base.BourstrangeMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.BourstrangeMap", baseChanceZombies/4)
        addMapToMechanics("Base.BourstrangeMap", baseChanceMechanics/2);
        addMapToSidetables("Base.BourstrangeMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.BourstrangeMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.BourstrangeMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.BourstrangeMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.BourstrangeMap", baseChanceCrateRandomJunk);
    end
    if getActivatedMods():contains("pineville") then
        addMapToTownZombies("Base.PinevilleMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.PinevilleMap", baseChanceZombies/4)
        addMapToMechanics("Base.PinevilleMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.PinevilleMap", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.PinevilleMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.PinevilleMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.PinevilleMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.PinevilleMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.PinevilleMap", baseChanceCrateRandomJunk);
    end
    if getActivatedMods():contains("Taylorsville") then
        addMapToTownZombies("Base.TaylorsvilleMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.TaylorsvilleMap", baseChanceZombies/4)
        addMapToMechanics("Base.TaylorsvilleMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.TaylorsvilleMap", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.TaylorsvilleMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.TaylorsvilleMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.TaylorsvilleMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.TaylorsvilleMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.TaylorsvilleMap", baseChanceCrateRandomJunk);
    end
    if getActivatedMods():contains("Diggertown") then
        -- addMapToMedicalZombies("Base.DTownTunnelMap", baseChanceZombies)
        addMapToTownZombies("Base.DTownTunnelMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.DTownTunnelMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.DTownTunnelMap", baseChanceZombies);
        addMapToMechanics("Base.DTownTunnelMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.DTownTunnelMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.DTownTunnelMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.DTownTunnelMap", baseChanceSurvivorBag);
        -- addMapToPoliceGlovebox("Base.DTownTunnelMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.DTownTunnelMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.DTownTunnelMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.DTownTunnelMap", baseChanceCrateRandomJunk);

        -- addMapToMedicalZombies("Base.DTownTunnelMap", baseChanceZombies)
        addMapToTownZombies("Base.DTownRoadMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.DTownRoadMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.DTownRoadMap", baseChanceZombies);
        addMapToMechanics("Base.DTownRoadMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.DTownRoadMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.DTownRoadMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.DTownRoadMap", baseChanceSurvivorBag);
        -- addMapToPoliceGlovebox("Base.DTownRoadMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.DTownRoadMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.DTownRoadMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.DTownRoadMap", baseChanceCrateRandomJunk);
    end

    -- if getActivatedMods():contains("DeadinHongKong") then
    --     addMapToTownZombies("Base.HongKongCityMap", baseChanceZombies/5);
    --     addMapToMechanics("Base.HongKongCityMap", baseChanceMechanics/5);
    --     addMapToMagazineRacks("Base.HongKongCityMap", baseChanceMechanics/5);
    --     addMapToSidetables("Base.HongKongCityMap", baseChanceSideTable/5);
    --     addMapToSurvivorBag("Base.HongKongCityMap", baseChanceSurvivorBag/5);
    --     addMapToGloveboxes("Base.HongKongCityMap", baseChanceGlovebox/5);
    --     addMapToMapCratesFactories("Base.HongKongCityMap", baseChanceMapFactoryCrate/5);
    --     addMapToCrateRandomJunk("Base.HongKongCityMap", baseChanceCrateRandomJunk/5);
    -- end
    ------------------------------------------------------------------------------------------------------
    ---------------------------- end of distribution tweaks ----------------------------------------------
    ------------------------------------------------------------------------------------------------------

    if SandboxVars.MoreMaps.GrapeseedMap and getActivatedMods():contains("Grapeseed") then
        -- GrapeseedMap
        addMapToTownZombies("Base.GrapeseedMap", baseChanceZombies);
        addMapToMechanics("Base.GrapeseedMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.GrapeseedMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.GrapeseedMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.GrapeseedMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.GrapeseedMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.GrapeseedMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.GrapeseedMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.BlackwoodMap and getActivatedMods():contains("Blackwood") then
        -- BlackwoodMap
        addMapToTownZombies("Base.BlackwoodMap", baseChanceZombies);
        addMapToMilitaryZombies("Base.BlackwoodMap", baseChanceMilitaryZombies/10);
        addMapToMechanics("Base.BlackwoodMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.BlackwoodMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.BlackwoodMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.BlackwoodMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.BlackwoodMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.BlackwoodMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.BlackwoodMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.PitstopMap and getActivatedMods():contains("Pitstop") then
        -- PitstopMap
        addMapToTownZombies("Base.PitstopMap", baseChanceZombies);
        addMapToMechanics("Base.PitstopMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.PitstopMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.PitstopMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.PitstopMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.PitstopMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.PitstopMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.PitstopMap", baseChanceCrateRandomJunk);
    end





    if SandboxVars.MoreMaps.OverTheRiverMap and getActivatedMods():contains("Otr") then
        -- OverTheRiverMap
        addMapToTownZombies("Base.OverTheRiverMap", baseChanceZombies);
        addMapToMechanics("Base.OverTheRiverMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.OverTheRiverMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.OverTheRiverMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.OverTheRiverMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.OverTheRiverMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.OverTheRiverMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.OverTheRiverMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.WeatherStationLocations and getActivatedMods():contains("SaveOurStation_KnoxCountry") then
        -- StationRIVS500Location
        addMapToTownZombies("Base.StationRIVS500Location", baseChanceZombies/5);
        addMapToMilitaryZombies("Base.StationRIVS500Location", baseChanceMilitaryZombies/5);
        addMapToSurvivorBag("Base.StationRIVS500Location", baseChanceSurvivorBag/2);
        addMapToNormalGlovebox("Base.StationRIVS500Location", baseChanceGlovebox/5);
        addMapToRadioTruck("Base.StationRIVS500Location", baseChanceGlovebox);
        --StationWESTP88Location
        addMapToTownZombies("Base.StationWESTP88Location", baseChanceZombies/5);
        addMapToMilitaryZombies("Base.StationWESTP88Location", baseChanceMilitaryZombies/5);
        addMapToSurvivorBag("Base.StationWESTP88Location", baseChanceSurvivorBag/2);
        addMapToNormalGlovebox("Base.StationWESTP88Location", baseChanceGlovebox/5);
        addMapToRadioTruck("Base.StationWESTP88Location", baseChanceGlovebox);
        --StationROSE099Location
        addMapToTownZombies("Base.StationROSE099Location", baseChanceZombies/5);
        addMapToMilitaryZombies("Base.StationROSE099Location", baseChanceMilitaryZombies/5);
        addMapToSurvivorBag("Base.StationROSE099Location", baseChanceSurvivorBag/2);
        addMapToNormalGlovebox("Base.StationROSE099Location", baseChanceGlovebox/5);
        addMapToRadioTruck("Base.StationROSE099Location", baseChanceGlovebox);
        --StationMULD650Location
        addMapToTownZombies("Base.StationMULD650Location", baseChanceZombies/5);
        addMapToMilitaryZombies("Base.StationMULD650Location", baseChanceMilitaryZombies/5);
        addMapToSurvivorBag("Base.StationMULD650Location", baseChanceSurvivorBag/2);
        addMapToNormalGlovebox("Base.StationMULD650Location", baseChanceGlovebox/5);
        addMapToRadioTruck("Base.StationMULD650Location", baseChanceGlovebox);
    end
	if SandboxVars.MoreMaps.MarchRidgeExpansionMap and getActivatedMods():contains("MRE") then
        addMapToTownZombies("Base.MarchRidgeExpansionMap", baseChanceZombies/3);
        addMapToMechanics("Base.MarchRidgeExpansionMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.MarchRidgeExpansionMap", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.MarchRidgeExpansionMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.MarchRidgeExpansionMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.MarchRidgeExpansionMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.MarchRidgeExpansionMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.MarchRidgeExpansionMap", baseChanceCrateRandomJunk/4);
    end
	if SandboxVars.MoreMaps.CONResearchMap and getActivatedMods():contains("CONRTF") then
        addMapToTownZombies("Base.CONResearchMap", baseChanceZombies/10);
        addMapToMilitaryZombies("Base.CONResearchMap", baseChanceMilitaryZombies/2);
        addMapToSurvivorBag("Base.CONResearchMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.CONResearchMap", baseChanceGlovebox);
    end
    if SandboxVars.MoreMaps.RosewoodExpansionMap and getActivatedMods():contains("pz_rosewoodexp_map") then
        
        addMapToTownZombies("Base.RosewoodExpansionMap", baseChanceZombies);
        addMapToMechanics("Base.RosewoodExpansionMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.RosewoodExpansionMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.RosewoodExpansionMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.RosewoodExpansionMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.RosewoodExpansionMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.RosewoodExpansionMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.RosewoodExpansionMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.LittleTownshipMap and getActivatedMods():contains("LittleTownship") then
        -- LittleTownshipMap
        addMapToTownZombies("Base.LittleTownshipMap", baseChanceZombies);
        addMapToCountrySideZombies("Base.LittleTownshipMap", baseChanceZombies/4);
        addMapToMechanics("Base.LittleTownshipMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.LittleTownshipMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.LittleTownshipMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.LittleTownshipMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.LittleTownshipMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.LittleTownshipMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.LittleTownshipMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.LindenMap and getActivatedMods():contains("Linden") then
        -- LindenMap
        addMapToTownZombies("Base.LindenMap", baseChanceZombies);
        addMapToMechanics("Base.LindenMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.LindenMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.LindenMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.LindenMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.LindenMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.LindenMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.LindenMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.RefordvilleMap and getActivatedMods():contains("Refordville") then
        -- LindenMap
        addMapToTownZombies("Base.RefordvilleMap", baseChanceZombies);
        addMapToMechanics("Base.RefordvilleMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.RefordvilleMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.RefordvilleMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.RefordvilleMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.RefordvilleMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.RefordvilleMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.RefordvilleMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.ChinatownMap and getActivatedMods():contains("Chinatown") then
        -- ChinatownMap
        addMapToTownZombies("Base.ChinatownMap", baseChanceZombies);
        addMapToMechanics("Base.ChinatownMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.ChinatownMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.ChinatownMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.ChinatownMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.ChinatownMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.ChinatownMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.ChinatownMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.ChernavilleMap and getActivatedMods():contains("Chernaville") then
        -- Chernaville Map
        addMapToTownZombies("Base.ChernavilleMap", baseChanceZombies);
        addMapToMechanics("Base.ChernavilleMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.ChernavilleMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.ChernavilleMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.ChernavilleMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.ChernavilleMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.ChernavilleMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.ChernavilleMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.BlueberryMap and getActivatedMods():contains("Blueberry") then
        -- Blueberry Map
        addMapToTownZombies("Base.BlueberryMap", baseChanceZombies);
        addMapToMechanics("Base.BlueberryMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.BlueberryMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.BlueberryMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.BlueberryMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.BlueberryMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.BlueberryMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.BlueberryMap", baseChanceCrateRandomJunk);
    end
	-- if SandboxVars.MoreMaps.WestPointFireDepartmentMap and getActivatedMods():contains("West Point Fire Department") then
        -- WestPointFireDepartmentMap
        -- REMOVED for now
    -- end
    if SandboxVars.MoreMaps.WestPointSouthTrailerParkMap and getActivatedMods():contains("WestPointTrailerParkAndVhsStore") then
        -- WestPointSouthTrailerParkMap
        addMapToTownZombies("Base.WestPointSouthTrailerParkMap", baseChanceZombies/4);
        addMapToCountrySideZombies("Base.WestPointSouthTrailerParkMap", baseChanceZombies/4);
        addMapToMechanics("Base.WestPointSouthTrailerParkMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.WestPointSouthTrailerParkMap", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.WestPointSouthTrailerParkMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.WestPointSouthTrailerParkMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.WestPointSouthTrailerParkMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.WestPointSouthTrailerParkMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.WestPointSouthTrailerParkMap", baseChanceCrateRandomJunk/2);
    end
    if SandboxVars.MoreMaps.KingsmouthMap and getActivatedMods():contains("KingsmouthKY") then
        -- KingsmouthMap
        addMapToTownZombies("Base.KingsmouthMap", baseChanceZombies/2);
        addMapToMechanics("Base.KingsmouthMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.KingsmouthMap", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.KingsmouthMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.KingsmouthMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.KingsmouthMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.KingsmouthMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.KingsmouthMap", baseChanceCrateRandomJunk/2);
    end
    if SandboxVars.MoreMaps.SurvivorWarehouseLocation and getActivatedMods():contains("survivorwarehouse") then
        -- Survivor Warehouse Location
        addMapToCountrySideZombies("Base.SurvivorWarehouseLocation", baseChanceZombies/2);
        addMapToSidetables("Base.SurvivorWarehouseLocation", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.SurvivorWarehouseLocation", baseChanceSurvivorBag/2);
        addMapToNormalGlovebox("Base.SurvivorWarehouseLocation", baseChanceGlovebox/4);
    end
    if SandboxVars.MoreMaps.CompleteRavenCreekMap and getActivatedMods():contains("RavenCreek")  then
        -- Full Raven Creek Map
        addMapToTownZombies("Base.RavenCreekMap", baseChanceZombies/20);
        addMapToMilitaryZombies("Base.RavenCreekMap", baseChanceMilitaryZombies/20);
        addMapToMechanics("Base.RavenCreekMap", baseChanceMechanics/15);
        addMapToMagazineRacks("Base.RavenCreekMap", baseChanceMagazineRacks/15);
        addMapToSidetables("Base.RavenCreekMap", baseChanceSideTable/20);
        addMapToSurvivorBag("Base.RavenCreekMap", baseChanceSurvivorBag/5);
        addMapToGloveboxes("Base.RavenCreekMap", baseChanceGlovebox/15);
        addMapToMapCratesFactories("Base.RavenCreekMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.RavenCreekMap", baseChanceCrateRandomJunk/20);
    end
    if SandboxVars.MoreMaps.RavenCreekDistrictMaps and getActivatedMods():contains("RavenCreek") then
        -- NorthRavenCreekMap
        addMapToTownZombies("Base.NorthRavenCreekMap", baseChanceZombies/5);
        addMapToMechanics("Base.NorthRavenCreekMap", baseChanceMechanics/5);
        addMapToMagazineRacks("Base.NorthRavenCreekMap", baseChanceMagazineRacks/5);
        addMapToSidetables("Base.NorthRavenCreekMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.NorthRavenCreekMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.NorthRavenCreekMap", baseChanceGlovebox/5);
        addMapToMapCratesFactories("Base.NorthRavenCreekMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.NorthRavenCreekMap", baseChanceCrateRandomJunk/2);
        -- SouthEastRavenCreekMap
        addMapToTownZombies("Base.SouthEastRavenCreekMap", baseChanceZombies/5);
        addMapToMechanics("Base.SouthEastRavenCreekMap", baseChanceMechanics/5);
        addMapToMagazineRacks("Base.SouthEastRavenCreekMap", baseChanceMagazineRacks/5);
        addMapToSidetables("Base.SouthEastRavenCreekMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.SouthEastRavenCreekMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.SouthEastRavenCreekMap", baseChanceGlovebox/5);
        addMapToMapCratesFactories("Base.SouthEastRavenCreekMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.SouthEastRavenCreekMap", baseChanceCrateRandomJunk/2);
         -- RavenCreekPortFacilitiesMap
        addMapToTownZombies("Base.RavenCreekPortFacilitiesMap", baseChanceZombies/5);
        addMapToMechanics("Base.RavenCreekPortFacilitiesMap", baseChanceMechanics/5);
        addMapToMagazineRacks("Base.RavenCreekPortFacilitiesMap", baseChanceMagazineRacks/5);
        addMapToSidetables("Base.RavenCreekPortFacilitiesMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.RavenCreekPortFacilitiesMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.RavenCreekPortFacilitiesMap", baseChanceGlovebox/5);
        addMapToMapCratesFactories("Base.RavenCreekPortFacilitiesMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.RavenCreekPortFacilitiesMap", baseChanceCrateRandomJunk/2);

         -- RavenCreekSouthernTownMap
         addMapToTownZombies("Base.RavenCreekSouthernTownMap", baseChanceZombies/5);
         addMapToMechanics("Base.RavenCreekSouthernTownMap", baseChanceMechanics/5);
         addMapToMagazineRacks("Base.RavenCreekSouthernTownMap", baseChanceMagazineRacks/5);
         addMapToSidetables("Base.RavenCreekSouthernTownMap", baseChanceSideTable/2);
         addMapToSurvivorBag("Base.RavenCreekSouthernTownMap", baseChanceSurvivorBag/2);
         addMapToGloveboxes("Base.RavenCreekSouthernTownMap", baseChanceGlovebox/5);
         addMapToMapCratesFactories("Base.RavenCreekSouthernTownMap", baseChanceMapFactoryCrate/5);
         addMapToCrateRandomJunk("Base.RavenCreekSouthernTownMap", baseChanceCrateRandomJunk/2);

    end
	if SandboxVars.MoreMaps.GreenleafMap and getActivatedMods():contains("Greenleaf") then
        -- Greenleaf Map
        addMapToTownZombies("Base.GreenleafMap", baseChanceZombies/10);
        addMapToCountrySideZombies("Base.GreenleafMap", baseChanceZombies);
        addMapToMechanics("Base.GreenleafMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.GreenleafMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.GreenleafMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.GreenleafMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.GreenleafMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.GreenleafMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.GreenleafMap", baseChanceCrateRandomJunk);
    end
	if SandboxVars.MoreMaps.CoryerdonMap and getActivatedMods():contains("coryerdon") then
        -- EastCoryerdonMap Map
        addMapToTownZombies("Base.EastCoryerdonMap", baseChanceZombies);
        addMapToMechanics("Base.EastCoryerdonMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.EastCoryerdonMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.EastCoryerdonMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.EastCoryerdonMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.EastCoryerdonMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.EastCoryerdonMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.EastCoryerdonMap", baseChanceCrateRandomJunk);
        -- SouthCoryerdonMap Map
        addMapToTownZombies("Base.SouthCoryerdonMap", baseChanceZombies);
        addMapToMechanics("Base.SouthCoryerdonMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.SouthCoryerdonMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.SouthCoryerdonMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.SouthCoryerdonMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.SouthCoryerdonMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.SouthCoryerdonMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.SouthCoryerdonMap", baseChanceCrateRandomJunk);
        -- CenterCoryerdonMap Map
        addMapToTownZombies("Base.CenterCoryerdonMap", baseChanceZombies);
        addMapToMechanics("Base.CenterCoryerdonMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.CenterCoryerdonMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.CenterCoryerdonMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.CenterCoryerdonMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.CenterCoryerdonMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.CenterCoryerdonMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.CenterCoryerdonMap", baseChanceCrateRandomJunk);
    end

	if SandboxVars.MoreMaps.OldParkTownMap and getActivatedMods():contains("ParkingLot") then
        -- OldPark Town Map
        addMapToTownZombies("Base.OldParkTownMap", baseChanceZombies/2);
        addMapToMechanics("Base.OldParkTownMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.OldParkTownMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.OldParkTownMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.OldParkTownMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.OldParkTownMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.OldParkTownMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.OldParkTownMap", baseChanceCrateRandomJunk/2);
    end


    if SandboxVars.MoreMaps.SlocanLakeMaps and (getActivatedMods():contains("SlocanLake") or getActivatedMods():contains("RavenCreekEerieCompatibleSlocanLake")) then   
        addMapToTownZombies("Base.SL_NewDenverMap", baseChanceZombies);
        addMapToCountrySideZombies("Base.SL_NewDenverMap", baseChanceZombies);
        addMapToMechanics("Base.SL_NewDenverMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.SL_NewDenverMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.SL_NewDenverMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.SL_NewDenverMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.SL_NewDenverMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.SL_NewDenverMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.SL_NewDenverMap", baseChanceCrateRandomJunk);

        addMapToTownZombies("Base.SL_RoseberyMap", baseChanceZombies);
        addMapToCountrySideZombies("Base.SL_RoseberyMap", baseChanceZombies);
        addMapToMechanics("Base.SL_RoseberyMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.SL_RoseberyMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.SL_RoseberyMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.SL_RoseberyMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.SL_RoseberyMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.SL_RoseberyMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.SL_RoseberyMap", baseChanceCrateRandomJunk);

        addMapToTownZombies("Base.SL_SilvertonMap", baseChanceZombies);
        addMapToCountrySideZombies("Base.SL_SilvertonMap", baseChanceZombies);
        addMapToMechanics("Base.SL_SilvertonMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.SL_SilvertonMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.SL_SilvertonMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.SL_SilvertonMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.SL_SilvertonMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.SL_SilvertonMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.SL_SilvertonMap", baseChanceCrateRandomJunk);

    end

    -- MAPS REQUIRING THE MOD "INGAME MAPS TO WORK"
    if getActivatedMods():contains("InGameMaps") then
        if SandboxVars.MoreMaps.WestPointExpansionMap and getActivatedMods():contains("WestPointExpansion") then
            addMapToTownZombies("Base.WestPointExpansionMap", baseChanceZombies);
            addMapToMechanics("Base.WestPointExpansionMap", baseChanceMechanics);
            addMapToMagazineRacks("Base.WestPointExpansionMap", baseChanceMagazineRacks);
            addMapToSidetables("Base.WestPointExpansionMap", baseChanceSideTable);
            addMapToSurvivorBag("Base.WestPointExpansionMap", baseChanceSurvivorBag);
            addMapToGloveboxes("Base.WestPointExpansionMap", baseChanceGlovebox);
            addMapToMapCratesFactories("Base.WestPointExpansionMap", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.WestPointExpansionMap", baseChanceCrateRandomJunk);
        end
        if SandboxVars.MoreMaps.GlenportMap and getActivatedMods():contains("Glenport") then
            addMapToTownZombies("Base.GlenportMap", baseChanceZombies);
            addMapToMechanics("Base.WestPointExpansionMap", baseChanceMechanics);
            addMapToMagazineRacks("Base.WestPointExpansionMap", baseChanceMagazineRacks);
            addMapToSidetables("Base.WestPointExpansionMap", baseChanceSideTable);
            addMapToSurvivorBag("Base.WestPointExpansionMap", baseChanceSurvivorBag);
            addMapToGloveboxes("Base.WestPointExpansionMap", baseChanceGlovebox);
            addMapToMapCratesFactories("Base.WestPointExpansionMap", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.WestPointExpansionMap", baseChanceCrateRandomJunk);
        end
        if SandboxVars.MoreMaps.CompleteEerieCountryMap and getActivatedMods():contains("EerieCountry") then
            addMapToCountrySideZombies("Base.CompleteEerieCountryMap", baseChanceZombies/30);
            addMapToMilitaryZombies("Base.CompleteEerieCountryMap", baseChanceMilitaryZombies/20);
            addMapToMechanics("Base.WestPointExpansionMap", baseChanceMechanics/20);
            addMapToMagazineRacks("Base.WestPointExpansionMap", baseChanceMagazineRacks/40);
            addMapToSidetables("Base.WestPointExpansionMap", baseChanceSideTable/20);
            addMapToSurvivorBag("Base.WestPointExpansionMap", baseChanceSurvivorBag/10);
            addMapToGloveboxes("Base.WestPointExpansionMap", baseChanceGlovebox/20);
            addMapToMapCratesFactories("Base.WestPointExpansionMap", baseChanceMapFactoryCrate/20);
            addMapToCrateRandomJunk("Base.WestPointExpansionMap", baseChanceCrateRandomJunk/20);
        end
        
        if SandboxVars.MoreMaps.EerieCountryDifferentMaps and getActivatedMods():contains("EerieCountry") then

            addMapToMilitaryZombies("Base.EC_CustomsBorderZoneMap", baseChanceMilitaryZombies/4);
            addMapToMechanics("Base.EC_CustomsBorderZoneMap", baseChanceMechanics/4);
            addMapToMagazineRacks("Base.EC_CustomsBorderZoneMap", baseChanceMagazineRacks/4);
            addMapToSidetables("Base.EC_CustomsBorderZoneMap", baseChanceSideTable/4);
            addMapToSurvivorBag("Base.EC_CustomsBorderZoneMap", baseChanceSurvivorBag/4);
            addMapToGloveboxes("Base.EC_CustomsBorderZoneMap", baseChanceGlovebox/4);
            addMapToMapCratesFactories("Base.EC_CustomsBorderZoneMap", baseChanceMapFactoryCrate/4);
            addMapToCrateRandomJunk("Base.EC_CustomsBorderZoneMap", baseChanceCrateRandomJunk/4);
            
            addMapToTownZombies("Base.EC_CentraliaMap", baseChanceZombies);
            addMapToCountrySideZombies("Base.EC_CentraliaMap", baseChanceZombies);
            addMapToMechanics("Base.EC_CentraliaMap", baseChanceMechanics);
            addMapToMagazineRacks("Base.EC_CentraliaMap", baseChanceMagazineRacks);
            addMapToSidetables("Base.EC_CentraliaMap", baseChanceSideTable);
            addMapToSurvivorBag("Base.EC_CentraliaMap", baseChanceSurvivorBag/4);
            addMapToGloveboxes("Base.EC_CentraliaMap", baseChanceGlovebox);
            addMapToMapCratesFactories("Base.EC_CentraliaMap", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.EC_CentraliaMap", baseChanceCrateRandomJunk);

            addMapToTownZombies("Base.EC_TrainStationMap", baseChanceZombies/3);
            addMapToCountrySideZombies("Base.EC_TrainStationMap", baseChanceZombies/3);
            addMapToMilitaryZombies("Base.EC_TrainStationMap", baseChanceMilitaryZombies/3);
            addMapToMechanics("Base.EC_TrainStationMap", baseChanceMechanics/3);
            addMapToMagazineRacks("Base.EC_TrainStationMap", baseChanceMagazineRacks/3);
            addMapToSidetables("Base.EC_TrainStationMap", baseChanceSideTable/3);
            addMapToSurvivorBag("Base.EC_TrainStationMap", baseChanceSurvivorBag/3);
            addMapToGloveboxes("Base.EC_TrainStationMap", baseChanceGlovebox/3);
            addMapToMapCratesFactories("Base.EC_TrainStationMap", baseChanceMapFactoryCrate/3);
            addMapToCrateRandomJunk("Base.EC_TrainStationMap", baseChanceCrateRandomJunk/3);
            
            -- Dark Falls
            addMapToCountrySideZombies("Base.EC_DarkFallsMap", baseChanceZombies);
            addMapToSidetables("Base.EC_DarkFallsMap", baseChanceSideTable);
            addMapToSurvivorBag("Base.EC_DarkFallsMap", baseChanceSurvivorBag);
            addMapToGloveboxes("Base.EC_DarkFallsMap", baseChanceGlovebox);
            
            -- Hidden Swamps
            addMapToCountrySideZombies("Base.EC_HiddenSwampsMap", baseChanceZombies/2);
            addMapToSidetables("Base.EC_HiddenSwampsMap", baseChanceSideTable/2);
            addMapToSurvivorBag("Base.EC_HiddenSwampsMap", baseChanceSurvivorBag/2);
            addMapToGloveboxes("Base.EC_HiddenSwampsMap", baseChanceGlovebox/2);

            -- Sandito Airport
            addMapToTownZombies("Base.EC_SanDitoAirportMap", baseChanceZombies/3);
            addMapToCountrySideZombies("Base.EC_SanDitoAirportMap", baseChanceZombies/3);
            addMapToMilitaryZombies("Base.EC_SanDitoAirportMap", baseChanceMilitaryZombies/3);
            addMapToMechanics("Base.EC_SanDitoAirportMap", baseChanceMechanics/3);
            addMapToMagazineRacks("Base.EC_SanDitoAirportMap", baseChanceMagazineRacks/10);
            addMapToSidetables("Base.EC_SanDitoAirportMap", baseChanceSideTable/3);
            addMapToSurvivorBag("Base.EC_SanDitoAirportMap", baseChanceSurvivorBag/3);
            addMapToGloveboxes("Base.EC_SanDitoAirportMap", baseChanceGlovebox/3);
            addMapToMapCratesFactories("Base.EC_SanDitoAirportMap", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.EC_SanDitoAirportMap", baseChanceCrateRandomJunk/3);
            
            -- lake Heisenberg
            addMapToTownZombies("Base.EC_LakeHeisenbergMap", baseChanceZombies/3);
            addMapToCountrySideZombies("Base.EC_LakeHeisenbergMap", baseChanceZombies);
            addMapToSidetables("Base.EC_LakeHeisenbergMap", baseChanceSideTable/3);
            addMapToSurvivorBag("Base.EC_LakeHeisenbergMap", baseChanceSurvivorBag/3);
            addMapToGloveboxes("Base.EC_LakeHeisenbergMap", baseChanceGlovebox/3);
            -- Eren City
            addMapToTownZombies("Base.EC_ErenCityMap", baseChanceZombies);
            addMapToCountrySideZombies("Base.EC_ErenCityMap", baseChanceZombies);
            addMapToMechanics("Base.EC_ErenCityMap", baseChanceMechanics);
            addMapToMagazineRacks("Base.EC_ErenCityMap", baseChanceMagazineRacks);
            addMapToSidetables("Base.EC_ErenCityMap", baseChanceSideTable);
            addMapToSurvivorBag("Base.EC_ErenCityMap", baseChanceSurvivorBag/4);
            addMapToGloveboxes("Base.EC_ErenCityMap", baseChanceGlovebox);
            addMapToMapCratesFactories("Base.EC_ErenCityMap", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.EC_ErenCityMap", baseChanceCrateRandomJunk);
            -- Irvington
            addMapToTownZombies("Base.EC_IrvingtonMap", baseChanceZombies);
            addMapToCountrySideZombies("Base.EC_IrvingtonMap", baseChanceZombies);
            addMapToMechanics("Base.EC_IrvingtonMap", baseChanceMechanics);
            addMapToMagazineRacks("Base.EC_IrvingtonMap", baseChanceMagazineRacks);
            addMapToSidetables("Base.EC_IrvingtonMap", baseChanceSideTable);
            addMapToSurvivorBag("Base.EC_IrvingtonMap", baseChanceSurvivorBag/4);
            addMapToGloveboxes("Base.EC_IrvingtonMap", baseChanceGlovebox);
            addMapToMapCratesFactories("Base.EC_IrvingtonMap", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.EC_IrvingtonMap", baseChanceCrateRandomJunk);

            -- Rural Zone
            addMapToCountrySideZombies("Base.EC_RuralZoneMap", baseChanceZombies/2);
            addMapToMechanics("Base.EC_RuralZoneMap", baseChanceMechanics);
            addMapToMagazineRacks("Base.EC_RuralZoneMap", baseChanceMagazineRacks/10);
            addMapToSidetables("Base.EC_RuralZoneMap", baseChanceSideTable);
            addMapToSurvivorBag("Base.EC_RuralZoneMap", baseChanceSurvivorBag);
            addMapToGloveboxes("Base.EC_RuralZoneMap", baseChanceGlovebox);
            addMapToMapCratesFactories("Base.EC_RuralZoneMap", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.EC_RuralZoneMap", baseChanceCrateRandomJunk);

        end
        
        if SandboxVars.MoreMaps.FortKnoxMaps and getActivatedMods():contains("FortKnoxLinked") then
            
            -- Quitman
            addMapToTownZombies("Base.FK_QuitmanMap", baseChanceZombies);
            addMapToMechanics("Base.FK_QuitmanMap", baseChanceMechanics);
            addMapToMagazineRacks("Base.FK_QuitmanMap", baseChanceMagazineRacks);
            addMapToSidetables("Base.FK_QuitmanMap", baseChanceSideTable);
            addMapToSurvivorBag("Base.FK_QuitmanMap", baseChanceSurvivorBag);
            addMapToGloveboxes("Base.FK_QuitmanMap", baseChanceGlovebox);
            addMapToMapCratesFactories("Base.FK_QuitmanMap", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.FK_QuitmanMap", baseChanceCrateRandomJunk);

            -- Full Fort Knox added in military maps section

        end       

    end

    if SandboxVars.MoreMaps.BillionaireSafehouseLocation and getActivatedMods():contains("BillionaireSafehouse") then
        -- BillionaireSafehouseLocation
        addMapToTownZombies("Base.BillionaireSafehouseLocation", baseChanceZombies/10);
        addMapToSurvivorBag("Base.BillionaireSafehouseLocation", baseChanceSurvivorBag/2);
        addMapToNormalGlovebox("Base.BillionaireSafehouseLocation", baseChanceSurvivorBag/2);
    end

    if SandboxVars.MoreMaps.WildberriesMap and getActivatedMods():contains("wildberries") then
        -- WildberriesMap
        addMapToTownZombies("Base.WildberriesMap", baseChanceZombies/2);
        addMapToCountrySideZombies("Base.WildberriesMap", baseChanceZombies/5);
        addMapToMechanics("Base.WildberriesMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.WildberriesMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.WildberriesMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.WildberriesMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.WildberriesMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.WildberriesMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.WildberriesMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.TugalandMap and getActivatedMods():contains("Tugaland") then
        -- TugalandMap
        addMapToTownZombies("Base.TugalandMap", baseChanceZombies);
        addMapToCountrySideZombies("Base.TugalandMap", baseChanceZombies/10);
        addMapToMechanics("Base.TugalandMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.TugalandMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.TugalandMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.TugalandMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.TugalandMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.TugalandMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.TugalandMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.RemusMap and getActivatedMods():contains("RemusMapMod") then
        -- RemusMap
        addMapToTownZombies("Base.RemusMap", baseChanceZombies/5);
        addMapToCountrySideZombies("Base.RemusMap", baseChanceZombies/2);
        addMapToMechanics("Base.TugalandMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.TugalandMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.TugalandMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.TugalandMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.TugalandMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.TugalandMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.TugalandMap", baseChanceCrateRandomJunk/2);
    end
    if SandboxVars.MoreMaps.TrimbleCountyMaps and getActivatedMods():contains("TrimbleCountyPowerStation") then
        -- TrimbleCountyPowerStationMap
        addMapToMechanics("Base.TrimbleCountyPowerStationMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.TrimbleCountyPowerStationMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.TrimbleCountyPowerStationMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.TrimbleCountyPowerStationMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.TrimbleCountyPowerStationMap", baseChanceGlovebox/2);
        addMapToCrateRandomJunk("Base.TrimbleCountyPowerStationMap", baseChanceCrateRandomJunk/2);
        addMapToRadioTruck("Base.TrimbleCountyPowerStationMap", baseChanceGlovebox);

        -- TrimbleCountyLaGrangeMap
        addMapToTownZombies("Base.TrimbleCountyLaGrangeMap", baseChanceZombies/2);
        addMapToCountrySideZombies("Base.TrimbleCountyLaGrangeMap", baseChanceZombies/2);
        addMapToMechanics("Base.TrimbleCountyLaGrangeMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.TrimbleCountyLaGrangeMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.TrimbleCountyLaGrangeMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.TrimbleCountyLaGrangeMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.TrimbleCountyLaGrangeMap", baseChanceGlovebox/2);
        addMapToCrateRandomJunk("Base.TrimbleCountyLaGrangeMap", baseChanceCrateRandomJunk/2);
        addMapToMapCratesFactories("Base.TrimbleCountyLaGrangeMap", baseChanceMapFactoryCrate);
    end
    if SandboxVars.MoreMaps.EZPZCommunityCenterMap and getActivatedMods():contains("EZPZCenter") then
        -- EZPZCommunityCenterMap
        addMapToTownZombies("Base.EZPZCommunityCenterMap", baseChanceZombies/4);
        addMapToMechanics("Base.EZPZCommunityCenterMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.EZPZCommunityCenterMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.EZPZCommunityCenterMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.EZPZCommunityCenterMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.EZPZCommunityCenterMap", baseChanceGlovebox/2);
        addMapToCrateRandomJunk("Base.EZPZCommunityCenterMap", baseChanceCrateRandomJunk/2);
        addMapToMapCratesFactories("Base.EZPZCommunityCenterMap", baseChanceMapFactoryCrate);
    end
    if SandboxVars.MoreMaps.OldPineVillageMap and getActivatedMods():contains("Old Pine Village") then
        -- OldPineVillageMap
        addMapToTownZombies("Base.OldPineVillageMap", baseChanceZombies/2);
        addMapToMechanics("Base.OldPineVillageMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.OldPineVillageMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.OldPineVillageMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.OldPineVillageMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.OldPineVillageMap", baseChanceGlovebox/2);
        addMapToCrateRandomJunk("Base.OldPineVillageMap", baseChanceCrateRandomJunk/2);
        addMapToMapCratesFactories("Base.OldPineVillageMap", baseChanceMapFactoryCrate);
    end
    if SandboxVars.MoreMaps.ChristmasVillageMap and getActivatedMods():contains("ChristmasVillage") then
        -- ChristmasVillageMap
        addMapToTownZombies("Base.ChristmasVillageMap", baseChanceZombies/10);
        addMapToMechanics("Base.ChristmasVillageMap", baseChanceMechanics/10);
        addMapToMagazineRacks("Base.ChristmasVillageMap", baseChanceMagazineRacks/10);
        addMapToSidetables("Base.ChristmasVillageMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.ChristmasVillageMap", baseChanceSurvivorBag/10);
        addMapToGloveboxes("Base.ChristmasVillageMap", baseChanceGlovebox/10);
        addMapToCrateRandomJunk("Base.ChristmasVillageMap", baseChanceCrateRandomJunk/10);
        addMapToMapCratesFactories("Base.ChristmasVillageMap", baseChanceMapFactoryCrate);
    end
    if SandboxVars.MoreMaps.HyruleCountyMap and getActivatedMods():contains("Hyrule County") then
        -- HyruleCountyMap
        addMapToTownZombies("Base.HyruleCountyMap", baseChanceZombies/2);
        addMapToMechanics("Base.HyruleCountyMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.HyruleCountyMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.HyruleCountyMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.HyruleCountyMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.HyruleCountyMap", baseChanceGlovebox/4);
        addMapToCrateRandomJunk("Base.HyruleCountyMap", baseChanceCrateRandomJunk/2);
        addMapToMapCratesFactories("Base.HyruleCountyMap", baseChanceMapFactoryCrate);
    end
    if SandboxVars.MoreMaps.HongKongYauMaTeiMap and getActivatedMods():contains("DeadinHongKong") then
        -- HongKongYauMaTeiMap
        addMapToTownZombies("Base.HongKongYauMaTeiMap", baseChanceZombies/2);
        addMapToMechanics("Base.HongKongYauMaTeiMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.HongKongYauMaTeiMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.HongKongYauMaTeiMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.HongKongYauMaTeiMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.HongKongYauMaTeiMap", baseChanceGlovebox/4);
        addMapToCrateRandomJunk("Base.HongKongYauMaTeiMap", baseChanceCrateRandomJunk/2);
        addMapToMapCratesFactories("Base.HongKongYauMaTeiMap", baseChanceMapFactoryCrate);
    end
    
    if SandboxVars.MoreMaps.RiverwoodMap and getActivatedMods():contains("Riverwood") then
        -- RiverwoodMap
        addMapToTownZombies("Base.RiverwoodMap", baseChanceZombies/10);
        addMapToCountrySideZombies("Base.RiverwoodMap", baseChanceZombies);
        addMapToMechanics("Base.RiverwoodMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.RiverwoodMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.RiverwoodMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.RiverwoodMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.RiverwoodMap", baseChanceGlovebox/4);
        addMapToCrateRandomJunk("Base.RiverwoodMap", baseChanceCrateRandomJunk/2);
        addMapToMapCratesFactories("Base.RiverwoodMap", baseChanceMapFactoryCrate);
    end
    
    
    if SandboxVars.MoreMaps.MansionAdress and getActivatedMods():contains("SnakeMansion") then
        -- MansionAdress
        addMapToTownZombies("Base.MansionAdress", baseChanceZombies/4);
        addMapToCountrySideZombies("Base.MansionAdress", baseChanceZombies/4);
        addMapToSidetables("Base.MansionAdress", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.MansionAdress", baseChanceSurvivorBag/10);
        addMapToGloveboxes("Base.MansionAdress", baseChanceGlovebox/4);
        addMapToCrateRandomJunk("Base.MansionAdress", baseChanceCrateRandomJunk/4);
    end
    
    if SandboxVars.MoreMaps.ConstructionFactoryMap and getActivatedMods():contains("Factory") then
        -- RiversideSouthExpansionMap
        addMapToTownZombies("Base.ConstructionFactoryMap", baseChanceZombies/5);
        addMapToMechanics("Base.ConstructionFactoryMap", baseChanceMechanics);
        addMapToSidetables("Base.ConstructionFactoryMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.ConstructionFactoryMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.ConstructionFactoryMap", baseChanceGlovebox/4);
        addMapToCrateRandomJunk("Base.ConstructionFactoryMap", baseChanceCrateRandomJunk/4);
    end

    
    if SandboxVars.MoreMaps.WestwoodMap and getActivatedMods():contains("westwoodremake") then
        addMapToTownZombies("Base.WestwoodMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.WestwoodMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.WestwoodMap", baseChanceZombies);
        addMapToMechanics("Base.WestwoodMap", baseChanceMechanics/3);
        addMapToMagazineRacks("Base.WestwoodMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.WestwoodMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.WestwoodMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.WestwoodMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.WestwoodMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.WestwoodMap", baseChanceCrateRandomJunk/2);
    end
    
    
    if SandboxVars.MoreMaps.AnthemMap and getActivatedMods():contains("Anthem") then
        addMapToTownZombies("Base.AnthemMap", baseChanceZombies)
        -- addMapToCountrySideZombies("Base.AnthemMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.WestwoodMap", baseChanceZombies);
        addMapToMechanics("Base.AnthemMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.AnthemMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.AnthemMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.AnthemMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.AnthemMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.AnthemMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.AnthemMap", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.AshenwoodMap and getActivatedMods():contains("Ashenwood") then
        addMapToTownZombies("Base.AshenwoodMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.AshenwoodMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.AshenwoodMap", baseChanceZombies);
        addMapToMechanics("Base.AshenwoodMap", baseChanceMechanics/3);
        addMapToMagazineRacks("Base.AshenwoodMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.AshenwoodMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.AshenwoodMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.AshenwoodMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.AshenwoodMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.AshenwoodMap", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.ElysiumIslandMap and getActivatedMods():contains("Elysium_Island") then
        addMapToTownZombies("Base.ElysiumIslandMap", baseChanceZombies/4)
        -- addMapToCountrySideZombies("Base.ElysiumIslandMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.ElysiumIslandMap", baseChanceZombies);
        addMapToMechanics("Base.ElysiumIslandMap", baseChanceMechanics/3);
        addMapToMagazineRacks("Base.ElysiumIslandMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.ElysiumIslandMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.ElysiumIslandMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.ElysiumIslandMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.ElysiumIslandMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.ElysiumIslandMap", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.HopewellMap and (getActivatedMods():contains("hopewell_eng_orig") or getActivatedMods():contains("hopewell_eng_zombies") or getActivatedMods():contains("hopewell_esp_zombies") or getActivatedMods():contains("hopewell_esp_orig")) then
        addMapToTownZombies("Base.HopewellMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.HopewellMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.HopewellMap", baseChanceZombies);
        addMapToMechanics("Base.HopewellMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.HopewellMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.HopewellMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.HopewellMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.HopewellMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.HopewellMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.HopewellMap", baseChanceCrateRandomJunk/2);

    end
    
    if SandboxVars.MoreMaps.HeavensHillMansionAddress and getActivatedMods():contains("Heavens Hill") then
        addMapToTownZombies("Base.HeavensHillMansionAddress", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.HeavensHillMansionAddress", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.HeavensHillMansionAddress", baseChanceZombies);
        -- addMapToMechanics("Base.HeavensHillMansionAddress", baseChanceMechanics/2);
        -- addMapToMagazineRacks("Base.HeavensHillMansionAddress", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.HeavensHillMansionAddress", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.HeavensHillMansionAddress", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.HeavensHillMansionAddress", baseChanceGlovebox/2);
        -- addMapToMapCratesFactories("Base.HeavensHillMansionAddress", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.HeavensHillMansionAddress", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.ChestownMap and getActivatedMods():contains("Chestown") then
        addMapToTownZombies("Base.ChestownMap", baseChanceZombies)
        -- addMapToCountrySideZombies("Base.ChestownMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.ChestownMap", baseChanceZombies);
        addMapToMechanics("Base.ChestownMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.ChestownMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.ChestownMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.ChestownMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.ChestownMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.ChestownMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.ChestownMap", baseChanceCrateRandomJunk);

    end
    
    if SandboxVars.MoreMaps.NashvilleMap and getActivatedMods():contains("Nashville") then
        addMapToTownZombies("Base.NashvilleMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.NashvilleMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.NashvilleMap", baseChanceZombies);
        addMapToMechanics("Base.NashvilleMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.NashvilleMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.NashvilleMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.NashvilleMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.NashvilleMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.NashvilleMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.NashvilleMap", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.OverlookHotelMap and getActivatedMods():contains("OverlookHotel") then
        addMapToTownZombies("Base.OverlookHotelMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.OverlookHotelMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.OverlookHotelMap", baseChanceZombies);
        addMapToMechanics("Base.OverlookHotelMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.OverlookHotelMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.OverlookHotelMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.OverlookHotelMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.OverlookHotelMap", baseChanceGlovebox/2);
        -- addMapToMapCratesFactories("Base.OverlookHotelMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.OverlookHotelMap", baseChanceCrateRandomJunk/2);

    end
    
    if SandboxVars.MoreMaps.PerfectShelterMap and getActivatedMods():contains("MiikluxaUltraSafe") then
        addMapToTownZombies("Base.PerfectShelterMap", baseChanceZombies/10)
        addMapToCountrySideZombies("Base.PerfectShelterMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.PerfectShelterMap", baseChanceZombies);
        -- addMapToMechanics("Base.PerfectShelterMap", baseChanceMechanics/2);
        -- addMapToMagazineRacks("Base.PerfectShelterMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.PerfectShelterMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.PerfectShelterMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.PerfectShelterMap", baseChanceGlovebox/10);
        -- addMapToMapCratesFactories("Base.PerfectShelterMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.PerfectShelterMap", baseChanceCrateRandomJunk/10);
    end
    
    if SandboxVars.MoreMaps.OConnorFarmAddress and getActivatedMods():contains("O'Connor Farm") then
        addMapToTownZombies("Base.OConnorFarmAddress", baseChanceZombies/10)
        addMapToCountrySideZombies("Base.OConnorFarmAddress", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.OConnorFarmAddress", baseChanceZombies);
        -- addMapToMechanics("Base.OConnorFarmAddress", baseChanceMechanics/2);
        -- addMapToMagazineRacks("Base.OConnorFarmAddress", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.OConnorFarmAddress", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.OConnorFarmAddress", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.OConnorFarmAddress", baseChanceGlovebox/10);
        -- addMapToMapCratesFactories("Base.OConnorFarmAddress", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.OConnorFarmAddress", baseChanceCrateRandomJunk/10);
    end
    
    if SandboxVars.MoreMaps.LincolnRegionalAirportMap and getActivatedMods():contains("LincolnRegionalAirport") then
        addMapToTownZombies("Base.LincolnRegionalAirportMap", baseChanceZombies/10)
        -- addMapToCountrySideZombies("Base.LincolnRegionalAirportMap", baseChanceZombies/5)
        addMapToMilitaryZombies("Base.LincolnRegionalAirportMap", baseChanceZombies/4);
        addMapToMechanics("Base.LincolnRegionalAirportMap", baseChanceMechanics/4);
        -- addMapToMagazineRacks("Base.LincolnRegionalAirportMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.LincolnRegionalAirportMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.LincolnRegionalAirportMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LincolnRegionalAirportMap", baseChanceGlovebox/10);
        addMapToMapCratesFactories("Base.LincolnRegionalAirportMap", baseChanceMapFactoryCrate/4);
        addMapToCrateRandomJunk("Base.LincolnRegionalAirportMap", baseChanceCrateRandomJunk/10);
    end
    
    if SandboxVars.MoreMaps.MuldraughWesternShippingCompanyMap and getActivatedMods():contains("Muldraugh-Westoutskirts ShippingCo") then
        addMapToTownZombies("Base.MuldraughWesternShippingCompanyMap", baseChanceZombies/10)
        -- addMapToCountrySideZombies("Base.MuldraughWesternShippingCompanyMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.MuldraughWesternShippingCompanyMap", baseChanceZombies);
        addMapToMechanics("Base.MuldraughWesternShippingCompanyMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.MuldraughWesternShippingCompanyMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.MuldraughWesternShippingCompanyMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.MuldraughWesternShippingCompanyMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.MuldraughWesternShippingCompanyMap", baseChanceGlovebox/2);
        -- addMapToMapCratesFactories("Base.MuldraughWesternShippingCompanyMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.MuldraughWesternShippingCompanyMap", baseChanceCrateRandomJunk/2);

    end
    
    if SandboxVars.MoreMaps.RosewoodMilitaryHospitalMap and getActivatedMods():contains("RMH") then
        addMapToMedicalZombies("Base.RosewoodMilitaryHospitalMap", baseChanceMedicalZombies)
        addMapToTownZombies("Base.RosewoodMilitaryHospitalMap", baseChanceZombies/4)
        -- addMapToCountrySideZombies("Base.RosewoodMilitaryHospitalMap", baseChanceZombies/5)
        addMapToMilitaryZombies("Base.RosewoodMilitaryHospitalMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.RosewoodMilitaryHospitalMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.RosewoodMilitaryHospitalMap", baseChanceMagazineRacks/2);
        -- addMapToSidetables("Base.RosewoodMilitaryHospitalMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.RosewoodMilitaryHospitalMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.RosewoodMilitaryHospitalMap", baseChanceGlovebox/4);
        -- addMapToMapCratesFactories("Base.RosewoodMilitaryHospitalMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.RosewoodMilitaryHospitalMap", baseChanceCrateRandomJunk/4);
    end
    
    if SandboxVars.MoreMaps.TheMuseumMap and getActivatedMods():contains("TheMuseumID") then
        -- addMapToMedicalZombies("Base.TheMuseumMap", baseChanceMedicalZombies)
        addMapToTownZombies("Base.TheMuseumMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.TheMuseumMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.TheMuseumMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.TheMuseumMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.TheMuseumMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.TheMuseumMap", baseChanceSideTable/2);
        -- addMapToSurvivorBag("Base.TheMuseumMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.TheMuseumMap", baseChanceGlovebox/4);
        -- addMapToMapCratesFactories("Base.TheMuseumMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.TheMuseumMap", baseChanceCrateRandomJunk/4);
    end
    
    if SandboxVars.MoreMaps.TheEyeLakeMap and getActivatedMods():contains("TheEyeLake") then
        -- addMapToMedicalZombies("Base.TheEyeLakeMap", baseChanceZombies)
        -- addMapToTownZombies("Base.TheEyeLakeMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.TheEyeLakeMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.TheEyeLakeMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.TheEyeLakeMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.TheEyeLakeMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.TheEyeLakeMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.TheEyeLakeMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.TheEyeLakeMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.TheEyeLakeMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.TheEyeLakeMap", baseChanceCrateRandomJunk/4);
    end
    
    if SandboxVars.MoreMaps.AddamsFamilyMansionMap and getActivatedMods():contains("AddamsMansion") then
        -- addMapToMedicalZombies("Base.AddamsFamilyMansionMap", baseChanceZombies)
        addMapToTownZombies("Base.AddamsFamilyMansionMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.AddamsFamilyMansionMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.AddamsFamilyMansionMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.AddamsFamilyMansionMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.AddamsFamilyMansionMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.AddamsFamilyMansionMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.AddamsFamilyMansionMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.AddamsFamilyMansionMap", baseChanceGlovebox/4);
        -- addMapToMapCratesFactories("Base.AddamsFamilyMansionMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.AddamsFamilyMansionMap", baseChanceCrateRandomJunk/4);
    end
    
    if SandboxVars.MoreMaps.JeffersonvilleMap and getActivatedMods():contains("LVRiverExpN") then
        -- addMapToMedicalZombies("Base.JeffersonvilleMap", baseChanceZombies)
        addMapToTownZombies("Base.JeffersonvilleMap", baseChanceZombies/8)
        addMapToCountrySideZombies("Base.JeffersonvilleMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.JeffersonvilleMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.JeffersonvilleMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.JeffersonvilleMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.JeffersonvilleMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.JeffersonvilleMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.JeffersonvilleMap", baseChanceGlovebox/4);
        -- addMapToMapCratesFactories("Base.TheEyeLakeMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.JeffersonvilleMap", baseChanceCrateRandomJunk/4);
    end
    
    if SandboxVars.MoreMaps.CherokeeLakeMap and getActivatedMods():contains("CherokeeLake") then
        -- addMapToMedicalZombies("Base.CherokeeLakeMap", baseChanceZombies)
        addMapToTownZombies("Base.CherokeeLakeMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.CherokeeLakeMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.CherokeeLakeMap", baseChanceZombies/4);
        addMapToMechanics("Base.CherokeeLakeMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.CherokeeLakeMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.CherokeeLakeMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.CherokeeLakeMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.CherokeeLakeMap", baseChanceGlovebox/2);
        -- addMapToMapCratesFactories("Base.CherokeeLakeMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.CherokeeLakeMap", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.RiversideMansionMap and getActivatedMods():contains("RiversidemansionBrang") then
        -- addMapToMedicalZombies("Base.RiversideMansionMap", baseChanceZombies)
        addMapToTownZombies("Base.RiversideMansionMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.RiversideMansionMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.RiversideMansionMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.RiversideMansionMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.RiversideMansionMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.RiversideMansionMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.RiversideMansionMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.RiversideMansionMap", baseChanceGlovebox/4);
        -- addMapToMapCratesFactories("Base.RiversideMansionMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.RiversideMansionMap", baseChanceCrateRandomJunk/4);
    end
    
    if SandboxVars.MoreMaps.FinneganMentalAsylumMap and getActivatedMods():contains("FinneganMentalAsylum") then
        addMapToMedicalZombies("Base.FinneganMentalAsylumMap", baseChanceZombies)
        addMapToTownZombies("Base.FinneganMentalAsylumMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.FinneganMentalAsylumMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.FinneganMentalAsylumMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.FinneganMentalAsylumMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.FinneganMentalAsylumMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.FinneganMentalAsylumMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.FinneganMentalAsylumMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.FinneganMentalAsylumMap", baseChanceGlovebox/4);
        -- addMapToMapCratesFactories("Base.FinneganMentalAsylumMap", baseChanceMapFactoryCrate/5);
        addMapToCrateRandomJunk("Base.FinneganMentalAsylumMap", baseChanceCrateRandomJunk/4);
    end
    
    if SandboxVars.MoreMaps.PapavilleMap and getActivatedMods():contains("Papaville") then
        -- addMapToMedicalZombies("Base.PapavilleMap", baseChanceZombies)
        addMapToTownZombies("Base.PapavilleMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.PapavilleMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.PapavilleMap", baseChanceZombies/4);
        addMapToMechanics("Base.PapavilleMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.PapavilleMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.PapavilleMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.PapavilleMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.PapavilleMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.PapavilleMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.PapavilleMap", baseChanceCrateRandomJunk);

    end
    
    if SandboxVars.MoreMaps.SouthTownMap and getActivatedMods():contains("SouthTown") then
        -- addMapToMedicalZombies("Base.SouthTownMap", baseChanceZombies)
        addMapToTownZombies("Base.SouthTownMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.SouthTownMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.SouthTownMap", baseChanceZombies/4);
        addMapToMechanics("Base.SouthTownMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.SouthTownMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.SouthTownMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.SouthTownMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.SouthTownMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.SouthTownMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.SouthTownMap", baseChanceCrateRandomJunk);

    end
    
    if SandboxVars.MoreMaps.ChinatownMapExpansionMap and getActivatedMods():contains("Chinatown expansion") then
        -- addMapToMedicalZombies("Base.ChinatownMapExpansionMap", baseChanceZombies)
        addMapToTownZombies("Base.ChinatownMapExpansionMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.ChinatownMapExpansionMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.ChinatownMapExpansionMap", baseChanceZombies/4);
        addMapToMechanics("Base.ChinatownMapExpansionMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.ChinatownMapExpansionMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.ChinatownMapExpansionMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.ChinatownMapExpansionMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.ChinatownMapExpansionMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.ChinatownMapExpansionMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.ChinatownMapExpansionMap", baseChanceCrateRandomJunk);
    end
    
    if SandboxVars.MoreMaps.LouisvilleBunkerLocationMap and getActivatedMods():contains("LVBunker") then
        -- addMapToMedicalZombies("Base.LouisvilleBunkerLocationMap", baseChanceZombies)
        addMapToTownZombies("Base.LouisvilleBunkerLocationMap", baseChanceZombies/5)
        addMapToCountrySideZombies("Base.LouisvilleBunkerLocationMap", baseChanceZombies/5)
        addMapToMilitaryZombies("Base.LouisvilleBunkerLocationMap", baseChanceZombies)
        -- addMapToMechanics("Base.LouisvilleBunkerLocationMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.LouisvilleBunkerLocationMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.LouisvilleBunkerLocationMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.LouisvilleBunkerLocationMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.LouisvilleBunkerLocationMap", baseChanceGlovebox/5);
        -- addMapToMapCratesFactories("Base.LouisvilleBunkerLocationMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.LouisvilleBunkerLocationMap", baseChanceCrateRandomJunk);
    end
    
    if SandboxVars.MoreMaps.OrchidwoodMap and (getActivatedMods():contains("Orchidwood(official version)") or getActivatedMods():contains("orchidwood(legacy version)")) then
        -- addMapToMedicalZombies("Base.OrchidwoodMap", baseChanceZombies)
        addMapToTownZombies("Base.OrchidwoodMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.OrchidwoodMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.OrchidwoodMap", baseChanceZombies/4);
        addMapToMechanics("Base.OrchidwoodMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.OrchidwoodMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.OrchidwoodMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.OrchidwoodMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.OrchidwoodMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.OrchidwoodMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.OrchidwoodMap", baseChanceCrateRandomJunk);

    end
    
    if SandboxVars.MoreMaps.WinchesterMap and (getActivatedMods():contains("Winchester")) then
        -- addMapToMedicalZombies("Base.WinchesterMap", baseChanceZombies)
        addMapToTownZombies("Base.WinchesterMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.WinchesterMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.WinchesterMap", baseChanceZombies/4);
        addMapToMechanics("Base.WinchesterMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.WinchesterMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.WinchesterMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.WinchesterMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.WinchesterMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.WinchesterMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.WinchesterMap", baseChanceCrateRandomJunk);

    end
    
    if SandboxVars.MoreMaps.BreakpointMap and getActivatedMods():contains("Breakpoint") then
        -- addMapToMedicalZombies("Base.BreakpointMap", baseChanceZombies)
        addMapToTownZombies("Base.BreakpointMap", baseChanceZombies/5)
        addMapToCountrySideZombies("Base.BreakpointMap", baseChanceZombies/5)
        addMapToMilitaryZombies("Base.BreakpointMap", baseChanceZombies);
        -- addMapToMechanics("Base.BreakpointMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.BreakpointMap", baseChanceMagazineRacks/2);
        -- addMapToSidetables("Base.BreakpointMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.BreakpointMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.BreakpointMap", baseChanceGlovebox);
        -- addMapToMapCratesFactories("Base.BreakpointMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.BreakpointMap", baseChanceCrateRandomJunk);

    end
    
    if SandboxVars.MoreMaps.WilboreMap and getActivatedMods():contains("wilboreky") then
        -- addMapToMedicalZombies("Base.WilboreMap", baseChanceZombies)
        addMapToTownZombies("Base.WilboreMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.WilboreMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.WilboreMap", baseChanceZombies/4);
        addMapToMechanics("Base.WilboreMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.WilboreMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.WilboreMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.WilboreMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.WilboreMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.WilboreMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.WilboreMap", baseChanceCrateRandomJunk);
    end
    
    if SandboxVars.MoreMaps.PetrovilleMap and getActivatedMods():contains("Petroville") then
        -- addMapToMedicalZombies("Base.PetrovilleMap", baseChanceZombies)
        addMapToTownZombies("Base.PetrovilleMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.PetrovilleMap", baseChanceZombies/8)
        -- addMapToMilitaryZombies("Base.PetrovilleMap", baseChanceZombies/4);
        addMapToMechanics("Base.PetrovilleMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.PetrovilleMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.PetrovilleMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.PetrovilleMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.PetrovilleMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.PetrovilleMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.PetrovilleMap", baseChanceCrateRandomJunk);

    end
    
    if SandboxVars.MoreMaps.CedarHillMap and getActivatedMods():contains("CedarHill") then
        -- addMapToMedicalZombies("Base.CedarHillMap", baseChanceZombies)
        addMapToTownZombies("Base.CedarHillMap", baseChanceZombies/8)
        addMapToCountrySideZombies("Base.CedarHillMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.CedarHillMap", baseChanceZombies/4);
        addMapToMechanics("Base.CedarHillMap", baseChanceMechanics/5);
        addMapToMagazineRacks("Base.CedarHillMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.CedarHillMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.CedarHillMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.CedarHillMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.CedarHillMap", baseChanceMapFactoryCrate/3);
        addMapToCrateRandomJunk("Base.CedarHillMap", baseChanceCrateRandomJunk);
    end
    
    if SandboxVars.MoreMaps.CathayaValleyMap and getActivatedMods():contains("Cathaya Valley") then
        -- addMapToMedicalZombies("Base.CathayaValleyMap", baseChanceZombies)
        addMapToTownZombies("Base.CathayaValleyMap", baseChanceZombies/8)
        addMapToCountrySideZombies("Base.CathayaValleyMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.CathayaValleyMap", baseChanceZombies/4);
        addMapToMechanics("Base.CathayaValleyMap", baseChanceMechanics/5);
        addMapToMagazineRacks("Base.CathayaValleyMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.CathayaValleyMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.CathayaValleyMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.CathayaValleyMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.CathayaValleyMap", baseChanceMapFactoryCrate/3);
        addMapToCrateRandomJunk("Base.CathayaValleyMap", baseChanceCrateRandomJunk);
    end
    
    if SandboxVars.MoreMaps.SpringwoodMap and getActivatedMods():contains("Springwood1") then
        -- addMapToMedicalZombies("Base.SpringwoodMap", baseChanceZombies)
        addMapToTownZombies("Base.SpringwoodMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.SpringwoodMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.SpringwoodMap", baseChanceZombies/4);
        addMapToMechanics("Base.SpringwoodMap", baseChanceMechanics/5);
        addMapToMagazineRacks("Base.SpringwoodMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.SpringwoodMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.SpringwoodMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.SpringwoodMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.SpringwoodMap", baseChanceMapFactoryCrate/3);
        addMapToCrateRandomJunk("Base.SpringwoodMap", baseChanceCrateRandomJunk);
    end
    
    if SandboxVars.MoreMaps.NaturesVengeanceTownshipMap and getActivatedMods():contains("nv_township_v1") then
        -- addMapToMedicalZombies("Base.NaturesVengeanceTownshipMap", baseChanceZombies)
        addMapToTownZombies("Base.NaturesVengeanceTownshipMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.NaturesVengeanceTownshipMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.NaturesVengeanceTownshipMap", baseChanceZombies/4);
        addMapToMechanics("Base.NaturesVengeanceTownshipMap", baseChanceMechanics/5);
        addMapToMagazineRacks("Base.NaturesVengeanceTownshipMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.NaturesVengeanceTownshipMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.NaturesVengeanceTownshipMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.NaturesVengeanceTownshipMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.NaturesVengeanceTownshipMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.NaturesVengeanceTownshipMap", baseChanceCrateRandomJunk);
    end
    
    if SandboxVars.MoreMaps.BigBearLakeMaps and getActivatedMods():contains("BBL") then
        --BigBearLakeEastMap
        -- addMapToMedicalZombies("Base.BigBearLakeEastMap", baseChanceZombies)
        addMapToTownZombies("Base.BigBearLakeEastMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.BigBearLakeEastMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.BigBearLakeEastMap", baseChanceZombies/4);
        addMapToMechanics("Base.BigBearLakeEastMap", baseChanceMechanics/3);
        addMapToMagazineRacks("Base.BigBearLakeEastMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.BigBearLakeEastMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.BigBearLakeEastMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.BigBearLakeEastMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.BigBearLakeEastMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.BigBearLakeEastMap", baseChanceCrateRandomJunk);
        --BigBearLakeWestMap
        -- addMapToMedicalZombies("Base.BigBearLakeWestMap", baseChanceZombies)
        addMapToTownZombies("Base.BigBearLakeWestMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.BigBearLakeWestMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.BigBearLakeWestMap", baseChanceZombies/4);
        addMapToMechanics("Base.BigBearLakeWestMap", baseChanceMechanics/3);
        addMapToMagazineRacks("Base.BigBearLakeWestMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.BigBearLakeWestMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.BigBearLakeWestMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.BigBearLakeWestMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.BigBearLakeWestMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.BigBearLakeWestMap", baseChanceCrateRandomJunk);
        --BigBearLakeMap
        -- addMapToMedicalZombies("Base.BigBearLakeMap", baseChanceZombies)
        addMapToTownZombies("Base.BigBearLakeMap", baseChanceZombies/10)
        addMapToCountrySideZombies("Base.BigBearLakeMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.BigBearLakeMap", baseChanceZombies/4);
        addMapToMechanics("Base.BigBearLakeMap", baseChanceMechanics/10);
        addMapToMagazineRacks("Base.BigBearLakeMap", baseChanceMagazineRacks/5);
        addMapToSidetables("Base.BigBearLakeMap", baseChanceSideTable/5);
        addMapToSurvivorBag("Base.BigBearLakeMap", baseChanceSurvivorBag/5);
        addMapToGloveboxes("Base.BigBearLakeMap", baseChanceGlovebox/5);
        addMapToMapCratesFactories("Base.BigBearLakeMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.BigBearLakeMap", baseChanceCrateRandomJunk/5);
    end
    
    
    if SandboxVars.MoreMaps.SimsZomboidMap and getActivatedMods():contains("The Sims Zomboid") then
        -- addMapToMedicalZombies("Base.SimsZomboidMap", baseChanceZombies)
        addMapToTownZombies("Base.SimsZomboidMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.SimsZomboidMap", baseChanceZombies/3)
        -- addMapToMilitaryZombies("Base.SimsZomboidMap", baseChanceZombies/4);
        addMapToMechanics("Base.SimsZomboidMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.SimsZomboidMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.SimsZomboidMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.SimsZomboidMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.SimsZomboidMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.SimsZomboidMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.SimsZomboidMap", baseChanceCrateRandomJunk);

    end
    
    if SandboxVars.MoreMaps.DirkerdamMaps and getActivatedMods():contains("Dirkerdam") then
        -- FloriusMap
        -- addMapToMedicalZombies("Base.FloriusMap", baseChanceZombies)
        addMapToTownZombies("Base.FloriusMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.FloriusMap", baseChanceZombies/3)
        -- addMapToMilitaryZombies("Base.FloriusMap", baseChanceZombies/4);
        addMapToMechanics("Base.FloriusMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.FloriusMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.FloriusMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.FloriusMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.FloriusMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.FloriusMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.FloriusMap", baseChanceCrateRandomJunk);
        -- PertvilleMap
        -- addMapToMedicalZombies("Base.PertvilleMap", baseChanceZombies)
        addMapToTownZombies("Base.PertvilleMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.PertvilleMap", baseChanceZombies/3)
        -- addMapToMilitaryZombies("Base.PertvilleMap", baseChanceZombies/4);
        addMapToMechanics("Base.PertvilleMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.PertvilleMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.PertvilleMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.PertvilleMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.PertvilleMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.PertvilleMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.PertvilleMap", baseChanceCrateRandomJunk);
        -- TashtegoMap
        -- addMapToMedicalZombies("Base.TashtegoMap", baseChanceZombies)
        addMapToTownZombies("Base.TashtegoMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.TashtegoMap", baseChanceZombies/3)
        -- addMapToMilitaryZombies("Base.TashtegoMap", baseChanceZombies/4);
        addMapToMechanics("Base.TashtegoMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.TashtegoMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.TashtegoMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.TashtegoMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.TashtegoMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.TashtegoMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.TashtegoMap", baseChanceCrateRandomJunk);
        -- FallenSurvivorColonyMap
        -- addMapToMedicalZombies("Base.FallenSurvivorColonyMap", baseChanceZombies)
        addMapToTownZombies("Base.FallenSurvivorColonyMap", baseChanceZombies/5)
        addMapToCountrySideZombies("Base.FallenSurvivorColonyMap", baseChanceZombies/2)
        addMapToMilitaryZombies("Base.FallenSurvivorColonyMap", baseChanceZombies);
        -- addMapToMechanics("Base.FallenSurvivorColonyMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.FallenSurvivorColonyMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.FallenSurvivorColonyMap", baseChanceSideTable/6);
        addMapToSurvivorBag("Base.FallenSurvivorColonyMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.FallenSurvivorColonyMap", baseChanceGlovebox/6);
        -- addMapToMapCratesFactories("Base.FallenSurvivorColonyMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.FallenSurvivorColonyMap", baseChanceCrateRandomJunk/6);
        -- DirkerdamWestMap
        -- addMapToMedicalZombies("Base.DirkerdamWestMap", baseChanceZombies)
        addMapToTownZombies("Base.DirkerdamWestMap", baseChanceZombies/3)
        -- addMapToCountrySideZombies("Base.DirkerdamWestMap", baseChanceZombies/3)
        -- addMapToMilitaryZombies("Base.DirkerdamWestMap", baseChanceZombies/4);
        addMapToMechanics("Base.DirkerdamWestMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.DirkerdamWestMap", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.DirkerdamWestMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.DirkerdamWestMap", baseChanceSurvivorBag/10);
        addMapToGloveboxes("Base.DirkerdamWestMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.DirkerdamWestMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.DirkerdamWestMap", baseChanceCrateRandomJunk/4);
        -- DirkerdamEastMap
        -- addMapToMedicalZombies("Base.DirkerdamEastMap", baseChanceZombies)
        addMapToTownZombies("Base.DirkerdamEastMap", baseChanceZombies/3)
        -- addMapToCountrySideZombies("Base.DirkerdamEastMap", baseChanceZombies/3)
        -- addMapToMilitaryZombies("Base.DirkerdamEastMap", baseChanceZombies/4);
        addMapToMechanics("Base.DirkerdamEastMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.DirkerdamEastMap", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.DirkerdamEastMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.DirkerdamEastMap", baseChanceSurvivorBag/10);
        addMapToGloveboxes("Base.DirkerdamEastMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.DirkerdamEastMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.DirkerdamEastMap", baseChanceCrateRandomJunk/4);
        -- DirkerdamMap
        -- addMapToMedicalZombies("Base.DirkerdamMap", baseChanceZombies)
        addMapToTownZombies("Base.DirkerdamMap", baseChanceZombies/15)
        -- addMapToCountrySideZombies("Base.DirkerdamMap", baseChanceZombies/3)
        -- addMapToMilitaryZombies("Base.DirkerdamMap", baseChanceZombies/4);
        addMapToMechanics("Base.DirkerdamMap", baseChanceMechanics/12);
        addMapToMagazineRacks("Base.DirkerdamMap", baseChanceMagazineRacks/10);
        addMapToSidetables("Base.DirkerdamMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.DirkerdamMap", baseChanceSurvivorBag/25);
        addMapToGloveboxes("Base.DirkerdamMap", baseChanceGlovebox/10);
        addMapToMapCratesFactories("Base.DirkerdamMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.DirkerdamMap", baseChanceCrateRandomJunk/10);
    end
    
    if SandboxVars.MoreMaps.LakeCumberlandMaps and (getActivatedMods():contains("LCv2") or getActivatedMods():contains("LC")) then
        if getActivatedMods():contains("LCv2") then
            --LakeCumberlandWestMapNew
            -- addMapToMedicalZombies("Base.LakeCumberlandWestMapNew", baseChanceZombies)
            addMapToTownZombies("Base.LakeCumberlandWestMapNew", baseChanceZombies/5)
            addMapToCountrySideZombies("Base.LakeCumberlandWestMapNew", baseChanceZombies)
            -- addMapToMilitaryZombies("Base.LakeCumberlandWestMapNew", baseChanceZombies/4);
            addMapToMechanics("Base.LakeCumberlandWestMapNew", baseChanceMechanics/2);
            addMapToMagazineRacks("Base.LakeCumberlandWestMapNew", baseChanceMagazineRacks/2);
            addMapToSidetables("Base.LakeCumberlandWestMapNew", baseChanceSideTable);
            addMapToSurvivorBag("Base.LakeCumberlandWestMapNew", baseChanceSurvivorBag/2);
            addMapToGloveboxes("Base.LakeCumberlandWestMapNew", baseChanceGlovebox/2);
            addMapToMapCratesFactories("Base.LakeCumberlandWestMapNew", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.LakeCumberlandWestMapNew", baseChanceCrateRandomJunk/2);
            --LakeCumberlandNorthEastMapNew
            -- addMapToMedicalZombies("Base.LakeCumberlandNorthEastMapNew", baseChanceZombies)
            addMapToTownZombies("Base.LakeCumberlandNorthEastMapNew", baseChanceZombies/5)
            addMapToCountrySideZombies("Base.LakeCumberlandNorthEastMapNew", baseChanceZombies)
            -- addMapToMilitaryZombies("Base.LakeCumberlandNorthEastMapNew", baseChanceZombies/4);
            addMapToMechanics("Base.LakeCumberlandNorthEastMapNew", baseChanceMechanics/2);
            addMapToMagazineRacks("Base.LakeCumberlandNorthEastMapNew", baseChanceMagazineRacks/2);
            addMapToSidetables("Base.LakeCumberlandNorthEastMapNew", baseChanceSideTable);
            addMapToSurvivorBag("Base.LakeCumberlandNorthEastMapNew", baseChanceSurvivorBag/2);
            addMapToGloveboxes("Base.LakeCumberlandNorthEastMapNew", baseChanceGlovebox/2);
            addMapToMapCratesFactories("Base.LakeCumberlandNorthEastMapNew", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.LakeCumberlandNorthEastMapNew", baseChanceCrateRandomJunk/2);
            --LakeCumberlandSouthEastMapNew
            -- addMapToMedicalZombies("Base.LakeCumberlandSouthEastMapNew", baseChanceZombies)
            addMapToTownZombies("Base.LakeCumberlandSouthEastMapNew", baseChanceZombies/5)
            addMapToCountrySideZombies("Base.LakeCumberlandSouthEastMapNew", baseChanceZombies)
            -- addMapToMilitaryZombies("Base.LakeCumberlandSouthEastMapNew", baseChanceZombies/4);
            addMapToMechanics("Base.LakeCumberlandSouthEastMapNew", baseChanceMechanics/2);
            addMapToMagazineRacks("Base.LakeCumberlandSouthEastMapNew", baseChanceMagazineRacks/2);
            addMapToSidetables("Base.LakeCumberlandSouthEastMapNew", baseChanceSideTable);
            addMapToSurvivorBag("Base.LakeCumberlandSouthEastMapNew", baseChanceSurvivorBag/2);
            addMapToGloveboxes("Base.LakeCumberlandSouthEastMapNew", baseChanceGlovebox/2);
            addMapToMapCratesFactories("Base.LakeCumberlandSouthEastMapNew", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.LakeCumberlandSouthEastMapNew", baseChanceCrateRandomJunk/2);
            --LakeCumberlandMapNew
            -- addMapToMedicalZombies("Base.LakeCumberlandMapNew", baseChanceZombies)
            addMapToTownZombies("Base.LakeCumberlandMapNew", baseChanceZombies/10)
            addMapToCountrySideZombies("Base.LakeCumberlandMapNew", baseChanceZombies/6)
            -- addMapToMilitaryZombies("Base.LakeCumberlandMapNew", baseChanceZombies/4);
            addMapToMechanics("Base.LakeCumberlandMapNew", baseChanceMechanics/10);
            addMapToMagazineRacks("Base.LakeCumberlandMapNew", baseChanceMagazineRacks/10);
            addMapToSidetables("Base.LakeCumberlandMapNew", baseChanceSideTable/10);
            addMapToSurvivorBag("Base.LakeCumberlandMapNew", baseChanceSurvivorBag/25);
            addMapToGloveboxes("Base.LakeCumberlandMapNew", baseChanceGlovebox/10);
            addMapToMapCratesFactories("Base.LakeCumberlandMapNew", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.LakeCumberlandMapNew", baseChanceCrateRandomJunk/10);
        end
        if getActivatedMods():contains("LC") then
            --LakeCumberlandWestMapOld
            -- addMapToMedicalZombies("Base.LakeCumberlandWestMapOld", baseChanceZombies)
            addMapToTownZombies("Base.LakeCumberlandWestMapOld", baseChanceZombies/5)
            addMapToCountrySideZombies("Base.LakeCumberlandWestMapOld", baseChanceZombies)
            -- addMapToMilitaryZombies("Base.LakeCumberlandWestMapOld", baseChanceZombies/4);
            addMapToMechanics("Base.LakeCumberlandWestMapOld", baseChanceMechanics/2);
            addMapToMagazineRacks("Base.LakeCumberlandWestMapOld", baseChanceMagazineRacks/2);
            addMapToSidetables("Base.LakeCumberlandWestMapOld", baseChanceSideTable);
            addMapToSurvivorBag("Base.LakeCumberlandWestMapOld", baseChanceSurvivorBag/2);
            addMapToGloveboxes("Base.LakeCumberlandWestMapOld", baseChanceGlovebox/2);
            addMapToMapCratesFactories("Base.LakeCumberlandWestMapOld", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.LakeCumberlandWestMapOld", baseChanceCrateRandomJunk/2);
            --LakeCumberlandNorthEastMapOld
            -- addMapToMedicalZombies("Base.LakeCumberlandNorthEastMapOld", baseChanceZombies)
            addMapToTownZombies("Base.LakeCumberlandNorthEastMapOld", baseChanceZombies/5)
            addMapToCountrySideZombies("Base.LakeCumberlandNorthEastMapOld", baseChanceZombies)
            -- addMapToMilitaryZombies("Base.LakeCumberlandNorthEastMapOld", baseChanceZombies/4);
            addMapToMechanics("Base.LakeCumberlandNorthEastMapOld", baseChanceMechanics/2);
            addMapToMagazineRacks("Base.LakeCumberlandNorthEastMapOld", baseChanceMagazineRacks/2);
            addMapToSidetables("Base.LakeCumberlandNorthEastMapOld", baseChanceSideTable);
            addMapToSurvivorBag("Base.LakeCumberlandNorthEastMapOld", baseChanceSurvivorBag/2);
            addMapToGloveboxes("Base.LakeCumberlandNorthEastMapOld", baseChanceGlovebox/2);
            addMapToMapCratesFactories("Base.LakeCumberlandNorthEastMapOld", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.LakeCumberlandNorthEastMapOld", baseChanceCrateRandomJunk/2);
            --LakeCumberlandSouthEastMapOld
            -- addMapToMedicalZombies("Base.LakeCumberlandSouthEastMapOld", baseChanceZombies)
            addMapToTownZombies("Base.LakeCumberlandSouthEastMapOld", baseChanceZombies/5)
            addMapToCountrySideZombies("Base.LakeCumberlandSouthEastMapOld", baseChanceZombies)
            -- addMapToMilitaryZombies("Base.LakeCumberlandSouthEastMapOld", baseChanceZombies/4);
            addMapToMechanics("Base.LakeCumberlandSouthEastMapOld", baseChanceMechanics/2);
            addMapToMagazineRacks("Base.LakeCumberlandSouthEastMapOld", baseChanceMagazineRacks/2);
            addMapToSidetables("Base.LakeCumberlandSouthEastMapOld", baseChanceSideTable);
            addMapToSurvivorBag("Base.LakeCumberlandSouthEastMapOld", baseChanceSurvivorBag/2);
            addMapToGloveboxes("Base.LakeCumberlandSouthEastMapOld", baseChanceGlovebox/2);
            addMapToMapCratesFactories("Base.LakeCumberlandSouthEastMapOld", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.LakeCumberlandSouthEastMapOld", baseChanceCrateRandomJunk/2);
            --LakeCumberlandMapOld
            -- addMapToMedicalZombies("Base.LakeCumberlandMapOld", baseChanceZombies)
            addMapToTownZombies("Base.LakeCumberlandMapOld", baseChanceZombies/10)
            addMapToCountrySideZombies("Base.LakeCumberlandMapOld", baseChanceZombies/6)
            -- addMapToMilitaryZombies("Base.LakeCumberlandMapOld", baseChanceZombies/4);
            addMapToMechanics("Base.LakeCumberlandMapOld", baseChanceMechanics/10);
            addMapToMagazineRacks("Base.LakeCumberlandMapOld", baseChanceMagazineRacks/10);
            addMapToSidetables("Base.LakeCumberlandMapOld", baseChanceSideTable/10);
            addMapToSurvivorBag("Base.LakeCumberlandMapOld", baseChanceSurvivorBag/25);
            addMapToGloveboxes("Base.LakeCumberlandMapOld", baseChanceGlovebox/10);
            addMapToMapCratesFactories("Base.LakeCumberlandMapOld", baseChanceMapFactoryCrate);
            addMapToCrateRandomJunk("Base.LakeCumberlandMapOld", baseChanceCrateRandomJunk/10);
        end
    end
    
    if SandboxVars.MoreMaps.PharmaceuticalFactoryMap and getActivatedMods():contains("Waterlocked Pharmaceutical Factory") then
        addMapToMedicalZombies("Base.PharmaceuticalFactoryMap", baseChanceMedicalZombies)
        -- addMapToTownZombies("Base.PharmaceuticalFactoryMap", baseChanceZombies/10)
        -- addMapToCountrySideZombies("Base.PharmaceuticalFactoryMap", baseChanceZombies/6)
        addMapToMilitaryZombies("Base.PharmaceuticalFactoryMap", baseChanceZombies/10);
        -- addMapToMechanics("Base.PharmaceuticalFactoryMap", baseChanceMechanics/10);
        -- addMapToMagazineRacks("Base.PharmaceuticalFactoryMap", baseChanceMagazineRacks/10);
        addMapToSidetables("Base.PharmaceuticalFactoryMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.PharmaceuticalFactoryMap", baseChanceSurvivorBag/5);
        -- addMapToGloveboxes("Base.PharmaceuticalFactoryMap", baseChanceGlovebox/10);
        -- addMapToMapCratesFactories("Base.PharmaceuticalFactoryMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.PharmaceuticalFactoryMap", baseChanceCrateRandomJunk/10);

    end
    
    if SandboxVars.MoreMaps.NettleTownshipMap and getActivatedMods():contains("Nettle Township") then
        -- addMapToMedicalZombies("Base.NettleTownshipMap", baseChanceZombies)
        addMapToTownZombies("Base.NettleTownshipMap", baseChanceZombies/3)
        addMapToCountrySideZombies("Base.NettleTownshipMap", baseChanceZombies/3)
        -- addMapToMilitaryZombies("Base.NettleTownshipMap", baseChanceZombies/10);
        addMapToMechanics("Base.NettleTownshipMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.NettleTownshipMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.NettleTownshipMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.NettleTownshipMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.NettleTownshipMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.NettleTownshipMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.NettleTownshipMap", baseChanceCrateRandomJunk);

    end
    
    if SandboxVars.MoreMaps.StMooseHospitalMap and (getActivatedMods():contains("MKHospitalArea_Normal") or getActivatedMods():contains("MKHospitalArea_Horde")) then
        addMapToMedicalZombies("Base.StMooseHospitalMap", baseChanceMedicalZombies)
        addMapToTownZombies("Base.StMooseHospitalMap", baseChanceZombies/10)
        -- addMapToCountrySideZombies("Base.StMooseHospitalMap", baseChanceZombies/6)
        addMapToMilitaryZombies("Base.StMooseHospitalMap", baseChanceZombies/10);
        -- addMapToMechanics("Base.StMooseHospitalMap", baseChanceMechanics/10);
        -- addMapToMagazineRacks("Base.StMooseHospitalMap", baseChanceMagazineRacks/10);
        addMapToSidetables("Base.StMooseHospitalMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.StMooseHospitalMap", baseChanceSurvivorBag/5);
        addMapToGloveboxes("Base.StMooseHospitalMap", baseChanceGlovebox/10);
        -- addMapToMapCratesFactories("Base.StMooseHospitalMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.StMooseHospitalMap", baseChanceCrateRandomJunk/10);

    end
    
    if SandboxVars.MoreMaps.ShortrestCountyMap and getActivatedMods():contains("Shortrest_County") then
        -- addMapToMedicalZombies("Base.ShortrestCountyMap", baseChanceZombies)
        addMapToTownZombies("Base.ShortrestCountyMap", baseChanceZombies/3)
        addMapToCountrySideZombies("Base.ShortrestCountyMap", baseChanceZombies/3)
        -- addMapToMilitaryZombies("Base.ShortrestCountyMap", baseChanceZombies/10);
        addMapToMechanics("Base.ShortrestCountyMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.ShortrestCountyMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.ShortrestCountyMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.ShortrestCountyMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.ShortrestCountyMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.ShortrestCountyMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.ShortrestCountyMap", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.LeavenburgMap and getActivatedMods():contains("Leavenburg") then
        -- addMapToMedicalZombies("Base.LeavenburgMap", baseChanceZombies)
        addMapToTownZombies("Base.LeavenburgMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.LeavenburgMap", baseChanceZombies/2)
        -- addMapToMilitaryZombies("Base.LeavenburgMap", baseChanceZombies/10);
        addMapToMechanics("Base.LeavenburgMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.LeavenburgMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.LeavenburgMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.LeavenburgMap", baseChanceSurvivorBag/2);
        addMapToGloveboxes("Base.LeavenburgMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.LeavenburgMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.LeavenburgMap", baseChanceCrateRandomJunk);
    end
    
    if SandboxVars.MoreMaps.BunkerDayOfTheDeadMap and getActivatedMods():contains("BunkerDayOfTheDead") then
        -- addMapToMedicalZombies("Base.BunkerDayOfTheDeadMap", baseChanceZombies)
        -- addMapToTownZombies("Base.BunkerDayOfTheDeadMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.BunkerDayOfTheDeadMap", baseChanceZombies/2)
        addMapToMilitaryZombies("Base.BunkerDayOfTheDeadMap", baseChanceZombies);
        -- addMapToMechanics("Base.BunkerDayOfTheDeadMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.BunkerDayOfTheDeadMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.BunkerDayOfTheDeadMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.BunkerDayOfTheDeadMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.BunkerDayOfTheDeadMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.BunkerDayOfTheDeadMap", baseChanceGlovebox/15);
        -- addMapToMapCratesFactories("Base.BunkerDayOfTheDeadMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.BunkerDayOfTheDeadMap", baseChanceCrateRandomJunk/15);
    end
    
    if SandboxVars.MoreMaps.SuperGigaMartMap and getActivatedMods():contains("SuperGigaMart") then
        -- addMapToMedicalZombies("Base.SuperGigaMartMap", baseChanceZombies)
        addMapToTownZombies("Base.SuperGigaMartMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.SuperGigaMartMap", baseChanceZombies/2)
        -- addMapToMilitaryZombies("Base.SuperGigaMartMap", baseChanceZombies);
        addMapToMechanics("Base.SuperGigaMartMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.SuperGigaMartMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.SuperGigaMartMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.SuperGigaMartMap", baseChanceSurvivorBag);
        addMapToGloveboxes("Base.SuperGigaMartMap", baseChanceGlovebox/4);
        -- addMapToMapCratesFactories("Base.SuperGigaMartMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.SuperGigaMartMap", baseChanceCrateRandomJunk/4);
    end
    
    if SandboxVars.MoreMaps.ZtardewValleyMap and getActivatedMods():contains("Ztardew") then
        -- addMapToMedicalZombies("Base.ZtardewValleyMap", baseChanceZombies)
        addMapToTownZombies("Base.ZtardewValleyMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.ZtardewValleyMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.ZtardewValleyMap", baseChanceZombies/10);
        addMapToMechanics("Base.ZtardewValleyMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.ZtardewValleyMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.ZtardewValleyMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.ZtardewValleyMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.ZtardewValleyMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.ZtardewValleyMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.ZtardewValleyMap", baseChanceCrateRandomJunk);
    end
    
    if SandboxVars.MoreMaps.TheWalkingDeadPrisonMap and getActivatedMods():contains("TWDprison") then
        -- addMapToMedicalZombies("Base.TheWalkingDeadPrisonMap", baseChanceZombies)
        addMapToTownZombies("Base.TheWalkingDeadPrisonMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.TheWalkingDeadPrisonMap", baseChanceZombies/4)
        addMapToMilitaryZombies("Base.TheWalkingDeadPrisonMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.TheWalkingDeadPrisonMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.TheWalkingDeadPrisonMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.TheWalkingDeadPrisonMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.TheWalkingDeadPrisonMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.TheWalkingDeadPrisonMap", baseChanceGlovebox);
        -- addMapToGloveboxes("Base.TheWalkingDeadPrisonMap", baseChanceGlovebox/15);
        -- addMapToMapCratesFactories("Base.TheWalkingDeadPrisonMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.TheWalkingDeadPrisonMap", baseChanceCrateRandomJunk/15);
        addMapToPrisonInmates("Base.TheWalkingDeadPrisonMap", baseChanceZombies*3);
    end
    
    if SandboxVars.MoreMaps.TheWalkingDeadTerminusMap and getActivatedMods():contains("TWDterminus") then
        -- addMapToMedicalZombies("Base.TheWalkingDeadTerminusMap", baseChanceZombies)
        addMapToTownZombies("Base.TheWalkingDeadTerminusMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.TheWalkingDeadTerminusMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.TheWalkingDeadTerminusMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.TheWalkingDeadTerminusMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.TheWalkingDeadTerminusMap", baseChanceMagazineRacks);
        -- addMapToSidetables("Base.TheWalkingDeadTerminusMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.TheWalkingDeadTerminusMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.TheWalkingDeadTerminusMap", baseChanceGlovebox);
        addMapToGloveboxes("Base.TheWalkingDeadTerminusMap", baseChanceGlovebox/2);
        -- addMapToMapCratesFactories("Base.TheWalkingDeadTerminusMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.TheWalkingDeadTerminusMap", baseChanceCrateRandomJunk/2);
        addMapToPrisonInmates("Base.TheWalkingDeadTerminusMap", baseChanceZombies/2);

    end
    
    if SandboxVars.MoreMaps.HuntersBaseMap and getActivatedMods():contains("Hunter'sBase") then
        -- addMapToMedicalZombies("Base.HuntersBaseMap", baseChanceZombies)
        -- addMapToTownZombies("Base.HuntersBaseMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.HuntersBaseMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.HuntersBaseMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.HuntersBaseMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.HuntersBaseMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.HuntersBaseMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.HuntersBaseMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.HuntersBaseMap", baseChanceGlovebox);
        addMapToGloveboxes("Base.HuntersBaseMap", baseChanceGlovebox/5);
        -- addMapToMapCratesFactories("Base.HuntersBaseMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.HuntersBaseMap", baseChanceCrateRandomJunk/5);
    end
    
    if SandboxVars.MoreMaps.PortCityMap and getActivatedMods():contains("PortCityKYAbisimod") then
        -- addMapToMedicalZombies("Base.PortCityMap", baseChanceZombies)
        addMapToTownZombies("Base.PortCityMap", baseChanceZombies/4)
        -- addMapToCountrySideZombies("Base.PortCityMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.PortCityMap", baseChanceZombies/4);
        addMapToMechanics("Base.PortCityMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.PortCityMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.PortCityMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.PortCityMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.PortCityMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.PortCityMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.PortCityMap", baseChanceCrateRandomJunk/2);

    end
    
    if SandboxVars.MoreMaps.SpringValleyMap and getActivatedMods():contains("SpringValleyKYAbisiMod") then
        -- addMapToMedicalZombies("Base.SpringValleyMap", baseChanceZombies)
        addMapToTownZombies("Base.SpringValleyMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.SpringValleyMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.SpringValleyMap", baseChanceZombies/4);
        addMapToMechanics("Base.SpringValleyMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.SpringValleyMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.SpringValleyMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.SpringValleyMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.SpringValleyMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.SpringValleyMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.SpringValleyMap", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.OakshireMap and getActivatedMods():contains("Oakshire") then
        -- addMapToMedicalZombies("Base.OakshireMap", baseChanceZombies)
        addMapToTownZombies("Base.OakshireMap", baseChanceZombies/3)
        addMapToCountrySideZombies("Base.OakshireMap", baseChanceZombies/3)
        -- addMapToMilitaryZombies("Base.OakshireMap", baseChanceZombies/4);
        addMapToMechanics("Base.OakshireMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.OakshireMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.OakshireMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.OakshireMap", baseChanceSurvivorBag/4);
        addMapToGloveboxes("Base.OakshireMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.OakshireMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.OakshireMap", baseChanceCrateRandomJunk/2);

    end
    
    if SandboxVars.MoreMaps.RangersHomesteadMap and getActivatedMods():contains("Ranger'sHomestead") then
        -- addMapToMedicalZombies("Base.RangersHomesteadMap", baseChanceZombies)
        -- addMapToTownZombies("Base.RangersHomesteadMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.RangersHomesteadMap", baseChanceZombies/2)
        -- addMapToMilitaryZombies("Base.RangersHomesteadMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.RangersHomesteadMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.RangersHomesteadMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.RangersHomesteadMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.RangersHomesteadMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.RangersHomesteadMap", baseChanceGlovebox);
        addMapToGloveboxes("Base.RangersHomesteadMap", baseChanceGlovebox/5);
        -- addMapToMapCratesFactories("Base.RangersHomesteadMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.RangersHomesteadMap", baseChanceCrateRandomJunk/5);
    end
    
    if SandboxVars.MoreMaps.FrigateMap and getActivatedMods():contains("The Frigate") then
        -- addMapToMedicalZombies("Base.FrigateMap", baseChanceZombies)
        -- addMapToTownZombies("Base.FrigateMap", baseChanceZombies/4)
        -- addMapToCountrySideZombies("Base.FrigateMap", baseChanceZombies/2)
        addMapToMilitaryZombies("Base.FrigateMap", baseChanceZombies);
        -- addMapToMechanics("Base.FrigateMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.FrigateMap", baseChanceMagazineRacks);
        -- addMapToSidetables("Base.FrigateMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.FrigateMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.FrigateMap", baseChanceGlovebox);
        -- addMapToGloveboxes("Base.FrigateMap", baseChanceGlovebox/5);
        -- addMapToMapCratesFactories("Base.FrigateMap", baseChanceMapFactoryCrate);
        -- addMapToCrateRandomJunk("Base.FrigateMap", baseChanceCrateRandomJunk/5);

    end
    
    if SandboxVars.MoreMaps.BunkerLastMinutePrepperMap and getActivatedMods():contains("LastMinutePrepperReloaded") or getActivatedMods():contains("LastMinutePrepper") then
        -- addMapToMedicalZombies("Base.BunkerLastMinutePrepperMap", baseChanceZombies)
        -- addMapToTownZombies("Base.BunkerLastMinutePrepperMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.BunkerLastMinutePrepperMap", baseChanceZombies/2)
        addMapToMilitaryZombies("Base.BunkerLastMinutePrepperMap", baseChanceZombies);
        -- addMapToMechanics("Base.BunkerLastMinutePrepperMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.BunkerLastMinutePrepperMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.BunkerLastMinutePrepperMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.BunkerLastMinutePrepperMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.BunkerLastMinutePrepperMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.BunkerLastMinutePrepperMap", baseChanceGlovebox/15);
        -- addMapToMapCratesFactories("Base.BunkerLastMinutePrepperMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.BunkerLastMinutePrepperMap", baseChanceCrateRandomJunk/15);
    end
    
    if SandboxVars.MoreMaps.LouisvilleQuarantineZoneMap and getActivatedMods():contains("Louisville_Quarantine_Zone") then

        -- addMapToMedicalZombies("Base.LouisvilleQuarantineZoneMap", baseChanceZombies)
        addMapToTownZombies("Base.LouisvilleQuarantineZoneMap", baseChanceZombies/4)
        -- addMapToCountrySideZombies("Base.LouisvilleQuarantineZoneMap", baseChanceZombies/2)
        addMapToMilitaryZombies("Base.LouisvilleQuarantineZoneMap", baseChanceZombies);
        -- addMapToMechanics("Base.LouisvilleQuarantineZoneMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.LouisvilleQuarantineZoneMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.LouisvilleQuarantineZoneMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.LouisvilleQuarantineZoneMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.LouisvilleQuarantineZoneMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.LouisvilleQuarantineZoneMap", baseChanceGlovebox/15);
        -- addMapToMapCratesFactories("Base.LouisvilleQuarantineZoneMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.LouisvilleQuarantineZoneMap", baseChanceCrateRandomJunk/15);
    end
    
    if SandboxVars.MoreMaps.LVInternationalAirport and getActivatedMods():contains("SimonMDLVInternationalAirport") then

        -- addMapToMedicalZombies("Base.LVInternationalAirport", baseChanceZombies)
        addMapToTownZombies("Base.LVInternationalAirport", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.LVInternationalAirport", baseChanceZombies/2)
        addMapToMilitaryZombies("Base.LVInternationalAirport", baseChanceZombies/4);
        addMapToMechanics("Base.LVInternationalAirport", baseChanceMechanics/5);
        addMapToMagazineRacks("Base.LVInternationalAirport", baseChanceMagazineRacks/5);
        -- addMapToSidetables("Base.LVInternationalAirport", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.LVInternationalAirport", baseChanceSurvivorBag/5);
        addMapToPoliceGlovebox("Base.LVInternationalAirport", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.LVInternationalAirport", baseChanceGlovebox/15);
        -- addMapToMapCratesFactories("Base.LVInternationalAirport", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.LVInternationalAirport", baseChanceCrateRandomJunk/15);
    end
    
    if SandboxVars.MoreMaps.MuldraughCheckpointMap and (getActivatedMods():contains("MuldraughCheckpoint") or getActivatedMods():contains("MuldraughCheckpoint[HARDMODE]")) then
        -- addMapToMedicalZombies("Base.MuldraughCheckpointMap", baseChanceZombies)
        addMapToTownZombies("Base.MuldraughCheckpointMap", baseChanceZombies/4)
        -- addMapToCountrySideZombies("Base.MuldraughCheckpointMap", baseChanceZombies/2)
        addMapToMilitaryZombies("Base.MuldraughCheckpointMap", baseChanceZombies);
        -- addMapToMechanics("Base.MuldraughCheckpointMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.MuldraughCheckpointMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.MuldraughCheckpointMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.MuldraughCheckpointMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.MuldraughCheckpointMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.MuldraughCheckpointMap", baseChanceGlovebox/15);
        -- addMapToMapCratesFactories("Base.MuldraughCheckpointMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.MuldraughCheckpointMap", baseChanceCrateRandomJunk/15);

    end
    
    if SandboxVars.MoreMaps.SpeckMap and getActivatedMods():contains("Speck_Map") then
        -- addMapToMedicalZombies("Base.SpeckMap", baseChanceZombies)
        -- addMapToTownZombies("Base.SpeckMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.SpeckMap", baseChanceZombies/5)
        -- addMapToMilitaryZombies("Base.SpeckMap", baseChanceZombies);
        -- addMapToMechanics("Base.SpeckMap", baseChanceMechanics);
        addMapToMagazineRacks("Base.SpeckMap", baseChanceMagazineRacks/5);
        addMapToSidetables("Base.SpeckMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.SpeckMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.SpeckMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.SpeckMap", baseChanceGlovebox/15);
        addMapToMapCratesFactories("Base.SpeckMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.SpeckMap", baseChanceCrateRandomJunk/15);

    end
    
    if SandboxVars.MoreMaps.HomesteadWindyMap and getActivatedMods():contains("HomesteadWindy") then
        -- addMapToMedicalZombies("Base.HomesteadWindyMap", baseChanceZombies)
        addMapToTownZombies("Base.HomesteadWindyMap", baseChanceZombies/8)
        addMapToCountrySideZombies("Base.HomesteadWindyMap", baseChanceZombies/2)
        -- addMapToMilitaryZombies("Base.HomesteadWindyMap", baseChanceZombies/4);
        -- addMapToMechanics("Base.HomesteadWindyMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.HomesteadWindyMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.HomesteadWindyMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.HomesteadWindyMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.HomesteadWindyMap", baseChanceGlovebox);
        addMapToGloveboxes("Base.HomesteadWindyMap", baseChanceGlovebox/5);
        -- addMapToMapCratesFactories("Base.HomesteadWindyMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.HomesteadWindyMap", baseChanceCrateRandomJunk/5);
    end
    
    if SandboxVars.MoreMaps.MilitaryFuelDepotMap and getActivatedMods():contains("military fuel depot") then
        -- addMapToMedicalZombies("Base.MilitaryFuelDepotMap", baseChanceZombies)
        -- addMapToTownZombies("Base.MilitaryFuelDepotMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.MilitaryFuelDepotMap", baseChanceZombies/2)
        addMapToMilitaryZombies("Base.MilitaryFuelDepotMap", baseChanceZombies);
        addMapToMechanics("Base.MilitaryFuelDepotMap", baseChanceMechanics/4);
        -- addMapToMagazineRacks("Base.MilitaryFuelDepotMap", baseChanceMagazineRacks);
        -- addMapToSidetables("Base.MilitaryFuelDepotMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.MilitaryFuelDepotMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.MilitaryFuelDepotMap", baseChanceGlovebox/4);
        -- addMapToGloveboxes("Base.MilitaryFuelDepotMap", baseChanceGlovebox/15);
        -- addMapToMapCratesFactories("Base.MilitaryFuelDepotMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.MilitaryFuelDepotMap", baseChanceCrateRandomJunk/15);
    end
    
    if SandboxVars.MoreMaps.SpencerMansionMap and (getActivatedMods():contains("SimonMDSpencerMansionLootable") or getActivatedMods():contains("SpencerMansionMap") ) then
        -- addMapToMedicalZombies("Base.SpencerMansionMap", baseChanceZombies)
        addMapToTownZombies("Base.SpencerMansionMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.SpencerMansionMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.SpencerMansionMap", baseChanceZombies);
        -- addMapToMechanics("Base.SpencerMansionMap", baseChanceMechanics/4);
        -- addMapToMagazineRacks("Base.SpencerMansionMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.SpencerMansionMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.SpencerMansionMap", baseChanceSurvivorBag/3);
        -- addMapToPoliceGlovebox("Base.SpencerMansionMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.SpencerMansionMap", baseChanceGlovebox/15);
        -- addMapToMapCratesFactories("Base.SpencerMansionMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.SpencerMansionMap", baseChanceCrateRandomJunk/15);

    end
    
    if SandboxVars.MoreMaps.UncleRedsBunkerMap and (getActivatedMods():contains("UncleRedsBunker") or getActivatedMods():contains("UncleRedsBunkerRedux") ) then
        -- addMapToMedicalZombies("Base.UncleRedsBunkerMap", baseChanceZombies)
        addMapToTownZombies("Base.UncleRedsBunkerMap", baseChanceZombies/25)
        addMapToCountrySideZombies("Base.UncleRedsBunkerMap", baseChanceZombies/25)
        addMapToMilitaryZombies("Base.UncleRedsBunkerMap", baseChanceZombies);
        -- addMapToMechanics("Base.UncleRedsBunkerMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.UncleRedsBunkerMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.UncleRedsBunkerMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.UncleRedsBunkerMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.UncleRedsBunkerMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.UncleRedsBunkerMap", baseChanceGlovebox/15);
        -- addMapToMapCratesFactories("Base.UncleRedsBunkerMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.UncleRedsBunkerMap", baseChanceCrateRandomJunk/15);

    end
    
    if SandboxVars.MoreMaps.HopefallsMap and getActivatedMods():contains("Hopefalls") then
        -- addMapToMedicalZombies("Base.HopefallsMap", baseChanceZombies)
        addMapToTownZombies("Base.HopefallsMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.HopefallsMap", baseChanceZombies/2)
        -- addMapToMilitaryZombies("Base.HopefallsMap", baseChanceZombies);
        addMapToMechanics("Base.HopefallsMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.HopefallsMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.HopefallsMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.HopefallsMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.HopefallsMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.HopefallsMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.HopefallsMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.HopefallsMap", baseChanceCrateRandomJunk/2);

    end
    
    if SandboxVars.MoreMaps.VineGroveMap and getActivatedMods():contains("Legacy_Vinegrove") then
        -- addMapToMedicalZombies("Base.VineGroveMap", baseChanceZombies)
        addMapToTownZombies("Base.VineGroveMap", baseChanceZombies/6)
        addMapToCountrySideZombies("Base.VineGroveMap", baseChanceZombies/6)
        -- addMapToMilitaryZombies("Base.VineGroveMap", baseChanceZombies);
        addMapToMechanics("Base.VineGroveMap", baseChanceMechanics/6);
        addMapToMagazineRacks("Base.VineGroveMap", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.VineGroveMap", baseChanceSideTable/8);
        addMapToSurvivorBag("Base.VineGroveMap", baseChanceSurvivorBag/5);
        -- addMapToPoliceGlovebox("Base.VineGroveMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.VineGroveMap", baseChanceGlovebox/6);
        addMapToMapCratesFactories("Base.VineGroveMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.VineGroveMap", baseChanceCrateRandomJunk/6);
    end
    if SandboxVars.MoreMaps.LouisianaMap and getActivatedMods():contains("Legacy_Louisiana") then
        -- addMapToMedicalZombies("Base.LouisianaMap", baseChanceZombies)
        addMapToTownZombies("Base.LouisianaMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.LouisianaMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.LouisianaMap", baseChanceZombies);
        addMapToMechanics("Base.LouisianaMap", baseChanceMechanics/4);
        addMapToMagazineRacks("Base.LouisianaMap", baseChanceMagazineRacks/3);
        addMapToSidetables("Base.LouisianaMap", baseChanceSideTable/5);
        addMapToSurvivorBag("Base.LouisianaMap", baseChanceSurvivorBag/3);
        -- addMapToPoliceGlovebox("Base.LouisianaMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.LouisianaMap", baseChanceGlovebox/3);
        addMapToMapCratesFactories("Base.LouisianaMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.LouisianaMap", baseChanceCrateRandomJunk/3);
    end
    if SandboxVars.MoreMaps.CaliforniaMaps and getActivatedMods():contains("Legacy_California") then
        -- addMapToMedicalZombies("Base.CaliforniaMap", baseChanceZombies)
        addMapToTownZombies("Base.CaliforniaMap", baseChanceZombies/15)
        addMapToCountrySideZombies("Base.CaliforniaMap", baseChanceZombies/15)
        -- addMapToMilitaryZombies("Base.CaliforniaMap", baseChanceZombies);
        addMapToMechanics("Base.CaliforniaMap", baseChanceMechanics/15);
        addMapToMagazineRacks("Base.CaliforniaMap", baseChanceMagazineRacks/8);
        addMapToSidetables("Base.CaliforniaMap", baseChanceSideTable/15);
        addMapToSurvivorBag("Base.CaliforniaMap", baseChanceSurvivorBag/10);
        -- addMapToPoliceGlovebox("Base.CaliforniaMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.CaliforniaMap", baseChanceGlovebox/15);
        addMapToMapCratesFactories("Base.CaliforniaMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.CaliforniaMap", baseChanceCrateRandomJunk/15);
        -- addMapToMedicalZombies("Base.CaliforniaMapNorth", baseChanceZombies)
        addMapToTownZombies("Base.CaliforniaMapNorth", baseChanceZombies/6)
        addMapToCountrySideZombies("Base.CaliforniaMapNorth", baseChanceZombies/6)
        -- addMapToMilitaryZombies("Base.CaliforniaMapNorth", baseChanceZombies);
        addMapToMechanics("Base.CaliforniaMapNorth", baseChanceMechanics/6);
        addMapToMagazineRacks("Base.CaliforniaMapNorth", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.CaliforniaMapNorth", baseChanceSideTable/8);
        addMapToSurvivorBag("Base.CaliforniaMapNorth", baseChanceSurvivorBag/5);
        -- addMapToPoliceGlovebox("Base.CaliforniaMapNorth", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.CaliforniaMapNorth", baseChanceGlovebox/6);
        addMapToMapCratesFactories("Base.CaliforniaMapNorth", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.CaliforniaMapNorth", baseChanceCrateRandomJunk/6);
        -- addMapToMedicalZombies("Base.CaliforniaMapSouth", baseChanceZombies)
        addMapToTownZombies("Base.CaliforniaMapSouth", baseChanceZombies/6)
        addMapToCountrySideZombies("Base.CaliforniaMapSouth", baseChanceZombies/6)
        -- addMapToMilitaryZombies("Base.CaliforniaMapSouth", baseChanceZombies);
        addMapToMechanics("Base.CaliforniaMapSouth", baseChanceMechanics/6);
        addMapToMagazineRacks("Base.CaliforniaMapSouth", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.CaliforniaMapSouth", baseChanceSideTable/8);
        addMapToSurvivorBag("Base.CaliforniaMapSouth", baseChanceSurvivorBag/5);
        -- addMapToPoliceGlovebox("Base.CaliforniaMapSouth", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.CaliforniaMapSouth", baseChanceGlovebox/6);
        addMapToMapCratesFactories("Base.CaliforniaMapSouth", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.CaliforniaMapSouth", baseChanceCrateRandomJunk/6);
    end
    
    if SandboxVars.MoreMaps.WeyhausenMap and getActivatedMods():contains("WeyhausenByCallnmx") then
        -- addMapToMedicalZombies("Base.WeyhausenMap", baseChanceZombies)
        addMapToTownZombies("Base.WeyhausenMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.WeyhausenMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.WeyhausenMap", baseChanceZombies);
        addMapToMechanics("Base.WeyhausenMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.WeyhausenMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.WeyhausenMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.WeyhausenMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.WeyhausenMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.WeyhausenMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.WeyhausenMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.WeyhausenMap", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.DaisyCountyMap and getActivatedMods():contains("Daisy County") then
        -- addMapToMedicalZombies("Base.DaisyCountyMap", baseChanceZombies)
        addMapToTownZombies("Base.DaisyCountyMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.DaisyCountyMap", baseChanceZombies/2)
        -- addMapToMilitaryZombies("Base.DaisyCountyMap", baseChanceZombies);
        addMapToMechanics("Base.DaisyCountyMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.DaisyCountyMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.DaisyCountyMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.DaisyCountyMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.DaisyCountyMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.DaisyCountyMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.DaisyCountyMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.DaisyCountyMap", baseChanceCrateRandomJunk/2);

    end
    
    
    if SandboxVars.MoreMaps.McCoysBunkerMap and getActivatedMods():contains("McCoysBunker") then

        -- addMapToMedicalZombies("Base.BunkerLastMinutePrepperMap", baseChanceZombies)
        addMapToTownZombies("Base.BunkerLastMinutePrepperMap", baseChanceZombies/20)
        addMapToCountrySideZombies("Base.BunkerLastMinutePrepperMap", baseChanceZombies/20)
        addMapToMilitaryZombies("Base.BunkerLastMinutePrepperMap", baseChanceZombies);
        -- addMapToMechanics("Base.BunkerLastMinutePrepperMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.BunkerLastMinutePrepperMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.BunkerLastMinutePrepperMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.BunkerLastMinutePrepperMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.BunkerLastMinutePrepperMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.BunkerLastMinutePrepperMap", baseChanceGlovebox/15);
        -- addMapToMapCratesFactories("Base.BunkerLastMinutePrepperMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.BunkerLastMinutePrepperMap", baseChanceCrateRandomJunk/15);
    end

    
    if SandboxVars.MoreMaps.OtterCreekMap and getActivatedMods():contains("OtterCreek") then
        -- addMapToMedicalZombies("Base.OtterCreekMap", baseChanceZombies)
        addMapToTownZombies("Base.OtterCreekMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.OtterCreekMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.OtterCreekMap", baseChanceZombies);
        addMapToMechanics("Base.OtterCreekMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.OtterCreekMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.OtterCreekMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.OtterCreekMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.OtterCreekMap", baseChanceGlovebox/2);
        addMapToGloveboxes("Base.OtterCreekMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.OtterCreekMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.OtterCreekMap", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.WellsburgLakeMap and getActivatedMods():contains("Wellsburg") then
        -- addMapToMedicalZombies("Base.WellsburgLakeMap", baseChanceZombies)
        addMapToTownZombies("Base.WellsburgLakeMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.WellsburgLakeMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.WellsburgLakeMap", baseChanceZombies);
        addMapToMechanics("Base.WellsburgLakeMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.WellsburgLakeMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.WellsburgLakeMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.WellsburgLakeMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.WellsburgLakeMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.WellsburgLakeMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.WellsburgLakeMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.WellsburgLakeMap", baseChanceCrateRandomJunk/2);
    end
    
    if SandboxVars.MoreMaps.FortBoonesboroughMap and getActivatedMods():contains("Fort_Boonesborough") then
        -- addMapToMedicalZombies("Base.FortBoonesboroughMap", baseChanceZombies)
        addMapToTownZombies("Base.FortBoonesboroughMap", baseChanceZombies/10)
        addMapToCountrySideZombies("Base.FortBoonesboroughMap", baseChanceZombies/10)
        addMapToMilitaryZombies("Base.FortBoonesboroughMap", baseChanceZombies);
        -- addMapToMechanics("Base.FortBoonesboroughMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.FortBoonesboroughMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.FortBoonesboroughMap", baseChanceSideTable/5);
        addMapToSurvivorBag("Base.FortBoonesboroughMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.FortBoonesboroughMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.FortBoonesboroughMap", baseChanceGlovebox/10);
        -- addMapToMapCratesFactories("Base.FortBoonesboroughMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.FortBoonesboroughMap", baseChanceCrateRandomJunk/10);
    end
    
    if SandboxVars.MoreMaps.CrowlakeMap and getActivatedMods():contains("Wellsburg") then
        -- addMapToMedicalZombies("Base.CrowlakeMap", baseChanceZombies)
        addMapToTownZombies("Base.CrowlakeMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.CrowlakeMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.CrowlakeMap", baseChanceZombies);
        addMapToMechanics("Base.CrowlakeMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.CrowlakeMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.CrowlakeMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.CrowlakeMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.CrowlakeMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.CrowlakeMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.CrowlakeMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.CrowlakeMap", baseChanceCrateRandomJunk/2);
    end
    if SandboxVars.MoreMaps.GustonMap and getActivatedMods():contains("Guston") then
        -- addMapToMedicalZombies("Base.GustonMap", baseChanceZombies)
        addMapToTownZombies("Base.GustonMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.GustonMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.GustonMap", baseChanceZombies);
        addMapToMechanics("Base.GustonMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.GustonMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.GustonMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.GustonMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.GustonMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.GustonMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.GustonMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.GustonMap", baseChanceCrateRandomJunk/2);
    end
    if SandboxVars.MoreMaps.JaspervilleMap and getActivatedMods():contains("Jasperville") then
        -- addMapToMedicalZombies("Base.GustonMap", baseChanceZombies)
        addMapToTownZombies("Base.JaspervilleMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.JaspervilleMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.GustonMap", baseChanceZombies);
        addMapToMechanics("Base.JaspervilleMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.JaspervilleMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.JaspervilleMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.JaspervilleMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.GustonMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.JaspervilleMap", baseChanceGlovebox/2);
        addMapToMapCratesFactories("Base.JaspervilleMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.JaspervilleMap", baseChanceCrateRandomJunk/2);
        
        -- addMapToMedicalZombies("Base.JaspervilleIndustrialMap", baseChanceZombies)
        addMapToTownZombies("Base.JaspervilleIndustrialMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.JaspervilleIndustrialMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.JaspervilleIndustrialMap", baseChanceZombies);
        addMapToMechanics("Base.JaspervilleIndustrialMap", baseChanceMechanics);
        -- addMapToMagazineRacks("Base.JaspervilleIndustrialMap", baseChanceMagazineRacks/5);
        -- addMapToSidetables("Base.JaspervilleIndustrialMap", baseChanceSideTable/2);
        -- addMapToSurvivorBag("Base.JaspervilleIndustrialMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.JaspervilleIndustrialMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.JaspervilleIndustrialMap", baseChanceGlovebox/2);
        -- addMapToMapCratesFactories("Base.JaspervilleIndustrialMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.JaspervilleIndustrialMap", baseChanceCrateRandomJunk/2);
        
        
        -- addMapToMedicalZombies("Base.JaspervilleTrainStationMap", baseChanceZombies)
        addMapToTownZombies("Base.JaspervilleTrainStationMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.JaspervilleTrainStationMap", baseChanceZombies/10)
        -- addMapToMilitaryZombies("Base.JaspervilleTrainStationMap", baseChanceZombies);
        addMapToMechanics("Base.JaspervilleTrainStationMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.JaspervilleTrainStationMap", baseChanceMagazineRacks/5);
        addMapToSidetables("Base.JaspervilleTrainStationMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.JaspervilleTrainStationMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.JaspervilleTrainStationMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.JaspervilleTrainStationMap", baseChanceGlovebox/5);
        -- addMapToMapCratesFactories("Base.JaspervilleTrainStationMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.JaspervilleTrainStationMap", baseChanceCrateRandomJunk/2);

    end
    
    if SandboxVars.MoreMaps.YakamaStateParkMap and getActivatedMods():contains("YakamaStatePark") then
        -- addMapToMedicalZombies("Base.YakamaStatePark", baseChanceZombies)
        addMapToTownZombies("Base.YakamaStatePark", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.YakamaStatePark", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.YakamaStatePark", baseChanceZombies);
        -- addMapToMechanics("Base.YakamaStatePark", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.YakamaStatePark", baseChanceMagazineRacks/4);
        addMapToSidetables("Base.YakamaStatePark", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.YakamaStatePark", baseChanceSurvivorBag/4);
        -- addMapToPoliceGlovebox("Base.YakamaStatePark", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.YakamaStatePark", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.YakamaStatePark", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.YakamaStatePark", baseChanceCrateRandomJunk/4);
    end

    
    if SandboxVars.MoreMaps.ValuTechAmusementParkMap and getActivatedMods():contains("SimonMDValuTechAmusementPark") then
        -- addMapToMedicalZombies("Base.ValuTechAmusementParkMap", baseChanceZombies)
        addMapToTownZombies("Base.ValuTechAmusementParkMap", baseChanceZombies)
        -- addMapToCountrySideZombies("Base.ValuTechAmusementParkMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.ValuTechAmusementParkMap", baseChanceZombies);
        -- addMapToMechanics("Base.ValuTechAmusementParkMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.ValuTechAmusementParkMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.ValuTechAmusementParkMap", baseChanceSideTable/4);
        addMapToSurvivorBag("Base.ValuTechAmusementParkMap", baseChanceSurvivorBag/4);
        -- addMapToPoliceGlovebox("Base.ValuTechAmusementParkMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.ValuTechAmusementParkMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.ValuTechAmusementParkMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.ValuTechAmusementParkMap", baseChanceCrateRandomJunk/4);
    end
    if SandboxVars.MoreMaps.CanvasbackStudiosMap and getActivatedMods():contains("Canvasback Studios") then
        -- addMapToMedicalZombies("Base.CanvasbackStudiosMap", baseChanceZombies)
        addMapToTownZombies("Base.CanvasbackStudiosMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.CanvasbackStudiosMap", baseChanceZombies)
        -- addMapToMilitaryZombies("Base.CanvasbackStudiosMap", baseChanceZombies);
        -- addMapToMechanics("Base.CanvasbackStudiosMap", baseChanceMechanics/2);
        -- addMapToMagazineRacks("Base.CanvasbackStudiosMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.CanvasbackStudiosMap", baseChanceSideTable/4);
        -- addMapToSurvivorBag("Base.CanvasbackStudiosMap", baseChanceSurvivorBag/4);
        -- addMapToPoliceGlovebox("Base.CanvasbackStudiosMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.CanvasbackStudiosMap", baseChanceGlovebox/4);
        -- addMapToMapCratesFactories("Base.CanvasbackStudiosMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.CanvasbackStudiosMap", baseChanceCrateRandomJunk/4);
    end
    if SandboxVars.MoreMaps.PlefordSpringsMap and getActivatedMods():contains("PlefordSpringsMapMod") then
        -- addMapToMedicalZombies("Base.PlefordSpringsMap", baseChanceZombies)
        addMapToTownZombies("Base.PlefordSpringsMap", baseChanceZombies)
        addMapToCountrySideZombies("Base.PlefordSpringsMap", baseChanceZombies/4)
        -- addMapToMilitaryZombies("Base.PlefordSpringsMap", baseChanceZombies);
        addMapToMechanics("Base.PlefordSpringsMap", baseChanceMechanics/2);
        addMapToMagazineRacks("Base.PlefordSpringsMap", baseChanceMagazineRacks);
        addMapToSidetables("Base.PlefordSpringsMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.PlefordSpringsMap", baseChanceSurvivorBag);
        -- addMapToPoliceGlovebox("Base.PlefordSpringsMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.PlefordSpringsMap", baseChanceGlovebox);
        addMapToMapCratesFactories("Base.PlefordSpringsMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.PlefordSpringsMap", baseChanceCrateRandomJunk);
    end
    if SandboxVars.MoreMaps.FoxWoodMap and getActivatedMods():contains("One cell life") then
        -- addMapToMedicalZombies("Base.FoxWoodMap", baseChanceZombies)
        -- addMapToTownZombies("Base.FoxWoodMap", baseChanceZombies/2)
        addMapToCountrySideZombies("Base.FoxWoodMap", baseChanceZombies*2)
        -- addMapToMilitaryZombies("Base.FoxWoodMap", baseChanceZombies);
        -- addMapToMechanics("Base.FoxWoodMap", baseChanceMechanics/2);
        -- addMapToMagazineRacks("Base.FoxWoodMap", baseChanceMagazineRacks);
        -- addMapToSidetables("Base.FoxWoodMap", baseChanceSideTable);
        addMapToSurvivorBag("Base.FoxWoodMap", baseChanceSurvivorBag/2);
        -- addMapToPoliceGlovebox("Base.FoxWoodMap", baseChanceGlovebox/4);
        -- addMapToGloveboxes("Base.FoxWoodMap", baseChanceGlovebox);
        -- addMapToMapCratesFactories("Base.FoxWoodMap", baseChanceMapFactoryCrate);
        addMapToCrateRandomJunk("Base.FoxWoodMap", baseChanceCrateRandomJunk/4);
    end

    if SandboxVars.MoreMaps.BrazilMap and getActivatedMods():contains("mapa brasil") then
        -- addMapToMedicalZombies("Base.BrazilMap", baseChanceZombies)
        addMapToTownZombies("Base.BrazilMap", baseChanceZombies/2)
        -- addMapToCountrySideZombies("Base.BrazilMap", baseChanceZombies/2)
        -- addMapToMilitaryZombies("Base.BrazilMap", baseChanceZombies);
        addMapToMechanics("Base.BrazilMap", baseChanceMechanics/5);
        addMapToMagazineRacks("Base.BrazilMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.BrazilMap", baseChanceSideTable/2);
        addMapToSurvivorBag("Base.BrazilMap", baseChanceSurvivorBag/4);
        -- addMapToPoliceGlovebox("Base.BrazilMap", baseChanceGlovebox/4);
        addMapToGloveboxes("Base.BrazilMap", baseChanceGlovebox/4);
        addMapToMapCratesFactories("Base.BrazilMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.BrazilMap", baseChanceCrateRandomJunk/4);
    end
    
    
    if SandboxVars.MoreMaps.HavenRidgeMap and getActivatedMods():contains("LastOfUs") then
        -- addMapToMedicalZombies("Base.HavenRidgeMap", baseChanceZombies)
        addMapToTownZombies("Base.HavenRidgeMap", baseChanceZombies/4)
        addMapToCountrySideZombies("Base.HavenRidgeMap", baseChanceZombies/10)
        addMapToMilitaryZombies("Base.HavenRidgeMap", baseChanceZombies);
        -- addMapToMechanics("Base.HavenRidgeMap", baseChanceMechanics/5);
        -- addMapToMagazineRacks("Base.HavenRidgeMap", baseChanceMagazineRacks/2);
        addMapToSidetables("Base.HavenRidgeMap", baseChanceSideTable/10);
        addMapToSurvivorBag("Base.HavenRidgeMap", baseChanceSurvivorBag/2);
        addMapToPoliceGlovebox("Base.HavenRidgeMap", baseChanceGlovebox);
        addMapToGloveboxes("Base.HavenRidgeMap", baseChanceGlovebox/4);
        -- addMapToMapCratesFactories("Base.HavenRidgeMap", baseChanceMapFactoryCrate/2);
        addMapToCrateRandomJunk("Base.HavenRidgeMap", baseChanceCrateRandomJunk/10);
    end

end

Events.OnPreDistributionMerge.Add(initMapDistributions)
