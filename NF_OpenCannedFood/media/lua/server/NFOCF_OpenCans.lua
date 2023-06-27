NFOCF = {}
NFOCF.OpenCan = {}

function NFOCF.OpenCan.OnCreate(items, result, player)
    local tHuntingKnife = "HuntingKnife"
    local tKitchenKnife = "KitchenKnife"
    local tStone = "Stone"
    local tTinOpener = "TinOpener"

    local itemType
    local item
    local random

    for i = 0, items:size() - 1 do
        itemType = items:get(i):getType()
        item = items:get(i)

        if itemType == tTinOpener then return end -- Nothing to do here, exiting
        if itemType == tHuntingKnife or itemType == tKitchenKnife or itemType == tStone then break end
    end

    -- ITEM: Stone
    if itemType == tStone then
        random = ZombRand(6)
        if random == 0 then
            player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):generateDeepWound()
        elseif random == 1 then
            player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):generateDeepWound()
        end
        return
    end

    -- ITEM: Kitchen or Hunting Knife
    local BREAK_CHANCE = { 70, 40, 10, 3 } -- chance in % to lose knife's condition (blade skill 0 to 3)

    local bladeSkill = player:getPerkLevel(Perks.SmallBlade)
    if bladeSkill > 3 then bladeSkill = 3 end

    -- Reduce condition of Kitchen Knife
    if itemType == tKitchenKnife then
        item:setCondition(item:getCondition() - 3)
    end

    random = ZombRand(100);
    if random < BREAK_CHANCE[bladeSkill + 1] then
        if itemType == tKitchenKnife then
            item:setCondition(item:getCondition() - 4)
        elseif itemType == tHuntingKnife then
            if bladeSkill == 3 then
                item:setCondition(item:getCondition() - 1)
            else
                item:setCondition(item:getCondition() - 2)
            end
        end
    end

    -- Injury
    local INJURY_CHANCE = { 13, 10, 7, 4 } -- chance in % to get hurt (blade skill 0 to 3)

    local luck = 0 -- increase by 3 if lucky, decrease by -3 if unlucky
    if player:HasTrait("Lucky") then luck = 3 end
    if player:HasTrait("Unlucky") then luck = -3 end

    random = ZombRand(100)
    if random < INJURY_CHANCE[bladeSkill + 1] - luck then
        random = ZombRand(2)
        if random == 0 then
            player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):generateDeepWound()
        elseif random == 1 then
            player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):generateDeepWound()
        end
    end
end

function NFOCF.OpenCan.OnTest(item)
    if (item:getType() == "KitchenKnife" or item:getType() == "HuntingKnife") and item:getCondition() < 1 then
        return false
    end

    --local player = getPlayer()
    --if player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):HasInjury() or player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):HasInjury() then
    --    return false
    --end
    return true
end