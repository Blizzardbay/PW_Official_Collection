--Ares Experimental Body muscle heat sink. By Paw Low--

require "TimedActions/ISBaseTimedAction"

local isON = true;

ISsoothe = ISBaseTimedAction:derive("ISsoothe");              

function ISsoothe:isValid()                        
	return self.character:getInventory():contains(self.item);
	--return self.character:getStats():getEndurance() > 0.2;
end

function ISsoothe:update()                         
	self.character:setMetabolicTarget(Metabolics.SeatedResting);
end

function ISsoothe:start()  
	--self:setActionAnim(CharacterActionAnims.Surrender)  
	self.character:getEmitter():playSound("soo", true);                    
end

function ISsoothe:stop()  
	local player = getPlayer();  
	self.character:getEmitter():playSound("errrr", true);
	self.character:getStats():setPain(2000); 
	self.character:getStats():setPanic(1000); 
	ISBaseTimedAction.stop(self);

end

function ISsoothe:perform()     
	local player = getPlayer();               
	if self.item then

	--self.character:getStats():setEndurance(1)
	player:getStats():setFatigue(player:getStats():getFatigue() + 0.3) 
	self.character:getStats():setPain(0); 
	self.character:getStats():setPanic(0); 
	self.character:getStats():setStress(0); 
	self.character:getBodyDamage():setUnhappynessLevel(0)
	self.character:getBodyDamage():setBoredomLevel(0)
	
	end
	ISBaseTimedAction.perform(self);
end

function ISsoothe:new(character, item, time)     
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.mul = 10;
	o.maxTime = time;
	o.timer = time / 5;
	o.tick = 0;
	o.caloriesModifier = 0.5;
	return o;
end
