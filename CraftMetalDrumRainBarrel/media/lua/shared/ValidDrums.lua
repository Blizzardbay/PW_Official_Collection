--[[ if you want to add your own additional barrel colours,
read the example below. We'll pretend you chose the prefix "moredrums_0_"

CMDRB_extraCraftableBarrels = CMDRB_extraCraftableBarrels or {}
CMDRB_extraValidDrums = CMDRB_extraValidDrums or {}
CMDRB_extraSpriteToModded = CMDRB_extraSpriteToModded or {}

table.insert(CMDRB_extraCraftableBarrels, { prefix = "moredrums_0_"})
table.insert(CMDRB_extraValidDrums, "Moveables.my_uncrafted_barrel")
CMDRB_extraSpriteToModded.myUncrafted = "myspritecolor_<...>"

Your sprites pack MUST use the same format as this mod; e.g:
	moredrums_0_0 -- empty
	moredrums_0_1 -- water
	moredrums_0_2 -- wood
	moredrums_0_3 -- fire
	<...>
	
YOUR SPRITE PREFIX MUST BE UNIQUE TO YOUR MOD
--]]

-- This is the list of all items considered valid for crafting into lidless barrels
local validDrums = { "Base.MetalDrum", "Moveables.crafted_01_32",
	"Moveables.industry_01_22", "Moveables.industry_01_23",
	"Moveables.location_military_generic_01_6", "Moveables.location_military_generic_01_7",
	"Moveables.location_military_generic_01_14", "Moveables.location_military_generic_01_15",
	unpack(CMDRB_extraValidDrums or {})
}

-- This is the map of uncrafted item sprite to crafted item sprite
local spriteToModded = {
	location_military_generic_01_6 = {convert = "metaldrums_01_0",
									  create = {{name = "Base.PaintYellow", amount = 2},
									            {name = "Base.Bleach"}
											   },
									  text = {"ContextMenu_Yellow", "Barrel"},
									 }, -- yellow
	location_military_generic_01_7 = {convert = "metaldrums_01_8",
	                                  create = {{name = "Base.PaintYellow", amount = 2}},
									  text = {"ContextMenu_Yellow", "Tooltip_clothing_worn", "Barrel"},
									 }, -- yellow rusty
	location_military_generic_01_14 = {convert = "metaldrums_01_4",
									   create = {{name = "Base.PaintGreen", amount = 2},
												 {name = "Base.Bleach"}
												},
									   text = {"ContextMenu_Green", "Barrel"},
									  }, -- green
	location_military_generic_01_15 = {convert = "metaldrums_01_12",
	                                   create = {{name = "Base.PaintGreen", amount = 2}},
									   text = {"ContextMenu_Green", "Tooltip_clothing_worn", "Barrel"},
									  }, -- green rusty
	industry_01_22 = {convert = "crafted_01_28",
	                  create = {{name = "Base.PaintOrange", amount = 2},
					            {name = "Base.Bleach"}
							   },
					  text = {"ContextMenu_Orange", "Barrel"},
					 },
	industry_01_23 = {convert = "metaldrums_01_16",
	                  create = {{name = "Base.PaintOrange", amount = 2}},
					  text = {"ContextMenu_Orange", "Tooltip_clothing_worn", "Barrel"},
					 }, -- orange rusty
	crafted_01_32 = {convert = "crafted_01_24",
	                 create = {{name = "Base.Bleach"}},
					 text = {"Barrel"},
					}, -- unpainted.
	unpack(CMDRB_extraSpriteToModded or {})
}

-- this is a list of modded-in barrel sprites
local barrelCols = {
	{ prefix = "metaldrums_01_"},
	unpack(CMDRB_extraCraftableBarrels or {})
}

Events.OnLoadedTileDefinitions.Add(function()
	local toRemove = {}
	for i,pack in ipairs(barrelCols) do
		local tiles = getWorld():getAllTiles(pack.prefix:sub(1, #pack.prefix - 1))
		if tiles then
			pack.first = tiles:get(0):match("^.*_(.*)$") + 0
			pack.last = tiles:get(tiles:size() - 1):match("^.*_(.*)$") + 0
		else
			table.insert(toRemove, i)
		end
	end
	
	for i = #toRemove, 1, -1 do
		table.remove(barrelCols, toRemove[i])
	end
end)

local drumCapacity = "100" -- can't go beyond this without java mods.

function CMDRB_WithProps(props, func)
	local oldSize = props:Val("ContainerCapacity")
	props:Set("ContainerCapacity", drumCapacity, false)
	props:Set("CanScrap", nil)
	props:Set("Material", "MetalPlates", false)
	props:Set("Material2", "MetalScrap", false)
	props:Set("Surface", "35", false)
	props:Set("IsLow", nil)
	props:Set("IsTable", nil)
	func()
	props:Set("ContainerCapacity", oldSize, false)
end

return {validDrums, spriteToModded, barrelCols, drumCapacity}
