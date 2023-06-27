require 'Blacksmith/ISUI/ISBlacksmithMenu'
local validDrums, spriteToModded, _, capacity = unpack(require 'ValidDrums')

local MIN_SKILL_LEVEL = 8
local TORCH_FUEL_REQUIRED = 5

local BARREL_SMALL_SHEET_REQUIRED = 2
local BARREL_LARGE_SHEET_REQUIRED = 4
local BARREL_SCRAP_REQUIRED = 2
local BARREL_TORCH_REQUIRED = 15
local BARREL_SKILL_LEVEL = 5

Events.OnFillWorldObjectContextMenu.Remove(ISBlacksmithMenu.doBuildMenu)

local oldDoBuild = ISBlacksmithMenu.doBuildMenu

local function getFirstValidDrumSprite(playerObj)
	for _,drum in ipairs(validDrums) do
		if ISBlacksmithMenu.getMaterialCount(playerObj, drum) > 0 then
			drum = spriteToModded[drum:sub(11)]
			if drum then
				return drum.convert
			end
		end
	end
	return "crafted_01_28"
end

local function getDrumCount(playerObj)
	local drumCount = 0
	for _,v in ipairs(validDrums) do
		drumCount = drumCount + ISBlacksmithMenu.getMaterialCount(playerObj, v)
	end
	return drumCount
end

local function onMetalDrum(worldobjects, player)
	local playerObj = getSpecificPlayer(player)
	local sprite = getFirstValidDrumSprite(playerObj)
	local barrel = ISMetalDrum:new(player, sprite)
	barrel.firstItem = "BlowTorch"
	barrel.secondItem = "WeldingMask"
	barrel.craftingBank = "BlowTorch"
	barrel.noNeedHammer = true
	barrel.actionAnim = "BlowTorchMid"
	barrel.maxTime = ISBuildMenu.cheat and 1 or 300
	barrel.modData["xp:MetalWelding"] = 25
	barrel.modData["need:" .. table.concat(validDrums, "/")] = 1
	barrel.modData["use:Base.BlowTorch"] = TORCH_FUEL_REQUIRED
	barrel.modData["use:Base.WeldingRods"] = 2 -- derived from game logic, not my pick.
	barrel.player = player
	barrel.completedSound = "BuildMetalStructureMedium"
	getCell():setDrag(barrel, player)
end

local function onMetalBarrel(worldobjects, player, sprite, extras)
	local item = CMDRBContainer:new(sprite, sprite)
	item:setCapacityOnCreate(capacity)
	item.name = "Barrel"
	item.noNeedHammer = true
	item.firstItem = "BlowTorch"
	item.secondItem = "WeldingMask"
	item.craftingBank = "BlowTorch"
	item.noNeedHammer = true
	item.actionAnim = "BlowTorchMid"
	item.maxTime = ISBuildMenu.cheat and 1 or 700
	item.modData["xp:MetalWelding"] = 25
	item.modData["need:SmallSheetMetal"] = BARREL_SMALL_SHEET_REQUIRED
	item.modData["need:SheetMetal"] = BARREL_LARGE_SHEET_REQUIRED
	item.modData["need:ScrapMetal"] = BARREL_SCRAP_REQUIRED
	item.modData["use:Base.BlowTorch"] = BARREL_TORCH_REQUIRED
	item.modData["use:Base.WeldingRods"] = 7
	for _,v in ipairs(extras) do
		item.modData[(v.amount and "use:" or "need:") .. v.name] = v.amount or 1
	end
	item.player = player
	item.completedSound = "BuildMetalStructureMedium"
	getCell():setDrag(item, player)
end

local function hasExtra(playerInv, items, toolTip)
	local ret = true
	for _,item in ipairs(items) do
		local uses = playerInv:getUsesTypeRecurse(item.name)
		toolTip.description = toolTip.description .. " <LINE> <RGB:1," ..
			(uses >= (item.amount or 1) and "1,1> " or "0,0> ") .. getItemNameFromFullType(item.name) ..
			" " .. uses.. "/" .. (item.amount or 1)
		ret = ret and uses >= (item.amount or 1)
	end
	return ret
end

local translationCache = {}
local function localise(t)
	if not translationCache[t] then
		local str = ""
		for _,v in ipairs(t) do
			str = str .. getText(v) .. " "
		end
		translationCache[t] = str:sub(1, #str - 1)
	end
	return translationCache[t]
end

function ISBlacksmithMenu.doBuildMenu(player, context, worldobjects, test, ...)
	local oldaddSubMenu = ISContextMenu.addSubMenu
	local menu = nil
	ISContextMenu.addSubMenu = function(self, option, submenu, ...)
		menu = menu ~= nil and menu or option == context:getOptionFromName(getText("ContextMenu_MetalWelding")) and submenu
		return oldaddSubMenu(self, option, submenu, ...)
	end
	local ret = {oldDoBuild(player, context, worldobjects, test, ...)}
	ISContextMenu.addSubMenu = oldaddSubMenu
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	if menu and ((playerInv:containsTypeRecurse("BlowTorch") and playerInv:containsTypeRecurse("WeldingMask")) or ISBuildMenu.cheat) then
		local barrelsOption = menu:addOption(getText("Barrel"), worldobjects, nil)
		local subMenuBarrels = menu:getNew(menu)
		context:addSubMenu(barrelsOption, subMenuBarrels)
		for k,v in pairs(spriteToModded) do
			local text = localise(v.text)
			local item = subMenuBarrels:addOption(text, worldobjects, onMetalBarrel, player, k, v.create)
			local toolTip = ISBlacksmithMenu.addToolTip(item, text, k)
			local hasMetal = ISBlacksmithMenu.checkMetalWeldingFurnitures(0, BARREL_SMALL_SHEET_REQUIRED, BARREL_LARGE_SHEET_REQUIRED, 0, BARREL_SCRAP_REQUIRED, BARREL_TORCH_REQUIRED, BARREL_SKILL_LEVEL, playerObj, toolTip, 0, 0)
			item.notAvailable = (not hasExtra(playerInv, v.create, toolTip) or not hasMetal) and not ISBuildMenu.cheat
		end
		local firstValid = getFirstValidDrumSprite(playerObj)
		local drumOption = menu:addOption(getText("ContextMenu_Metal_Drum"), worldobjects, onMetalDrum, player, firstValid)
		local toolTip = ISBlacksmithMenu.addToolTip(drumOption, getText("ContextMenu_Metal_Drum"), firstValid)
		local canCraft = ISBlacksmithMenu.checkMetalWeldingFurnitures(0, 0, 0, 0, 0, TORCH_FUEL_REQUIRED, MIN_SKILL_LEVEL, playerObj, toolTip, 0, 0)
		local drumCount = getDrumCount(playerObj)
		toolTip.description = toolTip.description .. " <LINE><RGB:1," .. (drumCount > 0 and "1,1>" or "0,0>") .. getItemNameFromFullType("Base.MetalDrum") ..
			" " .. drumCount .. "/1"
		drumOption.notAvailable = (drumCount == 0 or not canCraft) and not ISBuildMenu.cheat
	end
	return unpack(ret)
end

Events.OnFillWorldObjectContextMenu.Add(ISBlacksmithMenu.doBuildMenu)
