--Ares Experimental Body muscle heat sink. By Paw Low--

require "TimedActions/ISBaseTimedAction"


ISpainstopper = ISBaseTimedAction:derive("ISpainstopper");              

function ISpainstopper:isValid()                        
	return self.character:getInventory():contains(self.item);
	--return self.character:getStats():getEndurance() > 0.2;
end

function ISpainstopper:update()     
	local player = getPlayer();     
	player:setGhostMode(true);   
	player:setNoClip(true);
	player:getStats():setPain(player:getStats():getPain() - ( 5000 ));
	player:getStats():setPanic(player:getStats():getPanic() - ( 5000 ));
	self.character:setMetabolicTarget(Metabolics.SeatedResting);
end

function ISpainstopper:start()  
	self.character:getEmitter():playSound("ooff", true); 
	--self:setActionAnim(CharacterActionAnims.Sneak)                      
end

function ISpainstopper:stop()   
	local player = getPlayer();   
	self.character:getEmitter():playSound("errrr", true);
	self.character:setGhostMode(false);  
	self.character:setNoClip(false);   
	self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.6);                   
    ISBaseTimedAction.stop(self);
end

function ISpainstopper:perform()   
	              
	if self.item then
	--self.character:getBodyDamage():setHealth(0.5)
	self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.4);
	self.character:setGhostMode(false);
	self.character:setNoClip(false);
	self.character:setInfectionLevel(-1);
	--self.character:getStats():setHealth(self.character:getStats():getHealth() + 0.5)
	--self.character:getBodyDamage():setTemperature(self.character:getBodyDamage():getTemperature() - 1)
	
	end
	ISBaseTimedAction.perform(self);
end

function ISpainstopper:new(character, item, time)     
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = false;
	o.stopOnRun = false;
	o.maxTime = time;
	o.timer = time / 5;
	o.tick = 0;
	o.caloriesModifier = 0.5;
	return o;
end
