--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

local ArmoredWindowHealth = 5000

ArmoredWindow = ISBuildingObject:derive("ArmoredWindow");

--************************************************************************--
--** ArmoredWindow:new
--**
--************************************************************************--
function ArmoredWindow:create(x, y, z, north, sprite)
	print("Create")
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	-- local openSprite = self.openSprite;
	-- if north then
		-- openSprite = self.openNorthSprite;
	-- end
	--self.javaObject = IsoThumpable.new(cell, self.sq, sprite, openSprite, north, self);
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	--self.javaObject = IsoWindow.new(cell, self.sq, sprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	local consumedItems = buildUtil.consumeMaterial(self);
	-- the wooden wall have 200 base health + 100 per carpentry lvl
	--self.javaObject:setIsWindow(true)
	self.javaObject:setMaxHealth( ArmoredWindowHealth);
	self.javaObject:setHealth( ArmoredWindowHealth);
                self.javaObject:setCanPassThrough(false);
                self.javaObject:setHoppable(false);
				self.javaObject:setIsLocked(true)
				--self.javaObject:setBarricaded(true)
				--self.Barricade = IsoBarricade.AddBarricadeToObject(self.javaObject, true)
	-- the sound that will be played when our Window will be broken
	self.javaObject:setBreakSound("MetalWindow1");
	-- add the item to the ground
    self.sq:AddSpecialObject(self.javaObject);
    -- set the key id if we had one

	self.javaObject:transmitCompleteItemToServer();
	
	--ISMoveableSpriteProps:placeMoveable( getSpecificPlayer(0), self.sq, sprite:getName() )
	
	
	self.sq:playSound("Drill1")
end

--function ArmoredWindow:new(sprite, northSprite, openSprite, openNorthSprite)
function ArmoredWindow:new(sprite, northSprite)
	print("Armored Window New!")
	print("Armored Window New!")
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	--o.openSprite = openSprite;
	--o.openNorthSprite = openNorthSprite;
	o.isWindow = true;
	o.thumpDmg = 5;
	o.name = "Window Bars";
	o.isWallLike = true
	return o;
end

-- return the health of the new wall, it's 300 + 100 per carpentry lvl
function ArmoredWindow:getHealth()
	return 300 + buildUtil.getWoodHealth(self);
end

-- the Window can be placed only if it's on a Window frame
function ArmoredWindow:isValid(square)
	--print("is Valid?")
	self.noNeedHammer = true
	if not self:haveMaterial(square) then
		print("No material!")
		return false
	end
	if not square:isFreeOrMidair(false) or not square:hasFloor(self.north) then
		print("Bad placement!")
		--return false
	end
	if square:isVehicleIntersecting() then
		print("Vehicle!")
		return false
	end
	local hasFrame = false
	local hasWindow = false
	for i = 0, square:getSpecialObjects():size() - 1 do
		local item = square:getSpecialObjects():get(i);
		--if instanceof(item, "IsoThumpable") and item:isWindowFrame() and item:getNorth() == self.north then
		--if item:isWindowFrame() and item:getNorth() == self.north then
		--print("Wall Style? " .. tostring(item:getProperties():Val("WindowW")))
		if item:getProperties():Val("WindowN")  and item:getNorth() then
			hasFrame = true
			print("Has Frame 1")
		elseif item:getProperties():Val("WindowW") then
			hasFrame = true
			--print("Has Frame 2")
		end
		--if instanceof(item, "IsoThumpable") and item:isWindow() and item:getNorth() == self.north then
		-- if item:isWindow() and item:getNorth() == self.north then
			-- hasWindow = true
		-- end
		
	end
	for i=0,square:getObjects():size()-1 do
		local o = square:getObjects():get(i)
		--print("Wall Style? " .. tostring(o:getProperties():Val("WindowW")))
		if instanceof(o, 'IsoObject') then
			if self.north and o:getType() == IsoObjectType.WindowFrN then
				hasFrame = true
			print("Has Frame 3")
			end
			if not self.north and o:getType() == IsoObjectType.WindowFrW then
				hasFrame = true
			--print("Has Frame 4")
			end
			local sprite = o:getSprite()
			if self.north and sprite and sprite:getProperties():Val("WindowN")  then
				hasFrame = true
			print("Has Frame 5")
			end
			if not self.north and sprite and sprite:getProperties():Val("WindowW")  then
				hasFrame = true
			--print("Has Frame 6")
			end
		end
		local sprite = o:getSprite()
		if sprite:getProperties():Val("CustomName")=="Window Bars" then
			hasWindow = true
			print("Has Window 0")
		
		end
		if instanceof(o, 'IsoWindow')  or o:getProperties():Val("CustonName")=="Window Bars" then
			hasWindow = true
			print("Has Window 1")
		end
		--if o:getProperties():Val("WindowN")  and item:getNorth() then
		if o:getProperties():Val("WindowN")  and self.North then
			hasFrame = true
			print("Has Frame 7")
		elseif o:getProperties():Val("WindowW") then
			hasFrame = true
			--print("Has Frame 8")
		end--if o:getProperties():Val("WindowN")  and item:getNorth() then
		if o:getProperties():Val("Window") or o:getProperties():Val("CustonName")=="Window Bars" then
			hasWindow = true
			print("Has Window 2")
		end
	end
	--print("huh?")
    --if self.dontNeedFrame then return not hasWindow; end
	if hasWindow then return false end
	return hasFrame and not hasWindow
	--return hasFrame 
end

-- used to render more tile for example
function ArmoredWindow:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end
