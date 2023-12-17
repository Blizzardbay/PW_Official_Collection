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
    "Base.Hat_WitchyHat",
    "Base.Hat_Tknightopen",
    "Base.Hat_TubaHat",
  },
  TankTop = {    
  },     -- Remember,
  Tshirt = {},      -- if
  Shirt = {
  },       -- your
  Socks = {    
    "Base.WitchySocks",
    "Base.KnightGreaves",
  },       -- item
  Pants = {    

  },       -- doesn't
  Skirt = {},       -- have
  Dress = {
    "Base.WitchyDress",
  },       -- a
  Shoes = {
    "Base.Shoes_TKnight",
  },       -- unique
  Eyes = {
  },        -- DisplayName
  LeftEye = {},
  RightEye = {},
  BeltExtra = {
  },   -- it
  AmmoStrap = {
  },
  Mask = {
  },        -- will
  MaskEyes = {
    "Base.ClericMask",
    "Base.Mask_HECU",
    "Base.Hat_SpiffoEars",
  },    -- not
  Underwear = {
    "Base.ChainMail",
  },   -- appear
  FullHat = {
    "Base.Hat_Tknight",
  },     -- in
  Torso1Legs1 = {
    "Base.aresbody",
  }, -- the
  Neck = {
  },        -- dropdowns
  Hands = {
    "Base.Gloves_TKnight",
  },
  Legs1 = {},
  Sweater = {
    "Base.KnightArms",
  },     -- Do
  Jacket = {
  },      -- not
  FullSuit = {},    -- rename
  FullSuitHead = {},-- any
  FullTop = {},     -- functions
  BathRobe = {},    -- or
  TorsoExtra = {

    "Base.Vest_Tknight",
    "Base.Vest_HECU",
  },  -- lists
  Tail = {
    "Base.TKSPad",
  },        -- in
  Back = {
  },        -- this
  Scarf = {
    "Base.KnightWaist",
  },       -- file
  FannyPackFront = {

  },
  Necklace = {},
  Necklace_Long = {},
  Nose = {},
  LeftWrist = {
  },
  RightWrist = {
  },
  Right_RingFinger = {
  },
  Left_RingFinger = {
  },
  Right_MiddleFinger = {
    "Base.SpookySuit",
    "Base.Animask23",
    "Base.Animask2",
    "Base.Animask22",
  },
  Left_MiddleFinger = {
  },
  Ears = {},
  EarTop = {},
  MaskFull = {},
  TorsoRig = {
  },

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
