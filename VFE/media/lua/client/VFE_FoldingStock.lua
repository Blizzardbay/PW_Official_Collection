require "ISUI/ISInventoryPaneContextMenu"

VFEStockContext = {}

VFEStockContext.callAction = function(item, index, player) --when you click the action this gets called first
	--if stuff not in main inv grab them
	if player:getPrimaryHandItem() ~= item or player:getSecondaryHandItem() ~= item then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, true));
	end
	if item and item:getContainer() == player:getInventory() then 
		ISTimedActionQueue.add(VFEStockContextAction:new(item, index, player, CharacterActionAnims.Craft, 15))
	end
	
end

--------------  Timed Action
VFEStockContextAction = ISBaseTimedAction:derive("VFEStockContextAction");

function VFEStockContextAction:new(item, index, character, anim, time) --definition
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.item = item;
	o.index = index;
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

function VFEStockContextAction:isValid() --if items move or get deleted abort the action
	local returnvalue = true
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then 
		returnvalue = false;
	end
	return returnvalue;
end

function VFEStockContextAction:waitToStart()
	return false;
end

function VFEStockContextAction:start() -- when it starts
	self.item:setJobType("Moving Stock");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
	self:setActionAnim(self.animation);
end

function VFEStockContextAction:perform() --the action itself, gets called when it's completed
	VFEFoldingStock(self.item, self.index, self.character)

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function VFEStockContextAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function VFEStockContextAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end


function VFEFoldingStock(item, newWeapIndex, player)

	local result = player:getInventory():AddItem(VFEFoldingWeaponPair[newWeapIndex])
	local hotBar = getPlayerHotbar(player:getPlayerNum())
		
		result:setCondition(item:getCondition())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setActivated(item:isActivated())
		result:setFavorite(item:isFavorite())
		
		if item:getSubCategory() == "Firearm" then
			if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
				result:setRoundChambered(true)
			end
			if item:isSpentRoundChambered() then
				result:setSpentRoundChambered(true)
			end
			if item:isJammed()then -- Jam check
				result:setJammed(true)
			end
			if item:isContainsClip() then
				result:setContainsClip(true)
			end
			result:setCurrentAmmoCount(item:getCurrentAmmoCount())
			
			result:setFireMode(item:getFireMode())
			
			local modData = result:getModData() -- Mod Data
			for k,v in pairs(item:getModData()) do
				modData[k] = v
			end
			
			-- This doesn't work with a for loop for some reason
			local clip = item:getClip()
			local scope = item:getScope()
			local sling = item:getSling()
			local canon = item:getCanon()
			local stock = item:getStock()
			local pad = item:getRecoilpad()
			if scope then
			result:attachWeaponPart(scope)
			end
			if sling then
			result:attachWeaponPart(sling)
			end
			if canon then
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
			VFESetWeaponModel(result,false) -- Sets the model corretly incase of attachments that change weapon model
			player:getEmitter():playSound("M16Equip")
		end
end