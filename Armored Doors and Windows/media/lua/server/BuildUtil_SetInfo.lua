require "BuildingObjects/ISBuildUtil"

local old_buildUtil_setInfo = buildUtil.setInfo

function buildUtil.setInfo(javaObject, ISItem)
	old_buildUtil_setInfo(javaObject, ISItem)	
	if ISItem.modData and (ISItem.modData["use:Base.BlowTorch"] or ISItem.modData["use:Base.CordlessDrill"]) then
		javaObject:setThumpSound("ZombieThumpMetal")
	end
end

-- function ISBuildingObject:onTimedActionStart(action)
	-- print(tostring(action))
	-- local actionAnim = CharacterActionAnims.Build
	-- if self.actionAnim then
		-- actionAnim = self.actionAnim
	-- else
		-- if self.buildLow then
			-- actionAnim = CharacterActionAnims.BuildLow
		-- end
	-- end
	-- action:setActionAnim(actionAnim)
-- end

-- function buildUtil.setInfo(javaObject, ISItem)

	-- javaObject:setCanPassThrough(ISItem.canPassThrough);
	-- javaObject:setCanBarricade(ISItem.canBarricade);
	-- javaObject:setThumpDmg(ISItem.thumpDmg);
	-- javaObject:setIsContainer(ISItem.isContainer);
	-- javaObject:setIsDoor(ISItem.isDoor);
	-- javaObject:setIsDoorFrame(ISItem.isDoorFrame);
	-- javaObject:setCrossSpeed(ISItem.crossSpeed);
	-- javaObject:setBlockAllTheSquare(ISItem.blockAllTheSquare);
	-- javaObject:setName(ISItem.name);
	-- javaObject:setIsDismantable(ISItem.dismantable);
	-- javaObject:setCanBePlastered(ISItem.canBePlastered);
	-- javaObject:setIsHoppable(ISItem.hoppable);
	-- javaObject:setModData(copyTable(ISItem.modData));
    -- javaObject:setIsThumpable(ISItem.isThumpable);
    -- if ISItem.containerType and javaObject:getContainer() then
       -- javaObject:getContainer():setType(ISItem.containerType);
    -- end
    -- if ISItem.canBeLockedByPadlock then
        -- javaObject:setCanBeLockByPadlock(ISItem.canBeLockedByPadlock);
    -- end
	-- if ISItem.modData and (ISItem.modData["use:Base.BlowTorch"] or ISItem.modData["use:Base.CordlessDrill"]) then
		-- javaObject:setThumpSound("ZombieThumpMetal")
	-- end
-- end