
-- Definitions of the reveal areas of each map, as well as legends and badges

local function initMapReveals()
	MapUtils = MapUtils or {}

	LootMaps = LootMaps or {};
	LootMaps.Init = LootMaps.Init or {};
	-- COPY PASTA OF SOME NECESSARY VANILLA CODE BELOW (WHICH FOR SOME REASON IS INITIATED AS LOCAL FUNCTIONS AND VARIABLES)
	local MINZ = 0
	local MAXZ = 24
	local WATER_TEXTURE = false

	local function replaceWaterStyle(mapUI)
		if not WATER_TEXTURE then return end
		local mapAPI = mapUI.javaObject:getAPIv1()
		local styleAPI = mapAPI:getStyleAPI()
		local layer = styleAPI:getLayerByName("water")
		if not layer then return end
		layer:setMinZoom(MINZ)
		layer:setFilter("water", "river")
		layer:removeAllFill()
		layer:removeAllTexture()
		layer:addFill(MINZ, 59, 141, 149, 255)
		layer:addFill(MAXZ, 59, 141, 149, 255)
	end

	local function overlayPNG(mapUI, x, y, scale, layerName, tex, alpha)
		local texture = getTexture(tex)
		if not texture then return end
		local mapAPI = mapUI.javaObject:getAPIv1()
		local styleAPI = mapAPI:getStyleAPI()
		local layer = styleAPI:newTextureLayer(layerName)
		layer:setMinZoom(MINZ)
		layer:addFill(MINZ, 255, 255, 255, (alpha or 1.0) * 255)
		layer:addTexture(MINZ, tex)
		layer:setBoundsInSquares(x, y, x + texture:getWidth() * scale, y + texture:getHeight() * scale)
	end
	-- end of copy pasta

	--Complete Kentucky Map
	LootMaps.Init.KentuckyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3001, 950, 15000, 15000)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	--Ekron
	LootMaps.Init.EkronMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("NewEkron") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/NewEkron')
		else
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6900, 8000, 7500, 8700)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 7130, 8001, 0.3, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- Dixie (T	er park between Muldraugh and West Point)
	LootMaps.Init.DixieMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11300, 8600, 12000, 9200)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 11400, 9000, 0.3, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- Scenic Grove (Trailer Park next to Riverside)
	LootMaps.Init.ScenicGroveMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5200, 5800, 5700, 6200)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 5201, 5801, 0.25, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- Riverside Country Club
	LootMaps.Init.CountryClubMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5360, 6125, 6730, 6800)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 6350, 6200, 0.6, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- Pony Roam-O Map
	LootMaps.Init.PonyRoamOMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8150, 8133, 8800, 8700)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		--overlayPNG(mapUI, 6350, 6200, 0.6, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- MuldraughRailyardMap
	LootMaps.Init.MuldraughRailyardMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11200, 9200, 12000, 10600)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 11201, 10150, 0.6, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- Louisville Map
	LootMaps.Init.LouisvilleMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11750, 950, 14500, 3886)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 13850, 951, 1.1, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- Louisville Iroquois Park Map -- TO DO RECTIFY COORDONATES
	LootMaps.Init.LouisvilleIroquoisMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12900, 2200, 13439, 2913)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		-- overlayPNG(mapUI, 13850, 951, 1.1, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end


	-- LouisvilleAudubonMap
	LootMaps.Init.LouisvilleAudubonMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13198, 2890, 13774, 3500)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 13601, 3361, 0.25, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- LouisvilleCentralMap
	LootMaps.Init.LouisvilleCentralMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12295, 1100, 13200, 1800)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 12296, 1101, 0.3, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- LouisvilleEvergreenHillMap
	LootMaps.Init.LouisvilleEvergreenHillMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13416, 2395, 13987, 3068)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 13800, 2396, 0.35, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- LouisvilleOldMap
	LootMaps.Init.LouisvilleOldMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12500, 1650, 12900, 2440)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		--overlayPNG(mapUI, 12680, 1700, 0.25, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- LouisvillePhoenixHillMap
	LootMaps.Init.LouisvillePhoenixHillMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12703, 1724, 13204, 1958)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 12704, 1845, 0.12, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end


	-- LouisvilleGatedCommunityMap
	LootMaps.Init.LouisvilleGatedCommunityMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13972, 2690, 14360, 3110)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 13973, 3000, 0.25, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end


	-- LouisvilleCommercialDistrictMap
	LootMaps.Init.LouisvilleNorthCommercialDistrictMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13160, 1000, 13800, 1500)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 13200, 1000, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end



	-- LouisvillePortlandMap
	LootMaps.Init.LouisvillePortlandMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11900, 1000, 12300, 1890)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 11901, 1001, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- LouisvilleLSUMap (Louisiana State University)
	LootMaps.Init.LouisvilleLSUMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12293, 2092, 12524, 2520)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 12295, 2430, 0.2, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- LouisvilleSouth 
	LootMaps.Init.LouisvilleSouthMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12660, 2994, 13136, 3880)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 12910, 3660, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- LouisvilleLeafhillHeightsMap
	LootMaps.Init.LouisvilleLeafhillHeightsMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11920, 2994, 12671, 3880)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 11920, 3600, 0.5, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end


	-- LouisvilleChapelmountDownsMap
	LootMaps.Init.LouisvilleChapelmountDownsMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11800, 2564, 12523, 3006)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 11801, 2600, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end


	-- LouisvilleScarletOakMap
	LootMaps.Init.LouisvilleScarletOakMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11800, 1840, 12306, 2580)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 11801, 1841, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- LouisvilleEastMap
	LootMaps.Init.LouisvilleEastMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13192, 1547, 14470, 2400)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 14000, 1547, 0.6, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end
	-- Valley Station Map
	LootMaps.Init.ValleyStationMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12400, 4600, 13286, 6040)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 12900, 4605, 0.66, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end


	-- Valley Station Mall Area Map
	LootMaps.Init.ValleyStationMallAreaMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13500, 5300, 14500, 6000)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 13505, 5305, 0.45, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- EasternSummerCampMap
	LootMaps.Init.EasternSummerCampMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13150, 6500, 14300, 7000)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 13250, 6501, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	--  Military Base Map,
	LootMaps.Init.MilitaryBaseMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5400, 12300, 5900, 12800)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		--overlayPNG(mapUI, 12410, 6100, 0.5, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end


	--  SmallTownWestMap,
	LootMaps.Init.SmallTownWestMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5300, 9300, 6200, 10050)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 5520, 9300, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	--  MuldraughWarehouseComplexMap,
	LootMaps.Init.MuldraughWarehouseComplexMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9900, 10700, 10400, 11300)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 10150, 10701, 0.3, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	-- Cabin locations:
	LootMaps.Init.CabinLocation1 = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9500, 8600, 9800, 8900)
		MapUtils.overlayPaper(mapUI)
	end
	LootMaps.Init.CabinLocation2 = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13500, 7100, 13800, 7400)
		MapUtils.overlayPaper(mapUI)
	end
	LootMaps.Init.CabinLocation3 = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9200, 10100, 9450, 10350)
		MapUtils.overlayPaper(mapUI)
	end
	LootMaps.Init.CabinLocation4 = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11000, 10500, 11200, 10700)
		MapUtils.overlayPaper(mapUI)
	end
	LootMaps.Init.CabinLocation5 = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11200, 8900, 11300, 9000)
		MapUtils.overlayPaper(mapUI)
	end

	-- Camp Grounds location
	LootMaps.Init.CampGroundsLocation = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12200, 8700, 12900, 9200)
		MapUtils.overlayPaper(mapUI)
	end

	
	-- AbandonedFactoryMap
	LootMaps.Init.AbandonedFactoryMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3480, 5600, 4500, 6600)
		overlayPNG(mapUI, 3480, 6200, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- MOD MAPS

	--  GrapeseedMap,
	LootMaps.Init.GrapeseedMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Grapeseed')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7199, 11099, 7501, 11401)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 7400, 11333, 0.14, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end


	--  Blackwood map,
	LootMaps.Init.BlackwoodMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Blackwood')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7799, 10501, 8099, 10801)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		--overlayPNG(mapUI, 7751, 10451, 0.15, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end


	--  Pitstop map,
	LootMaps.Init.PitstopMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Pitstop')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9000, 11100, 10800, 11700)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 10500, 11131, 0.53, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end
	
	--  MarchRidgeExpansion map,
	LootMaps.Init.MarchRidgeExpansionMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/MREX')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9600, 12600, 9899, 12899)
		--overlayPNG(mapUI, 9601, 12601, 0.10, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end
	
	--  C.O.N. Research & Testing Facitity map,
	LootMaps.Init.CONResearchMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/CONRTF')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9300, 12600, 9599, 12899)
		--overlayPNG(mapUI, 9301, 12601, 0.25, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	--  RosewoodExpansion map,
	LootMaps.Init.RosewoodExpansionMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/pz_rosewoodexp_map')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8099, 10799, 8701, 11371)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 8535, 11215, 0.25, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	--  WestPointExpansion map, (NO IN GAME MAP YET)
	-- LootMaps.Init.WestPointExpansionMap = function(mapUI)
	-- 	local mapAPI = mapUI.javaObject:getAPIv1()
	-- 	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	-- 	MapUtils.initDefaultStyleV1(mapUI)
	-- 	replaceWaterStyle(mapUI)
	-- 	mapAPI:setBoundsInSquares(12000, 6600, 12900, 7500)
	-- 	-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
	-- 	overlayPNG(mapUI, 12001, 7400, 0.4, "legend", "media/textures/worldMap/Legend.png")
	-- 	MapUtils.overlayPaper(mapUI)
	-- --	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	-- end

	--  Over The River map,
	LootMaps.Init.OverTheRiverMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Otr')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11100, 5700, 12000, 6500)
		overlayPNG(mapUI, 6300, 11400, 0.25, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end


	--  Little Township map,
	LootMaps.Init.LittleTownshipMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/LittleTownship')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8099, 8399, 8401, 8701)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 8251, 8400, 0.15, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	--  Linden map,
	LootMaps.Init.LindenMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Linden')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11399, 8399, 11701, 8701)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 11401, 8201, 0.3, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	--  West Point Fire Department Map,
	LootMaps.Init.WestPointFireDepartmentMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/West Point Fire Department')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11100, 6900, 11399, 7199)
		--overlayPNG(mapUI, 11101, 6901, 0.18, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end
	
	--  West Point South Trailer Park Map,
	LootMaps.Init.WestPointSouthTrailerParkMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/WestPointTrailerParkAndVhsStore')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11399, 7199, 11701, 7501)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 11400, 7200, 0.18, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	--  Kingsmouth  Map,
	LootMaps.Init.KingsmouthMap2 = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Kingsmouth')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3000, 4200, 4200, 5400)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 3005, 4205, 0.6, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	--  Complete Raven Creek Map, (rare)
	LootMaps.Init.RavenCreekMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/RavenCreek')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3000, 11100, 5400, 13500)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 3005, 4205, 0.6, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	--  North Raven Creek Map: Center
	LootMaps.Init.NorthRavenCreekMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/RavenCreek')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(2998, 11098, 4280, 11702)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 3001, 11430, 0.5, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end



	--  South East Raven Creek Map
	LootMaps.Init.SouthEastRavenCreekMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/RavenCreek')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3600, 11580, 4800, 12800)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 4450, 12000, 0.6, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end


	--  Raven Creek's Harbor facilities Map
	LootMaps.Init.RavenCreekPortFacilitiesMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/RavenCreek')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3000, 11500, 3800, 12950)
		overlayPNG(mapUI, 3350, 11600, 0.7, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- Raven Creek South Town
	-- (3630, 12790, 4900, 13500)
	LootMaps.Init.RavenCreekSouthernTownMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/RavenCreek')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3630, 12790, 4900, 13500)
		--overlayPNG(mapUI, 3350, 11600, 0.7, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	--  Survivor Warehouse Location --
	LootMaps.Init.SurvivorWarehouseLocation = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/survivorwarehouse')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12000, 8400, 12600, 8700)
		-- overlayPNG(mapUI, 11093, 9222, 0.666, "badge", "media/textures/worldMap/MuldraughBadge.png")
		overlayPNG(mapUI, 3005, 4205, 0.6, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	--	overlayPNG(mapUI, 10524, 9222, 0.666, "lootMapPNG", "media/ui/LootableMaps/muldraughmap.png", 0.5)
	end

	
	-- Weather Stations from Save Our Station
	-- Station RIVS-500 Location
	LootMaps.Init.StationRIVS500Location = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/SaveOurStation_KnoxCountry_World')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7200, 5400, 7500, 5700)
		MapUtils.overlayPaper(mapUI)
	end
	-- Station WEST-P88 Location
	LootMaps.Init.StationWESTP88Location = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/SaveOurStation_KnoxCountry_World')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10500, 7200, 10800, 7500)
		MapUtils.overlayPaper(mapUI)
	end
	-- Station ROSE-099 Location
	LootMaps.Init.StationROSE099Location = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/SaveOurStation_KnoxCountry_World')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7500, 11400, 7800, 11700)
		MapUtils.overlayPaper(mapUI)
	end
	-- Station MULD-650 Location
	LootMaps.Init.StationMULD650Location = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/SaveOurStation_KnoxCountry_World')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10200, 10200, 10500, 10500)
		MapUtils.overlayPaper(mapUI)
	end
	-- Station ZULU (military) Location
	LootMaps.Init.StationZULULocation = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/SaveOurStation_KnoxCountry_World')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6300, 11700, 6600, 12000)
		--overlayPNG(mapUI, 6300, 11770, 0.2, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end


	-- Refordville
	LootMaps.Init.RefordvilleMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Refordville')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3300, 6900, 3900, 7500)
		--overlayPNG(mapUI, 6300, 11770, 0.2, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- Chinatown
	LootMaps.Init.ChinatownMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Chinatown')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11100, 8700, 11400, 9000)
		
		overlayPNG(mapUI, 11101, 8945, 0.12, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- Chernaville
	LootMaps.Init.ChernavilleMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/chernaville')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		-- 
		mapAPI:setBoundsInSquares(9600, 10200, 9899, 10799)
		
		overlayPNG(mapUI, 9600, 10712, 0.19, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- Blueberry
	LootMaps.Init.BlueberryMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Blueberry')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		-- 
		mapAPI:setBoundsInSquares(4800, 10500, 5400, 10800)
		
		--overlayPNG(mapUI, 9600, 10712, 0.19, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- Lake Ivy Township map
	-- LakeIvyMap2
	LootMaps.Init.LakeIvyMap2 = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/li_township')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8700, 9600, 9500, 10500)
		overlayPNG(mapUI, 8700, 10150, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end
	
	-- Greenleaf
	LootMaps.Init.GreenleafMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Greenleaf')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6300, 10200, 6899, 10499)
		MapUtils.overlayPaper(mapUI)
	end
	
	-- East Coryerdon
	-- (7780, 5720, 8120, 6899)
	LootMaps.Init.EastCoryerdonMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/coryerdon')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7780, 5720, 8120, 6899)
		-- overlayPNG(mapUI, 7201, 5701, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end
	-- South Coryerdon
	-- (8200, 6700, 9000, 7200)
	LootMaps.Init.SouthCoryerdonMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/coryerdon')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8200, 6700, 9000, 7200)
		-- overlayPNG(mapUI, 7201, 5701, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end
	-- Center Coryerdon
	-- (8120, 5720, 9000, 6825)
	LootMaps.Init.CenterCoryerdonMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/coryerdon')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8120, 5720, 9000, 6825)
		-- overlayPNG(mapUI, 7201, 5701, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end
	

	-- OldPark Town
	LootMaps.Init.OldParkTownMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/ParkingLot')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8700, 8700, 9299, 8999)
		--overlayPNG(mapUI, 7201, 5701, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end
	
	
	
	-- MilitaryAirport
	LootMaps.Init.MilitaryAirportMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/militaryairport')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9670, 8100, 10160, 8630 )
		
		-- overlayPNG(mapUI, 9601, 8101, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- Fort Benneing Map
	LootMaps.Init.FortBenningMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Fort Benning')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6000, 6900, 6300, 7200 )
		
		MapUtils.overlayPaper(mapUI)
	end

	-- NEW MAPS FROM THE MOD "INGAME MAPS"
	-- West Point Expansion Map
	LootMaps.Init.WestPointExpansionMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_WestPointExpansion") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/west_point_expansion_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/west_point_expansion')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12000, 6700, 12900, 7500 )
		
		-- overlayPNG(mapUI, 9601, 8101, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- Glenport Map
	LootMaps.Init.GlenportMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_Glenport") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Glenport_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Glenport')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 7200, 11700, 8100 )
		
		-- overlayPNG(mapUI, 9601, 8101, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end
	   
	-- Eerie Country maps :
	-- EC - Customs border zone Map (10500, 13500, 10800, 14000)
	LootMaps.Init.EC_CustomsBorderZoneMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10500, 13500, 10800, 14000)
		MapUtils.overlayPaper(mapUI)
	end
	-- EC - Centralia Map (11300, 13500, 12100, 14400)
	LootMaps.Init.EC_CentraliaMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11300, 13500, 12100, 14400)
		MapUtils.overlayPaper(mapUI)
	end
	-- EC - TrainStationMap (11400, 14700, 12100, 15300)
	LootMaps.Init.EC_TrainStationMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11400, 14700, 12100, 15300)
		MapUtils.overlayPaper(mapUI)
	end
	-- EC - DarkFallsMap (10800, 15300, 11400, 15900)
	LootMaps.Init.EC_DarkFallsMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 15300, 11500, 16200)
		MapUtils.overlayPaper(mapUI)
	end
	-- EC - HiddenSwampsMap (11400, 15300, 12300, 16200)
	LootMaps.Init.EC_HiddenSwampsMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11400, 15300, 12300, 16200)
		MapUtils.overlayPaper(mapUI)
	end
	-- EC - SanDitoAirportMap (10800, 16200, 11700, 16600)
	LootMaps.Init.EC_SanDitoAirportMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 16300, 12000, 16600)
		MapUtils.overlayPaper(mapUI)
	end
	-- EC - LakeHeisenbergMap (10800, 16600, 11500, 17200)
	LootMaps.Init.EC_LakeHeisenbergMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 16600, 11800, 17100)
		MapUtils.overlayPaper(mapUI)
	end
	-- EC - ErenCityMap (11700 ,17000, 12300, 17500)
	LootMaps.Init.EC_ErenCityMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11700 ,17000, 12300, 17500)
		MapUtils.overlayPaper(mapUI)
	end
	-- EC - IrvingtonMap (11100, 17700, 11700, 18300)
	LootMaps.Init.EC_IrvingtonMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11100, 17700, 11700, 18300)
		MapUtils.overlayPaper(mapUI)
	end
	-- EC - RuralZoneMap (7500, 16500, 9500, 18300)
	LootMaps.Init.EC_RuralZoneMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7500, 16500, 9500, 18300)
		MapUtils.overlayPaper(mapUI)
	end
	-- Complete Eerie Country map (7500, 13500, 12300, 17700)
	LootMaps.Init.EC_CompleteMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_EerieCountry") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7500, 13500, 12300, 17700)
		MapUtils.overlayPaper(mapUI)
	end

	-- Slocan Lake maps :
	-- SL - New Denver map
	--(2400, 16000, 4400, 17700)
	LootMaps.Init.SL_NewDenverMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_SlocanLake") or getActivatedMods():contains("RavenCreekEerieCompatibleSlocanLakeIngameMap") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/NewDenver_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/NewDenver')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(2400, 16000, 4400, 17700)
		MapUtils.overlayPaper(mapUI)
	end
	-- SL - Rosebery map
	--(600, 12800, 1800, 13900)
	LootMaps.Init.SL_RoseberyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_SlocanLake") or getActivatedMods():contains("RavenCreekEerieCompatibleSlocanLakeIngameMap") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Rosebery_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Rosebery')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(600, 12800, 1800, 13900)
		MapUtils.overlayPaper(mapUI)
	end
	-- SL - Silverton map
	--(3400, 19700, 4600, 20900)
	LootMaps.Init.SL_SilvertonMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_SlocanLake") or getActivatedMods():contains("RavenCreekEerieCompatibleSlocanLakeIngameMap") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Silverton_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Silverton')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3400, 19700, 4600, 20900)
		MapUtils.overlayPaper(mapUI)
	end
	
	-- Fort Knox maps : (linked to eerie country and beford falls version)
	-- FK - Quitman Map
	-- (12900, 13200, 13500, 14400)
	LootMaps.Init.FK_QuitmanMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_FortKnoxLinked") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Fort Knox linked to Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Fort Knox linked to Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12900, 13200, 13500, 14400)
		MapUtils.overlayPaper(mapUI)
	end
	-- FK - Fort Knox Map
	-- (13300, 14000, 15300, 17400)
	LootMaps.Init.FK_FortKnoxMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_FortKnoxLinked") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Fort Knox linked to Eerie Country_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/Fort Knox linked to Eerie Country')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13300, 14000, 15300, 17400)
		MapUtils.overlayPaper(mapUI)
	end
	
	-- Fort Knox maps : (normal version)
	-- FK - Quitman Map 2
	-- FK - Fort Knox Map 2

	-- Fort redstone
	--(5400, 11100, 5700; 12000)
	LootMaps.Init.FortRedstoneMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("InGameMaps_FortRedstone") then
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/FortRedstone_map')
		else 
			MapUtils.initDirectoryMapData(mapUI, 'media/maps/FortRedstone')
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5400, 11100, 6000, 12300)
		MapUtils.overlayPaper(mapUI)
	end



	-- Billionaire safehouse
	-- (10800, 7500, 11700, 8100)
	LootMaps.Init.BillionaireSafehouseLocation = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/BillionaireSafehouse')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 7500, 11700, 8100)
		MapUtils.overlayPaper(mapUI)
	end

	-- Wildberries
	-- (4500, 6600, 4800, 7500)
	LootMaps.Init.WildberriesMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Wildberries')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(4500, 6600, 4800, 7500)
		MapUtils.overlayPaper(mapUI)
	end

	-- Tugaland
	-- (12000, 9600, 12900, 10200)
	-- legend at (12700, 10000, 0.4)
	LootMaps.Init.TugalandMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Tugaland')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12000, 9600, 12900, 10200)
		overlayPNG(mapUI, 12650, 10000, 0.4, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end


	-- Remus
	-- (7500, 10800, 7800, 11400)
	-- legend at (7503, 10810, 0.3)
	LootMaps.Init.RemusMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/zremus')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7500, 10800, 7800, 11400)
		overlayPNG(mapUI, 7503, 10810, 0.3, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- Trimble County Power Station
	-- ( 15000, 3000, 15300, 3600)
	LootMaps.Init.TrimbleCountyPowerStationMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/TrimbleCountyPowerStation')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares( 15000, 3000, 15300, 3600)
		MapUtils.overlayPaper(mapUI)
	end

	-- Trimble County La Grange
	-- (15600, 3000, 16400, 3550)
	LootMaps.Init.TrimbleCountyLaGrangeMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/TrimbleCountyPowerStation')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(15600, 3000, 16400, 3550)
		MapUtils.overlayPaper(mapUI)
	end

	-- EZPZ Community Center
	-- (10500, 6600 , 10800, 6900)
	LootMaps.Init.EZPZCommunityCenterMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/EZPZCenter')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10500, 6600 , 10800, 6900)
		MapUtils.overlayPaper(mapUI)
	end

	-- Old Pine Village
	-- (10200, 12900, 10800, 14700)
	LootMaps.Init.OldPineVillageMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Old Pine Village')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10200, 12900, 10800, 14700)
		MapUtils.overlayPaper(mapUI)
	end

	--  West Point Fire Department Map, (not in distributions, has been removed.)
	LootMaps.Init.WestPointFireDepartmentMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/West Point Fire Department')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11100, 6900, 11399, 7199)
		overlayPNG(mapUI, 11101, 6901, 0.18, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	--  Fort Rock Ridge Map
	-- (6600, 6300, 7200, 6900)
	LootMaps.Init.FortRockRidgeMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Fort Rock Ridge')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6601, 6301, 7150, 6700)
		-- overlayPNG(mapUI, 11101, 6901, 0.18, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- Fort Benning
	-- (6000, 6900, 6300, 7200)
	LootMaps.Init.FortBenningMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Fort Benning')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6000, 6900, 6300, 7200)
		MapUtils.overlayPaper(mapUI)
	end

	-- Research Facility
	--(5400, 12300, 5900, 12800)
	LootMaps.Init.ResearchFacilityMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/researchbase')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5400, 12300, 5900, 12800)
		MapUtils.overlayPaper(mapUI)
	end

	-- Christmas Village
	-- (14100, 600, 14400, 1150)
	LootMaps.Init.ChristmasVillageMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/ChristmasVillage')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(14100, 600, 14400, 1150)
		MapUtils.overlayPaper(mapUI)
	end



	-- Fort Waterfront
	-- (10200, 10800, 10500, 11500)
	LootMaps.Init.FortWaterfrontMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Fort Waterfront')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10200, 10900, 10400, 11200)
		MapUtils.overlayPaper(mapUI)
	end
	
	-- Muldraugh Military Base
	-- (9600, 10200, 9900, 10500)
	LootMaps.Init.MuldraughMilitaryBaseMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh Military Base')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9600, 10200, 9900, 10500)
		MapUtils.overlayPaper(mapUI)
	end


	-- Hyrule County
	-- (9300, 7800, 9600, 8400)
	LootMaps.Init.HyruleCountyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Hyrule County')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9300, 7800, 9600, 8400)
		MapUtils.overlayPaper(mapUI)
	end

	-- Riverwood
	-- (7800, 7200, 8400, 7800)
	LootMaps.Init.RiverwoodMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Riverwood')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7800, 7200, 8400, 7800)
		MapUtils.overlayPaper(mapUI)
	end

	-- Hong Kong Map
	-- (13200, 6000, 13800, 6600)
	LootMaps.Init.HongKongYauMaTeiMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Dead in Hong Kong')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13200, 6000, 13800, 6600)
		MapUtils.overlayPaper(mapUI)
	end

	--  -- MAPS of Snake's Mod Pack : --  --

	-- Western Military Complex
	-- (5400, 9000, 5700, 9300)
	LootMaps.Init.WesternMilitaryComplexMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/MilitaryComplex')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5400, 9000, 5700, 9300)
		MapUtils.overlayPaper(mapUI)
	end
	-- Mansion Adress
	-- (11100, 10800, 11400, 11100)
	LootMaps.Init.MansionAdress = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Mansion')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11100, 10850, 11350, 11100)
		MapUtils.overlayPaper(mapUI)
	end
	-- Construction Factory location
	-- (12600, 11100, 12900, 11400)
	LootMaps.Init.ConstructionFactoryMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Factory')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12600, 11100, 12900, 11400)
		MapUtils.overlayPaper(mapUI)
	end





	-- westwood Remake
	-- (7200, 11400, 7800, 11700)
	LootMaps.Init.WestwoodMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Westwood')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7200, 11400, 7800, 11700)
		MapUtils.overlayPaper(mapUI)
	end


	-- Anthem, KY
	-- (11100, 8100, 11400, 8400)
	LootMaps.Init.AnthemMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Anthem, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11100, 8100, 11400, 8400)
		MapUtils.overlayPaper(mapUI)
	end

	-- laconia, KY (conflicts with coryerdon)
	-- (8100, 6000, 9000, 7200)
	LootMaps.Init.LaconiaMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Laconia')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8100, 6000, 9000, 7200)
		MapUtils.overlayPaper(mapUI)
	end


	-- ashenwood
	-- (11400, 11100, 11700, 11700)
	LootMaps.Init.AshenwoodMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Ashenwood')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11400, 11100, 11700, 11700)
		MapUtils.overlayPaper(mapUI)
	end

	

	-- elysium island
	-- (10550, 6600, 10730, 6890)
	LootMaps.Init.ElysiumIslandMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Elysium_Island')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10550, 6600, 10730, 6890)
		MapUtils.overlayPaper(mapUI)
	end

	-- Hopewell, KY -- ids : hopewell_eng_orig , hopewell_eng_zombies, hopewell_esp_zombies, hopewell_esp_orig
	-- (14700, 2900, 15000, 3400)
	LootMaps.Init.HopewellMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Hopewell, KY')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(14700, 2900, 15000, 3400)
		MapUtils.overlayPaper(mapUI)
	end

	-- Walnut Ridge
	-- (7800, 7200, 8700, 7800)
	LootMaps.Init.WalnutRidgeMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Walnut_ridge')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7800, 7200, 8700, 7800)
		MapUtils.overlayPaper(mapUI)
	end

	-- Heavens Hill Mansion
	-- (7530, 7820, 7790, 8040)
	LootMaps.Init.HeavensHillMansionAddress = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Heavens Hill')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7530, 7820, 7790, 8040)
		MapUtils.overlayPaper(mapUI)
	end

	-- Chestown
	-- (4500, 6600, 4800, 6900)
	LootMaps.Init.ChestownMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Chestown')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(4500, 6600, 4800, 6900)
		MapUtils.overlayPaper(mapUI)
	end

	-- nashville, Ky
	-- (3610, 7630, 3810, 8090)
	LootMaps.Init.NashvilleMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Nashville')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3610, 7630, 3810, 8090)
		MapUtils.overlayPaper(mapUI)
	end

	-- overlook hotel
	-- (4500, 6300, 4800, 6600)
	LootMaps.Init.OverlookHotelMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/OverlookHotel')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(4500, 6300, 4800, 6600)
		MapUtils.overlayPaper(mapUI)
	end

	-- Perfect shelter
	-- (11120, 11380, 8110, 8380)
	LootMaps.Init.PerfectShelterMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, 'media/maps/Fishing base')
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11160, 8160, 11370, 8360)
		MapUtils.overlayPaper(mapUI)
	end

	-- O'Connor Farm
	-- (8130, 8100, 8110, 8040)
	LootMaps.Init.OConnorFarmAddress = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/O'Connor Farm")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8130, 7570, 8360, 8070)
		MapUtils.overlayPaper(mapUI)
	end

	-- Lincoln Regional Airport
	-- (3900, 9000, 4200, 9300)
	LootMaps.Init.LincolnRegionalAirportMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Lincoln Regional Airport")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3900, 9000, 4200, 9300)
		MapUtils.overlayPaper(mapUI)
	end

	-- Muldraugh - West outskirts Shipping Company.
	-- (9600, 9600, 9900, 9900)
	LootMaps.Init.MuldraughWesternShippingCompanyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Westoutskirts-shippingCo")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9600, 9600, 9900, 9900)
		MapUtils.overlayPaper(mapUI)
	end


	---


	-- Rosewood Military Hospital
	-- (7670, 11440, 7800, 11570)
	LootMaps.Init.RosewoodMilitaryHospitalMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Rosewood Military Hospital")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7670, 11440, 7800, 11570)
		MapUtils.overlayPaper(mapUI)
	end

	-- The Museum
	-- 35x27 = (10540, 8100, 10800, 8400)
	LootMaps.Init.TheMuseumMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/The Museum")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10540, 8100, 10800, 8400)
		MapUtils.overlayPaper(mapUI)
	end

	-- The Eye Lake
	-- 49_16 = (14700, 4800, 15000, 5100)
	LootMaps.Init.TheEyeLakeMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/TheEyeLake")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(14700, 4800, 15000, 5100)
		MapUtils.overlayPaper(mapUI)
	end

	-- Addams Family Mansion
	-- 37, 31 = (11200, 9350, 11400, 9580)
	LootMaps.Init.AddamsFamilyMansionMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Addams Mansion")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11200, 9350, 11400, 9580)
		MapUtils.overlayPaper(mapUI)
	end

	-- Jeffersonville, Mansion (Louisville River Expansion)
	-- (12300, 530, 12900, 900)
	LootMaps.Init.JeffersonvilleMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Louisville, River Expansion (Mansion)")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12300, 530, 12900, 900)
		MapUtils.overlayPaper(mapUI)
	end


	-- Cherokee Lake
	-- (11100, 8100, 11400, 8400)
	LootMaps.Init.CherokeeLakeMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/CherokeeLake")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11100, 8100, 11400, 8400)
		MapUtils.overlayPaper(mapUI)
	end

	-- Riverside Mansion
	-- 18,17 = (5550, 5180, 5700, 5400)
	LootMaps.Init.RiversideMansionMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/riversidemansion")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5550, 5180, 5700, 5400)
		MapUtils.overlayPaper(mapUI)
	end


	-- Finnegan Mental Asylum
	LootMaps.Init.FinneganMentalAsylumMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/FinneganAsylum")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3995, 9670, 4400, 9860)
		MapUtils.overlayPaper(mapUI)
	end

	
	-- Papaville
	-- (10800, 8100, 11100, 8400)
	LootMaps.Init.PapavilleMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/PapaVilleModMap")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 8100, 11100, 8400)
		MapUtils.overlayPaper(mapUI)
	end


	-- SouthTown
	-- (10800, 11100, 11100, 11700)
	LootMaps.Init.SouthTownMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Southtown")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 11100, 11100, 11700)
		MapUtils.overlayPaper(mapUI)
	end

	-- Chinatown Extension
	-- (10800, 8400, 11100, 8700)
	LootMaps.Init.ChinatownMapExpansionMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Chinatown_EX")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 8400, 11100, 8700)
		MapUtils.overlayPaper(mapUI)
	end

	-- Louisville Bunker Location
	-- (14850, 3300, 15000, 3550)
	LootMaps.Init.LouisvilleBunkerLocationMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Mbase")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(14850, 3300, 15000, 3550)
		MapUtils.overlayPaper(mapUI)
	end


	-- Orchidwood(official version)
	-- (8100, 9600, 8700, 10200)
	LootMaps.Init.OrchidwoodMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/orchidwood")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8100, 9600, 8700, 10200)
		MapUtils.overlayPaper(mapUI)
	end



	---
	-- Winchester, KY
	-- (2220, 6650, 3890, 8520)
	LootMaps.Init.WinchesterMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Winchester, KY")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(2220, 6650, 3890, 8520)
		MapUtils.overlayPaper(mapUI)
	end
	
	-- Breakpoint
	-- (12700, 4820, 12890, 5090)
	LootMaps.Init.BreakpointMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Breakpoint")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12700, 4820, 12890, 5090)
		MapUtils.overlayPaper(mapUI)
	end

	-- Wilbore, KY
	-- (4500, 9900, 5100, 10500)
	LootMaps.Init.WilboreMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Wilbore")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(4500, 9900, 5100, 10500)
		MapUtils.overlayPaper(mapUI)
	end

	-- Petroville
	-- (10500, 11700, 11400, 12600)
	LootMaps.Init.PetrovilleMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Petroville")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10500, 11700, 11400, 12600)
		MapUtils.overlayPaper(mapUI)
	end

	-- Cedar Hill
	-- (4800, 5700, 5100, 6000)
	LootMaps.Init.CedarHillMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Cedar Hill")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(4800, 5700, 5100, 6000)
		MapUtils.overlayPaper(mapUI)
	end

	-- Cathaya Valley,KY
	-- (3900, 9000, 4200, 9300)
	LootMaps.Init.CathayaValleyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Cathaya Valley")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3900, 9000, 4200, 9300)
		MapUtils.overlayPaper(mapUI)
	end

	-- Springwood
	-- (10200, 8000, 10500, 8400)
	LootMaps.Init.SpringwoodMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Springwood")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10200, 8000, 10500, 8400)
		MapUtils.overlayPaper(mapUI)
	end

	-- Nature's Vengeance Township
	-- (6300, 10800, 6600, 11100)
	LootMaps.Init.NaturesVengeanceTownshipMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/nv_township_v1")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6300, 10800, 6600, 11100)
		MapUtils.overlayPaper(mapUI)
	end

	-- Big Bear Lake
	-- West Side : (6000, 7200, 9600, 8100)
	LootMaps.Init.BigBearLakeEastMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/BBL")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6000, 7200, 6900, 8100)
		MapUtils.overlayPaper(mapUI)
	end
	-- East Side : (4800, 7200, 6000, 8100)
	LootMaps.Init.BigBearLakeWestMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/BBL")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(4800, 7200, 6000, 8100)
		MapUtils.overlayPaper(mapUI)
	end
	-- Full Map : (4800, 7200, 9600, 8100)
	LootMaps.Init.BigBearLakeMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/BBL")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(4800, 7200, 6900, 8100)
		MapUtils.overlayPaper(mapUI)
	end

	-- The Sims Zomboid
	-- (15000, 3980, 15500, 4500)
	LootMaps.Init.SimsZomboidMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/The Sims Zomboid")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(15000, 3980, 15500, 4500)
		MapUtils.overlayPaper(mapUI)
	end

	-- Dirkerdam
	-- Florius: (1800, 2100, 3000, 3000)
	LootMaps.Init.FloriusMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Dirkerdam")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(1800, 2100, 3000, 3000)
		MapUtils.overlayPaper(mapUI)
	end
	-- Pertville (8700, 4500, 9600, 5100)
	LootMaps.Init.PertvilleMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Dirkerdam")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8700, 4500, 9600, 5100)
		MapUtils.overlayPaper(mapUI)
	end
	-- Tashtego (8700, 5400, 9280, 6270)
	LootMaps.Init.TashtegoMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Dirkerdam")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8700, 5400, 9280, 6270)
		MapUtils.overlayPaper(mapUI)
	end
	-- Fallen survivor colony(9900, 3300, 10200, 3900)
	LootMaps.Init.FallenSurvivorColonyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Dirkerdam")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9900, 3300, 10200, 3900)
		MapUtils.overlayPaper(mapUI)
	end
	-- Dirkerdam West (6000, 1930, 7625, 4500)
	LootMaps.Init.DirkerdamWestMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Dirkerdam")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6000, 1930, 7635, 4500)
		MapUtils.overlayPaper(mapUI)
	end
	-- Dirkerdam East (7625, 1930, 9300, 4500)
	LootMaps.Init.DirkerdamEastMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Dirkerdam")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7635, 1930, 9300, 4500)
		MapUtils.overlayPaper(mapUI)
	end
	-- Full Dirkerdam(5500, 1930, 9600, 5100)
	LootMaps.Init.DirkerdamMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Dirkerdam")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5500, 1930, 9600, 5100)
		MapUtils.overlayPaper(mapUI)
	end

	-- Lake Cumberland (old location)
	-- West : (12300, 8100 , 13500, 9900)
	LootMaps.Init.LakeCumberlandWestMapOld = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/LC")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12300, 8100 , 13500, 9900)
		MapUtils.overlayPaper(mapUI)
	end
	-- NorthEast :(13500, 8100 , 15300, 8700)
	LootMaps.Init.LakeCumberlandNorthEastMapOld = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/LC")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13500, 8100 , 15300, 8700)
		MapUtils.overlayPaper(mapUI)
	end
	-- SouthEast :(13500, 8700 , 15300, 9900)
	LootMaps.Init.LakeCumberlandSouthEastMapOld = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/LC")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13500, 8700 , 15300, 9900)
		MapUtils.overlayPaper(mapUI)
	end
	-- Full : (12300, 8100 , 15300, 9900)
	LootMaps.Init.LakeCumberlandMapOld = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/LC")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12300, 8100 , 15300, 9900)
		MapUtils.overlayPaper(mapUI)
	end


	-- Waterlocked Pharmaceutical Factory
	-- (8100, 9000, 8400, 9300)
	LootMaps.Init.PharmaceuticalFactoryMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Waterlocked Pharmaceutical Factory")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8100, 9000, 8400, 9300)
		MapUtils.overlayPaper(mapUI)
	end


	----
	-- print("x="..getPlayer():getSquare():getX().." and y="..getPlayer():getSquare():getY())
	-- Nettle Township 
	-- (6600, 9000, 7200, 9600)
	LootMaps.Init.NettleTownshipMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Nettle Township")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6600, 9000, 7200, 9600)
		MapUtils.overlayPaper(mapUI)
	end

	-- St Moose Hospital Area
	-- (10800, 12000, 11100, 12400)
	LootMaps.Init.StMooseHospitalMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("MKHospitalArea_Horde") then
			MapUtils.initDirectoryMapData(mapUI, "media/maps/MK_Hospital_Area_Horde")
		elseif getActivatedMods():contains("MKHospitalArea_Normal") then
			MapUtils.initDirectoryMapData(mapUI, "media/maps/MK_Hospital_Area")
		else
			MapUtils.initDirectoryMapData(mapUI, "media/maps/MK_Hospital_Area")
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 12000, 11100, 12400)
		MapUtils.overlayPaper(mapUI)
	end

	-- Shortrest County
	-- (13350, 6900, 13900, 7200)
	LootMaps.Init.ShortrestCountyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Shortrest County")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13350, 6900, 13900, 7200)
		MapUtils.overlayPaper(mapUI)
	end


	-- Leavenburg (riverside)
	-- (5100, 3600, 6900, 4800)
	LootMaps.Init.LeavenburgMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Leavenburg")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5100, 3600, 6900, 4800)
		MapUtils.overlayPaper(mapUI)
	end

	-- Bunker - Day of the dead
	-- (6000, 10500, 6300, 10800)
	LootMaps.Init.BunkerDayOfTheDeadMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/DayOfTheDead")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6000, 10500, 6300, 10800)
		MapUtils.overlayPaper(mapUI)
	end

	-- SuperGigaMart
	-- (3600, 6300, 3800, 6500)
	LootMaps.Init.SuperGigaMartMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/SuperGigaMart")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3600, 6300, 3800, 6500)
		MapUtils.overlayPaper(mapUI)
	end

	-- Lake Cumberland (new location)
	-- West : (15000, 6300, 16200, 8100)
	LootMaps.Init.LakeCumberlandWestMapNew = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/LCV2")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(15000, 6300, 16200, 8100)
		MapUtils.overlayPaper(mapUI)
	end
	-- NorthEast :(16200, 6300, 18000, 6900)
	LootMaps.Init.LakeCumberlandNorthEastMapNew = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/LCV2")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(16200, 6300, 18000, 6900)
		MapUtils.overlayPaper(mapUI)
	end
	-- SouthEast :(16200, 7200, 18000, 8100)
	LootMaps.Init.LakeCumberlandSouthEastMapNew = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/LCV2")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(16200, 7200, 18000, 8100)
		MapUtils.overlayPaper(mapUI)
	end
	-- Full : (15000, 6300, 18000, 8100)
	LootMaps.Init.LakeCumberlandMapNew = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/LCV2")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(15000, 6300, 18000, 8100)
		MapUtils.overlayPaper(mapUI)
	end

	-- Ztardew Valley
	-- (12150, 9450, 12900, 10200)
	LootMaps.Init.ZtardewValleyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/ZtardewValley")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12150, 9450, 12900, 10200)
		MapUtils.overlayPaper(mapUI)
	end

	-- The Walking Dead: Prison
	-- (9600, 9300, 9900, 9600)
	LootMaps.Init.TheWalkingDeadPrisonMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/PrisonTWD")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9600, 9300, 9900, 9600)
		MapUtils.overlayPaper(mapUI)
	end

	-- The Walking Dead: Terminus
	-- (11700, 10500, 12000, 10800)
	LootMaps.Init.TheWalkingDeadTerminusMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/TerminusTWD")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11700, 10500, 12000, 10800)
		MapUtils.overlayPaper(mapUI)
	end

	-- Hunter's Base
	-- (6050, 5750, 6250, 5950)
	LootMaps.Init.HuntersBaseMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Hunter'sBase_map")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6050, 5750, 6250, 5950)
		MapUtils.overlayPaper(mapUI)
	end

	--- 

	-- PortCity KY
	-- (9300, 6600, 9900, 7200)
	LootMaps.Init.PortCityMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/PortCityKY")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9300, 6600, 9900, 7200)
		MapUtils.overlayPaper(mapUI)
	end


	---

	-- SpringValley KY
	-- (10800, 11100, 11100, 11400)
	LootMaps.Init.SpringValleyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/SpringValleyKY")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 11100, 11100, 11400)
		MapUtils.overlayPaper(mapUI)
	end

	-- Oakshire
	-- (8100, 7500, 9000, 8400)
	LootMaps.Init.OakshireMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Oakshire")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8100, 7500, 9000, 8400)
		MapUtils.overlayPaper(mapUI)
	end

	-- Ranger's Homestead
	-- (9700, 9950, 9900, 10110)
	LootMaps.Init.RangersHomesteadMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/ranger's_homestead_map")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9700, 9950, 9900, 10110)
		MapUtils.overlayPaper(mapUI)
	end

	-- The Frigate
	-- (12300, 6500, 12500, 6600)
	LootMaps.Init.FrigateMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/The Frigate")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12300, 6500, 12500, 6600)
		MapUtils.overlayPaper(mapUI)
	end

	-- Bunker: Last Minute Prepper
	-- (13270, 3680, 13450, 3900)
	LootMaps.Init.BunkerLastMinutePrepperMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("LastMinutePrepper") then
			MapUtils.initDirectoryMapData(mapUI, "media/maps/LastMinutePrepper")
		elseif getActivatedMods():contains("LastMinutePrepperReloaded") then
			MapUtils.initDirectoryMapData(mapUI, "media/maps/LastMinutePrepperReloaded")
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13270, 3680, 13450, 3900)
		MapUtils.overlayPaper(mapUI)
	end

	-- Louisville Quarantine Zone
	-- (13400, 3900, 14000, 4200)
	LootMaps.Init.LouisvilleQuarantineZoneMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Louisville_Quarantine_Zone")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13400, 3900, 14000, 4200)
		MapUtils.overlayPaper(mapUI)
	end

	-- LV International Airport
	-- (12800, 4200, 13465, 4799)
	LootMaps.Init.LVInternationalAirport = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/lvinternationalairport")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(12800, 4200, 13465, 4799)
		MapUtils.overlayPaper(mapUI)
	end

	-- Muldraugh Checkpoint + [H]
	-- (10530, 8720, 10730, 8900)
	LootMaps.Init.MuldraughCheckpointMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		
		if getActivatedMods():contains("MuldraughCheckpoint") then
			MapUtils.initDirectoryMapData(mapUI, "media/maps/MuldraughCheckpoint")
		elseif getActivatedMods():contains("MuldraughCheckpoint[HARDMODE]") then
			MapUtils.initDirectoryMapData(mapUI, "media/maps/MuldraughCheckpoint[H]")
		else
			MapUtils.initDirectoryMapData(mapUI, "media/maps/MuldraughCheckpoint")
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10530, 8720, 10730, 8900)
		MapUtils.overlayPaper(mapUI)
	end

	-- Speck
	-- (9000, 12300, 9220, 12540)
	LootMaps.Init.SpeckMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Speck")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9000, 12300, 9220, 12540)
		MapUtils.overlayPaper(mapUI)
	end

	-- Homestead Windy
	-- (8100, 8400, 8300, 8600)
	LootMaps.Init.HomesteadWindyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/homesteadmap")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8100, 8400, 8300, 8600)
		MapUtils.overlayPaper(mapUI)
	end

	-- Military Fuel Depot
	-- (10200, 12900, 10800, 13500)
	LootMaps.Init.MilitaryFuelDepotMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Military Fuel Depot")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10200, 12900, 10800, 13500)
		MapUtils.overlayPaper(mapUI)
	end


	---

	-- Spencer-Mansion-lootable
	-- (6300, 5700, 6600, 5900)
	LootMaps.Init.SpencerMansionMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("SimonMDSpencerMansionLootable") then
			MapUtils.initDirectoryMapData(mapUI, "media/maps/spencermansionlootable")
		elseif getActivatedMods():contains("SimonMDSpencerMansionNoLoot") then
			MapUtils.initDirectoryMapData(mapUI, "media/maps/spencermansionnoloot")
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6300, 5700, 6600, 5900)
		MapUtils.overlayPaper(mapUI)
	end

	-- Uncle Red's Bunker Redux
	-- (10800, 10835, 11100, 11070)
	LootMaps.Init.UncleRedsBunkerMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		if getActivatedMods():contains("UncleRedsBunker") then
			MapUtils.initDirectoryMapData(mapUI, "media/maps/UncleRedsBunker")
		elseif getActivatedMods():contains("UncleRedsBunkerRedux") then
			MapUtils.initDirectoryMapData(mapUI, "media/maps/UncleRedsBunkerRedux")
		end
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(10800, 10835, 11100, 11070)
		MapUtils.overlayPaper(mapUI)
	end

	-- Hopefalls
	-- (9600, 6600, 9900, 6900)
	LootMaps.Init.HopefallsMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/hopefalls")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9600, 6600, 9900, 6900)
		MapUtils.overlayPaper(mapUI)
	end

	-- [Legacy] Vine Grove, KY
	-- (14775, 1915, 16000, 2775)
	LootMaps.Init.VineGroveMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Legacy_VineGrove")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(14775, 1915, 15599, 2775)
		MapUtils.overlayPaper(mapUI)
	end

	
	-- [Legacy] Louisiana, KY
	-- (15600, 2100, 16200, 2700)
	LootMaps.Init.LouisianaMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Legacy_Louisiana")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(15600, 2100, 16200, 2700)
		MapUtils.overlayPaper(mapUI)
	end


	-- [Legacy] California, KY
	-- Full(15600, 300, 17400, 2100)
	LootMaps.Init.CaliforniaMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Legacy_California")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(15600, 300, 17400, 2100)
		MapUtils.overlayPaper(mapUI)
	end
	-- North(15600, 300, 17400, 1050)
	LootMaps.Init.CaliforniaMapNorth = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Legacy_California")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(15600, 300, 17400, 1050)
		MapUtils.overlayPaper(mapUI)
	end
	-- South(15600, 1050, 17400, 2100)
	LootMaps.Init.CaliforniaMapSouth = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Legacy_California")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(15600, 1050, 17400, 2100)
		MapUtils.overlayPaper(mapUI)
	end



	-- Weyhausen, KY
	-- (5100, 9300, 5400, 9600)
	LootMaps.Init.WeyhausenMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/weyhausen")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5100, 9300, 5400, 9600)
		MapUtils.overlayPaper(mapUI)
	end


	-- Daisy County
	-- (9900, 7200, 10500, 8100)
	LootMaps.Init.DaisyCountyMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Daisy County")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9900, 7200, 10500, 8100)
		MapUtils.overlayPaper(mapUI)
	end


	-- McCoy's Bunker
	-- (13245, 4285, 13360, 4410)
	LootMaps.Init.McCoysBunkerMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/McCoysBunker")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13245, 4285, 13360, 4410)
		MapUtils.overlayPaper(mapUI)
	end
	---
	-- Otter Creek
	-- (6000, 7800, 6600, 8400)
	-- Mod ID: OtterCreek
	-- Map Folder: ottercreek
	LootMaps.Init.OtterCreekMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/ottercreek")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6000, 7800, 6600, 8400)
		MapUtils.overlayPaper(mapUI)
	end

	-- Wellsburg Lake
	-- (7500, 10200, 7800, 10500)
	-- Mod ID: Wellsburg
	-- Map Folder: Wellsburg Lake
	LootMaps.Init.WellsburgLakeMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Wellsburg Lake")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7500, 10200, 7800, 10500)
		MapUtils.overlayPaper(mapUI)
	end

	-- Fort Boonesborough 
	-- (14000, 1850, 14300, 2080)
	-- Mod ID: Fort_Boonesborough
	-- Map Folder: Fort_Boonesborough
	LootMaps.Init.FortBoonesboroughMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Fort_Boonesborough")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(14000, 1850, 14300, 2080)
		MapUtils.overlayPaper(mapUI)
	end
	

	-- Pineville DONE
	-- Taylorsville DONE

	-- print(" ( "..getPlayer():getX().. " , "..getPlayer():getY().." ) ")

	-- Crowlake (6300 ,11100 , 6599, 11699)
	-- Mod ID: Crowlake
	-- Map Folder: Crowlake
	LootMaps.Init.CrowlakeMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Crowlake")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6300 ,11100 , 6599, 11699)
		MapUtils.overlayPaper(mapUI)
	end

	-- Guston, KY (3640, 6715, 4450, 7770)
	-- Mod ID: Guston
	-- Map Folder: GustonKY
	LootMaps.Init.GustonMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/GustonKY")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3600, 6900, 4200, 7800)
		MapUtils.overlayPaper(mapUI)
	end

	-- Jasperville
	-- Mod ID: Jasperville
	-- Map Folder: Jasperville
	-- Jasperville Train Station (5300, 1600, 6200, 2200)
	LootMaps.Init.JaspervilleTrainStationMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Jasperville")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5300, 1600, 6200, 2300)
		MapUtils.overlayPaper(mapUI)
	end
	-- Jasperville Industrial (5680, 2350, 6125, 2800)
	LootMaps.Init.JaspervilleIndustrialMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Jasperville")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(5680, 2300, 6200, 2800)
		overlayPNG(mapUI, 5900, 2310, 0.25, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end
	-- Map of Jasperville (6235, 1915, 7120, 2730)
	LootMaps.Init.JaspervilleMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Jasperville")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(6235, 1915, 7120, 2730)
		overlayPNG(mapUI, 6250, 1930, 0.5, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end



	-- Yakama State Park (8400, 10500, 9599, 11399)
	-- Mod ID: YakamaStatePark
	-- Map Folder: YakamaStatePark
	LootMaps.Init.YakamaStateParkMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/YakamaStatePark")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(8400, 10500, 9599, 11399)
		MapUtils.overlayPaper(mapUI)
	end

	-- ValuTech Amusement Park (13500, 4200, 13799, 4799)
	-- Mod ID: SimonMDValuTechAmusementPark
	-- Map Folder: valutechamusementpark
	LootMaps.Init.ValuTechAmusementParkMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/valutechamusementpark")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(13500, 4200, 13799, 4799)
		MapUtils.overlayPaper(mapUI)
	end

	-- Canvasback Studios (9900, 10200, 10199, 10499)
	-- Mod ID: Canvasback Studios
	-- Map Folder: Canvasback
	LootMaps.Init.CanvasbackStudiosMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Canvasback")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(9900, 10200, 10199, 10499)
		MapUtils.overlayPaper(mapUI)
	end

	-- Pleford Springs, KY (3300, 7200, 4199, 8099)
	-- Mod ID: PlefordSpringsMapMod
	-- Map Folder: PlefordSprings
	LootMaps.Init.PlefordSpringsMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/PlefordSprings")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(3350, 7300, 4199, 8099)
		overlayPNG(mapUI, 3365, 7315, 0.35, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- FoxWood (7800, 7500, 8099, 7799)
	-- Mod ID: One cell life
	-- Map Folder: Foxwood
	LootMaps.Init.FoxWoodMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Foxwood")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7800, 7500, 8099, 7799)
		MapUtils.overlayPaper(mapUI)
	end
	-- Mapa brasil 1.0 (7200, 12300, 8400, 13500)
	-- Mod ID: mapa brasil
	-- Map Folder: mapa brasil
	LootMaps.Init.BrazilMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/mapa brasil")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(7200, 12300, 8400, 13500)
		overlayPNG(mapUI, 7220, 12900, 0.5, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end
	-- Fort Loid (11100, 8100, 11399, 8399)
	-- Mod ID: FortLoid
	-- Map Folder: Fort Loid
	LootMaps.Init.FortLoidMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/Fort Loid")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(11100, 8100, 11399, 8399)
		MapUtils.overlayPaper(mapUI)
	end
	-- HavenRidge (4260, 9900, 4799, 10199)
	-- Mod ID: LastOfUs
	-- Map Folder: LastOfUs
	LootMaps.Init.HavenRidgeMap = function(mapUI)
		local mapAPI = mapUI.javaObject:getAPIv1()
		MapUtils.initDirectoryMapData(mapUI, "media/maps/LastOfUs")
		MapUtils.initDefaultStyleV1(mapUI)
		replaceWaterStyle(mapUI)
		mapAPI:setBoundsInSquares(4260, 9900, 4799, 10199)
		overlayPNG(mapUI, 4270, 9910, 0.18, "legend", "media/textures/worldMap/Legend.png")
		MapUtils.overlayPaper(mapUI)
	end

	-- SHELTERS COLLECTION
	-- NONE OF THEM ARE INDEICATED ON THE IN GAME MAP
	-- SHELTER 22 38 (6600, 11400, 6899, 11699)
	-- SHELTER 31 22 (9300, 6600, 9599, 6899)
	-- SHELTER 49 12 (14700, 3600, 14999, 3899)
	-- SHELTER 22 28 (6600, 8400, 6899, 8699)
	-- SHELTER 25 33 (7500, 9900, 7799, 10199)
	-- SHELTER 29 26 (8700, 7800, 8999, 8099)
	-- SHELTER 40 30 (12000, 9000, 12299, 9299)
	-- SHELTER 45 15 (13500, 4500, )
	-- TOWER 13 26
	-- TOWER 47 22



	--------------------------------------------------
	-- will do later maybe
	-- Wolford
	-- Sulejkow 43x36
	-- Southwood 2.0, KY
	-- taibeiroad
	--------------------------------------------------
	-- Mods with the ingame map not supported yet !!
	-- Firecamp, KY 
	-- South Muldraugh's Mall
	-- Frankfort, KY 
	-- western town
	-- Cigaro little town
	-- Villa in forest
	-- Base in the Archipelago
	-- Liberty City
	-- East Riverside
	-- Peles mansion
	-- Daegu Metropolitan City (vanilla)
	-- Drayton
	-- The Walking Dead Project


end 


Events.OnGameStart.Add(initMapReveals)