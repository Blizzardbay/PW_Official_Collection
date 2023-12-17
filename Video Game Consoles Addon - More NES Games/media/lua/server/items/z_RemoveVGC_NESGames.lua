---- Remove Loot function by Panopticon ----

-- Removes original VGC NES games from spawning. Replaced by the addon for distribution balance reason.
if not getActivatedMods():contains("Video_Game_Consoles") then return end

local modName = "VGC_Addon_NESGames"

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

--                        ------- NES_Cartridge_Contra -------

RemoveLootFromType("BreakRoomShelves",		        "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("ClassroomShelves",		        "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("MusicStoreCDs",		        	"Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("CrateElectronics",		        "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("ElectronicStoreMisc",  	    	"Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("ElectronicStoreMusic",	        "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("GigamartHouseElectronics",	    "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("LivingRoomShelf",		        "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("SchoolLockers",		        	"Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("OfficeDeskHome",		        "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("WardrobeChild",  	            "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("WardrobeMan",	                "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("MechanicShelfElectric",			"Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("CrateCompactDiscs",	        	"Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("DeskGeneric",	                "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("ShelfGeneric",		            "Video_Game_Consoles.NES_Cartridge_Contra");
RemoveLootFromType("MusicStoreCases",	            "Video_Game_Consoles.NES_Cartridge_Contra");

--                     ------- NES_Cartridge_Mario3 -------

RemoveLootFromType("BreakRoomShelves",		        "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("ClassroomShelves",		        "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("MusicStoreCDs",		        	"Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("CrateElectronics",		        "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("ElectronicStoreMisc",  	    	"Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("ElectronicStoreMusic",	        "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("GigamartHouseElectronics",	    "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("LivingRoomShelf",		        "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("SchoolLockers",		       	 	"Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("OfficeDeskHome",		        "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("WardrobeChild",  	            "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("WardrobeMan",	                "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("MechanicShelfElectric",			"Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("CrateCompactDiscs",	        	"Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("DeskGeneric",	                "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("ShelfGeneric",		            "Video_Game_Consoles.NES_Cartridge_Mario3");
RemoveLootFromType("MusicStoreCases",	            "Video_Game_Consoles.NES_Cartridge_Mario3");

--                     ------- NES_Cartridge_Megaman -------

RemoveLootFromType("BreakRoomShelves",		        "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("ClassroomShelves",		        "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("MusicStoreCDs",		        	"Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("CrateElectronics",		        "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("ElectronicStoreMisc",  	    	"Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("ElectronicStoreMusic",	        "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("GigamartHouseElectronics",	    "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("LivingRoomShelf",		        "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("SchoolLockers",		        	"Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("OfficeDeskHome",		        "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("WardrobeChild",  	            "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("WardrobeMan",	                "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("MechanicShelfElectric",			"Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("CrateCompactDiscs",	        	"Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("DeskGeneric",	                "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("ShelfGeneric",		            "Video_Game_Consoles.NES_Cartridge_Megaman");
RemoveLootFromType("MusicStoreCases",	            "Video_Game_Consoles.NES_Cartridge_Megaman");

--                     ------- NES_Cartridge_Metroid -------

RemoveLootFromType("BreakRoomShelves",		        "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("ClassroomShelves",		        "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("MusicStoreCDs",		        	"Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("CrateElectronics",		        "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("ElectronicStoreMisc",  	    	"Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("ElectronicStoreMusic",	        "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("GigamartHouseElectronics",	    "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("LivingRoomShelf",		        "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("SchoolLockers",		        	"Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("OfficeDeskHome",		        "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("WardrobeChild",  	            "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("WardrobeMan",	                "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("MechanicShelfElectric",			"Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("CrateCompactDiscs",	        	"Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("DeskGeneric",	                "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("ShelfGeneric",		            "Video_Game_Consoles.NES_Cartridge_Metroid");
RemoveLootFromType("MusicStoreCases",	            "Video_Game_Consoles.NES_Cartridge_Metroid");

--                     ------- NES_Cartridge_Zelda -------

RemoveLootFromType("BreakRoomShelves",		        "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("ClassroomShelves",		        "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("MusicStoreCDs",		        	"Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("CrateElectronics",		        "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("ElectronicStoreMisc",  	    	"Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("ElectronicStoreMusic",	        "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("GigamartHouseElectronics",	    "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("LivingRoomShelf",		        "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("SchoolLockers",		        	"Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("OfficeDeskHome",		        "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("WardrobeChild",  	            "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("WardrobeMan",	                "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("MechanicShelfElectric",			"Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("CrateCompactDiscs",	        	"Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("DeskGeneric",	                "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("ShelfGeneric",		            "Video_Game_Consoles.NES_Cartridge_Zelda");
RemoveLootFromType("MusicStoreCases",	            "Video_Game_Consoles.NES_Cartridge_Zelda");