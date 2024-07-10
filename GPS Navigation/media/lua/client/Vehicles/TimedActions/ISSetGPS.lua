--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISSetGPS = ISBaseTimedAction:derive("ISSetGPS")

function ISSetGPS:isValid()
	local vehicle = self.character:getVehicle()
	return vehicle ~= nil and
		vehicle:isDriver(self.character) 
end

function ISSetGPS:update()
    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function ISSetGPS:start()
	self.sound = self.character:getEmitter():playSound("VehicleHotwireStart")
end

function ISSetGPS:stop()
	self:stopSound()
	ISBaseTimedAction.stop(self)
end

function ISSetGPS:perform()
	self:stopSound()
	local vehicle = self.character:getVehicle()
	if not vehicle:getModData().setGPS then
		vehicle:getModData().setGPS = true;
		ISRemoveItemTool.removeItem(self.character:getInventory():getFirstTypeRecurse("NAV.GPS"), self.character:getPlayerNum())
	 else 
		vehicle:getModData().setGPS = false;
		local inv = InventoryItemFactory.CreateItem("NAV.GPS")
		inv:setUsedDelta(0)
		self.character:getInventory():AddItems(inv, 1)
	end
	vehicle:transmitModData()
	--sendClientCommand(self.character, 'vehicle', 'hotwireEngine', {electricSkill=self.character:getPerkLevel(Perks.Electricity)})

	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISSetGPS:stopSound()
	if self.sound and self.character:getEmitter():isPlaying(self.sound) then
		self.character:stopOrTriggerSound(self.sound);
	end
end

function ISSetGPS:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = 200 - (character:getPerkLevel(Perks.Electricity) * 3);
	return o
end

