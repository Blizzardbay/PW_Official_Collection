require "TimedActions/ISBaseTimedAction"

ISFireTrailAction = ISBaseTimedAction:derive("ISFireTrailAction");

function ISFireTrailAction:waitToStart() --dhert contrib + PourTrailOfFuel (dhert is a legend on anims)
    if self.character:isSeatedInVehicle() then
        -- If we are in a car, we should just stop here actually. This really shouldn't happen
        self:forceStop()
        return false
    end
    if self.clickedsquare == self.character:getCurrentSquare() then return false end
    self.character:faceLocation(self.clickedsquare:getX(), self.clickedsquare:getY())
    return self.character:shouldBeTurning()
end

--from burncorpse
function ISFireTrailAction:isValid()
    if not self.lighter then
        self.lighter = self.character:getPrimaryHandItem();
    end
    if not self.petrol then
        self.petrol = self.character:getSecondaryHandItem();
    end
    return self.character:getInventory():contains(self.petrol) or self.character:getInventory():contains(self.lighter);
end

function ISFireTrailAction:update()
	if self.isStartFire then
		self.lighter:setJobDelta(self:getJobDelta());
		self.character:facePosition(self.clickedsquare:getX(), self.clickedsquare:getY());
    else
		self.petrol:setJobDelta(self:getJobDelta());		
		--Firetrail.Set:add(self.character:getCurrentSquare())
		
		local square = self.character:getLastSquare()
		
		Firetrail.pathsSet[Firetrail.currentIndex]:add(square)
		
		--add puddles
		--self.character:splatBloodFloor() --small
		--addBloodSplat(square,20) --large
		--addBloodSplat(square,9) --large
		
		
		--local spriteiso = spriteObj:getSprite()
		--spriteObj:setDir(IsoDirections.W)
		--spriteObj:setCustomColor(0.6, 1.0, 1.0, 1.0)
		--spriteObj:transmitCustomColor()
		-- local Yellow = {name = "Yellow", r = 0.9, g = 0.9, b = 0.3, a = 1.0 }
		
		if self.lastSquare ~= square then
			
			for x=1, ZombRand(2)+3 do
				--"overlay_blood_floor_01_"..ZombRand(9)+1
				local spriteObj = IsoObject.new(square, "overlay_GASOLINE_floor_firetrail_"..ZombRand(6)+1, "GasPuddle",false);
				--spriteObj:setCustomColor(self.color)
				--spriteObj:transmitCustomColor()		
				square:AddTileObject(spriteObj);
			end
			
			self.lastSquare = square
		end
		
		--spriteObj:setOverlaySprite("overlay_blood_floor_01_5", Yellow.r, Yellow.g, Yellow.b, Yellow.a, true)
		--spriteObj:setAlphaAndTarget(1.0)
		--spriteObj:setOverlaySpriteColor(0.0, 0.9, 0.0, 1.0)
		
    end
    --self.character:facePosition(self.square:getX(), self.square:getY());
end

function ISFireTrailAction:start()
	if self.isStartFire then
		self.lighter:setJobType(getText("IGUI_JobType_Burn"));
		self.lighter:setJobDelta(0.0);
		self:setOverrideHandModels(self.lighter:getStaticModel(), nil);
		self:setActionAnim("BlowTorchFloor")
	else
		self.petrol:setJobType(getText("IGUI_JobType_Burn"));
		self.petrol:setJobDelta(0.0);
		self:setOverrideHandModels(self.petrol:getStaticModel(), nil);
		self:setActionAnim("PourTrailOfFuel")
		--self:setActionAnim(CharacterActionAnims.Pour);
	end

    --self:setActionAnim(CharacterActionAnims.Pour);
    --self:setActionAnim(CharacterActionAnims.DigTrowel);
    -- Don't call setOverrideHandModels() with self.petrol, the right-hand mask
    -- will bork the animation.
end

--from burncorpse
function ISFireTrailAction:stop()
    ISBaseTimedAction.stop(self);
    if self.lighter then
        self.lighter:setJobDelta(0.0);
    end
    if self.petrol then
        self.petrol:setJobDelta(0.0);
    end
	
end

function ISFireTrailAction:perform()

    --IsoFireManager.StartFire(getCell(), self.square:getSquare(), true, 100, 700);
--    getCell():getObjectList():add(self.square);

	if self.isStartFire then
		self.lighter:setJobDelta(0.0);
		self.lighter:Use();
		Firetrail:activateChainReaction(self.clickedsquare)
	else
		self.petrol:setJobDelta(0.0);
		self.petrol:Use();
	end

    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISFireTrailAction:new (character, clickedsquare, time, isStartFire)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.clickedsquare = clickedsquare;
    o.stopOnWalk = false; --be able to walk pouring
    o.stopOnRun = true;
    o.maxTime = time;
	o.isStartFire = isStartFire
	
	o.lastSquare = false
		
	--local Yellow = {name = "Yellow", r = 0.5, g = 0.0, b = 0.0, a = 0.4 }
	--local YellowColorInfo = ColorInfo.new( Yellow.r, Yellow.g, Yellow.b, Yellow.a);
	--o.color = YellowColorInfo
	
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
    return o
end
