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
	ISBaseTimedAction.stop(self)
end

function TATurnACOff:perform()
    self.character:stopOrTriggerSound(self.sound)
    
    self.object:setActivated(false)
    
    if isClient() then
        local args = { x = self.object:getX(), y = self.object:getY(), z = self.object:getZ() }
        sendClientCommand(self.character, 'ac_commands', 'toggle', args)
    end

    updateAC()

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
