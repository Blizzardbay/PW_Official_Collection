require "TimedActions/ISBaseTimedAction"

---@class TATurnACOff : ISBaseTimedAction
TATurnACOff = ISBaseTimedAction:derive("TATurnACOff");

function TATurnACOff:isValid()
	return true
end

function TATurnACOff:update()
    
end

function TATurnACOff:start()
    self.character:faceThisObject(self.object)
	self:setActionAnim("RemoveCurtain")
	self.sound = self.character:playSound("ACStart")
end

function TATurnACOff:stop()
    self.character:stopOrTriggerSound(self.sound)
	ISBaseTimedAction.stop(self)
end

function TATurnACOff:perform()
    self.character:stopOrTriggerSound(self.sound)
    
    ACToggle(self.object, false, self.character)

	ISBaseTimedAction.perform(self)
end


function TATurnACOff:new(character, square, object)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	
    
    o.character = character
    o.stopOnWalk = false
    -- o.stopOnRun = false
    o.maxTime = 40

    -- custom fields
	o.object = object
    o.square = square
	return o
end

return TATurnACOff;
