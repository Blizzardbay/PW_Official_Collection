--************************************************************
--**        Whispering Zombies								**
--**		Code/Logic: Bicardine							**
--**		Helper: Scribl									**
--************************************************************
require "WZPhraseTimer"

local onWeaponHitCharacterPhrases = {}
local idlePhrases = {}
local lungePhrases = {}
local fakeDeadPhrases = {}
local thumpingPhrases = {}
local attackPhrases = {}
local eatBodyPhrases = {}

local function initPhrases(phrasesTable, count, key)
	for i = 1, count, 1 do
		local indexKey = key..tostring(i)
		table.insert(phrasesTable, getText(indexKey))
	end
end

initPhrases(onWeaponHitCharacterPhrases, 74, "UI_ZombiePhrases_OnWeaponHitCharacter")
initPhrases(idlePhrases, 89, "UI_ZombiePhrases_Idle")
initPhrases(lungePhrases, 81, "UI_ZombiePhrases_Lunge")
initPhrases(fakeDeadPhrases, 8, "UI_ZombiePhrases_FakeDead")
initPhrases(thumpingPhrases, 27, "UI_ZombiePhrases_Thumping")
initPhrases(attackPhrases, 36, "UI_ZombiePhrases_Attack")
initPhrases(eatBodyPhrases, 22, "UI_ZombiePhrases_EatBody")

local function getRandomPhrase(phrases)
    local randomIndex = ZombRandBetween(1, #phrases + 1)
    local randomPhrase = phrases[randomIndex]
    return randomPhrase
end


local zombieTimers = {}

local function initAndGetZombieData(id)
	zombieTimers[id] = PhraseTimer:new(
		ZombRandFloat(SandboxVars.WhisperingZombies.MinimumDelayBetweenSpecificPhrasesTimeInSeconds, SandboxVars.WhisperingZombies.MaximumDelayBetweenSpecificPhrasesTimeInSeconds),
		ZombRandFloat(SandboxVars.WhisperingZombies.MinimumDelayBetweenStatePhrasesTimeInSeconds, SandboxVars.WhisperingZombies.MaximumDelayBetweenStatePhrasesTimeInSeconds))
	return zombieTimers[id]
end

-- Enum used because EatBodyState:instance() kohlua exception but other states
local states = {
	attackState = "zombie.ai.states.AttackState",
	fakeDeadState = "zombie.ai.states.FakeDeadZombieState",
	lungeState = "zombie.ai.states.LungeState",
	thumpState = "zombie.ai.states.ThumpState",
	eatBodyState = "zombie.ai.states.ZombieEatBodyState",
}

local function getRandomPhraseFromStateName(stateName, isTimeToAnyStatePhrase)
	if stateName == states.attackState then
		return getRandomPhrase(attackPhrases)
	elseif stateName == states.fakeDeadState then
        return getRandomPhrase(fakeDeadPhrases)
	end

	if (isTimeToAnyStatePhrase) then
		if stateName == states.lungeState then
			return getRandomPhrase(lungePhrases)
		elseif stateName == states.thumpState then
			return getRandomPhrase(thumpingPhrases)
		elseif stateName == states.eatBodyState then
			return getRandomPhrase(eatBodyPhrases)
		end

		return getRandomPhrase(idlePhrases)
	end

	return nil
end


local minimalColorValue = 0.55
local maximumColorValue =  0.85

local function getRandomColor()
	return ZombRandFloat(minimalColorValue, maximumColorValue)
end


local worldSoundRadius = 15
local worldSoundVolume = 50
local worldSoundBStressHumans = true
local addLineChatElementRadius = 15

local function onZombieUpdate(zombie)
	local id = zombie:getID()
	local timer = zombieTimers[id]

	if timer == nil then 
		timer = initAndGetZombieData(id)
	end
	
	timer:updateElapsedTime()
	local isTimeToSpecificPhrase = timer:isTimeToSpecificPhrase()
	local isTimeToAnyStatePhrase = timer:isTimeToAnyStatePhrase()

	if isTimeToSpecificPhrase or isTimeToAnyStatePhrase then
		local state = zombie:getCurrentState()
		local phrase = getRandomPhraseFromStateName(tostring(state):match('^(.-)@'), isTimeToAnyStatePhrase)

        if phrase ~= nil then
			local color = getRandomColor()
			zombie:addLineChatElement(phrase, color, color, color, UIFont.Medium, addLineChatElementRadius, "")
			timer:reset(ZombRandFloat(SandboxVars.WhisperingZombies.MinimumDelayBetweenSpecificPhrasesTimeInSeconds, SandboxVars.WhisperingZombies.MaximumDelayBetweenSpecificPhrasesTimeInSeconds),
			ZombRandFloat(SandboxVars.WhisperingZombies.MinimumDelayBetweenStatePhrasesTimeInSeconds, SandboxVars.WhisperingZombies.MaximumDelayBetweenStatePhrasesTimeInSeconds))

			if SandboxVars.WhisperingZombies.ZombiesReactToPhrases then
				zombie:addWorldSoundUnlessInvisible(worldSoundRadius, worldSoundVolume, worldSoundBStressHumans)
			end
		end
	end
end


local function onHitZombie(zombie, character, bodyPartType, handWeapon)
	if ZombRand(101) > SandboxVars.WhisperingZombies.OnHitZombieChance then return end

	local id = zombie:getID()
	local timer = zombieTimers[id]
	local isTimeToSpecificPhrase = timer:isTimeToSpecificPhrase()

	if (isTimeToSpecificPhrase) then
		local phrase = getRandomPhrase(onWeaponHitCharacterPhrases)
		local color = getRandomColor()
		zombie:addLineChatElement(phrase, color, color, color, UIFont.Medium, addLineChatElementRadius, "")
		timer:reset(ZombRandFloat(SandboxVars.WhisperingZombies.MinimumDelayBetweenSpecificPhrasesTimeInSeconds, SandboxVars.WhisperingZombies.MaximumDelayBetweenSpecificPhrasesTimeInSeconds),
		ZombRandFloat(SandboxVars.WhisperingZombies.MinimumDelayBetweenStatePhrasesTimeInSeconds, SandboxVars.WhisperingZombies.MaximumDelayBetweenStatePhrasesTimeInSeconds))
	end
end


local function onZombieDead(zombie)
	zombieTimers[zombie:getID()] = nil
end

Events.OnZombieUpdate.Add(onZombieUpdate)
Events.OnHitZombie.Add(onHitZombie)
Events.OnZombieDead.Add(onZombieDead)