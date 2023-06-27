require "TimedActions/ISBaseTimedAction"






function ISMoveablesAction:isValid()
	if self.character:hasEquipped("CordlessDrill") then
		local Drill = self.character:getPrimaryHandItem()
		-- if Drill:getUsedDelta() and Drill:getUsedDelta() < Drill:getUseDelta() then
		if instanceof(Drill, "DrainableComboItem") and Drill:getUsedDelta() < Drill:getUseDelta() then
			return false
		end
	end
    return true;
end


-- function ISMoveablesAction:start()
    -- self:setActionSound();
    -- if self.sound then
        -- --self.sound = sound;
        -- self.sound:stop();
    -- end
    -- if self.mode and self.mode=="scrap" then
        -- if self.character:hasEquipped("BlowTorch") then
            -- self:setActionAnim("BlowTorch")
            -- self:setOverrideHandModels(self.character:getPrimaryHandItem(), nil)
        -- elseif self.character:hasEquippedTag("Hammer") then
            -- self:setActionAnim(CharacterActionAnims.Build)
            -- self:setOverrideHandModels(self.character:getPrimaryHandItem(), nil)
        -- else
            -- self:setActionAnim(CharacterActionAnims.Disassemble);
            -- self:setOverrideHandModels("Screwdriver", nil);
        -- end
    -- end
	
	-- if self.character:hasEquipped("CordlessDrill") then
            -- self:setOverrideHandModels("Drill", nil);
            -- self:setActionAnim("BlowTorch")
		-- --local Drill = self.character:getPrimaryHandItem()
		-- --Drill:setUsedDelta(Drill:getUsedDelta() - Drill:getUseDelta())	
	-- end
-- end


local old_ISMoveablesAction_start = ISMoveablesAction.start
function ISMoveablesAction:start()
    -- self:setActionSound();
    -- if self.sound then
        -- --self.sound = sound;
        -- self.sound:stop();
    -- end
    -- if self.mode and self.mode=="scrap" then
        -- if self.character:hasEquipped("BlowTorch") then
            -- self:setActionAnim("BlowTorch")
            -- self:setOverrideHandModels(self.character:getPrimaryHandItem(), nil)
        -- elseif self.character:hasEquippedTag("Hammer") then
            -- self:setActionAnim(CharacterActionAnims.Build)
            -- self:setOverrideHandModels(self.character:getPrimaryHandItem(), nil)
        -- else
            -- self:setActionAnim(CharacterActionAnims.Disassemble);
            -- self:setOverrideHandModels("Screwdriver", nil);
        -- end
    -- end
	old_ISMoveablesAction_start(self)
	if self.character:hasEquipped("CordlessDrill") then
            self:setOverrideHandModels("Drill", nil);
            self:setActionAnim("BlowTorch")
		--local Drill = self.character:getPrimaryHandItem()
		--Drill:setUsedDelta(Drill:getUsedDelta() - Drill:getUseDelta())	
	end
	--ISBaseTimedAction.perform(self);
end


local old_ISMoveablesAction_perform = ISMoveablesAction.perform
function ISMoveablesAction:perform()
    -- if self.sound and self.sound:isPlaying() then
        -- self.sound:stop();
    -- end

    -- if self.moveProps and self.moveProps.isMoveable and self.mode and self.mode ~= "scrap" then
        -- self.moveProps.cursorFacing = self.cursorFacing
        -- if self.mode == "pickup" then
            -- self.moveProps:pickUpMoveableViaCursor( self.character, self.square, self.origSpriteName, self.moveCursor ); --OrigSpriteName currently not used in this one.
        -- elseif self.mode == "place" then
            -- self.moveProps:placeMoveableViaCursor( self.character, self.square, self.origSpriteName, self.moveCursor );
        -- elseif self.mode == "rotate" then
            -- self.moveProps:rotateMoveableViaCursor( self.character, self.square, self.origSpriteName, self.moveCursor );
        -- end
        -- self.moveProps.cursorFacing = nil
    -- elseif self.mode and self.mode=="scrap" then
        -- self.moveProps:scrapObjectViaCursor( self.character, self.square, self.origSpriteName, self.moveCursor );
    -- end

    --ISBaseTimedAction.perform(self)
	old_ISMoveablesAction_perform(self)
	if self.character:hasEquipped("CordlessDrill") then
		local Drill = self.character:getPrimaryHandItem()
		if instanceof(Drill, "DrainableComboItem") then
			Drill:setUsedDelta(Drill:getUsedDelta() - Drill:getUseDelta())	
		end
	end
end