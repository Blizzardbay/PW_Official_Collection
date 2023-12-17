--[[ Thank you Arsenal[26], Paw Low was here :p]]


function Universal_TransformPLL(items, result, player)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setBloodLevel(Gun:getBloodLevel());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if 	(Gun:isContainsClip() == true) then
		result:setContainsClip(true);
	end
	if Gun:isRoundChambered() == true then
		result:setRoundChambered(true);
	end
	result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

--	====== TRANSFER WEAPON ATTACHMENTS ======
	result:attachWeaponPart(Gun:getWeaponPart("Scope"))
	result:attachWeaponPart(Gun:getWeaponPart("Canon"))
	result:attachWeaponPart(Gun:getWeaponPart("Stock"))
	result:attachWeaponPart(Gun:getWeaponPart("Sling"))
	result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

	if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end

-- ======= LAUNCHER ======

function Universal_LauncherPLL(items, result, player)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE & CERTAIN ATTACHMENTS THAT SHARE BENEFIT ======
	result:setCondition(Gun:getCondition());
	result:setBloodLevel(Gun:getBloodLevel());

	result:attachWeaponPart(Gun:getWeaponPart("Stock"))		-- UNCOMMENT BELOW TO IGNORE 
	result:attachWeaponPart(Gun:getWeaponPart("Sling"))
	result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

--	====== TRANSFER MOST WEAPON BECAUSE ITS A WHOLE DIFFERENT FIREARM WITH ITS OWN AMMO
	if 	(Gun:isAimedFirearm() and Gun:getDisplayName() == "MP5GL (40MM)" and result:getDisplayName() == "MP5GL (40MM)") then	-- [LAUNCHER to LAUNCHER] SAVE ATTACHMENT TO ModData.TempXXX
		-- AMMO TYPE DATA
		result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 TRANSFER TEMP for M16 SwitchBack
		result:getModData().TempContainsClip		= (Gun:getModData().TempContainsClip)	
		result:getModData().TempRoundChambered		= (Gun:getModData().TempRoundChambered)	
		result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)	

		result:setFireMode(Gun:getFireMode())						-- M203 SET its own FROM other M203

		if Gun:getCurrentAmmoCount() > 0 then
			if	result:getExtraDamage() < 100 then				-- WITH ONLY 2 TYPES, ALWAYS UNLOAD
				player:getInventory():AddItem("Base.40Rounds")			-- MORE COMPLICATED WITH MORE TYPES
				player:Say("Removing 40HE-Round")
			else	player:getInventory():AddItem("Base.40Rounds")
				player:Say("Removing 40INC-Round")
			end
			result:setCurrentAmmoCount(0);						-- NEVER LOADED FOR [LAUNCHER to LAUNCHER]
		end

		result:getModData().TempScope = (Gun:getModData().TempScope)			-- M203 TRANSFER TEMP for M16 Attachments
		result:getModData().TempCanon = (Gun:getModData().TempCanon)


	elseif 	(Gun:isAimedFirearm() and result:getDisplayName() == "MP5GL (40MM)") then		-- [GUN to LAUNCHER] SAVE ATTACHMENT TO ModData.TempXXX
		-- AMMO TYPE DATA
		result:getModData().TempFireMode		= (Gun:getFireMode())		-- M203 SET TEMP for M16 SwitchBack
		result:getModData().TempContainsClip		= (Gun:isContainsClip())	
		result:getModData().TempRoundChambered		= (Gun:isRoundChambered())	
		result:getModData().TempCurrentAmmoCount 	= (Gun:getCurrentAmmoCount())	

		if	(Gun:getModData().TempFireMode) ~= nil then
			result:setFireMode(Gun:getModData().TempFireMode)			-- M203 SET its own FROM M16 TEMP
		end
		if	(Gun:getModData().TempContainsClip) then
			result:setContainsClip(Gun:getModData().TempContainsClip)
		end
		if	(Gun:getModData().TempRoundChambered) then
			result:setRoundChambered(Gun:getModData().TempRoundChambered)
		end

		if 	Gun:getModData().TempAmmoType == 1 and result:getExtraDamage() < 100 then	-- HE LOADED, [GUN to INC LAUNCHER]
			player:getInventory():AddItem("Base.40Rounds")					-- REMOVE HE, ADD TO INVENTORY
			player:Say("Removing 40HE-Round")
			result:setCurrentAmmoCount(0);
		elseif	Gun:getModData().TempAmmoType == 2 and result:getExtraDamage() == 100 then	-- INC LOADED, [GUN to HE LAUNCHER]
			player:getInventory():AddItem("Base.40Rounds")				-- REMOVE INC, ADD TO INVENTORY
			player:Say("Removing 40INC-Round")
			result:setCurrentAmmoCount(0);
		elseif	(Gun:getModData().TempCurrentAmmoCount) then					-- NO CROSS SWITCH
			result:setCurrentAmmoCount(Gun:getModData().TempCurrentAmmoCount)		-- LEAVE LOADED
		end

		-- ATTACHMENTS
		result:getModData().TempScope = (Gun:getWeaponPart("Scope"))			-- M203 SET TEMP for M16 Attachments
		result:getModData().TempCanon = (Gun:getWeaponPart("Canon"))			-- These will not give bonuses to
	--	result:getModData().TempStock = (Gun:getWeaponPart("Stock"))			-- SHARD ATTACHMENT BENEFIT
	--	result:getModData().TempSling = (Gun:getWeaponPart("Sling"))			-- SHARD ATTACHMENT BENEFIT
	--	result:getModData().TempRecoilPad = (Gun:getWeaponPart("RecoilPad"))		-- SHARD ATTACHMENT BENEFIT

	elseif 	(Gun:getDisplayName() == "MP5GL (40MM)" and result:isAimedFirearm()) then		-- [LAUNCHER to GUN] RESTORE ATTACHMENT FROM ModData.TempXXX
		-- AMMO TYPE DATA
		result:getModData().TempFireMode		= (Gun:getFireMode())		-- M16 SET TEMP for M203 Switchback
		result:getModData().TempContainsClip		= (Gun:isContainsClip())	
		result:getModData().TempRoundChambered		= (Gun:isRoundChambered())	
		result:getModData().TempCurrentAmmoCount	= (Gun:getCurrentAmmoCount())

		if	(Gun:getModData().TempFireMode) ~= nil then
			result:setFireMode(Gun:getModData().TempFireMode)			-- M16 SET its own FROM M203 TEMP
		end
		if	(Gun:getModData().TempContainsClip) then
			result:setContainsClip(Gun:getModData().TempContainsClip)
		end
		if	(Gun:getModData().TempRoundChambered) then
			result:setRoundChambered(Gun:getModData().TempRoundChambered)
		end
		if	(Gun:getModData().TempCurrentAmmoCount) then
			result:setCurrentAmmoCount(Gun:getModData().TempCurrentAmmoCount)
		end

	--	if Gun:getCurrentAmmoCount() > 0 then						-- STORE GRENADE TYPE IN M16 TEMP
	--		if	Gun:getExtraDamage() == 100 then
	--			result:getModData().TempAmmoType	= 1			-- INCENDIARY
	--		else	result:getModData().TempAmmoType	= 2			-- EXPLOSIVE
	--		end
	--	end

	--	result:setFireMode(Gun:getModData().FireMode)					-- M16 SET its own FROM M203 TEMP REDO ABOVE
	--	result:setContainsClip(Gun:getModData().ContainsClip)				-- TO PREVENT nil ERROR
	--	result:setRoundChambered(Gun:getModData().RoundChambered)		
	--	result:setCurrentAmmoCount(Gun:getModData().CurrentAmmoCount)		

		-- ATTACHMENTS									-- NOTE: WEIGHT INACCURATE IF NO ATTACH !!!
		result:attachWeaponPart(Gun:getModData().TempScope)				-- Attaching (to get Bonuses back)
		result:attachWeaponPart(Gun:getModData().TempCanon)				-- From M203 TEMP
	--	result:attachWeaponPart(Gun:getModData().TempStock)				-- SHARD ATTACHMENT BENEFIT
	--	result:attachWeaponPart(Gun:getModData().TempSling)				-- SHARD ATTACHMENT BENEFIT
	--	result:attachWeaponPart(Gun:getModData().TempRecoilPad)				-- SHARD ATTACHMENT BENEFIT
	end

	if (instanceof(result,"HandWeapon")) then						-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end
