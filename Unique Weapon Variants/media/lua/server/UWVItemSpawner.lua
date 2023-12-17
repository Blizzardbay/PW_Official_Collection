-- Thanks to AltF4_ToExit, Shurutsue, and Turbo. AND MASSIVE THANKS TO AZAKAELA!
--You may use this to spawn an item ANYWHERE in game, based on coordnitates you can get in World Ed -- Ask Azakaela if you have any questions!
--This is very useful for placing down story related items, such as notes, or items you want the player to have like... a sledgehammer for instance.


UWVStoryItems = UWVStoryItems or {};

local function customItemSpawnInit()
  local itemData = ModData.get("UWVCustomItemSpawns");
  if itemData == nil then
    itemData = {
	  --Onehanded
	  {x = 12076, y = 6925, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.LeadPipe_Pipey"}, --Westpoint construction area
	  {x = 7253, y = 8372, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Nightstick_Justice"},  --Police Station In middle of map
	  {x = 13877, y = 5765, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.MeatCleaver_Artisan"}, --Westpoint Mall 			
	  {x = 4854, y = 6286, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.HandAxe_Ranger"}, -- Ranger Station  
	  {x = 7962, y = 10038, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.HandScythe_LilGrim"}, --Barn in middle of map somewhere
	  {x = 13765, y = 6702, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Machete_Slasher"},  --Campgrounds  	  
	  {x = 12829, y = 6431, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.PipeWrench_Tuner"}, --Racestrip	
	  {x = 13517, y = 2842, z = 3, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Violin_Stradivarius"}, --Mansion Attic  
	  {x = 12532, y = 1419, z = 2, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Plunger_Gold"}, --art gallery	
	  {x = 13062, y = 1468, z = 1, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.BallPeenHammer_WoodCrafter"}, --TV studio in Louisville
	  {x = 6714, y = 5236, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.WoodenMallet_Smasher"}, --Riverside construction area	
	
	--2 Handed
	  {x = 5766, y = 6436, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Golfclub_PrizedClub"},  --Country Club  	  
	  {x = 5549, y = 12459, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Crowbar_Resonance"}, --Military base	
	  {x = 12481, y = 1381, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Katana_RisingSun"},  --Louisville Pawn shop   	  
	  {x = 4600, y = 8196, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.AxeStone_StoneAge"}, --On island in middle of lake	
	  {x = 11334, y = 6788, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Broom_TomSword"},  	--WP School Utility Closet 
	  {x = 11617, y = 9963, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.PickAxe_MinersFury"},  --Train cart in Muldraugh train station 
	  {x = 13289, y = 1216, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.BaseballBat_Aluminium"}, --Louisville Baseball Factory			
	  {x = 8151, y = 11733, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.FireAxe_Prototype"}, --Rosewood Fire Station
	  {x = 10320, y = 9650, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.WoodAxe_TheBigMcCoy"}, 	--Mccoys		
	  {x = 13710, y = 1962, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.GuitarElectricRed_FamousMuscician"}, --Music Stage  			  

	--Knives
	  {x = 12469, y = 4247, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.HuntingKnife_McGrewKnife"},  --Perimeter Zone Cabin  	  
	  {x = 7688, y = 11895, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.IcePick_PrisonShiv"}, --Prison		
	  {x = 11952, y = 6888, z = 1, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.LetterOpener_Diplomacy"}, --Westpoint Mayor Office  	  
	  {x = 12415, y = 3695, z = 3, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Scalpel_Slicer"}, --St Peregrins Hospital	
	  {x = 10785, y = 10169, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Stake_Salvation"},  --Muldraugh Church  		  
	  {x = 12448, y = 8973, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Knife_Cultist"}, --abandoned cabins  	  
	  {x = 10107, y = 12716, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.Pen_Space"}, --March Ridge Post office
	  
	--Spear
	  {x = 8554, y = 8517, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.GardenFork_BigFork"}, -- Pony o Roam	  	  	  
	  {x = 13583, y = 2907, z = 0, spawned = false, sX = 0.5, sY = 0.5, sZ = 0, item = "UWV.WoodenLance_FallenSpear"}, --Fancy area statue
  
	  
	  
	  
    };
    ModData.add("UWVCustomItemSpawns", itemData);
  end
  UWVStoryItems.toSpawn = {};
  for i, v in pairs(itemData) do
    if not v.spawned then
      table.insert(UWVStoryItems.toSpawn, v);
    end
  end
  Events.LoadGridsquare.Add(checkItemSpawns);
end

function checkItemSpawns(sq)
  local x, y, z = sq:getX(), sq:getY(), sq:getZ();
  if #UWVStoryItems.toSpawn > 0 then
    for i = #UWVStoryItems.toSpawn, 1, - 1 do
      local itemSpawn = UWVStoryItems.toSpawn[i];
      if x == itemSpawn.x and y == itemSpawn.y and z == itemSpawn.z then
        sq:AddWorldInventoryItem(itemSpawn.item, itemSpawn.sX, itemSpawn.sY, itemSpawn.sZ);
        itemSpawn.spawned = true;
        table.remove(UWVStoryItems.toSpawn, i);
      end
    end
  else
    Events.LoadGridsquare.Remove(checkItemSpawns);
  end
end

Events.OnGameStart.Add(customItemSpawnInit);
