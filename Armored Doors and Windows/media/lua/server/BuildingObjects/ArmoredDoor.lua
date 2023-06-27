--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

local ArmoredDoorHealth = 5000

ArmoredDoor = ISBuildingObject:derive("ArmoredDoor");

--************************************************************************--
--** ArmoredDoor:new
--**
--************************************************************************--
function ArmoredDoor:create(x, y, z, north, sprite)
	--print("Create")
	if self.Drill:getUsedDelta() < 0.2 then
		return false
	end
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	local openSprite = self.openSprite;
	if north then
		openSprite = self.openNorthSprite;
	end
	
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, openSprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	local consumedItems = buildUtil.consumeMaterial(self);
	-- the wooden wall have 200 base health + 100 per carpentry lvl
	self.javaObject:setMaxHealth( ArmoredDoorHealth);
	self.javaObject:setHealth( ArmoredDoorHealth);
	-- the sound that will be played when our door will be broken
	self.javaObject:setBreakSound("MetalDoor1");
	-- add the item to the ground
    self.sq:AddSpecialObject(self.javaObject);
    -- set the key id if we had one
    for _,item in ipairs(consumedItems) do
		if item:getType() == "Doorknob" and item:getKeyId() ~= -1 then
			self.javaObject:setKeyId(item:getKeyId(), false)
		end
    end
	self.javaObject:transmitCompleteItemToServer();
	self.sq:playSound("Drill1")
	if self.Drill and instanceof(self.Drill, "DrainableComboItem") then
		self.Drill:setUsedDelta(self.Drill:getUsedDelta() - self.Drill:getUseDelta())
	end
end

function ArmoredDoor:new(sprite, northSprite, openSprite, openNorthSprite, Drill)
	--print("Armored Door New!")
	--print("Drill! " .. tostring(Drill:getUsedDelta()))
	if Drill and instanceof(self.Drill, "DrainableComboItem") and Drill:getUsedDelta() < 0.2 then
		return false
	end
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.openSprite = openSprite;
	o.openNorthSprite = openNorthSprite;
	o.isDoor = true;
	o.thumpDmg = 5;
	o.name = "Armored Door";
	o.isWallLike = true
	o.Drill = Drill
	o.actionAnim = "BlowTorch"
	--o:setActionAnim("BlowTorch")
	return o;
end

-- return the health of the new wall, it's 300 + 100 per carpentry lvl
function ArmoredDoor:getHealth()
	return 300 + buildUtil.getWoodHealth(self);
end

-- the door can be placed only if it's on a door frame
function ArmoredDoor:isValid(square)
	--print("is Valid?")
	self.noNeedHammer = true
	if not self:haveMaterial(square) then
		--print("No material!")
		return false
	end
	if not square:isFreeOrMidair(false) or not square:hasFloor(self.north) then
		--print("Bad placement!")
		return false
	end
	if square:isVehicleIntersecting() then
		--print("Vehicle!")
		return false
	end
	local hasFrame = false
	local hasDoor = false
	for i = 0, square:getSpecialObjects():size() - 1 do
		local item = square:getSpecialObjects():get(i);
		if instanceof(item, "IsoThumpable") and item:isDoorFrame() and item:getNorth() == self.north then
			hasFrame = true
		end
		if instanceof(item, "IsoThumpable") and item:isDoor() and item:getNorth() == self.north then
			hasDoor = true
		end
	end
	for i=0,square:getObjects():size()-1 do
		local o = square:getObjects():get(i)
		if instanceof(o, 'IsoObject') then
			if self.north and o:getType() == IsoObjectType.doorFrN then
				hasFrame = true
			end
			if not self.north and o:getType() == IsoObjectType.doorFrW then
				hasFrame = true
			end
			local sprite = o:getSprite()
			if self.north and sprite and sprite:getProperties():Is("DoorWallN") then
				hasFrame = true
			end
			if not self.north and sprite and sprite:getProperties():Is("DoorWallW") then
				hasFrame = true
			end
		end
		if instanceof(o, 'IsoDoor') and o:getNorth() == self.north then
			hasDoor = true
		end
	end

    if self.dontNeedFrame then return not hasDoor; end
	return hasFrame and not hasDoor
end

-- used to render more tile for example
function ArmoredDoor:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end
