require "TimedActions/ISBaseTimedAction"

---@class TASettingsAC : ISBaseTimedAction
TASettingsAC = ISBaseTimedAction:derive("TASettingsAC");

function TASettingsAC:isValid()
    return true;
end

function TASettingsAC:update()
	self.character:faceThisObject(self.object)
end

function TASettingsAC:start()
end

function TASettingsAC:stop()
    ISBaseTimedAction.stop(self);
end

function TASettingsAC:perform()
	
    ISBaseTimedAction.perform(self);

    self.character:faceThisObject(self.object)
  
    local ui = ISACUI:new(0,0,300,300, self.object, self.character, self.rangeLimit);
    ui:initialise();
    ui:addToUIManager();

end

function TASettingsAC:new(character, square, object, rangeLimit)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.square = square
    o.object = object;
    o.rangeLimit = rangeLimit
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = 0;

    return o;
end

return TASettingsAC;
