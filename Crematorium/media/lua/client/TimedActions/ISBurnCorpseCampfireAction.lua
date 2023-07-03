--***********************************************************
--**                    ShadowCop		                   **
--***********************************************************

require "TimedActions/ISBaseTimedAction"
require 'Camping/camping'

ISBurnCorpseCampfireAction = ISBaseTimedAction:derive("ISBurnCorpseCampfireAction");

function ISBurnCorpseCampfireAction:isValid()
	self.campfire:updateFromIsoObject()
	return self.campfire:getObject() and
		self.character:getInventory():contains(self.item)
end

function ISBurnCorpseCampfireAction:waitToStart()
	self.character:faceThisObject(self.campfire:getObject())
	return self.character:shouldBeTurning()
end

function ISBurnCorpseCampfireAction:update()
	self.item:setJobDelta(self:getJobDelta());
	self.character:faceThisObject(self.campfire:getObject())
    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);

end

function ISBurnCorpseCampfireAction:start()
	self.item:setJobType(getText("ContextMenu_Cremate_Corpse"));
	self.item:setJobDelta(0.0);
	self:setActionAnim("Loot")
	self.character:SetVariable("LootPosition", "Low")
	self.character:reportEvent("EventLootItem");
end

function ISBurnCorpseCampfireAction:stop()
	ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function ISBurnCorpseCampfireAction:perform()
    self.item:setJobDelta(0.0);
	self.character:removeFromHands(self.item);
	self.character:getInventory():Remove(self.item);
	
	local cf = self.campfire;
	local args = { x = cf.x, y = cf.y, z = cf.z, fuelAmt = self.fuelAmt };
	CCampfireSystem.instance:sendCommand(self.character, 'addFuel', args);

     -- needed to remove from queue / start next
	ISBaseTimedAction.perform(self);
end

function ISBurnCorpseCampfireAction:new(character, campfire, item, fuelAmt, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	-- custom fields
	o.campfire = campfire;
	o.fuelAmt = fuelAmt;
	o.item = item;
	return o;
end
