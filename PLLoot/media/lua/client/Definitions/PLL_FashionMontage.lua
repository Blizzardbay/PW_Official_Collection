-- INSTRUCTIONS - NAMING THE FILE --
-- Rename this file, ideally your mod's ID followed by "_FashionMontage.lua"
-- Make sure this filename starts with an english letter --

-- INSTRUCTIONS - ADDING YOUR ITEMS --
-- Add each of your items to the list that corresponds to its BodyLocation
-- If it does not have a unique DisplayName it will not appear in the dropdown


-- This ensures the player won't get any error messages if they aren't using Fashion Montage
if getActivatedMods():contains("FashionMontage") then
  require "Definitions/_OGSN_FashionMontage"
  require "Definitions/_OGSN_FashionMontageVanillaClothes"
else
  return
end

-- pointless statement is pointless
ClothingSelectionDefinitions = ClothingSelectionDefinitions

local clothing = {
  -- these lists are named after the BodyLocation of the item
  -- If your item's BodyLocation = Hat then put it in "Hat"
  Hat = {
    "Base.RogueHoodie",
    "Base.Hat_Altynopen",
    "Base.HATELA",
    "Base.HATELAHEADS",
    "base.FlatCap",
  },
  TankTop = {    
    "Base.CropTop",
    "Base.PFCropped",
    "Base.SportTankTop",
  },     -- Remember,
  Tshirt = {},      -- if
  Shirt = {
    "Base.bandagesgloves",
  },       -- your
  Socks = {    
    "Base.RogueGreaves",
    "Base.Leggings_Bottoms",
    "Base.bandageslegs",
  },       -- item
  Pants = {    
    "Base.ClericPants",
    "Base.PFPants",
    "Base.PFShorts",
    "Base.ShorterDenim",
    "Base.Shorts_Kimo",
  },       -- doesn't
  Skirt = {},       -- have
  Dress = {},       -- a
  Shoes = {
    "Base.Shoes_Canvasshoes",
    "Base.Shoes_CanvasshoesLong",
    "Base.Shoes_Rogue",
  },       -- unique
  Eyes = {
    "Base.GlassesPLL", 
    "Base.GlassesPLLR",
  },        -- DisplayName
  LeftEye = {},
  RightEye = {},
  BeltExtra = {
    "Base.HolsterPLL",
    "Base.HolsterPLL2",
    "Base.HolsterPLLM",
    "Base.HolsterPLL2M",
  },   -- it
  AmmoStrap = {
  },
  Mask = {
    "Base.BalaTight",
    "Base.BalaTight2",
  },        -- will
  MaskEyes = {
    "Base.RogueMask",
  },    -- not
  Underwear = {
    "Base.WetSuit",
  },   -- appear
  FullHat = {
    "Base.Hat_Altyn",
  },     -- in
  Torso1Legs1 = {
  }, -- the
  Neck = {
    "Base.ClericNeck",
  },        -- dropdowns
  Hands = {
    "Base.Gloves_Rogue",
  },
  Legs1 = {},
  Sweater = {
    "Base.RogueArms",
  },     -- Do
  Jacket = {
  },      -- not
  FullSuit = {},    -- rename
  FullSuitHead = {},-- any
  FullTop = {},     -- functions
  BathRobe = {},    -- or
  TorsoExtra = {
    "Base.Vest_WitchyCarrier",
    "Base.Vest_RogueVest",
    "Base.PFVest",
    "Base.PFVest2",
  },  -- lists
  Tail = {},        -- in
  Back = {
    "Base.smallback",
    "Base.Bag_ParaMedic",
  },        -- this
  Scarf = {
    "Base.RogueWaist",
  },       -- file
  FannyPackFront = {
    "Base.TacticalWaistBagFront",
    "Base.TacticalWaistBagBack",
    "Base.TacticalWaistBagFrontMed",
    "Base.TacticalWaistBagBackMed",
    "Base.BeltRig",
    "Base.RogueWaistBag",
    "Base.medbag",
    "Base.medbag2",
  },
  Necklace = {},
  Necklace_Long = {},
  Nose = {},
  LeftWrist = {
    "Base.ElbowbandL",
  },
  RightWrist = {
    "Base.ElbowbandR",
  },
  Right_RingFinger = {
  },
  Left_RingFinger = {
    "Base.HolsterPLLLEFT",
    "Base.HolsterPLLLEFT2",
    "Base.HolsterPLLLEFTM",
    "Base.HolsterPLLLEFT2M",
  },
  Right_MiddleFinger = {
  },
  Left_MiddleFinger = {
    "Base.PFKnee",
  },
  Ears = {},
  EarTop = {},
  MaskFull = {},
  TorsoRig = {
    "Base.strapchest",
    "Base.strapchest2",
    "Base.MVest",
    "Base.MVest2",
  }

  -- If your mod adds new bodylocations, you can include its items here
  -- as long as you also include the new bodyLocation's name
  -- in the next array (see below)
}

local bodyLocations = {"TorsoRig"}

  -- if your mod adds brand new bodyLocations, list each of them here as strings
  -- for example:
  -- "KneePads",
  -- "ThirdArm",
  -- "SidewaysBaseballCap",

  if #bodyLocations > 0 then
    _OGSN_FashionMontage.addBodyLocations(bodyLocations);
  end
  _OGSN_FashionMontage.addClothingItems(clothing);
