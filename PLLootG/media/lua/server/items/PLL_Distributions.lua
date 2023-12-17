Distributions = Distributions or {};

local distributionTable = 
{

    zippeestore =
    {
        counter = {
            rolls = 1,
            items = {
                "Base.p88p", 0.5,
            }
        },
    },

    gigamart =
    {
        
        counter ={
            rolls = 1,
            items = {
                "Base.p88p", 0.5,
            }
        },
    },

    fossoil =
    {
        counter ={
            rolls = 1,
            items = {
                "Base.p88p", 0.5,
            }
        },
    },

    bedroom =
    {
        
        sidetable = {
            rolls = 1,
            items = {
                "Base.smallback", 0.8,
                "Base.medbag", 0.5,
                "Base.p88p", 0.5,
                "Base.9mmClip", 0.7,
                "Base.m32r", 0.8,
                "Base.Bullets38Box", 1,
                "Leggings_Bottoms", 1.5,
            }
        },
    },

    optometrist = {
        counter = {
            rolls = 3,
            items = {
                "Base.GlassesPLL", 3,
                "Base.GlassesPLLR", 3,
            }
        },
    },

	aesthetic = {
        counter ={
            rolls = 1,
            items = {
                "Base.Hat_HairP", 2,
				"Base.Hat_HairPiggy", 2,
				"Base.Hat_HairModern", 2,
                "Base.Hat_HairWide", 2,
                "Base.Hat_HairWendy", 2,
                "Base.Hat_HairBun2", 2,
                "Base.Hat_HairCroft", 2,
                "Base.Hat_HairFio", 2,
                "Base.Hat_HairMarcel", 2,
                "Base.Animask1", 1,
                "Base.Animask2", 0.5,
                "Base.Animask12", 1,
                "Base.Animask22", 0.5,
            },
        },
    },

	clothesstore = {

        counter ={
            rolls = 3,
            items = {
                  --"TacticalWaistBagBackMed", 0.4,
                  "Base.medbag2", 0.5,
                  --"Base.Bag_ParaMedic", 0.5,
                  "Base.strapchest", 0.5,
                  "Base.BeltRig",0.7,
                  --"Base.MVest", 0.5,
                  "ElbowbandL", 1,
                  "ElbowbandR", 1,
                  "Leggings_Bottoms", 1.5,
                  "Base.Shoes_CanvasshoesLong", 2,
                  "Base.Shoes_Canvasshoes", 3,
            },
        },
    },

	
	gunstore = {
        counter ={
            rolls = 3,
            items = {
				--"Base.132Box", 1,
                "Base.500Box", 1,
                --"40Clip", 1,
				"Base.WitchySMGClip", 1,
				"Base.ClericRevolver", 0.5,
				--"Base.RogueSniperRifle", 0.5,
				"Base.WitchySMG", 0.5,
                --"Base.TKShotgun", 0.5,
                --"Base.Lewis", 0.5,
                "Base.PPSH", 0.5,
                "Base.PPSHClip", 1,
                --"Base.LewisDrum", 1,
                --"Base.m79", 0.2,
                "Base.MAS38", 0.2,
                "Base.MASClip", 0.5,
                "Base.p88p", 0.7,
                "Base.m32r", 0.8,
                "Base.JERICHOP",0.6,
            },
            dontSpawnAmmo = true,
        },

        displaycase ={
            rolls = 3,
            items = {
				--"Base.132Box", 1,
                "Base.500Box", 1,
                --"40Clip", 1,
				"Base.WitchySMGClip", 0.5,
				"Base.ClericRevolver", 0.5,
				--"Base.RogueSniperRifle", 0.5,
				"Base.WitchySMG", 0.5,
                --"Base.TKShotgun", 0.5,
                --"Base.Lewis", 0.5,
                "Base.PPSH", 0.5,
                "Base.PPSHClip", 0.5,
                --"Base.LewisDrum", 0.5,
                --"Base.m79", 0.2,
                "Base.MAS38", 0.2,
                "Base.MASClip", 0.5,
                "Base.p88p", 0.7,
                "Base.m32r", 0.8,
                "Base.JERICHOP",0.6,
            },
            dontSpawnAmmo = true,
        },

        locker ={
            rolls = 3,
            items = {
                "Vest_WitchyCarrier", 0.5,
				--"Vest_RogueVest", 0.5,
				"RogueMask", 0.5,
                "RogueWaistBag", 0.5,
                "Base.strapchest", 0.5,
                "Base.MVest", 0.3,
                --"Base.132Box", 0.5,
                "Base.500Box", 0.5,
                --"40Clip", 0.5,
				"Base.WitchySMGClip", 0.5,
				"Base.ClericRevolver", 0.3,
				--"Base.RogueSniperRifle", 0.3,
				"Base.WitchySMG", 0.3,
                --"Base.TKShotgun", 0.3,
                --"Base.Lewis", 0.3,
                "Base.PPSH", 0.3,
                "Base.PPSHClip", 0.5,
                --"Base.LewisDrum", 0.5,
                --"Base.m79", 0.2,
                "Base.MAS38", 0.2,
                "Base.MASClip", 0.5,
                "Base.p88p", 0.7,
                "Base.m32r", 0.8,
                "Base.JERICHOP",0.6,
            },
            dontSpawnAmmo = true,
        },

        metal_shelves ={
            rolls = 2,
            items = {
				--"Base.132Box", 1,
                "Base.500Box", 1,
                --"40Clip", 1,
				"Base.WitchySMGClip", 0.5,
				"Base.ClericRevolver", 0.5,
				--"Base.RogueSniperRifle", 0.5,
				"Base.WitchySMG", 0.5,
                --"Base.TKShotgun", 0.5,
                --"Base.Lewis", 0.5,
                "Base.PPSH", 0.5,
                "Base.PPSHClip", 1,
                --"Base.LewisDrum", 1,
                --"Base.m79", 0.2,
                "Base.MAS38", 0.2,
                "Base.MASClip", 0.5,
                "Base.p88p", 0.7,
                "Base.m32r", 0.8,
                "Base.JERICHOP",0.6,
            },
            dontSpawnAmmo = true,
        },
    },

    gunstorestorage ={
        all={
            rolls = 2,
            items = {
                "Base.132Box", 2,
                "Base.500Box", 2,
                "40Clip", 1,
                "Base.PPSHClip", 0.7,
                "Base.LewisDrum", 0.5,
                "Base.WitchySMGClip", 0.6,
                "Vest_WitchyCarrier", 0.6,
				--"RogueGreaves", 0.5,
				--"RogueArms", 0.5,
				"Shoes_Rogue", 0.2,
				"Gloves_Rogue", 0.3,
                "Base.medbag2", 0.2,
				--"RogueWaist", 0.5,
				--"Vest_RogueVest", 0.5,
				--"RogueHoodie", 0.5,
                "RogueMask", 0.5,
                --"Base.strapchest", 0.5,
                --"Base.MVest", 0.5,
                "Base.m79", 0.2,
                "Base.WitchySMG", 0.3,
                "Base.TKShotgun", 0.2,
                "Base.Lewis", 0.2,
                "Base.PPSH", 0.4,
                "Base.ClericRevolver", 0.3,
                "Base.RogueSniperRifle", 0.3,
                "Base.MAS38", 0.3,
                "Base.MASClip", 0.6,
            },
    
            dontSpawnAmmo = true,
        },
    },

    armysurplus = {
        shelves = {
            rolls = 2,
            items = {
                "Base.ClericPants", 0.5,
                "Base.HATELA", 
                0.3,
                "Base.ClericNeck", 0.5,
                "WetSuit", 0.5,
                "Vest_WitchyCarrier", 0.6,
				"RogueGreaves", 0.5,
				"RogueArms", 0.5,
				"Shoes_Rogue", 0.5,
				"Gloves_Rogue", 0.5,
				"RogueWaist", 0.5,
				"Vest_RogueVest", 0.5,
				"RogueHoodie", 0.5,
                "RogueMask", 0.5,
                "Base.strapchest", 0.5,
                "Base.MVest", 0.5,
                "TacticalWaistBagBack", 0.4,
                "TacticalWaistBagBackMed", 0.4,
                "Base.HolsterPLL2M", 2,
                "Base.medbag", 0.6,
                "Base.medbag2", 0.6,
                "Base.FlatCap", 1.5,
                "Base.smallback", 0.8,
            },
        },
        
        metal_shelves = {
            rolls = 2,
            items = {
                "Base.ClericPants", 0.5,
                "Base.HATELA", 
                0.3,
                "Base.ClericNeck", 0.5,
                "Base.Hat_Altyn",0.6,
                "WetSuit", 0.5,
                "Vest_WitchyCarrier", 0.6,
				"RogueGreaves", 0.5,
				"RogueArms", 0.5,
				"Shoes_Rogue", 0.5,
				"Gloves_Rogue", 0.5,
				"RogueWaist", 0.5,
				"Vest_RogueVest", 0.5,
				"RogueHoodie", 0.5,
                "RogueMask", 0.5,
                "Base.strapchest", 0.5,
                "Base.MVest", 0.5,
                "TacticalWaistBagBack", 0.4,
                "TacticalWaistBagBackMed", 0.4,
                "Base.HolsterPLL2M", 2,
                "Base.medbag", 0.6,
                "Base.medbag2", 0.6,
                "Base.FlatCap", 1.5,
                "Base.smallback", 0.8,
            },
        },
        
        
        clothingrack = {
            rolls = 3,
            items = {
                "WetSuit", 0.5,
                "Vest_WitchyCarrier", 0.6,
				--"RogueGreaves", 0.5,
				--"RogueArms", 0.5,
				--"Shoes_Rogue", 0.5,
				--"Gloves_Rogue", 0.5,
				"RogueWaist", 0.5,
				"Vest_RogueVest", 0.5,
				"RogueHoodie", 0.5,
                --"RogueMask", 0.5,
                "Base.strapchest", 0.5,
                "Base.MVest", 0.5,
                "TacticalWaistBagBack", 0.4,
                "TacticalWaistBagBackMed", 0.4,
                "Base.HolsterPLL2M", 2,
                "Base.medbag", 0.6,
                "Base.medbag2", 0.6,
                "Base.FlatCap", 1.5,
                "Base.smallback", 0.8,
            },
        },
    },
    
    armyhanger = {
        metal_shelves = {
            rolls = 3,
            items = {
                "Base.Hat_Altyn",0.6,
                "WetSuit", 0.5,
                --"Vest_WitchyCarrier", 0.6,
				"RogueGreaves", 0.5,
				"RogueArms", 0.5,
				"Shoes_Rogue", 0.5,
				"Gloves_Rogue", 0.5,
				"RogueWaist", 0.5,
				"Vest_RogueVest", 0.5,
				"RogueHoodie", 0.5,
                "RogueMask", 0.5,
                "Base.strapchest", 0.5,
                "Base.MVest", 0.5,
                "TacticalWaistBagBack", 0.4,
                "TacticalWaistBagBackMed", 0.4,
                "Base.HolsterPLL2M", 2,
                "Base.medbag", 0.6,
                "Base.medbag2", 0.6,
                "Base.FlatCap", 1.5,
                "Base.smallback", 0.8,
            },
        },
    },

    sportstore = {
        shelves = {
            rolls = 4,
            items = {
                "WetSuit", 0.5,
                "TacticalWaistBagBackMed", 0.3,
                "TacticalWaistBagBack", 0.3,
                "ElbowbandL", 0.5,
                "ElbowbandR", 0.5,
                "PFVest", 0.5,
                "CropTop", 0.5,
                "PFCropped", 0.5,
                "PFShorts", 0.5,
                "PFKnee", 0.5,
                "PFPants", 0.5,
                "ShorterDenim", 0.4,
                "Base.strapchest", 0.4,
                "Base.Shoes_CanvasshoesLong", 1.5,
                "Base.Shoes_Canvasshoes", 2,
            },
        },

        clothingrack = {
            rolls = 3,
            items = {
                "WetSuit", 0.5,
                --"TacticalWaistBagBack", 0.5,
                "Base.smallback", 1.5,
                --"Base.Bag_ParaMedic", 1,
            },
        },
    },

    policestorage = {

        locker = {
            rolls = 2,
            items = {
                "Vest_WitchyCarrier", 0.8,
                --"Base.JERICHOP",1,
                --"Base.Hat_Altyn",1,
                "Base.p88p", 0.7,
                "Base.m32r", 0.8,
                "Base.HolsterPLL2",
                3,
                "Base.BeltRig",
                0.5,
                "TacticalWaistBagBack", 
                0.5,
                "Base.ClericPants", 0.5,
                "Base.HATELA", 
                0.2,
                --"Base.ClericNeck", 1,
                "Base.medbag2", 
                1,
                --"Base.Bag_ParaMedic", 0.8,
                "Base.strapchest", 
                0.5,
                "Base.MVest", 
                0.5,
                "Base.FlatCap", 
                1,

            },
        },

        metal_shelves = {
            rolls = 2,
            items = {
                "Vest_WitchyCarrier", 0.8,
                --"Base.JERICHOP",1,
                "Base.p88p", 0.7,
                "Base.m32r", 0.8,
                "Base.Hat_Altyn",0.6,
                "Base.HolsterPLL2",
                3,
                "Base.BeltRig",
                2,
                "TacticalWaistBagBack", 
                0.8,
                "Base.ClericPants", 0.5,
                "Base.HATELA", 
                0.2,
                --"Base.ClericNeck", 1,
                "Base.medbag2", 
                0.7,
                "Base.strapchest", 
                0.5,
                "Base.MVest", 
                0.3,

            },
        },

        counter = {
            rolls = 2,
            items = {
                "Vest_WitchyCarrier", 0.8,
                "Base.p88p", 0.7,
                "Base.m32r", 0.8,
                "Base.HolsterPLL2",
                3,
                "Base.BeltRig",
                2,
                "TacticalWaistBagBack", 
                0.8,
                --"Base.ClericPants", 1,
                "Base.HATELA", 
                0.2,
                --"Base.ClericNeck", 1,
                "Base.medbag2", 
                0.7,
                "Base.strapchest", 
                0.5,
                --"Base.MVest", 0.3,

            },
        },
    },

    medclinic =
    {
        isShop = true,
        counter =
        {
            rolls = 1,
            items = {
                "Base.medbag", 0.5,
                "Base.Bag_ParaMedic", 0.6,
            }
        }
    },
    
    medicalstorage = {
        isShop = true,
        metal_shelves =
        {
            rolls = 1,
            items = {
                "TacticalWaistBagBackMed", 0.3,
                "Base.Bag_ParaMedic", 0.8,
            }
        }
    },

    pharmacystorage = {
        isShop = true,
        metal_shelves ={
            rolls = 1,
            items = {
                "TacticalWaistBagBackMed", 0.3,
                "Base.Bag_ParaMedic", 0.8,
            }
        },
    },

    all = {

        inventorymale = {
            rolls = 1,
            items = {

                "Base.m32r", 0.05,

            }
        },
        inventoryfemale = {
            rolls = 1,
            items = {

                "Base.m32r", 0.05,
            }
            
        },
    },

}

table.insert(Distributions, distributionTable);
