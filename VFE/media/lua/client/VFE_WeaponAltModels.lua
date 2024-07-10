-- This makes the possibility of open chamber and removed magazine guns super easy but we'll burn that bridge when we get there.

-- The table that holds all the methods
VFEWeaponModelTable = {}

-- Main function. Test for support, if not we reset weapon to original model
function VFESetWeaponModel(weapon, open)
	for index, modelfunction in ipairs(VFEWeaponModelTable) do
		if modelfunction.Name == weapon:getFullType() then
			modelfunction.Apply(weapon, open)
			return
		end	
	end
	weapon:setWeaponSprite(weapon:getOriginalWeaponSprite())
end

-- Mini tables contain the name of the weapon it is for and a method to actually change the weapon
local HuntingRifle = {}
HuntingRifle.Name = "Base.HuntingRifle"
HuntingRifle.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	local canon = weapon:getCanon()
	if canon ~= nil then
		if canon:getType() == "Bipod" then
			originalSprite = originalSprite .. "BP"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, HuntingRifle);

local VarmintRifle = {}
VarmintRifle.Name = "Base.VarmintRifle"
VarmintRifle.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	local canon = weapon:getCanon()
	if canon ~= nil then
		if canon:getType() == "Bipod" then
			originalSprite = originalSprite .. "BP"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, VarmintRifle);

local SniperRifle = {}
SniperRifle.Name = "Base.SniperRifle"
SniperRifle.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local canon = weapon:getCanon()
	if canon ~= nil then
		if canon:getType() == "Bipod" then
			originalSprite = originalSprite .. "BP"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, SniperRifle);

local Spas12 = {}
Spas12.Name = "Base.Spas12"
Spas12.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local pad = weapon:getRecoilpad()
	if pad ~= nil then
		if pad:getType() == "ShellHolder" then
			originalSprite = originalSprite .. "SH"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, Spas12);

local Spas12Folded = {}
Spas12Folded.Name = "Base.Spas12Folded"
Spas12Folded.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local pad = weapon:getRecoilpad()
	if pad ~= nil then
		if pad:getType() == "ShellHolder" then
			originalSprite = originalSprite .. "SH"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, Spas12Folded);

local AK47 = {}
AK47.Name = "Base.AK47"
AK47.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, AK47);

local Mini14 = {}
Mini14.Name = "Base.Mini14"
Mini14.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, Mini14);

local SKS = {}
SKS.Name = "Base.SKS"
SKS.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	local canon = weapon:getCanon()
	if canon ~= nil then
		if canon:getType() == "Bipod" then
			originalSprite = originalSprite .. "BP"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, SKS);

local R1022 = {}
R1022.Name = "Base.1022"
R1022.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, R1022);

local AssaultRifle2 = {}
AssaultRifle2.Name = "Base.AssaultRifle2"
AssaultRifle2.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	local canon = weapon:getCanon()
	if canon ~= nil then
		if canon:getType() == "Bipod" then
			originalSprite = originalSprite .. "BP"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, AssaultRifle2);

local M60MMG = {}
M60MMG.Name = "Base.M60MMG"
M60MMG.Apply = function(weapon, open)
	local player = getSpecificPlayer(0)
	local originalSprite = weapon:getOriginalWeaponSprite()
	if not weapon:isContainsClip() then
		originalSprite = originalSprite .. "_Empty"
	end

	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, M60MMG);

local M60MMG_Bipod = {}
M60MMG_Bipod.Name = "Base.M60MMG_Bipod"
M60MMG_Bipod.Apply = function(weapon, open)
	local player = getSpecificPlayer(0)
	local originalSprite = weapon:getOriginalWeaponSprite()
	if not weapon:isContainsClip() then
		originalSprite = originalSprite .. "_Empty"
	end

	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, M60MMG_Bipod);

local Shotgun = {}
Shotgun.Name = "Base.Shotgun"
Shotgun.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	local pad = weapon:getRecoilpad()
	if pad ~= nil then
		if pad:getType() == "ShellHolder" then
			originalSprite = originalSprite .. "SH"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, Shotgun);

local ShotgunSawnoff = {}
ShotgunSawnoff.Name = "Base.ShotgunSawnoff"
ShotgunSawnoff.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	local pad = weapon:getRecoilpad()
	if pad ~= nil then
		if pad:getType() == "ShellHolder" then
			originalSprite = originalSprite .. "SH"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, ShotgunSawnoff);

local ShotgunSawnoffNoStock = {}
ShotgunSawnoffNoStock.Name = "Base.ShotgunSawnoffNoStock"
ShotgunSawnoffNoStock.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local pad = weapon:getRecoilpad()
	if pad ~= nil then
		if pad:getType() == "ShellHolder" then
			originalSprite = originalSprite .. "SH"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, ShotgunSawnoffNoStock);

local Shotgun2 = {}
Shotgun2.Name = "Base.Shotgun2"
Shotgun2.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	local pad = weapon:getRecoilpad()
	if pad ~= nil then
		if pad:getType() == "ShellHolder" then
			originalSprite = originalSprite .. "SH"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, Shotgun2);

local Shotgun2Bayonet = {}
Shotgun2Bayonet.Name = "Base.Shotgun2Bayonet"
Shotgun2Bayonet.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	local pad = weapon:getRecoilpad()
	if pad ~= nil then
		if pad:getType() == "ShellHolder" then
			originalSprite = originalSprite .. "SH"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, Shotgun2Bayonet);

local ShotgunSemi = {}
ShotgunSemi.Name = "Base.ShotgunSemi"
ShotgunSemi.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	local pad = weapon:getRecoilpad()
	if pad ~= nil then
		if pad:getType() == "ShellHolder" then
			originalSprite = originalSprite .. "SH"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, ShotgunSemi);

local ShotgunSemi2 = {}
ShotgunSemi2.Name = "Base.ShotgunSemi2"
ShotgunSemi2.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	local pad = weapon:getRecoilpad()
	if pad ~= nil then
		if pad:getType() == "ShellHolder" then
			originalSprite = originalSprite .. "SH"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, ShotgunSemi2);

local ShotgunSilent = {}
ShotgunSilent.Name = "Base.ShotgunSilent"
ShotgunSilent.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local pad = weapon:getRecoilpad()
	if pad ~= nil then
		if pad:getType() == "ShellHolder" then
			originalSprite = originalSprite .. "SH"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, ShotgunSilent);

local DoubleBarrelShotgun = {}
DoubleBarrelShotgun.Name = "Base.DoubleBarrelShotgun"
DoubleBarrelShotgun.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	if open then
		originalSprite = originalSprite .. "_OPEN"
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, DoubleBarrelShotgun);

local DoubleBarrelShotgunSawnoff = {}
DoubleBarrelShotgunSawnoff.Name = "Base.DoubleBarrelShotgunSawnoff"
DoubleBarrelShotgunSawnoff.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	if open then
		originalSprite = originalSprite .. "_OPEN"
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, DoubleBarrelShotgunSawnoff);

local DoubleBarrelShotgunSawnoffNoStock = {}
DoubleBarrelShotgunSawnoffNoStock.Name = "Base.DoubleBarrelShotgunSawnoffNoStock"
DoubleBarrelShotgunSawnoffNoStock.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	if open then
		originalSprite = originalSprite .. "_OPEN"
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, DoubleBarrelShotgunSawnoffNoStock);

local M2400_Shotgun = {}
M2400_Shotgun.Name = "Base.M2400_Shotgun"
M2400_Shotgun.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			if open then
				originalSprite = "M2400FGS_OPEN"
			else
				originalSprite = originalSprite .. "FGS"
			end
		end
	elseif open then
		originalSprite = "M2400_OPEN"
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, M2400_Shotgun);

local M2400_Rifle = {}
M2400_Rifle.Name = "Base.M2400_Rifle"
M2400_Rifle.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			if open then
				originalSprite = "M2400FGS_OPEN"
			else
				originalSprite = originalSprite .. "FGS"
			end
		end
	elseif open then
		originalSprite = "M2400_OPEN"
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, M2400_Rifle);


local LeverRifle = {}
LeverRifle.Name = "Base.LeverRifle"
LeverRifle.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, LeverRifle);

local LeverRifle2 = {}
LeverRifle2.Name = "Base.LeverRifle2"
LeverRifle2.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, LeverRifle2);

local CampCarbine = {}
CampCarbine.Name = "Base.CampCarbine"
CampCarbine.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "FGS"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
table.insert(VFEWeaponModelTable, CampCarbine);