--***********************************************************
--**                    ShadowCop		                   **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISBurnCorpseFireplaceAction = ISBaseTimedAction:derive("ISBurnCorpseFireplaceAction");

function ISBurnCorpseFireplaceAction:isValid()
	return self.fireplace:getObjectIndex() ~= -1 and
		self.character:getInventory():contains(self.item)
end

function ISBurnCorpseFireplaceAction:update()
	self.item:setJobDelta(self:getJobDelta());
end

function ISBurnCorpseFireplaceAction:start()
	self.item:setJobType(getText("ContextMenu_Cremate_Corpse"));
	self.item:setJobDelta(0.0);
end

function ISBurnCorpseFireplaceAction:stop()
	ISBaseTimedAction.stop(self);
    	self.item:setJobDelta(0.0);
end

function ISBurnCorpseFireplaceAction:perform()
	self.character:setSecondaryHandItem(nil);
	self.character:setPrimaryHandItem(nil);
	self.character:getInventory():Remove(self.item);
    self.item:setJobDelta(0.0);

	local fp = self.fireplace;
	local args = { x = fp:getX(), y = fp:getY(), z = fp:getZ(), fuelAmt = self.fuelAmt };
	sendClientCommand(self.character, 'fireplace', 'addFuel', args);

     -- needed to remove from queue / start next
	ISBaseTimedAction.perform(self);
end

function ISBurnCorpseFireplaceAction:new(character, fireplace, item, fuelAmt, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	-- custom fields
	o.fireplace = fireplace;
	o.fuelAmt = fuelAmt;
	o.item = item;
	return o;
end
