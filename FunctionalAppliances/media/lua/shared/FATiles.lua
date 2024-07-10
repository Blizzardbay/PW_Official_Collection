FA = FA or {}

FA.gridTilesSiloGenerator = {
    	industry_02_64 = {0,1},
    	industry_02_65 = {1,1},
    	industry_02_66 = {2,1},
    	industry_02_67 = {3,1},
    	industry_02_68 = {0,0},
    	industry_02_69 = {1,0},
    	industry_02_70 = {2,0},
    	industry_02_71 = {3,0},
}

FA.largeCorkBoards = {
	"location_business_office_generic_01_36",
	"location_business_office_generic_01_37",
	"location_business_office_generic_01_38",
	"location_business_office_generic_01_39"
}

FA.largePegBoards = {
	"location_business_machinery_01_24",
	"location_business_machinery_01_25",
	"location_business_machinery_01_26",
	"location_business_machinery_01_27"
}

FA.LoadedTiles = function(manager)
    	local spriteGrid = IsoSpriteGrid.new(4,2)
	local IsoFlagType, ipairs = IsoFlagType, ipairs

    	for each, name in pairs(FA.gridTilesSiloGenerator) do
        	local spr = manager:getSprite(each)
        	spriteGrid:setSprite(name[1],name[2],spr)
        	spr:setSpriteGrid(grid)
    	end
end

Events.OnLoadedTileDefinitions.Add(FA.LoadedTiles)