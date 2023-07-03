Distributions = Distributions or {};

local distributionTable = {

	VFEShotgunCase1 = {
        rolls = 1,
        items = {
            "Shotgun2", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 50,
            "ShotgunShellsBox", 20,
            "ShotgunShellsBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFEShotgunCase2 = {
        rolls = 1,
        items = {
            "ShotgunSemi", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 50,
            "ShotgunShellsBox", 20,
            "ShotgunShellsBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFEShotgunCase3 = {
        rolls = 1,
        items = {
            "ShotgunSemi2", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 50,
            "ShotgunShellsBox", 20,
            "ShotgunShellsBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFERifleCase1 = {
        rolls = 1,
        items = {
            "1022", 200,
            "22ClipRifle", 200,
            "22ClipRifle", 10,
            "22Box", 200,
            "22Box", 50,
            "22Box", 20,
            "22Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFERifleCase2 = {
        rolls = 1,
        items = {
            "Mini14", 200,
            "223Clip20", 200,
            "223Clip20", 10,
            "223Box", 200,
            "223Box", 50,
            "223Box", 20,
            "223Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFERifleCase3 = {
        rolls = 1,
        items = {
            "Mini14Unfolded", 200,
            "223Clip20", 200,
            "223Clip20", 10,
            "223Box", 200,
            "223Box", 50,
            "223Box", 20,
            "223Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFERifleCase4 = {
        rolls = 1,
        items = {
            "LeverRifle", 200,
            "Bullets38Box", 200,
            "Bullets38Box", 50,
            "Bullets38Box", 20,
            "Bullets38Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFERifleCase5 = {
        rolls = 1,
        items = {
            "SKS", 200,
            "762Box", 200,
            "762Box", 50,
            "762Box", 20,
            "762Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFERifleCase6 = {
        rolls = 1,
        items = {
            "AK47", 200,
			"762Clip", 200,
            "762Clip", 10,
            "762Box", 200,
            "762Box", 50,
            "762Box", 20,
            "762Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFERifleCase7 = {
        rolls = 1,
        items = {
            "AK47Unfolded", 200,
			"762Clip", 200,
            "762Clip", 10,
            "762Box", 200,
            "762Box", 50,
            "762Box", 20,
            "762Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFERifleCase8 = {
        rolls = 1,
        items = {
            "FAL", 200,
            "FALClip", 200,
            "FALClip", 10,
            "308Box", 200,
            "308Box", 50,
            "308Box", 20,
            "308Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFERifleCase9 = {
        rolls = 1,
        items = {
            "FALClassic", 200,
            "FALClip", 200,
            "FALClip", 10,
            "308Box", 200,
            "308Box", 50,
            "308Box", 20,
            "308Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFEPistolCase1 = {
        rolls = 1,
        items = {
            "Glock", 200,
            "9mmClip17", 200,
            "9mmClip17", 10,
            "Bullets9mmBox", 200,
            "Bullets9mmBox", 50,
            "Bullets9mmBox", 20,
            "Bullets9mmBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFEPistolCase2 = {
        rolls = 1,
        items = {
            "P229", 200,
            "9mmClip13", 200,
            "9mmClip13", 10,
            "Bullets9mmBox", 200,
            "Bullets9mmBox", 50,
            "Bullets9mmBox", 20,
            "Bullets9mmBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
	VFEPistolCase3 = {
        rolls = 1,
        items = {
            "Tec9", 200,
            "9mmClip20", 200,
            "9mmClip20", 10,
            "Bullets9mmBox", 200,
            "Bullets9mmBox", 50,
            "Bullets9mmBox", 20,
            "Bullets9mmBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
}

table.insert(Distributions, 1, distributionTable);

-- Need to insert into the right table. Highly dependent on mods, including this one.

-- So highly dependant on mods it throws errors for some people. Disabled for now.

-- for key,value in pairs(Distributions) do
    -- if Distributions[key].all then
		-- table.insert(Distributions[key].all.Outfit_ArmyCamoDesert.items, "Base.CleaningKit");
		-- table.insert(Distributions[key].all.Outfit_ArmyCamoDesert.items,  6);
		
		-- table.insert(Distributions[key].all.Outfit_ArmyCamoGreen.items, "Base.CleaningKit");
		-- table.insert(Distributions[key].all.Outfit_ArmyCamoGreen.items,  6);
		
		-- table.insert(Distributions[key].all.Outfit_Police.items, "Base.CleaningKit");
		-- table.insert(Distributions[key].all.Outfit_Police.items,  6);
		
		-- table.insert(Distributions[key].all.Outfit_PoliceState.items, "Base.CleaningKit");
		-- table.insert(Distributions[key].all.Outfit_PoliceState.items,  6);
	-- end
	
-- end

-- ======================= ---
-- ProceduralDistributions ---
-- ======================= ---

-- Army Ammo
table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, "Base.Bullets9mmBox");
table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, 20);
table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, "Base.Bullets9mmBox");
table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, 10);

-- Antique Weapons
table.insert(ProceduralDistributions.list.Antiques.items, "Base.AssaultRifleM1");
table.insert(ProceduralDistributions.list.Antiques.items, 1.0);
table.insert(ProceduralDistributions.list.Antiques.items, "Base.VFERifleCase9");
table.insert(ProceduralDistributions.list.Antiques.items, 1.0);

-- Army Guns
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.CAR15");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 2);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.SniperRifle");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 5);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.CAR15D");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 0.01);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.MAC10Folded");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 0.01);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.MP5SD");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 0.01);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.Glock");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 0.1);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.MP5");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 1.75);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.MP5Unfolded");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 1.75);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 5);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.ShotgunSemi2");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 5);

table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.9mmClip30");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 3);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.45Clip32");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 0.1);

table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.Coupled556");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 0.05);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.Bipod");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 6);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.ShellHolder");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 6);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.IronSight");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 2);
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Base.CleaningKit");
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 10);

-- Army Surplus
table.insert(ProceduralDistributions.list.ArmySurplusTools.items, "Base.CleaningKit");
table.insert(ProceduralDistributions.list.ArmySurplusTools.items, 6);
table.insert(ProceduralDistributions.list.ArmySurplusTools.items, "Base.CleaningKit");
table.insert(ProceduralDistributions.list.ArmySurplusTools.items, 6);
table.insert(ProceduralDistributions.list.ArmySurplusTools.items, "Base.M16Bayonet");
table.insert(ProceduralDistributions.list.ArmySurplusTools.items, 4);

-- Bedroom Dresser Handguns
table.insert(ProceduralDistributions.list.BedroomDresser.items, "Base.VFEPistolCase1");
table.insert(ProceduralDistributions.list.BedroomDresser.items, 0.0004);
table.insert(ProceduralDistributions.list.BedroomDresser.items, "Base.VFEPistolCase2");
table.insert(ProceduralDistributions.list.BedroomDresser.items, 0.0004);
table.insert(ProceduralDistributions.list.BedroomDresser.items, "Base.VFEPistolCase3");
table.insert(ProceduralDistributions.list.BedroomDresser.items, 0.0002);
table.insert(ProceduralDistributions.list.BedroomDresser.items, "Base.Glock");
table.insert(ProceduralDistributions.list.BedroomDresser.items, 0.003);
table.insert(ProceduralDistributions.list.BedroomDresser.items, "Base.P229");
table.insert(ProceduralDistributions.list.BedroomDresser.items, 0.003);
table.insert(ProceduralDistributions.list.BedroomDresser.items, "Base.Tec9");
table.insert(ProceduralDistributions.list.BedroomDresser.items, 0.002);

-- Bedroom Sidetable Handguns
table.insert(ProceduralDistributions.list.BedroomSideTable.items, "Base.VFEPistolCase1");
table.insert(ProceduralDistributions.list.BedroomSideTable.items, 0.0004);
table.insert(ProceduralDistributions.list.BedroomSideTable.items, "Base.VFEPistolCase2");
table.insert(ProceduralDistributions.list.BedroomSideTable.items, 0.0004);
table.insert(ProceduralDistributions.list.BedroomSideTable.items, "Base.VFEPistolCase2");
table.insert(ProceduralDistributions.list.BedroomSideTable.items, 0.0002);
table.insert(ProceduralDistributions.list.BedroomSideTable.items, "Base.Glock");
table.insert(ProceduralDistributions.list.BedroomSideTable.items, 0.003);
table.insert(ProceduralDistributions.list.BedroomSideTable.items, "Base.P229");
table.insert(ProceduralDistributions.list.BedroomSideTable.items, 0.003);
table.insert(ProceduralDistributions.list.BedroomSideTable.items, "Base.Tec9");
table.insert(ProceduralDistributions.list.BedroomSideTable.items, 0.002);

-- Closet Long Guns
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.005);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFERifleCase2");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.0005);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFERifleCase3");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.0005);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.005);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.001);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFERifleCase6");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.000025);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFERifleCase7");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.000025);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFERifleCase8");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.00005);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.0005);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.0005);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.VFEShotgunCase3");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.00005);

table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.1022");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.05);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.001);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.001);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.05);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.SKS");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.002);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.0005);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.001);
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.ClosetShelfGeneric.items, 0.001);

-- Drug Lab Guns
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.9mmClip20");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 8);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.9mmClip30");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 3);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.9mmClip17");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 3);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.9mmClip13");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 3);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.223Clip20");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 2.5);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.762Clip");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 2);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.FALClip");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 2);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.45Clip32");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 1);


table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.762Box");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 10);

table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.Glock");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 2.5);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.Glock18");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 0.05);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.P229");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 1.5);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 2);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 2);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.SKS");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 4);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 1);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.AK47");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 0.1);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.AK47Unfolded");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 0.1);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.FAL");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 0.2);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.MAC10Folded");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 0.05);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.MP5");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 0.4);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.MP5Unfolded");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 0.4);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.MP5SD");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 0.01);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.CAR15");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 1);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.CAR15D");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 0.01);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 4);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 4);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.ShotgunSemi2");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 2);
table.insert(ProceduralDistributions.list.DrugLabGuns.items, "Base.Tec9");
table.insert(ProceduralDistributions.list.DrugLabGuns.items, 8);

-- Drug Shack Weapons
table.insert(ProceduralDistributions.list.DrugShackWeapons.items, "Base.Tec9");
table.insert(ProceduralDistributions.list.DrugShackWeapons.items, 6);

-- Safehouse Firearms
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.9mmClip20");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 8);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.9mmClip30");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 3);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.9mmClip17");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 3);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.9mmClip13");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 3);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.223Clip20");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 2.5);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.762Clip");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 2);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.22ClipRifle");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 4);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.FALClip");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 2);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.45Clip32");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 1);

table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.762Box");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 10);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.22Box");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 10);

table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.Glock");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 2.5);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.P229");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 1.5);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.1022");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 6);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 2);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 2);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 6);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.SKS");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 4);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 1);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.AK47");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.1);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.AK47Unfolded");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.1);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.FAL");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.2);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.MP5");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.25);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.MP5Unfolded");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.25);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.CAR15");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 1);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.SniperRifle");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 1);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.Glock18");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.01);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.MP5SD");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.01);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.CAR15D");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.01);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.MAC10Folded");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.01);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.FALClassic");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.01);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.AssaultRifleM1");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.01);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 1);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 1);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.ShotgunSemi2");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.5);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.Tec9");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 8);
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.SniperRifle");
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 1);

-- Garage guns with attachments and cleaning kits
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.Bipod");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 4);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.ShellHolder");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 5);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.IronSight");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 2);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.CleaningKit");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 5);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.FireKlean");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.01);

table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFEPistolCase1");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.2);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFEPistolCase2");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.2);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFEPistolCase3");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.1);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.6);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFERifleCase2");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.2);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFERifleCase3");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.2);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.6);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.4);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFERifleCase6");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.02);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFERifleCase7");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.01);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFERifleCase8");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.01);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFERifleCase8");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.02);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFERifleCase9");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.002);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.08);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.08);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.VFEShotgunCase3");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.08);

table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.Glock");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 2.0);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.P229");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 2.0);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.Tec9");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 1.0);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.1022");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 6);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 2);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 2);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 6);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.SKS");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 4);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 1);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.AK47");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.1);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.AK47Unfolded");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.1);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.FAL");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.2);
table.insert(ProceduralDistributions.list.GarageFirearms.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.GarageFirearms.items, 0.1);

-- Gunstore Ammo
table.insert(ProceduralDistributions.list.GunStoreAmmunition.items, "Base.762Box");
table.insert(ProceduralDistributions.list.GunStoreAmmunition.items, 25);
table.insert(ProceduralDistributions.list.GunStoreAmmunition.items, "Base.22Box");
table.insert(ProceduralDistributions.list.GunStoreAmmunition.items, 27);

-- Gunstore Counter
table.insert(ProceduralDistributions.list.GunStoreCounter.items, "Base.762Clip");
table.insert(ProceduralDistributions.list.GunStoreCounter.items, 2);
table.insert(ProceduralDistributions.list.GunStoreCounter.items, "Base.223Clip20");
table.insert(ProceduralDistributions.list.GunStoreCounter.items, 3.5);
table.insert(ProceduralDistributions.list.GunStoreCounter.items, "Base.22ClipRifle");
table.insert(ProceduralDistributions.list.GunStoreCounter.items, 6);
table.insert(ProceduralDistributions.list.GunStoreCounter.items, "Base.FALClip");
table.insert(ProceduralDistributions.list.GunStoreCounter.items, 2);
table.insert(ProceduralDistributions.list.GunStoreCounter.items, "Base.CleaningKit");
table.insert(ProceduralDistributions.list.GunStoreCounter.items, 4);
table.insert(ProceduralDistributions.list.GunStoreCounter.items, "Base.FireKlean");
table.insert(ProceduralDistributions.list.GunStoreCounter.items, 0.01);

-- Gunstore Displaycase
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.9mmClip20");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 5.2);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.9mmClip13");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 5.2);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.9mmClip17");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 5.2);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.22ClipRifle");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 6);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.762Clip");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 3);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.FALClip");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 3);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.223Clip20");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 4);

table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.762Box");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 10);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.22Box");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 10);

table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.FireKlean");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 0.1);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.CleaningKit");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 5);

table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.Bipod");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 4);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.ShellHolder");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 5);

table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.FAL");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 0.2);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.AK47");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 0.1);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.AK47Unfolded");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 0.1);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.MAC10Folded");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 0.02);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.SKS");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 4);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 1);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 7);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.1022");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 7);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.Tec9");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 4);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.P229");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 4);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.Glock");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 4);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 2);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 2);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.Spas12");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 0.2);
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.GunStoreDisplayCase.items, 3);

-- Gunstore Shelf
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.9mmClip20");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 5.2);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.9mmClip13");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 5.2);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.9mmClip17");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 5.2);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.22ClipRifle");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 6);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.762Clip");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 1);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.45Clip32");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 0.1);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.M14Clip");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 2);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.FALClip");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 1);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.223Clip20");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 3);

table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.FireKlean");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 0.01);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.CleaningKit");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 10);

table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.762Box");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 10);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.762Box");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 20);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.22Box");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 10);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.22Box");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 20);

table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.Bipod");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 6);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.ShellHolder");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 6);
table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.IronSight");
table.insert(ProceduralDistributions.list.GunStoreShelf.items, 3);

-- Hunter Light Weapons
table.insert(ProceduralDistributions.list.Hunter.items, "Base.1022");
table.insert(ProceduralDistributions.list.Hunter.items, 0.05);
table.insert(ProceduralDistributions.list.Hunter.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.Hunter.items, 0.01);
table.insert(ProceduralDistributions.list.Hunter.items, "Base.SKS");
table.insert(ProceduralDistributions.list.Hunter.items, 0.005);
table.insert(ProceduralDistributions.list.Hunter.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.Hunter.items, 0.005);
table.insert(ProceduralDistributions.list.Hunter.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.Hunter.items, 0.005);
table.insert(ProceduralDistributions.list.Hunter.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.Hunter.items, 0.002);
table.insert(ProceduralDistributions.list.Hunter.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.Hunter.items, 0.002);
table.insert(ProceduralDistributions.list.Hunter.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.Hunter.items, 0.002);
table.insert(ProceduralDistributions.list.Hunter.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.Hunter.items, 0.001);
table.insert(ProceduralDistributions.list.Hunter.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.Hunter.items, 0.001);

-- Hunter Locker Light Weapons
table.insert(ProceduralDistributions.list.HuntingLockers.items, "Base.1022");
table.insert(ProceduralDistributions.list.HuntingLockers.items, 0.05);
table.insert(ProceduralDistributions.list.HuntingLockers.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.HuntingLockers.items, 0.01);
table.insert(ProceduralDistributions.list.HuntingLockers.items, "Base.SKS");
table.insert(ProceduralDistributions.list.HuntingLockers.items, 0.005);
table.insert(ProceduralDistributions.list.HuntingLockers.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.HuntingLockers.items, 0.005);
table.insert(ProceduralDistributions.list.HuntingLockers.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.HuntingLockers.items, 0.005);
table.insert(ProceduralDistributions.list.HuntingLockers.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.HuntingLockers.items, 0.002);
table.insert(ProceduralDistributions.list.HuntingLockers.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.HuntingLockers.items, 0.002);
table.insert(ProceduralDistributions.list.HuntingLockers.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.HuntingLockers.items, 0.002);
table.insert(ProceduralDistributions.list.HuntingLockers.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.HuntingLockers.items, 0.001);
table.insert(ProceduralDistributions.list.HuntingLockers.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.HuntingLockers.items, 0.001);

-- Army lockers --
table.insert(ProceduralDistributions.list.LockerArmyBedroom.items, "Base.M16Bayonet");
table.insert(ProceduralDistributions.list.LockerArmyBedroom.items, 2);

table.insert(ProceduralDistributions.list.MeleeWeapons.items, "Base.M16Bayonet");
table.insert(ProceduralDistributions.list.MeleeWeapons.items, 4);

-- Office Desk Home
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, "Base.VFEPistolCase1");
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, 0.0004);
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, "Base.VFEPistolCase2");
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, 0.0004);
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, "Base.VFEPistolCase3");
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, 0.0002);
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, "Base.Glock");
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, 0.002);
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, "Base.P229");
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, 0.002);
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, "Base.Tec9");
table.insert(ProceduralDistributions.list.OfficeDeskHome.items, 0.001);

-- Pawnshop Guns
table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.22Box");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 10);

table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.9mmClip20");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 4.2);
table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.9mmClip13");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 3.2);
table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.9mmClip17");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 3.2);
table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.22ClipRifle");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 6);

table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.Glock");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 2.5);
table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.Glock18");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 0.001);
table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.P229");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 1.5);
table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 3);
table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.Tec9");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 4);
table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 6);
table.insert(ProceduralDistributions.list.PawnShopGuns.items, "Base.1022");
table.insert(ProceduralDistributions.list.PawnShopGuns.items, 6);

-- Pawnshop Special Guns
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, "Base.762Clip");
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, 1);
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, "Base.FALClip");
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, 1);
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, "Base.45Clip32");
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, 1);

table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, "Base.FAL");
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, 0.2);
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, "Base.MAC10Folded");
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, 0.2);
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, "Base.FALClassic");
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, 0.02);
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, "Base.AK47");
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, 0.1);
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, "Base.AK47Unfolded");
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, 0.1);
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, "Base.Spas12");
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, 0.2);
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.PawnShopGunsSpecial.items, 0.2);

table.insert(ProceduralDistributions.list.PawnShopKnives.items, "Base.M16Bayonet");
table.insert(ProceduralDistributions.list.PawnShopKnives.items, 4);

-- Plank Stash Sneaky 100% Legal Guns
table.insert(ProceduralDistributions.list.PlankStashGun.items, "Base.762Clip");
table.insert(ProceduralDistributions.list.PlankStashGun.items, 3);
table.insert(ProceduralDistributions.list.PlankStashGun.items, "Base.9mmClip20");
table.insert(ProceduralDistributions.list.PlankStashGun.items, 5);
table.insert(ProceduralDistributions.list.PlankStashGun.items, "Base.45Clip32");
table.insert(ProceduralDistributions.list.PlankStashGun.items, 1);

table.insert(ProceduralDistributions.list.PlankStashGun.items, "Base.AK47Folded");
table.insert(ProceduralDistributions.list.PlankStashGun.items, 4);
table.insert(ProceduralDistributions.list.PlankStashGun.items, "Base.Tec9");
table.insert(ProceduralDistributions.list.PlankStashGun.items, 5);
table.insert(ProceduralDistributions.list.PlankStashGun.items, "Base.MAC10Folded");
table.insert(ProceduralDistributions.list.PlankStashGun.items, 2);

-- Police Ammunition
table.insert(ProceduralDistributions.list.PoliceStorageAmmunition.items, "Base.556Box");
table.insert(ProceduralDistributions.list.PoliceStorageAmmunition.items, 10);
table.insert(ProceduralDistributions.list.PoliceStorageAmmunition.items, "Base.556Box");
table.insert(ProceduralDistributions.list.PoliceStorageAmmunition.items, 5);
table.insert(ProceduralDistributions.list.PoliceStorageAmmunition.items, "Base.223Box");
table.insert(ProceduralDistributions.list.PoliceStorageAmmunition.items, 10);
table.insert(ProceduralDistributions.list.PoliceStorageAmmunition.items, "Base.223Box");
table.insert(ProceduralDistributions.list.PoliceStorageAmmunition.items, 5);

-- Police Guns
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.FireKlean");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 0.01);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.CleaningKit");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 8);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.Bipod");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 4);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.ShellHolder");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 6);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.IronSight");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 2);

table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.223Clip20");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 4.2);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.9mmClip30");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 3.5);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.9mmClip17");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 5.5);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.556Clip");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 2);

table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 0.8);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 0.8);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.Glock");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 4.2);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.Glock18");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 0.1);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.Spas12");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 0.1);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.MP5");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 1);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.MP5Unfolded");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 1);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.MP5SD");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 0.1);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.CAR15");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 0.3);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 2.5);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 2.5);
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, "Base.ShotgunSemi2");
table.insert(ProceduralDistributions.list.PoliceStorageGuns.items, 1.5);

-- Security Lockers 9mm Handguns
table.insert(ProceduralDistributions.list.SecurityLockers.items, "Base.9mmClip17");
table.insert(ProceduralDistributions.list.SecurityLockers.items, 1);
table.insert(ProceduralDistributions.list.SecurityLockers.items, "Base.9mmClip13");
table.insert(ProceduralDistributions.list.SecurityLockers.items, 1);
table.insert(ProceduralDistributions.list.SecurityLockers.items, "Base.Glock");
table.insert(ProceduralDistributions.list.SecurityLockers.items, 3);
table.insert(ProceduralDistributions.list.SecurityLockers.items, "Base.P229");
table.insert(ProceduralDistributions.list.SecurityLockers.items, 3);

-- Survial Gear Light Weaponry
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.1022");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.05);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.01);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.SKS");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.005);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.001);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.005);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.005);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.002);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.002);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.002);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.001);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 0.001);
table.insert(ProceduralDistributions.list.SurvivalGear.items, "Base.M16Bayonet");
table.insert(ProceduralDistributions.list.SurvivalGear.items, 2);


-- Trapper Light Weaponry
table.insert(ProceduralDistributions.list.Trapper.items, "Base.1022");
table.insert(ProceduralDistributions.list.Trapper.items, 0.05);
table.insert(ProceduralDistributions.list.Trapper.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.Trapper.items, 0.01);
table.insert(ProceduralDistributions.list.Trapper.items, "Base.SKS");
table.insert(ProceduralDistributions.list.Trapper.items, 0.005);
table.insert(ProceduralDistributions.list.Trapper.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.Trapper.items, 0.005);
table.insert(ProceduralDistributions.list.Trapper.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.Trapper.items, 0.005);
table.insert(ProceduralDistributions.list.Trapper.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.Trapper.items, 0.002);
table.insert(ProceduralDistributions.list.Trapper.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.Trapper.items, 0.002);
table.insert(ProceduralDistributions.list.Trapper.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.Trapper.items, 0.002);
table.insert(ProceduralDistributions.list.Trapper.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.Trapper.items, 0.001);
table.insert(ProceduralDistributions.list.Trapper.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.Trapper.items, 0.001);
table.insert(ProceduralDistributions.list.Trapper.items, "Base.M16Bayonet");
table.insert(ProceduralDistributions.list.Trapper.items, 2);

-- Wardrobe Man Long Guns
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.005);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.VFERifleCase2");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.VFERifleCase3");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.005);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.0005);

table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.1022");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.05);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.05);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.SKS");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.002);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.001);

-- Wardrobe Man Classy Long Guns
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.005);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.VFERifleCase2");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.VFERifleCase3");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.005);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.0005);

table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.1022");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.05);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.05);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.SKS");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.002);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.001);

-- Wardrobe Redneck Long Guns
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.005);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.VFERifleCase2");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.VFERifleCase3");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.005);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.0005);

table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.1022");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.05);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.05);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.SKS");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.002);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.001);

-- Wardrobe Woman Long Guns
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.005);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.VFERifleCase2");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.VFERifleCase3");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.005);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.0005);

table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.1022");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.05);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.05);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.SKS");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.002);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.001);

-- Wardrobe Woman Classy Long Guns
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.VFERifleCase1");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.005);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.VFERifleCase2");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.VFERifleCase3");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.VFERifleCase4");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.005);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.VFERifleCase5");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.VFEShotgunCase1");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.VFEShotgunCase2");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.0005);

table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.1022");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.05);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.Mini14");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.Mini14Unfolded");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.LeverRifle");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.05);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.SKS");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.002);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.SKSSpiker");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.0005);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.Shotgun2");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.001);
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.ShotgunSemi");
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.001);


table.insert(ProceduralDistributions.list.MotelLinens.items, "Base.ShotgunSilent");
table.insert(ProceduralDistributions.list.MotelLinens.items, 0.1);

-- ==================== ---
-- VehicleDistributions ---
-- ==================== ---

-- Survivalist vehicle glovebox handgun
table.insert(VehicleDistributions.SurvivalistGlovebox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.SurvivalistGlovebox.junk.items, 2.5);
table.insert(VehicleDistributions.SurvivalistGlovebox.junk.items, "Base.P229");
table.insert(VehicleDistributions.SurvivalistGlovebox.junk.items, 1.5);
table.insert(VehicleDistributions.SurvivalistGlovebox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.SurvivalistGlovebox.junk.items, 1.5);

-- Fisherman vehicle glovebox handgun
table.insert(VehicleDistributions.FishermanGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.FishermanGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.FishermanGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.FishermanGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.FishermanGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.FishermanGloveBox.junk.items, 0.1);

-- Golf vehicle glovebox handgun
table.insert(VehicleDistributions.GolfGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.GolfGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.GolfGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.GolfGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.GolfGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.GolfGloveBox.junk.items, 0.1);

-- Carpenter vehicle glovebox handgun
table.insert(VehicleDistributions.CarpenterGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.CarpenterGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.CarpenterGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.CarpenterGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.CarpenterGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.CarpenterGloveBox.junk.items, 0.1);

-- Electrician vehicle glovebox handgun
table.insert(VehicleDistributions.ElectricianGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.ElectricianGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.ElectricianGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.ElectricianGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.ElectricianGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.ElectricianGloveBox.junk.items, 0.1);

-- Farmer vehicle glovebox handgun
table.insert(VehicleDistributions.FarmerGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.FarmerGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.FarmerGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.FarmerGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.FarmerGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.FarmerGloveBox.junk.items, 0.1);

-- Metal Welder vehicle glovebox handgun
table.insert(VehicleDistributions.MetalWelderGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.MetalWelderGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.MetalWelderGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.MetalWelderGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.MetalWelderGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.MetalWelderGloveBox.junk.items, 0.1);

-- Radio vehicle glovebox handgun
table.insert(VehicleDistributions.RadioGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.RadioGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.RadioGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.RadioGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.RadioGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.RadioGloveBox.junk.items, 0.1);

-- Painter vehicle glovebox handgun
table.insert(VehicleDistributions.PainterGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.PainterGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.PainterGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.PainterGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.PainterGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.PainterGloveBox.junk.items, 0.1);

-- Construction Worker vehicle glovebox handgun
table.insert(VehicleDistributions.ConstructionWorkerGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.ConstructionWorkerGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.ConstructionWorkerGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.ConstructionWorkerGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.ConstructionWorkerGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.ConstructionWorkerGloveBox.junk.items, 0.1);

-- Police vehicle weapons
table.insert(VehicleDistributions.PoliceGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.PoliceGloveBox.junk.items, 8);
table.insert(VehicleDistributions.PoliceGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.PoliceGloveBox.junk.items, 3);

table.insert(VehicleDistributions.PoliceTruckBed.items, "Base.Glock");
table.insert(VehicleDistributions.PoliceTruckBed.items, 4);
table.insert(VehicleDistributions.PoliceTruckBed.items, "Base.P229");
table.insert(VehicleDistributions.PoliceTruckBed.items, 1.5);
table.insert(VehicleDistributions.PoliceTruckBed.items, "Base.Shotgun2");
table.insert(VehicleDistributions.PoliceTruckBed.items, 4);
table.insert(VehicleDistributions.PoliceTruckBed.items, "Base.ShotgunSemi");
table.insert(VehicleDistributions.PoliceTruckBed.items, 4);
table.insert(VehicleDistributions.PoliceTruckBed.items, "Base.MP5");
table.insert(VehicleDistributions.PoliceTruckBed.items, 0.5);
table.insert(VehicleDistributions.PoliceTruckBed.items, "Base.MP5Unfolded");
table.insert(VehicleDistributions.PoliceTruckBed.items, 0.5);
table.insert(VehicleDistributions.PoliceTruckBed.items, "Base.9mmClip30");
table.insert(VehicleDistributions.PoliceTruckBed.items, 2);
table.insert(VehicleDistributions.PoliceTruckBed.items, "Base.ShellHolder");
table.insert(VehicleDistributions.PoliceTruckBed.items, 4);

-- Ranger vehicle weapons
table.insert(VehicleDistributions.RangerGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.RangerGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.RangerGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.RangerGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.RangerGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.RangerGloveBox.junk.items, 0.1);

table.insert(VehicleDistributions.RangerTruckBed.junk.items, "Base.VFEShotgunCase1");
table.insert(VehicleDistributions.RangerTruckBed.junk.items, 2);
table.insert(VehicleDistributions.RangerTruckBed.junk.items, "Base.VFEShotgunCase2");
table.insert(VehicleDistributions.RangerTruckBed.junk.items, 2);
table.insert(VehicleDistributions.RangerTruckBed.junk.items, "Base.VFEShotgunCase3");
table.insert(VehicleDistributions.RangerTruckBed.junk.items, 0.5);

-- Fire vehicle glovebox handgun
table.insert(VehicleDistributions.FireGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.FireGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.FireGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.FireGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.FireGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.FireGloveBox.junk.items, 0.1);

-- McCoy vehicle glovebox handgun
table.insert(VehicleDistributions.McCoyGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.McCoyGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.McCoyGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.McCoyGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.McCoyGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.McCoyGloveBox.junk.items, 0.1);

-- Hunter vehicle weapons
table.insert(VehicleDistributions.HunterGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.HunterGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.HunterGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.HunterGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.HunterGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.HunterGloveBox.junk.items, 0.1);

table.insert(VehicleDistributions.RangerTruckBed.junk.items, "Base.VFERifleCase1");
table.insert(VehicleDistributions.RangerTruckBed.junk.items, 50);
table.insert(VehicleDistributions.RangerTruckBed.junk.items, "Base.VFERifleCase4");
table.insert(VehicleDistributions.RangerTruckBed.junk.items, 40);
table.insert(VehicleDistributions.RangerTruckBed.junk.items, "Base.VFERifleCase5");
table.insert(VehicleDistributions.RangerTruckBed.junk.items, 20);
table.insert(VehicleDistributions.RangerTruckBed.junk.items, "Base.VFERifleCase2");
table.insert(VehicleDistributions.RangerTruckBed.junk.items, 5);
table.insert(VehicleDistributions.RangerTruckBed.junk.items, "Base.VFERifleCase3");
table.insert(VehicleDistributions.RangerTruckBed.junk.items, 5);
table.insert(VehicleDistributions.RangerTruckBed.junk.items, "Base.VFEShotgunCase1");
table.insert(VehicleDistributions.RangerTruckBed.junk.items, 5);
table.insert(VehicleDistributions.RangerTruckBed.junk.items, "Base.VFEShotgunCase2");
table.insert(VehicleDistributions.RangerTruckBed.junk.items, 5);

-- Fossoil vehicle glovebox handgun
table.insert(VehicleDistributions.FossoilGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.FossoilGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.FossoilGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.FossoilGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.FossoilGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.FossoilGloveBox.junk.items, 0.1);

-- Postal vehicle glovebox handgun
table.insert(VehicleDistributions.PostalGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.PostalGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.PostalGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.PostalGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.PostalGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.PostalGloveBox.junk.items, 0.1);

-- Spiffo vehicle glovebox handgun
table.insert(VehicleDistributions.SpiffoGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.SpiffoGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.SpiffoGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.SpiffoGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.SpiffoGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.SpiffoGloveBox.junk.items, 0.1);

-- Mass Gen Fac vehicle glovebox handgun
table.insert(VehicleDistributions.MassGenFacGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.MassGenFacGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.MassGenFacGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.MassGenFacGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.MassGenFacGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.MassGenFacGloveBox.junk.items, 0.1);

-- Transit vehicle glovebox handgun
table.insert(VehicleDistributions.TransitGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.TransitGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.TransitGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.TransitGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.TransitGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.TransitGloveBox.junk.items, 0.1);

-- Distillery vehicle glovebox handgun
table.insert(VehicleDistributions.DistilleryGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.DistilleryGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.DistilleryGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.DistilleryGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.DistilleryGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.DistilleryGloveBox.junk.items, 0.1);

-- Heralds vehicle glovebox handgun
table.insert(VehicleDistributions.HeraldsGloveBox.junk.items, "Base.Glock");
table.insert(VehicleDistributions.HeraldsGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.HeraldsGloveBox.junk.items, "Base.P229");
table.insert(VehicleDistributions.HeraldsGloveBox.junk.items, 0.1);
table.insert(VehicleDistributions.HeraldsGloveBox.junk.items, "Base.Tec9");
table.insert(VehicleDistributions.HeraldsGloveBox.junk.items, 0.1);