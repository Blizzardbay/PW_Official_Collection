ArmoredBase = {};
ArmoredBase.canDoSomething = false
ArmoredBase.windowbars = 0;
ArmoredBase.armoreddoor = 0;
ArmoredBase.screws = 0;
ArmoredBase.doorknob = 0;
local Drill = nil
ArmoredBase.doBuildMenu = function(player, context, worldobjects, test)
	print("BASE ARMOR")
    if test and ISWorldObjectContextMenu.Test then return true end
    if getCore():getGameMode()=="LastStand" then
        return;
    end
    if test then return ISWorldObjectContextMenu.setTest() end
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if playerObj:getVehicle() then return; end
    local itemMap = buildUtil.getMaterialOnGround(playerObj:getCurrentSquare())
    ArmoredBase.groundItems = itemMap
    ArmoredBase.groundItemCounts = buildUtil.getMaterialOnGroundCounts(itemMap)
    ArmoredBase.groundItemUses = buildUtil.getMaterialOnGroundUses(itemMap)
    -- show menu if we have an Armored Door and (later) Screw Gun with power
 if playerInv:containsTypeRecurse("WindowBars")  then
	print("Has Window Bars!")	
end	
 if playerInv:containsTypeRecurse("ArmoredDoor")  then
	print("Has Door!")	
end 	
 if playerInv:containsTypeRecurse("Doorknob")  then
	print("Has Door Knob!")	
end 
	if playerInv:containsTypeRecurse("CordlessDrill") then
		Drill = getFirstDrillWithUses(playerInv, 1) or getDrillWithMostUses(playerInv)	
	end
   if ((playerInv:containsTypeRecurse("ArmoredDoor") and playerInv:containsTypeRecurse("Doorknob") and Drill and Drill:getUsedDelta()>=Drill:getUseDelta()) or ISBuildMenu.cheat) then
		print("Qualifies?")
		ArmoredBase.armoreddoor = ISBuildMenu.countMaterial(player, "Base.ArmoredDoor")	
		ArmoredBase.screws = ISBuildMenu.countMaterial(player, "Base.Screws")		
		ArmoredBase.doorknob = ISBuildMenu.countMaterial(player, "Base.Doorknob")
	   --if (playerInv:containsTypeRecurse("ArmoredDoor") and playerInv:containsTypeRecurse("ScrewGun")) or ISBuildMenu.cheat then
		-- local buildMWOption = context:addOption(getText("Armored Door 1"), worldobjects, nil);
		-- local subMenuMW = ISContextMenu:getNew(context);
		-- context:addSubMenu(buildMWOption, subMenuMW);
		-- local keepMenu = true;
		 -- if not keepMenu then
			 -- context:removeLastOption()
		 -- end			
		local sprite = ArmoredBase.getArmoredDoorSprites(player);
		local doorsOption = context:addOption(getText("Place Armored Door"), worldobjects, ArmoredBase.onArmoredDoor, square, sprite, player, Drill);
		local tooltip = ArmoredBase.canBuild(0,1,4,0,0,0,1,0,3,doorsOption, player);
		tooltip:setName(getText("Armored Door"));
		tooltip.description = getText("ArmoredDoorDesc") .. tooltip.description;
		tooltip:setTexture(sprite.sprite);
		--ISBuildMenu.requireHammer(false)			
		if doorsOption.notAvailable then
			option.notAvailable = true;
		end			
	end
		
		
   -- if ((playerInv:containsTypeRecurse("WindowBars")) or ISBuildMenu.cheat) then
		-- print("Qualifies?")
		-- ArmoredBase.windowbars = ISBuildMenu.countMaterial(player, "Base.WindowBars")	
		-- ArmoredBase.screws = ISBuildMenu.countMaterial(player, "Base.Screws")		
		-- --ArmoredBase.doorknob = ISBuildMenu.countMaterial(player, "Base.Doorknob")
	   -- --if (playerInv:containsTypeRecurse("ArmoredDoor") and playerInv:containsTypeRecurse("ScrewGun")) or ISBuildMenu.cheat then
		-- -- local buildMWOption = context:addOption(getText("Armored Door 1"), worldobjects, nil);
		-- -- local subMenuMW = ISContextMenu:getNew(context);
		-- -- context:addSubMenu(buildMWOption, subMenuMW);
		-- -- local keepMenu = true;
		 -- -- if not keepMenu then
			 -- -- context:removeLastOption()
		 -- -- end			
		-- local sprite = ArmoredBase.getWindowBarsSprites(player);
		-- local doorsOption = context:addOption(getText("Place Window Bars"), worldobjects, ArmoredBase.onWindowBars, square, sprite, player);
		-- local tooltip = ArmoredBase.canBuild(1,0,4,0,0,0,0,0,3,doorsOption, player);
		-- tooltip:setName(getText("Window Bars"));
		-- tooltip.description = getText("WindowBarsDesc") .. tooltip.description;
		-- tooltip:setTexture(sprite.sprite);
		-- --ISBuildMenu.requireHammer(false)			
		-- if doorsOption.notAvailable then
			-- option.notAvailable = true;
		-- end			
	-- end
end

ArmoredBase.getArmoredDoorSprites = function(player)
	local spriteLvl = ISBuildMenu.getSpriteLvl(player);
	local sprite = {};
		sprite.sprite = "ArmoredDoors_0";
		sprite.northSprite = "ArmoredDoors_1";
		sprite.openSprite = "ArmoredDoors_2";
		sprite.openNorthSprite = "ArmoredDoors_3";
	return sprite;
end

ArmoredBase.getWindowBarsSprites = function(player)
	local spriteLvl = ISBuildMenu.getSpriteLvl(player);
	local sprite = {};
		sprite.sprite = "WindowBars_0";
		sprite.northSprite = "WindowBars_1";
	return sprite;
end

ArmoredBase.onArmoredDoor = function(worldobjects, square, sprite, player, Drill)
	--print("Stage 2")
	-- sprite, northsprite, openSprite, openNorthSprite
	print("Drill! " .. tostring(Drill:getUsedDelta()))
	--if Drill:getUsedDelta() >= 0.2 then
		local door = ArmoredDoor:new(sprite.sprite, sprite.northSprite, sprite.openSprite, sprite.openNorthSprite, Drill);
		--door:setActionAnim("BlowTorch")
		door.firstItem = "CordlessDrill";
		door.firstPredicate = predicateDrainableUsesInt
		door.firstArg = tonumber("1")
		door.noNeedHammer = true;
		door.modData["need:Base.ArmoredDoor"] = "1";
		door.modData["need:Base.Doorknob"] = "1";
		door.modData["need:Base.Screws"] = "4";
		door.modData["use:Base.CordlessDrill"] = "1";
		door.player = player
		getCell():setDrag(door, player);
	--end
end

ArmoredBase.onWindowBars = function(worldobjects, square, sprite, player)
	--print("Stage 2")
	-- sprite, northsprite, openSprite, openNorthSprite
	--local door = ArmoredWindow:new(sprite.sprite, sprite.northSprite, sprite.openSprite, sprite.openNorthSprite);
	local door = ArmoredWindow:new(sprite.sprite, sprite.northSprite);
	door.modData["need:Base.WindowBars"] = "1";
	--door.modData["need:Base.Doorknob"] = "1";
	door.player = player
	getCell():setDrag(door, player);
end

ArmoredBase.canBuild = function(windowbarsNb, armoreddoorNb, screwsNb, plankNb, nailsNb, hingeNb, doorknobNb, baredWireNb, carpentrySkill, option, player)
	-- create a new tooltip
	local tooltip = ISBuildMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	tooltip.description = "<LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. ": <LINE>";
	-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
	if ArmoredBase.windowbars < windowbarsNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.WindowBars") .. " " .. ArmoredBase.windowbars .. "/" .. windowbarsNb .. " <LINE>";
		result = false;
	elseif windowbarsNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.WindowBars") .. " " .. armoreddoorNb .. " <LINE>";
	end
	if ArmoredBase.armoreddoor < armoreddoorNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.ArmoredDoor") .. " " .. ArmoredBase.windowbars .. "/" .. windowbarsNb .. " <LINE>";
		result = false;
	elseif armoreddoorNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.ArmoredDoor") .. " " .. armoreddoorNb .. " <LINE>";
	end
	if ArmoredBase.screws < screwsNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Screws") .. " " .. ArmoredBase.screws .. "/" .. screwsNb .. " <LINE>";
		result = false;
	elseif screwsNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Screws") .. " " .. screwsNb .. " <LINE>";
	end
	if ISBuildMenu.planks < plankNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Plank") .. " " .. ISBuildMenu.planks .. "/" .. plankNb .. " <LINE>";
		result = false;
	elseif plankNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Plank") .. " " .. plankNb .. " <LINE>";
	end
	if ISBuildMenu.nails < nailsNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Nails") .. " " .. ISBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
		result = false;
	elseif nailsNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Nails") .. " " .. nailsNb .. " <LINE>";
	end
	if ArmoredBase.doorknob < doorknobNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Doorknob") .. " " .. ISBuildMenu.doorknob .. "/" .. doorknobNb .. " <LINE>";
		result = false;
	elseif doorknobNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Doorknob") .. " " .. doorknobNb .. " <LINE>";
	end
	if ISBuildMenu.hinge < hingeNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Hinge") .. " " .. ISBuildMenu.hinge .. "/" .. hingeNb .. " <LINE>";
		result = false;
	elseif hingeNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Hinge") .. " " .. hingeNb .. " <LINE>";
	end
	if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
		result = false;
	elseif carpentrySkill > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. carpentrySkill .. " <LINE>";
	end
	if ISBuildMenu.cheat then
		return tooltip;
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	tooltip.description = " " .. tooltip.description .. " "
	return tooltip;
end

-- Events.OnFillWorldObjectContextMenu.Add(ArmoredBase.doBuildMenuHook);
--ArmoredBase.metalForAnvil = 500;
local function comparatorDrainableUsesInt(item1, item2)
    return item1:getDrainableUsesInt() - item2:getDrainableUsesInt()
end

local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end


function getDrillWithMostUses(container)
    return container:getBestTypeEvalRecurse("Base.CordlessDrill", comparatorDrainableUsesInt)
end

function getFirstDrillWithUses(container, uses)
    return container:getFirstTypeEvalArgRecurse("Base.CordlessDrill", predicateDrainableUsesInt, uses)
end