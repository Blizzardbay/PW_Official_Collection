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