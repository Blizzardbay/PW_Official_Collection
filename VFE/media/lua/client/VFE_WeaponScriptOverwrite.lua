require "TimedActions/ISReloadWeaponAction"
require "TimedActions/ISRackFirearm"

-- Event hook manager has references to the original method
Events.OnWeaponSwingHitPoint.Remove(ISReloadWeaponAction.onShoot);

-- Rack

-- Complete overwritting, no need to keep the old function locally
-- Rack to get a bullet (from the chamber) or unjam the gun
function ISRackFirearm:rackBullet()
	if self.gun:haveChamber() then
		-- rack give one bullet & put another one back in the chamber
		-- If jammed give back the bullet if the gun is cleared
		if self.gun:isRoundChambered() then
			if not self.gun:isJammed() or self.gun:getCurrentAmmoCount() == 0 then
				self:removeBullet()
			end
		end
		self.gun:setRoundChambered(false)
		self.gun:setJammed(false)
		if self.gun:getCurrentAmmoCount() >= self.gun:getAmmoPerShoot() then
			self.gun:setRoundChambered(true)
			self.gun:setCurrentAmmoCount(self.gun:getCurrentAmmoCount() - self.gun:getAmmoPerShoot())
		end
		if self.gun:isRoundChambered() then
			calculateWeaponJam(self.gun)
		end
	else
		-- rack non chamber gun give a bullet back
		-- don't give back bullet if jammed
		if not self.gun:isJammed() and self.gun:getCurrentAmmoCount() > 0 then
			self:removeBullet()
			self.gun:setCurrentAmmoCount(self.gun:getCurrentAmmoCount() - self.gun:getAmmoPerShoot())
		end
		self.gun:setJammed(false)
	end
end

local ISRackFirearm_animEvent_old = ISRackFirearm.animEvent
function ISRackFirearm:animEvent(event, parameter)
	if event == 'unloadFinished' then
		VFESetWeaponModel(self.gun,false)
		return ISRackFirearm_animEvent_old(self, event, parameter)
	end
	if event == 'rackingFinished' then
		VFESetWeaponModel(self.gun,false)
		return ISRackFirearm_animEvent_old(self, event, parameter)
	end
    if event == 'changeWeaponSprite' then
        if parameter and parameter ~= '' then
			if parameter == 'open' then
				VFESetWeaponModel(self.gun,true)
				self:setOverrideHandModels(self.gun, nil)
            elseif parameter ~= 'original' then
                self.gun:setWeaponSprite(parameter)
				self:setOverrideHandModels(self.gun, nil)
            else
                VFESetWeaponModel(self.gun,false)
				self:setOverrideHandModels(self.gun, nil)
            end
        end
    else
        return ISRackFirearm_animEvent_old(self, event, parameter)
    end
end

local ISRackFirearm_stop_old = ISRackFirearm.stop
function ISRackFirearm:stop()
	VFESetWeaponModel(self.gun,false)
	self:setOverrideHandModels(self.gun, nil)
    return ISRackFirearm_stop_old(self)
end

local ISReloadWeaponAction_animEvent_old = ISReloadWeaponAction.animEvent
function ISReloadWeaponAction:animEvent(event, parameter)
	if event == 'loadFinished' then
		VFESetWeaponModel(self.gun,false)
		return ISReloadWeaponAction_animEvent_old(self, event, parameter)
	end
    if event == 'changeWeaponSprite' then
        if parameter and parameter ~= '' then
            if parameter == 'open' then
				VFESetWeaponModel(self.gun,true)
				self:setOverrideHandModels(self.gun, nil)
            elseif parameter ~= 'original' then
                self.gun:setWeaponSprite(parameter)
				self:setOverrideHandModels(self.gun, nil)
            else
                VFESetWeaponModel(self.gun,false)
				self:setOverrideHandModels(self.gun, nil)
            end
        end
    else
        return ISReloadWeaponAction_animEvent_old(self, event, parameter)
    end
end

local ISReloadWeaponAction_stop_old = ISReloadWeaponAction.stop
function ISReloadWeaponAction:stop()
	VFESetWeaponModel(self.gun,false)
	self:setOverrideHandModels(self.gun, nil)
    return ISReloadWeaponAction_stop_old(self)
end

-- Complete overwritting, no need to keep the old function locally
function ISReloadWeaponAction.setReloadSpeed(character, rack)
	local baseReloadSpeed = 1;
	if rack then
		-- reloading skill has less impact on racking, panic does nothing
		baseReloadSpeed = baseReloadSpeed + (character:getPerkLevel(Perks.Reloading) * 0.03);
	else
		baseReloadSpeed = baseReloadSpeed + (character:getPerkLevel(Perks.Reloading) * 0.07);
		baseReloadSpeed = baseReloadSpeed - (character:getMoodles():getMoodleLevel(MoodleType.Panic) * 0.05);
	end
	
	-- check for ammo straps
	local gun = character:getPrimaryHandItem();
	local strap = character:getWornItem("AmmoStrap");
	local reloadFast = character:hasEquippedTag("ReloadFastShells") or character:hasEquippedTag("ReloadFastBullets")
	local attachmentBoost = 0
	local strapFound = false;
	if instanceof(gun, "HandWeapon") then
		if gun then
			local shell = false;
			if gun:getAmmoType() == "Base.ShotgunShells" then
				shell = true;
			end
			if reloadFast or (strap and strap:getClothingItem()) then
				if shell and (character:hasEquippedTag("ReloadFastShells") or strap:getClothingItemName() == "AmmoStrap_Shells") then
					strapFound = true;
				elseif not shell and (character:hasEquippedTag("ReloadFastBullets") or strap:getClothingItemName() == "AmmoStrap_Bullets") then
					strapFound = true;
				end
			end
			if not rack then
				local weaponPart = gun:getRecoilpad()
				if weaponPart ~= nil then
					if (shell and weaponPart:hasTag("ShellReloadBoost")) or (not shell and weaponPart:hasTag("BulletReloadBoost")) then
						attachmentBoost = attachmentBoost + 0.15
					end
				end
				weaponPart = gun:getSling()
				if weaponPart ~= nil then
					if (shell and weaponPart:hasTag("ShellReloadBoost")) or (not shell and weaponPart:hasTag("BulletReloadBoost")) then
						attachmentBoost = attachmentBoost + 0.30
					end
				end
			end
		end
		baseReloadSpeed = baseReloadSpeed + attachmentBoost;
		if strapFound and not rack then
			baseReloadSpeed = baseReloadSpeed * 1.15;
		end
	end
	-- vehicles driver take bit longer to reload their weapon
	if character:getVehicle() and character:getVehicle():getDriver() == character then
		baseReloadSpeed = baseReloadSpeed * 0.8;
	end
	character:setVariable("ReloadSpeed", baseReloadSpeed * GameTime.getAnimSpeedFix());
end

local ISUnloadBulletsFromFirearm_animEvent_old = ISUnloadBulletsFromFirearm.animEvent
function ISUnloadBulletsFromFirearm:animEvent(event, parameter)
	if event == 'unloadFinished' then
		VFESetWeaponModel(self.gun,false)
		return ISUnloadBulletsFromFirearm_animEvent_old(self, event, parameter)
	end
    if event == 'changeWeaponSprite' then
        if parameter and parameter ~= '' then
            if parameter == 'open' then
				VFESetWeaponModel(self.gun,true)
				self:setOverrideHandModels(self.gun, nil)
            elseif parameter ~= 'original' then
                self.gun:setWeaponSprite(parameter)
				self:setOverrideHandModels(self.gun, nil)
            else
                VFESetWeaponModel(self.gun,false)
				self:setOverrideHandModels(self.gun, nil)
            end
        end
    else
        return ISUnloadBulletsFromFirearm_animEvent_old(self, event, parameter)
    end
end

local ISUnloadBulletsFromFirearm_stop_old = ISUnloadBulletsFromFirearm.stop
function ISUnloadBulletsFromFirearm:stop()
	VFESetWeaponModel(self.gun,false)
	self:setOverrideHandModels(self.gun, nil)
    return ISUnloadBulletsFromFirearm_stop_old(self)
end

local ISInsertMagazine_animEvent_old = ISInsertMagazine.animEvent
function ISInsertMagazine:animEvent(event, parameter)
	if event == 'loadFinished' then
		-- flicker the magazine state. It's stupid but it works
		self.gun:setContainsClip(true)
		VFESetWeaponModel(self.gun,false)
		self.gun:setContainsClip(false)
		return ISInsertMagazine_animEvent_old(self, event, parameter)
	end
    if event == 'changeWeaponSprite' then
        if parameter and parameter ~= '' then
            if parameter == 'open' then
				VFESetWeaponModel(self.gun,true)
				self:setOverrideHandModels(self.gun, nil)
            elseif parameter ~= 'original' then
                self.gun:setWeaponSprite(parameter)
				self:setOverrideHandModels(self.gun, nil)
            else
                VFESetWeaponModel(self.gun,false)
				self:setOverrideHandModels(self.gun, nil)
            end
        end
    else
        return ISInsertMagazine_animEvent_old(self, event, parameter)
    end
end

local ISInsertMagazine_stop_old = ISInsertMagazine.stop
function ISInsertMagazine:stop()
	VFESetWeaponModel(self.gun,false)
	self:setOverrideHandModels(self.gun, nil)
    return ISInsertMagazine_stop_old(self)
end

local ISEjectMagazine_animEvent_old = ISEjectMagazine.animEvent
function ISEjectMagazine:animEvent(event, parameter)
	if event == 'unloadFinished' then
		-- flicker the magazine state. It's stupid but it works
		self.gun:setContainsClip(false)
		VFESetWeaponModel(self.gun,false)
		self.gun:setContainsClip(true)
		return ISEjectMagazine_animEvent_old(self, event, parameter)
	end
    if event == 'changeWeaponSprite' then
        if parameter and parameter ~= '' then
            if parameter == 'open' then
				VFESetWeaponModel(self.gun,true)
				self:setOverrideHandModels(self.gun, nil)
            elseif parameter ~= 'original' then
                self.gun:setWeaponSprite(parameter)
				self:setOverrideHandModels(self.gun, nil)
            else
                VFESetWeaponModel(self.gun,false)
				self:setOverrideHandModels(self.gun, nil)
            end
        end
    else
        return ISEjectMagazine_animEvent_old(self, event, parameter)
    end
end

local ISEjectMagazine_stop_old = ISEjectMagazine.stop
function ISEjectMagazine:stop()
	VFESetWeaponModel(self.gun,false)
	self:setOverrideHandModels(self.gun, nil)
    return ISEjectMagazine_stop_old(self)
end

-- Complete overwritting, no need to keep the old function locally
ISReloadWeaponAction.onShoot = function(player, weapon)
	if not weapon:isRanged() then return; end
	if getDebug() and getDebugOptions():getBoolean("Cheat.Player.UnlimitedAmmo") then
		return;
	end
	if weapon:hasTag("M60_Link") then
		local pad = weapon:getRecoilpad()
		if pad ~= nil then
			if pad:hasTag("CatchBrass") then
				player:getInventory():AddItem("Base.M60_Link")
			else
				player:getCurrentSquare():AddWorldInventoryItem("Base.M60_Link", 0.0, 0.0, 0.0);
			end
		else
			player:getCurrentSquare():AddWorldInventoryItem("Base.M60_Link", 0.0, 0.0, 0.0);
		end
	end
	if weapon:getFullType() == "Base.AssaultRifleM1" then
		if weapon:isRoundChambered() and weapon:getCurrentAmmoCount() == 0 then
			weapon:setWeaponSprite("AssaultRifleM1_Open")
			--self:setOverrideHandModels(self.gun, nil) this works in animations but not here
			player:setPrimaryHandItem(weapon);
				if weapon:isTwoHandWeapon() then
					player:setSecondaryHandItem(weapon);
				end
			player:getEmitter():playSound("M1Ping")
		end
	end
	if weapon:haveChamber() then
		weapon:setRoundChambered(false);
	end
	if weapon:isRackAfterShoot() then
		-- shotgun need to be rack after each shot to rechamber round
		-- See ISReloadWeaponAction.OnPlayerAttackFinished()
		if weapon:haveChamber() then
			weapon:setSpentRoundChambered(true);
		end
	else
		-- automatic weapons eject the bullet cartridge
		if not weapon:isManuallyRemoveSpentRounds() then
			if weapon:getShellFallSound() then
				player:getEmitter():playSound(weapon:getShellFallSound())
			end
		end
		if weapon:getCurrentAmmoCount() >= weapon:getAmmoPerShoot() then
			-- remove ammo, add one to chamber if we still have some
			if weapon:haveChamber() then
				weapon:setRoundChambered(true);
			end
			weapon:setCurrentAmmoCount(weapon:getCurrentAmmoCount() - weapon:getAmmoPerShoot())
		end
	end
	if weapon:isManuallyRemoveSpentRounds() then
		weapon:setSpentRoundCount(weapon:getSpentRoundCount() + weapon:getAmmoPerShoot())
	end
	if not weapon:isRackAfterShoot() then -- Jam is calculated on rack for these guns
		calculateWeaponJam(weapon)
	end
end

function calculateWeaponJam(weapon)
	if weapon:getCondition() < weapon:getConditionMax() and weapon:getJamGunChance() > 0 and weapon:getCurrentAmmoCount() > 0 then
		local baseJamChance = weapon:getJamGunChance();
		if baseJamChance == 0 then -- If it can't jam, don't
			return;
		end
		if baseJamChance > 7 then -- Cap the constant at 7
			baseJamChance = 7;
		end
		local gunMissingHealth = 1 - (weapon:getCondition()/weapon:getConditionMax())
		if gunMissingHealth <= 0.2 then -- The formula will never jam at 80% and higher condition, so no reason to do the math
			return;
		end
		-- Hello there! If you're here you're probably snooping for how this works
		-- https://www.desmos.com/calculator/4xum8vc7j5
		-- "b" is the jam chance from the gun, the red line is this function, and the green line is vanilla. Anything below the blue line (1%) will never jam.
		baseJamChance = ((gunMissingHealth ^ 3)/(8 - (baseJamChance/2)) + 0.008) * 100
		if ZombRand(100) < baseJamChance then
			weapon:setJammed(true);
		end	
	end
end

-- Give event hook manager the new methods
Events.OnWeaponSwingHitPoint.Add(ISReloadWeaponAction.onShoot);