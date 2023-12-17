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
	ISBaseTimedAction.stop(self)
end

function TATurnACOn:perform()
    self.character:stopOrTriggerSound(self.sound)

	

    self.object:setActivated(true)

	if isClient() then
		local args = { x = self.object:getX(), y = self.object:getY(), z = self.object:getZ() }
		sendClientCommand(self.character, 'ac_commands', 'toggle', args)
	end
		
    -- self.object:transmitModdata()
    updateAC()

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
