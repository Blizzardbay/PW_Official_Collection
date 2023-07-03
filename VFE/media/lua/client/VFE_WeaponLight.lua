local function WeaponLightBeam()

	local attacker	= getSpecificPlayer(0)
	local weapon	= nil
	
	-- A dirty solution that turns off flashlights of weapons in inventory every update
	local playerItems = attacker:getInventory():getItems()
	for i=1,playerItems:size() do
		weapon = playerItems:get(i-1)
		if ((weapon:getType() == "MP5Folded") or (weapon:getType() == "MP5Unfolded") or (weapon:getType() == "CAR15D") or (weapon:getType() == "CAR15DFolded")) then
			weapon:setLightStrength(0.0)
			break
		end
	end
	
	if attacker ~= nil then				
		weapon	= attacker:getPrimaryHandItem()
	end
	
	if attacker:isAiming() and attacker:getPrimaryHandItem() and ((weapon:getType() == "MP5Folded") or (weapon:getType() == "MP5Unfolded") or (weapon:getType() == "CAR15D") or (weapon:getType() == "CAR15DFolded")) then
		weapon:setLightStrength(1.5)
	elseif not attacker:isAiming() and attacker:getPrimaryHandItem() and ((weapon:getType() == "MP5Folded") or (weapon:getType() == "MP5Unfolded") or (weapon:getType() == "CAR15D") or (weapon:getType() == "CAR15DFolded")) then
		weapon:setLightStrength(0.0)
	end
		
end
			

Events.OnPlayerUpdate.Add(WeaponLightBeam)