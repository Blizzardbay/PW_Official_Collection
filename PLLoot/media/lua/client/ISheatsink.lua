--Ares Experimental Body muscle heat sink. By Paw Low--

require "TimedActions/ISBaseTimedAction"

local isON = true;

ISheatsink = ISBaseTimedAction:derive("ISheatsink");              

function ISheatsink:isValid()                        
	return self.character:getInventory():contains(self.item);
	--return self.character:getStats():getEndurance() > 0.2;
end

function ISheatsink:update()     
	local endurance = self.character:getStats():getEndurance() + ((ZomboidGlobals.ImobileEnduranceIncrease * self.character:getRecoveryMod() * self.mul) * getGameTime():getMultiplier())
        if endurance > 1 then endurance = 1 end
        if endurance < 0 then endurance = 0 end
		self.character:getStats():setEndurance(endurance)                 
	self.character:setMetabolicTarget(Metabolics.SeatedResting);
end

function ISheatsink:start()  
	--self:setActionAnim(CharacterActionAnims.Surrender)  
	self.character:getEmitter():playSound("tss", true);                    
end

function ISheatsink:stop()  
	self.character:getEmitter():playSound("errrr", true);
	self.character:getStats():setThirst(self.character:getStats():getThirst() + 0.6)                           
    ISBaseTimedAction.stop(self);
end

function ISheatsink:perform()     
	local player = getPlayer();               
	if self.item then
	player:getBodyDamage():setTemperature(37.000);

	--self.character:getStats():setEndurance(1)
	self.character:getBodyDamage():setWetness(0)
	self.character:getStats():setThirst(self.character:getStats():getThirst() + 0.4)
	
	end
	ISBaseTimedAction.perform(self);
end

function ISheatsink:new(character, item, time)     
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.mul = 50;
	o.maxTime = time;
	o.timer = time / 5;
	o.tick = 0;
	o.caloriesModifier = 0.5;
	return o;
end
