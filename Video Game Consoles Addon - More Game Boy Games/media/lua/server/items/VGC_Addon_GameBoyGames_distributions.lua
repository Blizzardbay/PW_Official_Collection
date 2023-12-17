local gameboyDummies = {
	"VGC_Addon_GameBoyGames.GB_Cartridge_Dummy1",
	"VGC_Addon_GameBoyGames.GB_Cartridge_Dummy2",
	"VGC_Addon_GameBoyGames.GB_Cartridge_Dummy3",
	"VGC_Addon_GameBoyGames.GB_Cartridge_Dummy4",
	"VGC_Addon_GameBoyGames.GB_Cartridge_Dummy5",

  }
  
  local function addGameboyLoot(proc_name, chance)
	local data = ProceduralDistributions.list
	if not data then
	  return print('VGC GB Addon ERROR: procedure distributions not found!')
	end
	
	local c = data[proc_name];
	if not c then
	  return print('VGC GB Addon ERROR: cant add items to procedure '..proc_name)
	end
	
	for _, console in ipairs(gameboyDummies) do
	  table.insert(c.items, console);
	  table.insert(c.items, chance);
	end
  end
  
  -- ProceduralDistributions
  addGameboyLoot("BreakRoomShelves", 0.04)
  addGameboyLoot("ClassroomShelves", 0.04)
  addGameboyLoot("MusicStoreCDs", 0.04)
  addGameboyLoot("CrateElectronics", 0.1)
  addGameboyLoot("ElectronicStoreMisc", 0.1)
  addGameboyLoot("ElectronicStoreMusic", 0.04)
  addGameboyLoot("MusicStoreCDs", 0.04)
  addGameboyLoot("GigamartHouseElectronics", 0.1)
  addGameboyLoot("LivingRoomShelf", 0.1)
  addGameboyLoot("LivingRoomShelfNoTapes", 0.04)
  addGameboyLoot("SchoolLockers", 0.04)
  addGameboyLoot("OfficeDeskHome", 0.04)
  addGameboyLoot("WardrobeChild", 0.1)
  addGameboyLoot("WardrobeMan", 0.04)
  addGameboyLoot("MechanicShelfElectric", 0.04)
  addGameboyLoot("CrateCompactDiscs", 0.04)
  addGameboyLoot("DeskGeneric", 0.04)
  addGameboyLoot("ShelfGeneric", 0.04)
  addGameboyLoot("MusicStoreCases", 0.04)
  
  --- Replace Dummies function by albion ---
-- list of items to replace the dummy with
local itemList =
	{
		'VGC_Addon_GameBoyGames.GB_Cartridge_Alleyway',
		'VGC_Addon_GameBoyGames.GB_Cartridge_AvengingSpirit',
		'VGC_Addon_GameBoyGames.GB_Cartridge_BalloonKid',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Baseball',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Batman',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Battletoads',
		'VGC_Addon_GameBoyGames.GB_Cartridge_BionicCommando',
		'VGC_Addon_GameBoyGames.GB_Cartridge_BubbleBobble',
		'VGC_Addon_GameBoyGames.GB_Cartridge_BugsBunny',
		'VGC_Addon_GameBoyGames.GB_Cartridge_BugsBunny2',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Castlevania',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Castlevania2',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Catrap',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Dexterity',
		'VGC_Addon_GameBoyGames.GB_Cartridge_DoubleDragon',
		'VGC_Addon_GameBoyGames.GB_Cartridge_DoubleDragon2',
		'VGC_Addon_GameBoyGames.GB_Cartridge_DrMario',
		'VGC_Addon_GameBoyGames.GB_Cartridge_DuckTales',
		'VGC_Addon_GameBoyGames.GB_Cartridge_F1Race',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Fantasy',
		'VGC_Addon_GameBoyGames.GB_Cartridge_FFLegend',
		'VGC_Addon_GameBoyGames.GB_Cartridge_FFLegend2',
		'VGC_Addon_GameBoyGames.GB_Cartridge_FortifiedZone',
		'VGC_Addon_GameBoyGames.GB_Cartridge_GargoylesQuest',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Golf',
		'VGC_Addon_GameBoyGames.GB_Cartridge_KidDracula',
		'VGC_Addon_GameBoyGames.GB_Cartridge_KidIcarus',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Kirby',
		'VGC_Addon_GameBoyGames.GB_Cartridge_LittleMermaid',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Mario',
		'VGC_Addon_GameBoyGames.GB_Cartridge_MegaMan',
		'VGC_Addon_GameBoyGames.GB_Cartridge_MegaMan2',
		'VGC_Addon_GameBoyGames.GB_Cartridge_MegaMan3',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Metroid2',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Mickey',
		'VGC_Addon_GameBoyGames.GB_Cartridge_MotocrossManiacs',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Nemesis',
		'VGC_Addon_GameBoyGames.GB_Cartridge_NinjaGaiden',
		'VGC_Addon_GameBoyGames.GB_Cartridge_OperationC',
		'VGC_Addon_GameBoyGames.GB_Cartridge_QIX',
		'VGC_Addon_GameBoyGames.GB_Cartridge_RolansCurse',
		'VGC_Addon_GameBoyGames.GB_Cartridge_RolansCurse2',
		'VGC_Addon_GameBoyGames.GB_Cartridge_RType',
		'VGC_Addon_GameBoyGames.GB_Cartridge_SolarStriker',
		'VGC_Addon_GameBoyGames.GB_Cartridge_SolomonsClub',
		'VGC_Addon_GameBoyGames.GB_Cartridge_StarWars',
		'VGC_Addon_GameBoyGames.GB_Cartridge_StarWars2',
		'VGC_Addon_GameBoyGames.GB_Cartridge_SuperMario2',
		'VGC_Addon_GameBoyGames.GB_Cartridge_SuperRC',
		'VGC_Addon_GameBoyGames.GB_Cartridge_SwordOfHope',
		'VGC_Addon_GameBoyGames.GB_Cartridge_TailGator',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Tennis',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Tetris',
		'VGC_Addon_GameBoyGames.GB_Cartridge_TMNT',
		'VGC_Addon_GameBoyGames.GB_Cartridge_TMNT2',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Trax',
		'VGC_Addon_GameBoyGames.GB_Cartridge_WaveRace',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Yoshi',
		'VGC_Addon_GameBoyGames.GB_Cartridge_YoshisCookie',
		'VGC_Addon_GameBoyGames.GB_Cartridge_Zelda',
	}

local function replaceDummies(container)
    local dummies = container:getAllType('VGC_Addon_GameBoyGames.GB_Cartridge_Dummy1') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
	
	local dummies = container:getAllType('VGC_Addon_GameBoyGames.GB_Cartridge_Dummy2') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
	
	local dummies = container:getAllType('VGC_Addon_GameBoyGames.GB_Cartridge_Dummy3') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
	
	local dummies = container:getAllType('VGC_Addon_GameBoyGames.GB_Cartridge_Dummy4') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
	
	local dummies = container:getAllType('VGC_Addon_GameBoyGames.GB_Cartridge_Dummy5') -- dummy item type
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