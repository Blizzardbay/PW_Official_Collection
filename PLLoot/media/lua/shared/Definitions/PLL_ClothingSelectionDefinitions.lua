-- define here all the clothing that'll be available for a specific profession.
-- the default will always been available


PLL_ClothingSelectionDefinitions = {};

-- default selection, always available
PLL_ClothingSelectionDefinitions.default = {
	-- if there's no difference between male/female outfit, just create the female one, here we can have skirt
	Female = {
		-- this is the bodyLocation (defined in BodyLocations.lua)
		Hat = {
			chance = 10,
			items = {"Base.Hat_BaseballCap"},
		},

		Wig = {
			chance = 0,
			items = {"Base.Hat_HairP",
			"Base.Hat_HairPiggy",
			"Base.Hat_HairWide",
			"Base.Hat_HairWendy",
			"Base.Hat_HairBun2",
			"Base.Hat_HairCroft",
			"Base.Hat_HairLeo",
			"Base.Hat_HairFio",
			"Base.Hat_HairMarcel"},
		},
		
		Eyes = {
			chance = 10,
			items = {"Base.Glasses_Normal", "Base.Glasses_Reading", "Base.GlassesPLL", "Base.GlassesPLLR"},
		},

		Pupils = {
			chance = 0,
			items = {"Base.Animask1", "Base.Animask12", "Base.Animask13"},
		},
		
		TankTop = {
			chance = 10,
			items = {"Base.Vest_DefaultTEXTURE_TINT", "Base.CropTop", "Base.SportTankTop"},
		},
		
		Shirt = {
			chance = 10,
			items = {"Base.Shirt_FormalWhite", "Base.Shirt_FormalWhite_ShortSleeve", "Base.Shirt_Denim"},
		},
	
		Tshirt = {
			items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_WhiteLongSleeveTINT", "Base.Tshirt_PoloStripedTINT", "Base.Tshirt_PoloTINT"},
		},

--		Sweater = {
--			chance = 30,
--			items = {"Base.Jumper_PoloNeck", "Base.Jumper_RoundNeck", "Base.Jumper_VNeck"},
--		},
--
--		Jacket = {
--			chance = 30,
--			items = {"Base.Jacket_WhiteTINT", "Base.JacketLong_Random"},
--		},
		
		Pants = {
			items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"},
		},
		
		Skirt = {
			chance = 50,
			items = {"Base.Skirt_Knees", "Base.Skirt_Long", "Base.Skirt_Normal", "Base.Skirt_Short"},
		},
		
		Socks = {
			items = {"Base.Socks_Ankle", "Base.Socks_Long",},
		},
		
		Shoes = {
			items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT","Base.Shoes_Canvasshoes"},
		},
	},
	
	Male = {
		Hat = {
			chance = 10,
			items = {"Base.Hat_BaseballCap"},
		},

		Wig = {
			chance = 0,
			items = {"Base.Hat_HairP",
			"Base.Hat_HairPiggy",
			"Base.Hat_HairWide",
			"Base.Hat_HairWendy",
			"Base.Hat_HairBun2",
			"Base.Hat_HairCroft",
			"Base.Hat_HairLeo",
			"Base.Hat_HairFio",
			"Base.Hat_HairMarcel"},
		},
		
		Eyes = {
			chance = 10,
			items = {"Base.Glasses_Normal", "Base.Glasses_Reading", "Base.GlassesPLL", "Base.GlassesPLLR"},
		},

		Pupils = {
			chance = 0,
			items = {"Base.Animask1", "Base.Animask12", "Base.Animask13"},
		},
		
		TankTop = {
			chance = 30,
			items = {"Base.Vest_DefaultTEXTURE_TINT", "Base.SportTankTop"},
		},
		
		Shirt = {
			chance = 10,
			items = {"Base.Shirt_FormalWhite", "Base.Shirt_FormalWhite_ShortSleeve",},
		},
		
		Tshirt = {
			items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_WhiteLongSleeveTINT", "Base.Tshirt_PoloStripedTINT", "Base.Tshirt_PoloTINT"},
		},
		
--		Sweater = {
--			chance = 30,
--			items = {"Base.Jumper_PoloNeck", "Base.Jumper_RoundNeck", "Base.Jumper_VNeck"},
--		},
--
--		Jacket = {
--			chance = 30,
--			items = {"Base.Jacket_WhiteTINT", "Base.JacketLong_Random"},
--		},
		
		Pants = {
			items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"},
		},
		
		Socks = {
			items = {"Base.Socks_Ankle", "Base.Socks_Long"},
		},
		
		Shoes = {
			items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT","Base.Shoes_Canvasshoes"},
		},
	}
}

for key, value in pairs(PLL_ClothingSelectionDefinitions) do
    ClothingSelectionDefinitions[key] = value
end
