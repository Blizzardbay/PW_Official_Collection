---- Remove Loot function by Panopticon ----

-- Removes original VGC Game Boy games from spawning. Replaced by the addon for distribution balance reason.
if not getActivatedMods():contains("Video_Game_Consoles") then return end

local modName = "VGC_Addon_GameBoyGames"

local function RemoveLootFromType(containerName, itemName)
    local containerData = ProceduralDistributions.list[containerName]
    if not containerData then
        print("["..modName.."] Container "..containerName.." does not exist")
        return
    end
    
    local containerItems = containerData.items
    local itemFound = false
    for i, v in ipairs(containerItems) do
        local item = v
        if item == itemName then
            itemFound = true
            local itemChanceRemoved = table.remove(containerItems, i + 1)
            local itemNameRemoved = table.remove(containerItems, i)
            print("["..modName.."] Removed "..itemNameRemoved.." from "..containerName..". Spawn chance was "..itemChanceRemoved)
            break
        end
    end
    if not itemFound then
        print("["..modName.."] "..itemName.." was not found in "..containerName)
    end
end

--                        ------- GB_Cartridge_Zelda -------

RemoveLootFromType("BreakRoomShelves",		        "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("ClassroomShelves",		        "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("MusicStoreCDs",		        	"Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("CrateElectronics",		        "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("ElectronicStoreMisc",  	    	"Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("ElectronicStoreMusic",	        "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("GigamartHouseElectronics",	    "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("LivingRoomShelf",		        "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("SchoolLockers",		        	"Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("OfficeDeskHome",		        "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("WardrobeChild",  	            "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("WardrobeMan",	                "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("MechanicShelfElectric",			"Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("CrateCompactDiscs",	        	"Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("DeskGeneric",	                "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("ShelfGeneric",		            "Video_Game_Consoles.GB_Cartridge_Zelda");
RemoveLootFromType("MusicStoreCases",	            "Video_Game_Consoles.GB_Cartridge_Zelda");

--                     ------- GB_Cartridge_Kirby -------

RemoveLootFromType("BreakRoomShelves",		        "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("ClassroomShelves",		        "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("MusicStoreCDs",		        	"Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("CrateElectronics",		        "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("ElectronicStoreMisc",  	    	"Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("ElectronicStoreMusic",	        "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("GigamartHouseElectronics",	    "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("LivingRoomShelf",		        "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("SchoolLockers",		       	 	"Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("OfficeDeskHome",		        "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("WardrobeChild",  	            "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("WardrobeMan",	                "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("MechanicShelfElectric",			"Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("CrateCompactDiscs",	        	"Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("DeskGeneric",	                "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("ShelfGeneric",		            "Video_Game_Consoles.GB_Cartridge_Kirby");
RemoveLootFromType("MusicStoreCases",	            "Video_Game_Consoles.GB_Cartridge_Kirby");

--                     ------- GB_Cartridge_Fantasy -------

RemoveLootFromType("BreakRoomShelves",		        "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("ClassroomShelves",		        "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("MusicStoreCDs",		        	"Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("CrateElectronics",		        "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("ElectronicStoreMisc",  	    	"Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("ElectronicStoreMusic",	        "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("GigamartHouseElectronics",	    "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("LivingRoomShelf",		        "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("SchoolLockers",		        	"Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("OfficeDeskHome",		        "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("WardrobeChild",  	            "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("WardrobeMan",	                "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("MechanicShelfElectric",			"Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("CrateCompactDiscs",	        	"Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("DeskGeneric",	                "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("ShelfGeneric",		            "Video_Game_Consoles.GB_Cartridge_Fantasy");
RemoveLootFromType("MusicStoreCases",	            "Video_Game_Consoles.GB_Cartridge_Fantasy");

--                     ------- GB_Cartridge_Mario -------

RemoveLootFromType("BreakRoomShelves",		        "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("ClassroomShelves",		        "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("MusicStoreCDs",		        	"Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("CrateElectronics",		        "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("ElectronicStoreMisc",  	    	"Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("ElectronicStoreMusic",	        "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("GigamartHouseElectronics",	    "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("LivingRoomShelf",		        "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("SchoolLockers",		        	"Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("OfficeDeskHome",		        "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("WardrobeChild",  	            "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("WardrobeMan",	                "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("MechanicShelfElectric",			"Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("CrateCompactDiscs",	        	"Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("DeskGeneric",	                "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("ShelfGeneric",		            "Video_Game_Consoles.GB_Cartridge_Mario");
RemoveLootFromType("MusicStoreCases",	            "Video_Game_Consoles.GB_Cartridge_Mario");

--                     ------- GB_Cartridge_Tetris -------

RemoveLootFromType("BreakRoomShelves",		        "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("ClassroomShelves",		        "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("MusicStoreCDs",		        	"Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("CrateElectronics",		        "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("ElectronicStoreMisc",  	    	"Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("ElectronicStoreMusic",	        "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("GigamartHouseElectronics",	    "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("LivingRoomShelf",		        "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("SchoolLockers",		        	"Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("OfficeDeskHome",		        "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("WardrobeChild",  	            "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("WardrobeMan",	                "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("MechanicShelfElectric",			"Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("CrateCompactDiscs",	        	"Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("DeskGeneric",	                "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("ShelfGeneric",		            "Video_Game_Consoles.GB_Cartridge_Tetris");
RemoveLootFromType("MusicStoreCases",	            "Video_Game_Consoles.GB_Cartridge_Tetris");