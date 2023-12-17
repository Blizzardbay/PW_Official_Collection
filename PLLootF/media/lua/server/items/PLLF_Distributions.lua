Distributions = Distributions or {};

local distributionTable = 
{

	bookstore = {
        other =
        {
            rolls = 1,
            items = {
				"Base.grimoireclosed", 0.05,
            }
        }
    },

    musicstore = {
        counter ={
            rolls = 3,
            items = {
                "Hat_TubaHat", 0.5,
                "BeltRig", 0.7,
                "Pen", 5,
                "BluePen", 3,
                "RedPen", 3,
                "Pencil", 5,
                "RubberBand", 2,
                "Magazine", 6,
                "Tote", 4,
                "Radio.RadioBlack",1,
                "Radio.RadioRed",0.5,
            }
        }
    },

	clothesstore = {

        counter ={
            rolls = 4,
            items = {
                  "Hat_WitchyHat", 0.2,
                  "Hat_SpiffoEars", 0.8,
				  "WitchyDress", 0.2,
				  "WitchySocks", 1,
                  "ClericMask", 0.3,
            },
        },
    },

    toolstore = {
        
        counter ={
            rolls = 4,
            items = {
              "KnightArms", 0.2,
              "Gloves_TKnight", 0.3,
              "Shoes_TKnight", 0.3,
              "KnightGreaves", 0.2,
              "ChainMail", 0.2,
              "Hat_Tknight", 0.2,
              "Vest_Tknight", 0.2,
              "KnightWaist", 0.2,
            }
        },
    },

    gunstore = {
        counter ={
            rolls = 3,
            items = {
                "Base.Tanto3", 0.4,
            },
            dontSpawnAmmo = true,
        },

        displaycase ={
            rolls = 3,
            items = {
                "Base.Tanto3", 0.4,
            },
            dontSpawnAmmo = true,
        },

        locker ={
            rolls = 3,
            items = {
                "Base.Tanto3", 0.4,
                --"Base.40Clip", 1,
            },
        },

    },

    gunstorestorage ={
        all={
            rolls = 2,
            items = {
                --"Base.Tanto3", 0.5,
                --"Vest_HECU", 0.05,
                "Mask_HECU", 0.06,
                --"Base.40ClipCan", 0.4,
                --"Base.VulcanClip", 0.4,
                "Base.40Clip", 1,
                --"Base.40Clip", 0.5,
                --"Base.Vulcan", 0.1,
                --"Base.Autocannon", 0.1,
                "Base.mp5GL", 0.05,
                "Base.WitchySMGClip", 1,
                --"Base.556HMGBelt", 0.5,
            },
        },
    },

    armystorage = {
        locker ={
            rolls = 1,
            items = {
                "Vest_HECU", 0.1,
				"Mask_HECU", 0.1,
            },
        },

        metal_shelves =
        {
            rolls = 2,
            items = {
                "Vest_HECU", 0.1,
				"Mask_HECU", 0.1,
            }
        },
    },

    armysurplus = {
        isShop = true,
        shelves = {
            rolls = 1,
            items = {
                "Vest_HECU", 0.1,
				"Mask_HECU", 0.1,
            },
        },
        
        metal_shelves = {
            rolls = 1,
            items = {
                --"Vest_HECU", 0.1,
				"Mask_HECU", 0.1,
            },
        },
        
    },

}

table.insert(Distributions, distributionTable);
