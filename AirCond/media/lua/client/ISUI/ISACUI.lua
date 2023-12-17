require "ISUI/ISPanelJoypad"


ISACUI = ISPanelJoypad:derive("ISACUI");

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

function ISACUI:loadDigits()

    self.digit1 = {}
    for i=1, 3 do
        self.digit1[i] = ISImage:new(73, 46, 10, 17, getTexture("media/ui/ClockAssets/ClockDigitsMedium" .. i .. ".png"))
        self.digit1[i]:initialise();
        self.digit1[i]:instantiate();
        self.digit1[i]:setColor(0.5, 1, 0.5);
        self.digit1[i]:setVisible(false)
        self:addChild(self.digit1[i]);
    end

    self.digit2 = {}
    for i=0, 9 do
        self.digit2[i] = ISImage:new(83, 46, 10, 17, getTexture("media/ui/ClockAssets/ClockDigitsMedium" .. i .. ".png"))
        self.digit2[i]:initialise();
        self.digit2[i]:instantiate();
        self.digit2[i]:setColor(0.5, 1, 0.5);
        self.digit2[i]:setVisible(false)
        self:addChild(self.digit2[i]);
    end

end

function ISACUI:loadVents()

    self.vents = {}
    for i=1, 5 do
        self.vents[i] = ISImage:new(184 + (i * 7), 46, 4, 17, getTexture("media/textures/vent" .. i .. ".png"))
        self.vents[i]:initialise();
        self.vents[i]:instantiate();
        -- self.vents[i]:setColor(0.5, 1, 0.5);
        self.vents[i]:setColor(0.5, 0.5, 0.5);
        self.vents[i]:setVisible(true)
        self:addChild(self.vents[i]);
    end

    self.ventsOn = {}
    for i=1, 5 do
        self.ventsOn[i] = ISImage:new(184 + (i * 7), 46, 4, 17, getTexture("media/textures/vent" .. i .. ".png"))
        self.ventsOn[i]:initialise();
        self.ventsOn[i]:instantiate();
        self.ventsOn[i]:setColor(0.5, 1, 0.5);
        self.ventsOn[i]:setVisible(false)
        self:addChild(self.ventsOn[i]);
    end
end

function ISACUI:updatePower()
    if self.object:isActivated() then
        self.buttonpon:setVisible(true)
        self.buttonpoff:setVisible(false)
    else
        self.buttonpon:setVisible(false)
        self.buttonpoff:setVisible(true)
    end
end

function ISACUI:updateDigits(n)

    self.temperature = n

    local t = tostring(n)
    local d1 = tonumber(string.sub(t, 1, 1))
    local d2 = tonumber(string.sub(t, 2, 2))

    for i=1, 3 do
        self.digit1[i]:setVisible(false)
    end
    for i=0, 9 do
        self.digit2[i]:setVisible(false)
    end
    self.image3:setVisible(false)
    self.image4:setVisible(false)
    
    if self.object:isActivated() then
        self.digit1[d1]:setVisible(true)
        self.digit2[d2]:setVisible(true)
        self.image3:setVisible(true)
        self.image4:setVisible(true)
    end
end

function ISACUI:updateFan(n)

    self.fan = n

    if self.object:isActivated() then
        self.image5:setVisible(true)
        for i=1, 5 do
            if n < i then
                self.vents[i]:setVisible(true)
                self.ventsOn[i]:setVisible(false)
            else
                self.vents[i]:setVisible(false)
                self.ventsOn[i]:setVisible(true)
            end
        end
    else
        self.image5:setVisible(false)
        for i=1, 5 do
            self.vents[i]:setVisible(false)
            self.ventsOn[i]:setVisible(false)
        end
    end
end

function ISACUI:initialise()
    ISPanelJoypad.initialise(self);

    local md = self.object:getModData()

    if md['targettemp'] then
        self.temperature = md['targettemp']
    end

    if md['targetfan'] then
        self.fan = md['targetfan']
    end

    --power
    
    self.buttonpon = ISButton:new(25, 40, 32, 32, "", self, ISACUI.onClick);
    self.buttonpon.internal = "POWERON";
    self.buttonpon:initialise();
    self.buttonpon:instantiate();
    self.buttonpon.borderColor = {r=1, g=1, b=1, a=0.1};
    self.buttonpon:setImage(getTexture("media/textures/power_on.png"))
    self.buttonpon:setVisible(false)
    self:addChild(self.buttonpon);

    self.buttonpoff = ISButton:new(25, 40, 32, 32, "", self, ISACUI.onClick);
    self.buttonpoff.internal = "POWEROFF";
    self.buttonpoff:initialise();
    self.buttonpoff:instantiate();
    self.buttonpoff.borderColor = {r=1, g=1, b=1, a=0.1};
    self.buttonpoff:setImage(getTexture("media/textures/power_off.png"))
    self.buttonpoff:setVisible(false)
    self:addChild(self.buttonpoff);

    self:updatePower()

    --temp

    self.image3 = ISImage:new(93, 46, 10, 17, getTexture("media/ui/ClockAssets/ClockDigitsMediumDot.png"))
    self.image3:initialise();
    self.image3:instantiate();
    self.image3:setColor(0.5, 1, 0.5);
    self.image3:setVisible(false)
    self:addChild(self.image3);

    self.image4 = ISImage:new(96, 46, 10, 17, getTexture("media/ui/ClockAssets/ClockDigitsMediumC.png"))
    self.image4:initialise();
    self.image4:instantiate();
    self.image4:setColor(0.5, 1, 0.5);
    self.image4:setVisible(false)
    self:addChild(self.image4);

    self:loadDigits()
    self:updateDigits(self.temperature)

    self.button1p = ISButton:new(116, 39, 27, 17, "", self, ISACUI.onClick);
    self.button1p.internal = "DIGITPLUS";
    self.button1p:initialise();
    self.button1p:instantiate();
    self.button1p.borderColor = {r=1, g=1, b=1, a=0.1};
    self.button1p:setImage(getTexture("media/textures/ac_up_big.png"))
    self:addChild(self.button1p);

    self.button1m = ISButton:new(116, 56, 27, 17, "", self, ISACUI.onClick);
    self.button1m.internal = "DIGITMINUS";
    self.button1m:initialise();
    self.button1m:instantiate();
    self.button1m:setImage(getTexture("media/textures/ac_down_big.png"))
    self.button1m.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button1m);

    --vent

    self.image5 = ISImage:new(168, 47, 17, 17, getTexture("media/textures/fan.png"))
    self.image5:initialise();
    self.image5:instantiate();
    self.image5:setColor(0.4, 0.9, 0.4);
    self.image5:setVisible(false)
    self:addChild(self.image5);

    self:loadVents()
    self:updateFan(self.fan)

    self.button2p = ISButton:new(232, 39, 27, 17, "", self, ISACUI.onClick);
    self.button2p.internal = "FANPLUS";
    self.button2p:initialise();
    self.button2p:instantiate();
    self.button2p.borderColor = {r=1, g=1, b=1, a=0.1};
    self.button2p:setImage(getTexture("media/textures/ac_up_big.png"))
    self:addChild(self.button2p);

    self.button2m = ISButton:new(232, 56, 27, 17, "", self, ISACUI.onClick);
    self.button2m.internal = "FANMINUS";
    self.button2m:initialise();
    self.button2m:instantiate();
    self.button2m:setImage(getTexture("media/textures/ac_down_big.png"))
    self.button2m.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button2m);

    self.ok = ISButton:new((self:getWidth() - 100) / 2, 80, 100, 24, getText("UI_Ok"), self, ISACUI.onClick);
    self.ok.internal = "OK";
    self.ok:initialise();
    self.ok:instantiate();
    self.ok.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.ok);

    self:setHeight(self.ok:getBottom() + 5)

    self:insertNewLineOfButtons(self.button1p, self.button2p)
    self:insertNewLineOfButtons(self.ok)
end

function ISACUI:destroy()
    UIManager.setShowPausedMessage(true);
    self:setVisible(false);
    self:removeFromUIManager();
end

function ISACUI:onClick(button)

    if button.internal == "POWERON" then
        self:powerOff();
    end
    if button.internal == "POWEROFF" then
        self:powerOn();
    end
    if button.internal == "DIGITPLUS" then
        self:incrementTemp(self.temperature);
    end
    if button.internal == "DIGITMINUS" then
        self:decrementTemp(self.temperature);
    end
    if button.internal == "FANPLUS" then
        self:incrementFan(self.fan);
    end
    if button.internal == "FANMINUS" then
        self:decrementFan(self.fan);
    end
    if button.internal == "OK" then
        self:destroy();
    end
    self:updateNow()
end

function ISACUI:powerOff(number)
    self.object:setActivated(false)

	if isClient() then
		local args = { x = self.object:getX(), y = self.object:getY(), z = self.object:getZ() }
		sendClientCommand(self.character, 'ac_commands', 'toggle', args)
	end
		
    -- updateAC()
    self:updatePower()
    self:updateDigits(self.temperature)
    self:updateFan(self.fan)
end

function ISACUI:powerOn(number)
    self.object:setActivated(true)
    
    if isClient() then
        local args = { x = self.object:getX(), y = self.object:getY(), z = self.object:getZ() }
        sendClientCommand(self.character, 'ac_commands', 'toggle', args)
    end

    -- updateAC()
    self:updatePower()
    self:updateDigits(self.temperature)
    self:updateFan(self.fan)
end


function ISACUI:incrementTemp(number)
    local newNumber = number + 1;
    if newNumber > 30 then
        newNumber = 30;
    end
    -- number:setText(newNumber .. "");
    self:updateDigits(newNumber)
end

function ISACUI:decrementTemp(number)
    local newNumber = number - 1;
    if newNumber < 10 then
        newNumber = 10;
    end
    -- number:setText(newNumber .. "");
    self:updateDigits(newNumber)
end

function ISACUI:incrementFan(number)
    local newNumber = number + 1;
    if newNumber > 5 then
        newNumber = 5;
    end
    -- number:setText(newNumber .. "");
    self:updateFan(newNumber)
end

function ISACUI:decrementFan(number)
    local newNumber = number - 1;
    if newNumber < 1 then
        newNumber = 1;
    end
    -- number:setText(newNumber .. "");
    self:updateFan(newNumber)
end

function ISACUI:prerender()
    self.backgroundColor.a = 0.8
    self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
    self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);

    self:drawRect(64, 40, 50, 30, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
    self:drawRectBorder(64, 40, 50, 30, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);

    self:drawRect(160, 40, 70, 30, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
    self:drawRectBorder(160, 40, 70, 30, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);


    self:drawTextCentre("Air Conditioner", self:getWidth()/2, 10, 1, 1, 1, 1, UIFont.Small);
end

--************************************************************************--
--** ISAlarmClockDialog:render
--**
--************************************************************************--
function ISACUI:render()

end

function ISACUI:update()
end

function ISACUI:updateNow()
    local md = self.object:getModData()
    md['targettemp'] = self.temperature
    md['targetfan'] = self.fan
    
    if isClient() then
        local args = { x = self.object:getX(), y = self.object:getY(), z = self.object:getZ(),  targettemp = self.temperature, targetfan = self.fan}
        sendClientCommand(self.character, 'ac_commands', 'settings', args)
    end

    if self.character:DistTo(self.object:getX(), self.object:getY()) > self.rangeLimit then
        self:setVisible(false);
        self:removeFromUIManager();
    end

    ISPanelJoypad.update(self)
    if self.ok.joypadFocused then
        self.ok:setJoypadButton(Joypad.Texture.AButton)
    else
        self.ok.joypadTexture = nil
        self.ok.isJoypad = false
    end
end

function ISACUI:onGainJoypadFocus(joypadData)
    ISPanelJoypad.onGainJoypadFocus(self, joypadData)
    self.joypadIndexY = 1
    self.joypadIndex = 1
    self.joypadButtons = self.joypadButtonsY[self.joypadIndexY]
    self.joypadButtons[self.joypadIndex]:setJoypadFocused(true)
end

function ISACUI:onJoypadDown(button)
    ISPanelJoypad.onJoypadDown(self, button)
    if button == Joypad.BButton then
        self:onClick(self.ok)
    end
end

function ISACUI:getCode()
    local n1 = tonumber(self.number1:getText()) * 100
    local n2 = tonumber(self.number2:getText()) * 10
    local n3 = tonumber(self.number3:getText())
    return n1 + n2 + n3
end

--************************************************************************--
--** ISAlarmClockDialog:new
--**
--************************************************************************--
function ISACUI:new(x, y, width, height, object, character, rangeLimit)
    local o = {}
    o = ISPanelJoypad:new(x, y, width, height);
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.name = nil;
    o.backgroundColor = {r=0, g=0, b=0, a=0.5};
    o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
    o.width = width;
    o.height = height;
    o.anchorLeft = true;
    o.anchorRight = true;
    o.anchorTop = true;
    o.anchorBottom = true;
    o.rangeLimit = rangeLimit

    local player = character:getPlayerNum()
    if y == 0 then
        o.y = (getPlayerScreenHeight(player) - height) / 2
        o:setY(o.y)
    end
    if x == 0 then
        o.x = (getPlayerScreenWidth(player) - width) / 2
        o:setX(o.x)
    end
    
    o.temperature = 20
    o.fan = 3
    o.object = object;

    return o;
end

