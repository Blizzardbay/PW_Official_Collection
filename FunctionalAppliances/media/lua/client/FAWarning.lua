-- Warn players that this mod should be replaced with FA2
-- Orginal modified from Burryaga's code for the old TrueMusicJukebox

if getActivatedMods():contains("FunctionalAppliances") and getActivatedMods():contains("FunctionalAppliances2") then 
	print("FunctionalAppliances: Warning! FunctionalAppliances and FunctionalAppliances2 should not be loaded at the same time in the mod list. Use only FunctionalAppliances2 unless you are not ready to upgrade.")
else
	return
end

FADeprecationWarning = FADeprecationWarning or ISPanel:derive("FADeprecationWarning")

FADeprecationWarning.realHoursPerDayIndex = {
	[1] = 0.25, [2] = 0.50, [3] = 1, [4] = 2, [5] = 3, 
	[6] = 4, [7] = 5, [8] = 6, [9] = 7, [10] = 8, [11] = 9, 
	[12] = 10, [13] = 11, [14] = 12, [15] = 12, [16] = 14, 
	[17] = 15, [19] = 16, [20] = 17, [21] = 18, [22] = 19, 
	[23] = 20, [24] = 21, [25] = 22, [26] = 23, [27] = 24
}

FADeprecationWarning.initializeTimeVariables = function()
	if FADeprecationWarning.timeVariablesInitialized then return end

	FADeprecationWarning.timeVariablesInitialized = true

	-- Initialize realHoursPerDay
	FADeprecationWarning.realHoursPerDay = FADeprecationWarning.realHoursPerDayIndex[SandboxVars.DayLength]

	FADeprecationWarning.oneRealHalfSecond = (1 / 7200) * (24 / FADeprecationWarning.realHoursPerDay)
end

FADeprecationWarning.getTime = function() 
	return GameTime.getInstance():getTimeOfDay()
end

function FADeprecationWarning:show(message)

    self.displayTime = 8 * (2 * FADeprecationWarning.oneRealHalfSecond)

	if self.fadeTicks and self.fadeTicks > 0 then
		self.messageQueue[#self.messageQueue + 1] = message
        return
	end

	self.time = FADeprecationWarning.getTime()

    self.message = message or "ERROR: No message provided."
    self.fadeTicks = 100 -- Used for fadeout and message queue.

    self.font = UIFont.Large

    self:setWidth(getTextManager():MeasureStringX(self.font, self.message) + 20)

    self:setX((getCore():getScreenWidth() / 2) - (self:getWidth() / 2))

    self:addToUIManager()
    self:setVisible(true)

    self:draw()

end

function FADeprecationWarning:draw()

    local opacity = math.min(1, self.fadeTicks / 100)

    local textHeight = getTextManager():getFontHeight(self.font)

    self:drawRectStatic(0, 0, self.width, self.height, opacity, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
    
    self:drawRectBorderStatic(0, 0, self.width, self.height, opacity, self.borderColor.r, self.borderColor.g, self.borderColor.b);

    self:drawTextCentre(self.message, self.width / 2, self.height / 2 - (textHeight / 2), 1, 0.6, 0, opacity, UIFont.Medium)

end

function FADeprecationWarning:prerender()

    if not (self.message and self.fadeTicks) then return end

	self:bringToTop()

    self:draw()

	local now = FADeprecationWarning.getTime()

	local minuend = (now > self.time and now) or (24 + now)

	local difference = minuend - self.time

	-- Gives at least 5 seconds before fadeout.
	
	if difference < self.displayTime then return end

    self.fadeTicks = self.fadeTicks - 1

    if self.fadeTicks < 90 and #self.messageQueue > 0 then
        self.fadeTicks = 0
        local message = self.messageQueue[1]
        self:show(message)
        table.remove(self.messageQueue, 1)
        return
    end

    if self.fadeTicks == 0 then 
        self.message = nil
        self.fadeTicks = nil
        self:close()
        self:removeFromUIManager()
    end

end

function FADeprecationWarning:new(width, height, background)

    local o = {}

    local x = (getCore():getScreenWidth() / 2) - (width / 2)
    local y = 100

	o = ISPanel:new(x, y, width, height)

    setmetatable(o, self)

    self.__index = self

    o.backgroundColor = background
    o.fadeTicks = fadeTicks
    o.message = message

	o.displayTime = 8 * (2 * FADeprecationWarning.oneRealHalfSecond)

	o.messageQueue = {}

	o.time = FADeprecationWarning.getTime()

    o:initialise()
    
    return o

end

FADeprecationWarning.declare = function()
    FADeprecationWarning.instance:show("[1 / 5] WARNING: FunctionalAppliances and FunctionalAppliances2 are both loaded at the same time.")
    FADeprecationWarning.instance:show("[2 / 5] To avoid errors, only load one of them. Both use Workshop ID: 3042138819 each have their own Mod ID's.")
    FADeprecationWarning.instance:show("[3 / 5] For original users waiting to upgrade, use Mod ID: FunctionalAppliances")
    FADeprecationWarning.instance:show("[4 / 5] For new users or if you are ready to upgrade, use Mod ID: FunctionalAppliances2")
    FADeprecationWarning.instance:show("[5 / 5] Only FunctionalAppliances2 is being updated for future use. Loading both may cause issues.")

    FADeprecationWarning.hasBeenWarned = true
end

FADeprecationWarning.awaitGameFullyBegun = function()
    if FADeprecationWarning.hasBeenWarned then return end

    FADeprecationWarning.initializeTimeVariables()

    FADeprecationWarning.instance = FADeprecationWarning:new(getCore():getScreenWidth() - 80, 80, { r = 0.2, g = 0, b = 0, a = 1 })

    FADeprecationWarning.waitTicks = (FADeprecationWarning.waitTicks and (FADeprecationWarning.waitTicks - 1)) or 300

    if FADeprecationWarning.waitTicks == 300 then
        Events.OnTick.Add(FADeprecationWarning.awaitGameFullyBegun)
    elseif FADeprecationWarning.waitTicks == 0 then
        FADeprecationWarning.waitTicks = nil
        Events.OnTick.Remove(FADeprecationWarning.awaitGameFullyBegun)
        FADeprecationWarning.declare()
    end
end

Events.OnCreatePlayer.Add(FADeprecationWarning.awaitGameFullyBegun)