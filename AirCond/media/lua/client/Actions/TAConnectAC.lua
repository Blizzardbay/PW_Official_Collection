require "TimedActions/ISBaseTimedAction"

---@class TAConnectAC : ISBaseTimedAction
TAConnectAC = ISBaseTimedAction:derive("TAConnectAC");

function TAConnectAC:isValid()
	return true
end

function TAConnectAC:update()
    
end

function TAConnectAC:start()
    self.character:faceThisObject(self.object)
	self:setActionAnim("RemoveCurtain")
	self.sound = self.character:playSound("GeneratorConnect")
end

function TAConnectAC:stop()
	ISBaseTimedAction.stop(self)
end

function TAConnectAC:perform()
    self.character:stopOrTriggerSound(self.sound)
    
    local cell = self.square:getCell()

    local spriteName = "industry_01_4"
    if self.orientation == "V" then
        spriteName = "industry_01_5"
    end

    cd = IsoClothingDryer.new(self.square:getCell(), self.square, getSprite(spriteName))
    cd:setActivated(false)
    cd:setMovedThumpable(true)
    cd:createContainersFromSpriteProperties()
    cd:getModData()["orientation"] = self.orientation
    cd:getModData()["targetTemp"] = 20
    cd:getModData()["targetFan"] = 3
    
    -- self.square:RemoveTileObject(self.object)
    -- self.square:transmitRemoveItemFromSquareOnServer(self.object)
    if isClient() then
        sledgeDestroy(self.object);
    else
        self.object:getSquare():transmitRemoveItemFromSquare(self.object)
    end

    self.square:AddSpecialObject(cd)
    cd:transmitCompleteItemToServer()

	ISBaseTimedAction.perform(self)
end


function TAConnectAC:new(character, square, object, orientation)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	
    
    o.character = character
    o.stopOnWalk = false
    -- o.stopOnRun = false
    o.maxTime = 160

    -- custom fields
	o.object = object
    o.square = square
    o.orientation = orientation
	return o
end

return TAConnectAC;
