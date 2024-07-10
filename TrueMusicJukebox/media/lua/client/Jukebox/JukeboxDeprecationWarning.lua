-- Warn players that this mod needs to be replaced.

JukeboxDeprecationWarning = JukeboxDeprecationWarning or ISPanel:derive("JukeboxDeprecationWarning")

JukeboxDeprecationWarning.realHoursPerDayIndex = {
	[1] = 0.25, [2] = 0.50, [3] = 1, [4] = 2, [5] = 3, 
	[6] = 4, [7] = 5, [8] = 6, [9] = 7, [10] = 8, [11] = 9, 
	[12] = 10, [13] = 11, [14] = 12, [15] = 12, [16] = 14, 
	[17] = 15, [19] = 16, [20] = 17, [21] = 18, [22] = 19, 
	[23] = 20, [24] = 21, [25] = 22, [26] = 23, [27] = 24
}

JukeboxDeprecationWarning.initializeTimeVariables = function()
	if JukeboxDeprecationWarning.timeVariablesInitialized then return end

	JukeboxDeprecationWarning.timeVariablesInitialized = true

	-- Initialize realHoursPerDay
	JukeboxDeprecationWarning.realHoursPerDay = JukeboxDeprecationWarning.realHoursPerDayIndex[SandboxVars.DayLength]

	JukeboxDeprecationWarning.oneRealHalfSecond = (1 / 7200) * (24 / JukeboxDeprecationWarning.realHoursPerDay)
end

JukeboxDeprecationWarning.getTime = function() 
	return GameTime.getInstance():getTimeOfDay()
end

function JukeboxDeprecationWarning:show(message)

    self.displayTime = 8 * (2 * JukeboxDeprecationWarning.oneRealHalfSecond)

	if self.fadeTicks and self.fadeTicks > 0 then
		self.messageQueue[#self.messageQueue + 1] = message
        return
	end

	self.time = JukeboxDeprecationWarning.getTime()

    self.message = message or "ERROR: No message provided."
    self.fadeTicks = 100 -- Used for fadeout and message queue.

    self.font = UIFont.Large

    self:setWidth(getTextManager():MeasureStringX(self.font, self.message) + 20)

    self:setX((getCore():getScreenWidth() / 2) - (self:getWidth() / 2))

    self:addToUIManager()
    self:setVisible(true)

    self:draw()

end

function JukeboxDeprecationWarning:draw()

    local opacity = math.min(1, self.fadeTicks / 100)

    local textHeight = getTextManager():getFontHeight(self.font)

    self:drawRectStatic(0, 0, self.width, self.height, opacity, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
    
    self:drawRectBorderStatic(0, 0, self.width, self.height, opacity, self.borderColor.r, self.borderColor.g, self.borderColor.b);

    self:drawTextCentre(self.message, self.width / 2, self.height / 2 - (textHeight / 2), 1, 0.6, 0, opacity, UIFont.Medium)

end

function JukeboxDeprecationWarning:prerender()

    if not (self.message and self.fadeTicks) then return end

	self:bringToTop()

    self:draw()

	local now = JukeboxDeprecationWarning.getTime()

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

function JukeboxDeprecationWarning:new(width, height, background)

    local o = {}

    local x = (getCore():getScreenWidth() / 2) - (width / 2)
    local y = 100

	o = ISPanel:new(x, y, width, height)

    setmetatable(o, self)

    self.__index = self

    o.backgroundColor = background
    o.fadeTicks = fadeTicks
    o.message = message

	o.displayTime = 8 * (2 * JukeboxDeprecationWarning.oneRealHalfSecond)

	o.messageQueue = {}

	o.time = JukeboxDeprecationWarning.getTime()

    o:initialise()
    
    return o

end

JukeboxDeprecationWarning.declare = function()
    JukeboxDeprecationWarning.instance:show("[1 / 6] WARNING: YOUR INSTALLED VERSION OF True Music Jukebox WAS DELETED FROM THE STEAM WORKSHOP ON JANUARY 26, 2024.")
    JukeboxDeprecationWarning.instance:show("[2 / 6] Please acquire the new version of True Music Jukebox (Workshop ID 3118990099) using the Steam Workshop.")
    JukeboxDeprecationWarning.instance:show("[3 / 6] This mod has been FULLY REWRITTEN with multiplayer support, bug fixes, and upgrades.")
    JukeboxDeprecationWarning.instance:show("[4 / 6] The new version is still called True Music Jukebox. YOUR VERSION, renamed TrueMusicJukebox (OLD)")
    JukeboxDeprecationWarning.instance:show("[5 / 6] Again, the new version of True Music Jukebox has Workshop ID 3118990099 on the Steam Workshop.")
    JukeboxDeprecationWarning.instance:show("[6 / 6] IMPORTANT: You must UNSUBSCRIBE FROM THIS VERSION when you subscribe to the new version. Sorry for the interruption!")

    JukeboxDeprecationWarning.hasBeenWarned = true
end

JukeboxDeprecationWarning.awaitGameFullyBegun = function()
    if JukeboxDeprecationWarning.hasBeenWarned then return end

    JukeboxDeprecationWarning.initializeTimeVariables()

    JukeboxDeprecationWarning.instance = JukeboxDeprecationWarning:new(getCore():getScreenWidth() - 80, 80, { r = 0.2, g = 0, b = 0, a = 1 })

    JukeboxDeprecationWarning.waitTicks = (JukeboxDeprecationWarning.waitTicks and (JukeboxDeprecationWarning.waitTicks - 1)) or 300

    if JukeboxDeprecationWarning.waitTicks == 300 then
        Events.OnTick.Add(JukeboxDeprecationWarning.awaitGameFullyBegun)
    elseif JukeboxDeprecationWarning.waitTicks == 0 then
        JukeboxDeprecationWarning.waitTicks = nil
        Events.OnTick.Remove(JukeboxDeprecationWarning.awaitGameFullyBegun)
        JukeboxDeprecationWarning.declare()
    end
end

Events.OnCreatePlayer.Add(JukeboxDeprecationWarning.awaitGameFullyBegun)
