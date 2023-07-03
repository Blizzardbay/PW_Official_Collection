require "ISUI/ISInventoryPaneContextMenu"

VFEBayonetContext = {}

VFEBayonetContext.callAction = function(item, player, bayonet) --when you click the action this gets called first
	--if stuff not in main inv grab them
	if player:getPrimaryHandItem() ~= item or player:getSecondaryHandItem() ~= item then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, true));
	end
	if item and item:getContainer() == player:getInventory() then 
		ISTimedActionQueue.add(VFEBayonetContextAction:new(item, player, bayonet, CharacterActionAnims.Craft, 15))
	end
	
end

--------------  Timed Action
VFEBayonetContextAction = ISBaseTimedAction:derive("VFEBayonetContextAction");

function VFEBayonetContextAction:new(item, character, bayonet, anim, time) --definition
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.item = item;
	o.bayonet = bayonet;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = time;
    o.caloriesModifier = 6;
	o.animation = anim
	o.useProgressBar = false;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end

function VFEBayonetContextAction:isValid() --if items move or get deleted abort the action
	local returnvalue = true
	if self.item:getFullType() == "Base.AssaultRifle" then
		if not self.item or self.item:getContainer() ~= self.character:getInventory() and not self.bayonet or self.bayonet:getContainer() ~= self.character:getInventory() then 
			returnvalue = false;
		end
	else
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then 
			returnvalue = false;
		end
	end
	return returnvalue;
end

function VFEBayonetContextAction:waitToStart()
	return false;
end

function VFEBayonetContextAction:start() -- when it starts
	self.item:setJobType("Using Bayonet");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
	self:setActionAnim(self.animation);
end

function VFEBayonetContextAction:perform() --the action itself, gets called when it's completed
	VFEBayonet(self.item, self.character, self.bayonet)

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function VFEBayonetContextAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function VFEBayonetContextAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function VFEBayonetSetup(modData)
	modData.rifle = {}
	modData.bayonet = {}
end


function VFEBayonet(item, player, bayonet)

	local hotBar = getPlayerHotbar(player:getPlayerNum())
	local result = nil
	local seperateBayonet = false
	
	if item:getSubCategory() == "Firearm" then
		if item:getFullType() == "Base.AssaultRifle" then
			seperateBayonet = true
			result = player:getInventory():AddItem("Base.AssaultRifleBayonet")
		else
			result = player:getInventory():AddItem("Base.SKSSpikerBayonet")
		end
	else
		if item:getFullType() == "Base.AssaultRifleBayonet" then
			seperateBayonet = true
			result = player:getInventory():AddItem("Base.AssaultRifle")
		else
			result = player:getInventory():AddItem("Base.SKSSpiker")
		end
	end
	
	result:setBloodLevel(item:getBloodLevel())
	result:setFavorite(item:isFavorite())
	
	local modData = result:getModData() -- Mod Data
		for k,v in pairs(item:getModData()) do
			modData[k] = v
		end
		
	if modData.rifle == nil or modData.bayonet == nil then
		VFEBayonetSetup(modData)
	end
	
	if item:getSubCategory() == "Firearm" then -- Rifle to Bayonet
		
		-- Save Rifle Data
		modData.rifle.Condition = item:getCondition()		
		result:setCurrentAmmoCount(item:getCurrentAmmoCount())
		
		if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
			result:setRoundChambered(true)
		end
		if item:getHaveBeenRepaired() then
			modData.rifle.HaveBeenRepaired = item:getHaveBeenRepaired()
		end 
		if item:isRoundChambered() then -- Chamber Check
			modData.rifle.RoundChambered = true
		else
			modData.rifle.RoundChambered = false
		end
		if item:isSpentRoundChambered() then
			modData.rifle.SpentRoundChambered = true
		else
			modData.rifle.SpentRoundChambered = false
		end
		if item:isJammed() then -- Jam check
			modData.rifle.Jammed = true
		else
			modData.rifle.Jammed = false
		end
		if item:isContainsClip() then
			modData.rifle.ContainsClip = true
		else
			modData.rifle.ContainsClip = false
		end
		modData.rifle.CurrentAmmoCount = item:getCurrentAmmoCount()
			
		modData.rifle.FireMode = item:getFireMode()
		
		-- This doesn't work with a for loop for some reason
			local clip = item:getClip()
			local scope = item:getScope()
			local sling = item:getSling()
			local canon = item:getCanon()
			local stock = item:getStock()
			local pad = item:getRecoilpad()
			if scope then
				if scope:getFullType() == "Base.x2Scope" then
					scope = InventoryItemFactory.CreateItem("Base.x2Scope_Fake")
				elseif scope:getFullType() == "Base.x4Scope" then
					scope = InventoryItemFactory.CreateItem("Base.x4Scope_Fake")
				elseif scope:getFullType() == "Base.x8Scope" then
					scope = InventoryItemFactory.CreateItem("Base.x8Scope_Fake")
				end
			result:attachWeaponPart(scope)
			end
			if sling then
			result:attachWeaponPart(sling)
			end
			if canon then
				if canon:getFullType() == "Base.Bipod" then
					canon = InventoryItemFactory.CreateItem("Base.Bipod_Fake")
				end
			result:attachWeaponPart(canon)
			end
			if stock then
			result:attachWeaponPart(stock)
			end
			if pad then
			result:attachWeaponPart(pad)
			end
			if clip then
			result:attachWeaponPart(clip)
			end
		
		-- Load Bayonet Data
		if seperateBayonet then
			result:setCondition(bayonet:getCondition())
			result:setHaveBeenRepaired(bayonet:getHaveBeenRepaired())
			
			modData.bayonet.modData = {}
			for k,v in pairs(bayonet:getModData()) do
				modData.bayonet.modData[k] = v
			end
			modData.bayonet.Favorite = bayonet:isFavorite()
			
			local playerModData = player:getModData()
			
			if hotBar:isInHotbar(bayonet) then -- hotbar
				playerModData.bayonetHotbar = {}
				playerModData.bayonetHotbar.rifle = result
				local bayonetSlot = bayonet:getAttachedSlot()
				playerModData.bayonetHotbar.slot = bayonetSlot
				playerModData.bayonetHotbar.slotDef = hotBar.availableSlot[bayonetSlot].def
				hotBar:removeItem(bayonet, false)
			else
				playerModData.bayonetHotbar = nil
			end
			player:getInventory():DoRemoveItem(bayonet)
		else
			if modData.bayonet.Condition then
				result:setCondition(modData.bayonet.Condition)
			end
			if modData.bayonet.HaveBeenRepaired then
				result:setHaveBeenRepaired(modData.bayonet.HaveBeenRepaired)
			end 
		end
	
	else -- Bayonet to Rifle
		
		-- Save Bayonet Data
		if seperateBayonet then
			local playerModData = player:getModData()
			local newBayonet = player:getInventory():AddItem("Base.M16Bayonet")
			if modData.bayonet.Favorite then
				newBayonet:setFavorite(modData.bayonet.Favorite)
			end
			local bayonetModData = newBayonet:getModData() -- Mod Data
			if modData.bayonet.modData then
				for k,v in pairs(modData.bayonet.modData) do
					bayonetModData[k] = v
				end
			end
			modData.bayonet.modData = nil
			
			newBayonet:setCondition(item:getCondition())
			newBayonet:setHaveBeenRepaired(item:getHaveBeenRepaired())
			newBayonet:setBloodLevel(item:getBloodLevel())
			if playerModData.bayonetHotbar then
				if not hotBar.attachedItems[playerModData.bayonetHotbar.slot] and playerModData.bayonetHotbar.rifle == item then
					hotBar:attachItem(newBayonet, playerModData.bayonetHotbar.slotDef.attachments[newBayonet:getAttachmentType()], playerModData.bayonetHotbar.slot, playerModData.bayonetHotbar.slotDef, true)
					playerModData.bayonetHotbar = nil
				else
					playerModData.bayonetHotbar = nil
				end
			end
			
		else
			modData.bayonet.Condition = item:getCondition()
			if modData.bayonet.HaveBeenRepaired then
				modData.bayonet.HaveBeenRepaired = item:getHaveBeenRepaired()
			end 
		end
		
		-- This doesn't work with a for loop for some reason
			local clip = item:getClip()
			local scope = item:getScope()
			local sling = item:getSling()
			local canon = item:getCanon()
			local stock = item:getStock()
			local pad = item:getRecoilpad()
			if scope then
				if scope:getFullType() == "Base.x2Scope_Fake" then
					scope = InventoryItemFactory.CreateItem("Base.x2Scope")
				elseif scope:getFullType() == "Base.x4Scope_Fake" then
					scope = InventoryItemFactory.CreateItem("Base.x4Scope")
				elseif scope:getFullType() == "Base.x8Scope_Fake" then
					scope = InventoryItemFactory.CreateItem("Base.x8Scope")
				end
			result:attachWeaponPart(scope)
			end
			if sling then
			result:attachWeaponPart(sling)
			end
			if canon then
				if canon:getFullType() == "Base.Bipod_Fake" then
					canon = InventoryItemFactory.CreateItem("Base.Bipod")
				end
			result:attachWeaponPart(canon)
			end
			if stock then
			result:attachWeaponPart(stock)
			end
			if pad then
			result:attachWeaponPart(pad)
			end
			if clip then
			result:attachWeaponPart(clip)
			end
		
		-- Load Rifle Data
		if modData.rifle.Condition then
			result:setCondition(modData.rifle.Condition)
		end
		if modData.rifle.HaveBeenRepaired then
			result:setHaveBeenRepaired(modData.rifle.HaveBeenRepaired)
		end 
		if modData.rifle.RoundChambered then -- Chamber Check
			result:setRoundChambered(true)
		end
		if modData.rifle.SpentRoundChambered then
			result:setSpentRoundChambered(true)
		end
		if modData.rifle.Jammed then -- Jam check
			result:setJammed(true)
		end
		if modData.rifle.ContainsClip then
			result:setContainsClip(true)
		end
		if modData.rifle.CurrentAmmoCount then
			result:setCurrentAmmoCount(modData.rifle.CurrentAmmoCount)
		end
		if modData.rifle.FireMode then
			result:setFireMode(modData.rifle.FireMode)
		end
	end
			
	if hotBar:isInHotbar(item) then -- hotbar
		local itemSlot = item:getAttachedSlot()
		hotBar:removeItem(item, false)
		local slotDef = hotBar.availableSlot[itemSlot].def
		hotBar:attachItem(result, slotDef.attachments[result:getAttachmentType()], itemSlot, slotDef, false)

		hotBar.needsRefresh = true
		hotBar:update()
	end
	player:getInventory():DoRemoveItem(item)
	player:setPrimaryHandItem(result);
	if result:isTwoHandWeapon() then
		player:setSecondaryHandItem(result);
	end
		
end