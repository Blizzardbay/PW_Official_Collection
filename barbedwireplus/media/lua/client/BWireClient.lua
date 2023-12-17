require "BuildingObjects/ISUI/ISBuildMenu.lua"

-- No server
if not isClient() and BWirePlus:isMultiplayer() then return end

--[[
	-- Body parts   
	Hand_L
	Hand_R
	ForeArm_L
	ForeArm_R
	UpperArm_L
	UpperArm_R
	Torso_Upper
	Torso_Lower
	Head
	Neck
	Groin
	UpperLeg_L
	UpperLeg_R
	LowerLeg_L
	LowerLeg_R
	Foot_L
	Foot_R
	Back
	MAX
]]
-- Base
function BWirePlus:playerTicks()
	BWirePlus:sleepDo(SandboxVars.BarbedWirePlus.PlayerTickTime or 0.33, BWirePlus.playerTicks);

	local player = getPlayer();

	if player and player:isPlayerMoving() then 
		local square = player:getSquare();
		if square then
			local objects = square:getObjects();
			local doHandicap;

			for i=0,objects:size() - 1 do 
				if not doHandicap then 
					local object = objects:get(i);
					local sprite = object:getSprite();
					if sprite then
						local name = sprite:getName();
						if name then
							doHandicap = name == "barbwire_0" or name == "barbwire_1"
						end
					end 
				end
			end

			if doHandicap then
				if ZombRand(100) < (SandboxVars.BarbedWirePlus.LacerateChance or 10) then
					local bodyParts = {"LowerLeg_R", "UpperLeg_R", "Groin", "LowerLeg_L", "UpperLeg_L"}
					local randomPart = BWirePlus:selectRandom(bodyParts);
					player:getBodyDamage():getBodyPart(BodyPartType[randomPart]):setCut(true);
				elseif ZombRand(100) < (SandboxVars.BarbedWirePlus.ScratchChance or 20) then
					local bodyParts = {"UpperLeg_R", "UpperLeg_L"}
					local randomPart = BWirePlus:selectRandom(bodyParts);
					player:getBodyDamage():getBodyPart(BodyPartType[randomPart]):setScratched(true, true);
				elseif ZombRand(100) < (SandboxVars.BarbedWirePlus.RipClothChance or 40) then
					local bodyParts = {"LowerLeg_R", "UpperLeg_R", "Groin", "LowerLeg_L", "UpperLeg_L"}
					local randomPart = BWirePlus:selectRandom(bodyParts);
					player:addHole(BloodBodyPartType[randomPart]);
					getSoundManager():PlayWorldSound("ClothesRipping", getPlayer():getSquare(), 0, 1, 1, true);		
				end		
			end
		end
	end
end

function BWirePlus:zombieTicks(zombie)
	BWirePlus:sleepDo(SandboxVars.BarbedWirePlus.ZombieTickTime or 0.25, BWirePlus.zombieTicks);
	
	local allZombos = getCell():getZombieList();
	for i=0,allZombos:size() - 1 do
		local zombie = allZombos:get(i);

		if zombie then
			local doHandicap;

			-- Find wire
			if zombie:getMoveSpeed() > 0 then
				local square = zombie:getSquare();
				if square then 
					local objects = square:getObjects();

					for i=0,objects:size() - 1 do 
						if not doHandicap then 
							local object = objects:get(i);
							local sprite = object:getSprite();
							if sprite then
								local name = sprite:getName();
								if name then
									doHandicap = name == "barbwire_0" or name == "barbwire_1"
								end
							end 
							if doHandicap then
								if BWirePlus:isMultiplayer() then
									sendClientCommand(getPlayer(), "BWirePlus", "validateZombie", { ['target'] = zombie:getOnlineID() });
								else 
									BWirePlus:handicapZombie(zombie); 
								end
							end
						end
					end
				end 	
			end
		end
	end
end

function BWirePlus:handicapZombie(zombie)
	if not zombie then return end;

	local bodyParts = {"Hand_L", "Hand_R", "ForeArm_L", "ForeArm_R", "UpperArm_L", "UpperArm_R", "Torso_Upper", "Torso_Lower", "Head", "Neck", "Groin", "UpperLeg_L", "UpperLeg_R", "LowerLeg_L", "LowerLeg_R", "Foot_L", "Foot_R", "Back"}
	local randomPart = BWirePlus:selectRandom(bodyParts);	
	if ZombRand(100) <= (SandboxVars.BarbedWirePlus.ZombieKnockChance or 50) then
		zombie:knockDown(true);
	end		
	if ZombRand(100) <= (SandboxVars.BarbedWirePlus.ZombieCrawlChance or 5) then
		zombie:knockDown(true);
		zombie:setBecomeCrawler(true);
	end	
	if  ZombRand(100) <= (SandboxVars.BarbedWirePlus.ZombieRipChance or 40) then
		getSoundManager():PlayWorldSound("ClothesRipping", zombie:getSquare(), 0, 1, 1, true);
		zombie:addRandomVisualDamages();
		zombie:addHole(BloodBodyPartType[randomPart]);
	end
end 

-- Override block for "BuildingObjects/ISUI/ISBuildMenu.lua"

ISBuildMenu.buildFenceMenu = function(subMenu, option, player)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	local stakeOption = subMenu:addOption(getText("ContextMenu_Wooden_Stake"), worldobjects, ISBuildMenu.onWoodenFenceStake, square, player);
	local toolTip = ISBuildMenu.canBuild(1,2,0,0,0,5,stakeOption, player);
	toolTip:setName(getText("ContextMenu_Wooden_Stake"));
	toolTip.description = getText("Tooltip_craft_woodenStakeDesc") .. toolTip.description;
	toolTip:setTexture("fencing_01_19");
	ISBuildMenu.requireHammer(stakeOption)

	local name = getItemNameFromFullType("Base.BarbedWire")
	local barbedOption = subMenu:addOption(name, worldobjects, ISBuildMenu.onBarbedFence, square, player);
	local tooltip2 = ISBuildMenu.canBuild(0,0,0,0,1,SandboxVars.BarbedWirePlus.CarpentryLevel or 6, barbedOption, player);
	-- we add that we need a Barbed wire too
	local barbedWire = ISBuildMenu.countMaterial(player, "Base.BarbedWire");
	if not playerInv:containsTypeRecurse("BarbedWire") then
		tooltip2.description = tooltip2.description .. ISBuildMenu.bhs .. getItemNameFromFullType("Base.BarbedWire") .. " " .. barbedWire .. "/1 ";
		if not ISBuildMenu.cheat then
			barbedOption.onSelect = nil;
			barbedOption.notAvailable = true;
		end
	else
		tooltip2.description = tooltip2.description .. ISBuildMenu.ghs .. getItemNameFromFullType("Base.BarbedWire") .. " " .. barbedWire .. "/1 ";
	end
	tooltip2:setName(name);
	tooltip2.description = getText("Tooltip_craft_barbedFenceDesc") .. tooltip2.description;
	tooltip2:setTexture("barbwire_0");
	ISBuildMenu.requireHammer(barbedOption)

	local woodenFenceSprite = ISBuildMenu.getWoodenFenceSprites(player);
	local fenceOption = subMenu:addOption(getText("ContextMenu_Wooden_Fence"), worldobjects, ISBuildMenu.onWoodenFence, square, woodenFenceSprite, player);
	local tooltip3 = ISBuildMenu.canBuild(2,3,0,0,0,2,fenceOption, player);
	tooltip3:setName(getText("ContextMenu_Wooden_Fence"));
	tooltip3.description = getText("Tooltip_craft_woodenFenceDesc") .. tooltip3.description;
	tooltip3:setTexture(woodenFenceSprite.sprite);
	ISBuildMenu.requireHammer(fenceOption)

	local sandBagOption = subMenu:addOption(getText("ContextMenu_Sang_Bag_Wall"), worldobjects, ISBuildMenu.onSangBagWall, square, player);
	local tooltip4 = ISBuildMenu.canBuild(0,0,0,0,0,0,sandBagOption, player);
	-- we add that we need 3 sand bag too
	local sandbag = ISBuildMenu.countMaterial(player, "Base.Sandbag");
	if sandbag < 3 then
		tooltip4.description = tooltip4.description .. ISBuildMenu.bhs .. getItemNameFromFullType("Base.Sandbag") .. " " .. sandbag .. "/3 ";
		if not ISBuildMenu.cheat then
			sandBagOption.onSelect = nil;
			sandBagOption.notAvailable = true;
		end
	else
		tooltip4.description = tooltip4.description .. ISBuildMenu.ghs .. getItemNameFromFullType("Base.Sandbag") .. " " .. sandbag .. "/3 ";
	end
	tooltip4:setName(getText("ContextMenu_Sang_Bag_Wall"));
	tooltip4.description = getText("Tooltip_craft_sandBagDesc") .. tooltip4.description;
	tooltip4:setTexture("carpentry_02_12");

	local gravelBagOption = subMenu:addOption(getText("ContextMenu_Gravel_Bag_Wall"), worldobjects, ISBuildMenu.onGravelBagWall, square, player);
	local tooltip5 = ISBuildMenu.canBuild(0,0,0,0,0,0,gravelBagOption, player);
	-- we add that we need 3 gravel bag too
	local gravelbag = ISBuildMenu.countMaterial(player, "Base.Gravelbag");
	if gravelbag < 3 then
		tooltip5.description = tooltip5.description .. ISBuildMenu.bhs .. getItemNameFromFullType("Base.Gravelbag") .. " " .. gravelbag .. "/3 ";
		if not ISBuildMenu.cheat then
			gravelBagOption.onSelect = nil;
			gravelBagOption.notAvailable = true;
		end
	else
		tooltip5.description = tooltip5.description .. ISBuildMenu.ghs .. getItemNameFromFullType("Base.Gravelbag") .. " " .. gravelbag .. "/3 ";
	end
	tooltip5:setName(getText("ContextMenu_Gravel_Bag_Wall"));
	tooltip5.description = getText("Tooltip_craft_gravelBagDesc") .. tooltip5.description;
	tooltip5:setTexture("carpentry_02_12");

	if stakeOption.notAvailable and barbedOption.notAvailable and fenceOption.notAvailable and sandBagOption.notAvailable and gravelBagOption.notAvailable then
		option.notAvailable = true;
	end
end

ISBuildMenu.onBarbedFence = function(worldobjects, square, player)
-- sprite, northSprite, corner
	local fence = BWireObject:new("barbwire_0", "barbwire_1");
	-- we can place our fence every where
--	fence.canBeAlwaysPlaced = true;
	fence.isThumpable = true;
	fence.hoppable = false;
    fence.canBarricade = false;
    fence.modData["xp:Woodwork"] = SandboxVars.BarbedWirePlus.CarpentryLevel or 6;
	fence.modData["need:Base.BarbedWire"] = "1";
	fence.player = player
	fence.name = "Barbed Wire"
	fence.completionSound = "BuildMetalStructureSmallWiredFence";
    getCell():setDrag(fence, player);
end


-- Runtime 
local function Init()
	BWirePlus:sleepDo(SandboxVars.BarbedWirePlus.PlayerTickTime or 0.33, BWirePlus.playerTicks);
	BWirePlus:sleepDo(SandboxVars.BarbedWirePlus.ZombieTickTime or 0.25, BWirePlus.zombieTicks);
end

Events.OnInitGlobalModData.Add(Init);

local function remoteExecClient(module, command, args)
	if module ~= "BWirePlus" then return end;

	if command == "handicapZombie" then 
		if args then
			if args.target then
				local zombie = BWirePlus:getZombieByID(args.target);
				BWirePlus:handicapZombie(zombie);
			end 
		end 
	end
end
Events.OnServerCommand.Add(remoteExecClient);