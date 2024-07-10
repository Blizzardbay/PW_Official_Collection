require "TimedActions/ISBaseTimedAction"

---@class TATurnACOn : ISBaseTimedAction
TATurnACOn = ISBaseTimedAction:derive("TATurnACOn");

function TATurnACOn:isValid()
	return true
end

function TATurnACOn:update()
    
end

function TATurnACOn:start()
    self.character:faceThisObject(self.object)
	self:setActionAnim("RemoveCurtain")
    
	self.sound = self.character:playSound("ACStartSlow")
end

function TATurnACOn:stop()
	self.character:stopOrTriggerSound(self.sound)
	ISBaseTimedAction.stop(self)
end

function TATurnACOn:perform()
    self.character:stopOrTriggerSound(self.sound)

	ACToggle(self.object, true, self.character)

	ISBaseTimedAction.perform(self)
end


function TATurnACOn:new(character, square, object)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.stopOnWalk = false
	o.stopOnRun = false
	o.maxTime = 90
	-- custom fields
	o.object = object
    o.square = square
	return o
end

return TATurnACOn;
