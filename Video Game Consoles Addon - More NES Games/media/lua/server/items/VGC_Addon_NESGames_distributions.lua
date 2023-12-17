local nesDummies = {
	"VGC_Addon_NESGames.NES_Cartridge_Dummy1",
	"VGC_Addon_NESGames.NES_Cartridge_Dummy2",
	"VGC_Addon_NESGames.NES_Cartridge_Dummy3",
	"VGC_Addon_NESGames.NES_Cartridge_Dummy4",
	"VGC_Addon_NESGames.NES_Cartridge_Dummy5",

  }
  
  local function addNESLoot(proc_name, chance)
	local data = ProceduralDistributions.list
	if not data then
	  return print('VGC NES Addon ERROR: procedure distributions not found!')
	end
	
	local c = data[proc_name];
	if not c then
	  return print('VGC NES Addon ERROR: cant add items to procedure '..proc_name)
	end
	
	for _, console in ipairs(nesDummies) do
	  table.insert(c.items, console);
	  table.insert(c.items, chance);
	end
  end
  
  -- ProceduralDistributions
  addNESLoot("BreakRoomShelves", 0.04)
  addNESLoot("ClassroomShelves", 0.04)
  addNESLoot("MusicStoreCDs", 0.04)
  addNESLoot("CrateElectronics", 0.1)
  addNESLoot("ElectronicStoreMisc", 0.1)
  addNESLoot("ElectronicStoreMusic", 0.04)
  addNESLoot("MusicStoreCDs", 0.04)
  addNESLoot("GigamartHouseElectronics", 0.1)
  addNESLoot("LivingRoomShelf", 0.1)
  addNESLoot("LivingRoomShelfNoTapes", 0.04)
  addNESLoot("SchoolLockers", 0.04)
  addNESLoot("OfficeDeskHome", 0.04)
  addNESLoot("WardrobeChild", 0.1)
  addNESLoot("WardrobeMan", 0.04)
  addNESLoot("MechanicShelfElectric", 0.04)
  addNESLoot("CrateCompactDiscs", 0.04)
  addNESLoot("DeskGeneric", 0.04)
  addNESLoot("ShelfGeneric", 0.04)
  addNESLoot("MusicStoreCases", 0.04)
  
  --- Replace Dummies function by albion ---
-- list of items to replace the dummy with
local itemList =
	{
		'VGC_Addon_NESGames.NES_Cartridge_AdventureIsland',
		'VGC_Addon_NESGames.NES_Cartridge_AdventureIsland2',
		'VGC_Addon_NESGames.NES_Cartridge_BaseballStars',
		'VGC_Addon_NESGames.NES_Cartridge_Batman',
		'VGC_Addon_NESGames.NES_Cartridge_Battletoads',
		'VGC_Addon_NESGames.NES_Cartridge_BionicCommando',
		'VGC_Addon_NESGames.NES_Cartridge_BladesOfSteel',
		'VGC_Addon_NESGames.NES_Cartridge_BlasterMaster',
		'VGC_Addon_NESGames.NES_Cartridge_Bomberman',
		'VGC_Addon_NESGames.NES_Cartridge_BubbleBobble',
		'VGC_Addon_NESGames.NES_Cartridge_Castlevania',
		'VGC_Addon_NESGames.NES_Cartridge_Castlevania2',
		'VGC_Addon_NESGames.NES_Cartridge_Castlevania3',
		'VGC_Addon_NESGames.NES_Cartridge_Contra',
		'VGC_Addon_NESGames.NES_Cartridge_Crystalis',
		'VGC_Addon_NESGames.NES_Cartridge_ChipNDale',
		'VGC_Addon_NESGames.NES_Cartridge_DoubleDragon',
		'VGC_Addon_NESGames.NES_Cartridge_DoubleDragon2',
		'VGC_Addon_NESGames.NES_Cartridge_DrMario',
		'VGC_Addon_NESGames.NES_Cartridge_DragonWarrior',
		'VGC_Addon_NESGames.NES_Cartridge_DragonWarrior2',
		'VGC_Addon_NESGames.NES_Cartridge_DragonWarrior3',
		'VGC_Addon_NESGames.NES_Cartridge_DragonWarrior4',
		'VGC_Addon_NESGames.NES_Cartridge_DuckHunt',
		'VGC_Addon_NESGames.NES_Cartridge_DuckTales',
		'VGC_Addon_NESGames.NES_Cartridge_Excitebike',
		'VGC_Addon_NESGames.NES_Cartridge_Faxanadu',
		'VGC_Addon_NESGames.NES_Cartridge_FinalFantasy',
		'VGC_Addon_NESGames.NES_Cartridge_GhostsNGoblins',
		'VGC_Addon_NESGames.NES_Cartridge_Gradius',
		'VGC_Addon_NESGames.NES_Cartridge_IceClimber',
		'VGC_Addon_NESGames.NES_Cartridge_Jackal',
		'VGC_Addon_NESGames.NES_Cartridge_KidIcarus',
		'VGC_Addon_NESGames.NES_Cartridge_Kirby',
		'VGC_Addon_NESGames.NES_Cartridge_KungFu',
		'VGC_Addon_NESGames.NES_Cartridge_LifeForce',
		'VGC_Addon_NESGames.NES_Cartridge_LodeRunner',
		'VGC_Addon_NESGames.NES_Cartridge_ManiacMansion',
		'VGC_Addon_NESGames.NES_Cartridge_MegaMan',
		'VGC_Addon_NESGames.NES_Cartridge_MegaMan2',
		'VGC_Addon_NESGames.NES_Cartridge_MegaMan3',
		'VGC_Addon_NESGames.NES_Cartridge_MetalGear',
		'VGC_Addon_NESGames.NES_Cartridge_Metroid',
		'VGC_Addon_NESGames.NES_Cartridge_PunchOut',
		'VGC_Addon_NESGames.NES_Cartridge_NinjaGaiden',
		'VGC_Addon_NESGames.NES_Cartridge_NinjaGaiden2',
		'VGC_Addon_NESGames.NES_Cartridge_RCProAm',
		'VGC_Addon_NESGames.NES_Cartridge_RiverCityRansom',
		'VGC_Addon_NESGames.NES_Cartridge_StarTropics',
		'VGC_Addon_NESGames.NES_Cartridge_SuperMarioBros',
		'VGC_Addon_NESGames.NES_Cartridge_SuperMarioBros2',
		'VGC_Addon_NESGames.NES_Cartridge_SuperMarioBros3',
		'VGC_Addon_NESGames.NES_Cartridge_TecmoBowl',
		'VGC_Addon_NESGames.NES_Cartridge_TecmoSuperBowl',
		'VGC_Addon_NESGames.NES_Cartridge_TMNT',
		'VGC_Addon_NESGames.NES_Cartridge_TMNT2',
		'VGC_Addon_NESGames.NES_Cartridge_TMNT3',
		'VGC_Addon_NESGames.NES_Cartridge_Tetris',
		'VGC_Addon_NESGames.NES_Cartridge_Zelda',
		'VGC_Addon_NESGames.NES_Cartridge_Zelda2',
	}

local function replaceDummies(container)
    local dummies = container:getAllType('VGC_Addon_NESGames.NES_Cartridge_Dummy1') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
	
	local dummies = container:getAllType('VGC_Addon_NESGames.NES_Cartridge_Dummy2') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
	
	local dummies = container:getAllType('VGC_Addon_NESGames.NES_Cartridge_Dummy3') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
	
	local dummies = container:getAllType('VGC_Addon_NESGames.NES_Cartridge_Dummy4') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
	
	local dummies = container:getAllType('VGC_Addon_NESGames.NES_Cartridge_Dummy5') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
end

-- for items in containers
local function onFillContainer(_roomName, _containerType, container)
    replaceDummies(container)
end

Events.OnFillContainer.Add(onFillContainer)