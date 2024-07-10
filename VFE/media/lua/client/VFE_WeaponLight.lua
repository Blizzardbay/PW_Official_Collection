local function WeaponLightBeam()

	local attacker	= getSpecificPlayer(0)
	local weapon	= nil
	
	-- A dirty solution that turns off flashlights of weapons in inventory every update
	local playerItems = attacker:getInventory():getItems()
	for i=1,playerItems:size() do
		weapon = playerItems:get(i-1)
		if (weapon:hasTag("WeaponLight")) then
			weapon:setLightStrength(0.0)
			break
		end
	end
	
	if attacker ~= nil then				
		weapon	= attacker:getPrimaryHandItem()
	end
	if weapon == nil then return end
	
	if attacker:isAiming() and attacker:getPrimaryHandItem() and (weapon:hasTag("WeaponLight")) then
		weapon:setLightStrength(1.5)
	elseif not attacker:isAiming() and attacker:getPrimaryHandItem() and (weapon:hasTag("WeaponLight")) then
		weapon:setLightStrength(0.0)
	end
	
	if  instanceof(weapon, "HandWeapon") then
		if ( weapon:getCanon()) then
			if attacker:isAiming() and weapon then
				if  weapon:getCanon():getFullType() == "Base.Laser" and weapon:getSubCategory() == "Firearm" then
					local part = InventoryItemFactory.CreateItem("Base.LaserOn")
					weapon:attachWeaponPart(part)
					attacker:setPrimaryHandItem(weapon);
					if weapon:isTwoHandWeapon() then
						attacker:setSecondaryHandItem(weapon);
					end
				end
			
			elseif not attacker:isAiming() and weapon then
				if  weapon:getCanon():getFullType() == "Base.LaserOn" then
					local part = InventoryItemFactory.CreateItem("Base.Laser")
					weapon:attachWeaponPart(part)
					attacker:setPrimaryHandItem(weapon);
					if weapon:isTwoHandWeapon() then
						attacker:setSecondaryHandItem(weapon);
					end
				end
			end
		end
	end
end
			

Events.OnPlayerUpdate.Add(WeaponLightBeam)