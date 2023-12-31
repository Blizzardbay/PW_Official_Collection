require 'Items/SuburbsDistributions'

-- This overwrites the table. Not a good solution but VFE should load before any VFE addons anyways.
WeaponUpgrades = {
	-- Shotguns
    Shotgun = {"ShellHolder", "Sling", "ChokeTubeFull", "ChokeTubeImproved"},
	ShotgunSemi = {"ShellHolder", "Sling", "ChokeTubeFull", "ChokeTubeImproved"},
	Shotgun2 = {"ShellHolder", "Sling", "ChokeTubeFull", "ChokeTubeImproved", "FiberglassStock", "IronSight"},
	ShotgunSemi2 = {"ShellHolder", "Sling", "ChokeTubeFull", "ChokeTubeImproved", "FiberglassStock", "IronSight"},
	DoubleBarrelShotgun = {"Sling", "IronSight"},
	Spas12 = {"ShellHolder", "Sling", "ChokeTubeFull", "ChokeTubeImproved", "IronSight"},
	-- Rifles
	VarmintRifle = {"x2Scope", "x4Scope", "x8Scope", "AmmoStraps", "Sling", "RecoilPad", "IronSight"},
    HuntingRifle = {"x2Scope", "x4Scope", "x8Scope", "AmmoStraps", "Sling", "FiberglassStock", "RecoilPad", "IronSight"},
	SniperRifle = {"x2Scope", "x4Scope", "x8Scope", "AmmoStraps", "Sling", "IronSight", "Bipod"},
	SKS = {"x4Scope", "AmmoStraps", "Sling", "FiberglassStock", "RecoilPad", "IronSight"},
	AK47 = {"x4Scope", "Sling", "FiberglassStock", "IronSight"},
	AK47Unfolded = {"x4Scope", "Sling", "IronSight"},
	FAL = {"x2Scope", "x4Scope", "RedDot", "Laser", "Sling", "IronSight"},
	FALClassic = {"Sling", "IronSight"},
	AssaultRifleM1 = {"Sling", "AmmoStraps", "IronSight"},
	AssaultRifle2 = {"x2Scope", "x4Scope", "RedDot", "FiberglassStock", "Sling"},
	Mini14 = {"x2Scope", "x4Scope", "RedDot", "Sling"},
	Mini14Unfolded = {"x2Scope", "x4Scope", "RedDot", "Sling"},
	AssaultRifle = {"x2Scope", "RedDot", "Sling", "Laser", "IronSight"},
	CAR15 = {"x2Scope", "RedDot", "Sling", "Laser", "IronSight"},
	CAR15D = {"x2Scope", "RedDot", "Sling", "Laser", "IronSight"},
	-- Pistols
	Pistol = {"Laser", "IronSight"},
	Glock = {"Laser", "IronSight"},
	Glock18 = {"Laser", "IronSight"},
	-- PCC
	LeverRifle = {"x4Scope", "IronSight", "AmmoStraps", "Sling"},
	MP5 = {"RedDot", "IronSight", "Laser", "Sling"},
	MP5Unfolded = {"RedDot", "IronSight", "Laser", "Sling"},
	MP5SD = {"RedDot", "IronSight", "Laser", "Sling"},
}