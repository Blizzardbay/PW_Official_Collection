local MaskEfficiency = 0
local prevSicknessLevel = -1

local MaskEfficiencyTable = {
    -- Better Masks
    ["NMBM.Hat_DisposableMask_White"] = 0.5,                         -- Disposable Mask
    ["NMBM.Hat_DisposableMask_Black"] = 0.5,                         -- Disposable Mask
    ["NMBM.Hat_SpiffoMask_Black"] = 0.55,                         -- Spiffo Mask
    ["NMBM.Hat_SpiffoMask_White"] = 0.55,                         -- Spiffo Mask
    ["NMBM.Hat_SpiffoMask_Yellow"] = 0.55,                         -- Spiffo Mask
    ["NMBM.Hat_XMaskWhite"] = 0.55,                         -- X Face Mask
    ["NMBM.Hat_XMaskBlack"] = 0.55,                         -- X Face Mask
    ["NMBM.Hat_XMaskBlack_Red"] = 0.55,                         -- X Face Mask
    ["NMBM.Hat_SmileMaskYellow"] = 0.55,                         -- Smile Face Mask
    ["NMBM.Hat_SmileMaskBlack"] = 0.55,                         -- Smile Face Mask
    ["NMBM.Hat_HalloweenMask1"] = 0.55,                         -- Jack-o'-lantern Face Mask
    ["NMBM.Hat_FaceMaskBlack"] = 0.55,                         -- Black Face Mask
    ["NMBM.Hat_FaceMaskYellow"] = 0.55,                         -- Yellow Face Mask
    ["NMBM.Hat_FaceMaskNavy"] = 0.55,                         -- Navy Face Mask
    ["NMBM.Hat_FaceMaskWhite"] = 0.55,                         -- White Face Mask
    ["NMBM.Hat_AdidasFaceMask_Black"] = 0.55,                         -- Adidas Black Face Mask
    ["NMBM.Hat_AdidasFaceMask_White"] = 0.55,                         -- Adidas White Face Mask
    ["NMBM.Hat_WoodlandFaceMask"] = 0.55,                         -- Woodland Camo Face Mask
    ["NMBM.Hat_FaceMaskRed"] = 0.55,                         -- Red Face Mask
    ["NMBM.Hat_FaceMaskLeopardPrint"] = 0.55,                         -- Leopard Print Face Mask
    ["NMBM.Hat_FaceMaskLeopardPrint2"] = 0.55,                         -- Leopard Print Face Mask
    ["NMBM.Hat_FaceMaskJollyRoger"] = 0.55,                         -- Jolly Roger Face Mask
    ["NMBM.Hat_FaceMaskCatWhiskersBlack"] = 0.55,                         -- Cat Whiskers Face Mask
    ["NMBM.Hat_FaceMaskCatWhiskersWhite"] = 0.55,                         -- Cat Whiskers Face Mask
    ["NMBM.Hat_FaceMaskCatWhiskersPink"] = 0.55,                         -- Cat Whiskers Face Mask
    ["NMBM.Hat_HalfMaskRespirator_Black"] = 0.85,                         -- Half Mask Respirator
    ["NMBM.Hat_HalfMaskRespirator_White"] = 0.85,                         -- Half Mask Respirator
    ["NMBM.Hat_TR2TacticalRespirator"] = 0.85,                         -- TR2 Respirator
    ["NMBM.Hat_HalfMaskRespiratorII_Black"] = 0.85,                         -- Half Mask Respirator II
    ["NMBM.Hat_HalfMaskRespiratorII_White"] = 0.85,                         -- Half Mask Respirator II

}


local function setEfficiencyForItem(maskItem)
    local type = maskItem:getFullType()
    local maskEfficiencyRaw = 0
    if MaskEfficiencyTable[type] ~= nil  then
        MaskEfficiency = MaskEfficiencyTable[type] * maskItem:getCondition() / maskItem:getConditionMax()
    else
--[[        local tags = ScriptManager.instance:getItem(type):getTags()
        for i=0,tags:size() do
            local tag = tags:get(i)
            if tag == "GasMask" or tag == "HazmatSuit" then
                MaskEfficiency = 1
                return
            end
        end]]
        MaskEfficiency = 0
    end
end

local function UpdateMaskEfficiency(player)
    local wornItems = player:getWornItems()
    local maskItem = wornItems:getItem("Mask")
    if maskItem then
        setEfficiencyForItem(maskItem)
    else
        maskItem = wornItems:getItem("MaskEyes")
        if maskItem then
            setEfficiencyForItem(maskItem)
        else
            maskItem = wornItems:getItem("MaskFull")
            if maskItem then
                setEfficiencyForItem(maskItem)
            else
                maskItem = wornItems:getItem("FullHat")
                if maskItem then
                    setEfficiencyForItem(maskItem)
                else
                    maskItem = wornItems:getItem("FullSuitHead")
                    if maskItem then
                        setEfficiencyForItem(maskItem)
                    else
                        MaskEfficiency = 0
                    end
                end
            end
        end
    end
end


local function ApplyMaskEfficiency(player)
    local bodyDamage = player:getBodyDamage()
	if prevSicknessLevel < 0.0 then --get initial value
		prevSicknessLevel = bodyDamage:getFoodSicknessLevel()
	end
    local currentSickness = bodyDamage:getFoodSicknessLevel()
    if MaskEfficiency > 0.0 and currentSickness > 0.0 then
        local newSickness = currentSickness
        local gameTimeMultiplier = GameTime.getInstance():getMultiplier()
        local deltaSicknessLevel = currentSickness - prevSicknessLevel
        local poisonLevel = bodyDamage:getPoisonLevel()
        if deltaSicknessLevel > 0 then
            -- we cannot get the number of corpses, because that value is not exposed in lua, so we calculate it backwards ourselves
            local sicknessFromCorpses
            if poisonLevel > 0.0 then --use different formula if poisoned
                --original formula for 41.65
                sicknessFromCorpses = deltaSicknessLevel - ((bodyDamage:getInfectionGrowthRate() * (2 + Math.round(bodyDamage:getPoisonLevel() / 10.0))) * gameTimeMultiplier)
            else
                sicknessFromCorpses = deltaSicknessLevel
            end
            local sicknessFromCorpseRate = BodyDamage.getSicknessFromCorpsesRate(6) -- Damage is calculated for any corpse above 5
            local estimatedCorpses = sicknessFromCorpses / sicknessFromCorpseRate / gameTimeMultiplier
            local sicknessFromCorpsesAdjusted = Math.min(Math.ceil(estimatedCorpses), 20) * sicknessFromCorpseRate * gameTimeMultiplier-- capped at 20 corpses
            if sicknessFromCorpses > 0 then
                newSickness = newSickness - (sicknessFromCorpsesAdjusted * MaskEfficiency)
            end
        end
        if newSickness < 0 then
            newSickness = 0
        end
        bodyDamage:setFoodSicknessLevel(newSickness);
        prevSicknessLevel = newSickness
    else
        prevSicknessLevel = currentSickness
    end
end

local function OnCreatePlayer(playerIndex, player)
    if (playerIndex == 0) then
        UpdateMaskEfficiency(player)
    end
end

Events.OnClothingUpdated.Add(UpdateMaskEfficiency)
Events.OnPlayerUpdate.Add(ApplyMaskEfficiency)
Events.OnCreatePlayer.Add(OnCreatePlayer)