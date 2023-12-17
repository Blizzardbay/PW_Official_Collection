BWireObject = ISBuildingObject:derive("BWireObject")

function BWireObject:create(x, y, z, north, sprite)
	local cell = getWorld():getCell()
	self.sq = cell:getGridSquare(x, y, z)
	local object = IsoObject.new(self.sq, sprite, name);
	self.sq:AddTileObject(object);
	object:transmitCompleteItemToServer();
	buildUtil.consumeMaterial(self);

	-- self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self)
	-- buildUtil.setInfo(self.javaObject, self)
	-- buildUtil.consumeMaterial(self)
	-- self.javaObject:setMaxHealth(100)
	-- self.javaObject:setHealth(self.javaObject:getMaxHealth())
	-- self.javaObject:setName(self.name)
	-- self.javaObject:setBreakSound("BreakObject")
	-- self.sq:AddSpecialObject(self.javaObject, self:getObjectIndex(self.sq))
	-- self.sq:RecalcAllWithNeighbours(true)
	-- self.javaObject:transmitCompleteItemToServer()
end

function BWireObject:onTimedActionStart(action)
	ISBuildingObject.onTimedActionStart(self, action)
end

function BWireObject:new(sprite, northSprite)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	o:setSprite(sprite)
	o:setNorthSprite(northSprite)
	o.hoppable = false
	o.canBarricade = false
	o.name = "Barbed Wire"
	o.isWallLike = false
	return o
end

function BWireObject:isValid(square)
	if not self:haveMaterial(square) then return false end
	if self:getBarbedWire(square) ~= -1 then return false end
	return true
end

function BWireObject:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end

function BWireObject:getBarbedWire(square)
	if not square then return -1 end
	for i=1,square:getObjects():size() do
		local object = square:getObjects():get(i-1);
		local name = object:getSprite():getName();

		if instanceof(object, "IsoObject") and (name == "barbwire_0" or name == "barbwire_1") then
			return i - 1
		end
	end
	return -1
end

function BWireObject:getObjectIndex(square)
	return -1
end	
