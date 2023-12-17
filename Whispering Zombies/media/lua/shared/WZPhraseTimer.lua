--************************************************************
--**        Whispering Zombies								**
--**		Code/Logic: Bicardine							**
--**		Helper: Scribl									**
--************************************************************
PhraseTimer = {}
PhraseTimer.__index = PhraseTimer

function PhraseTimer:new(timeInSecondsToSpecificPhrase, timeInSecondsToAnyStatePhrase) 
	local obj = {}
	setmetatable(obj, PhraseTimer)

	obj.elapsedTimeInSeconds = 0
	obj.timeInSecondsToSpecificPhrase = timeInSecondsToSpecificPhrase
	obj.timeInSecondsToAnyStatePhrase = timeInSecondsToAnyStatePhrase

	return obj
end

function PhraseTimer:isTimeToAnyStatePhrase()
	return self.elapsedTimeInSeconds >= self.timeInSecondsToAnyStatePhrase
end

function PhraseTimer:isTimeToSpecificPhrase()
	return self.elapsedTimeInSeconds >= self.timeInSecondsToSpecificPhrase
end

function PhraseTimer:updateElapsedTime() 
	local realworldSecondsSinceLastUpdate = getGameTime():getRealworldSecondsSinceLastUpdate()
	self.elapsedTimeInSeconds = self.elapsedTimeInSeconds + realworldSecondsSinceLastUpdate 
end

function PhraseTimer:reset(timeInSecondsToSpecificPhrase, timeInSecondsToAnyStatePhrase)
	self.elapsedTimeInSeconds = 0
	self.timeInSecondsToSpecificPhrase = timeInSecondsToSpecificPhrase
	self.timeInSecondsToAnyStatePhrase = timeInSecondsToAnyStatePhrase
end