require "Foraging/forageSystem"

Events.onAddForageDefs.Add(function()

local CGRockSalt = {
	type="CGRecipes.CGRockSalt",
	minCount=1,
	maxCount=3,
	xp=15,
	categories = { "Stones" },
		zones = {
			Forest      = 9,
			DeepForest  = 9,
			Vegitation  = 5,
			FarmLand    = 2,
			Farm        = 2,
			TrailerPark = 5,
			TownZone    = 5,
			Nav         = 5,
		},
		months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 }
};

forageSystem.addItemDef(CGRockSalt);

end);
