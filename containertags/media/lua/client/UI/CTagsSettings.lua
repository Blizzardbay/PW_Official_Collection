CTagsSettings = ISCollapsableWindow:derive("CTagsSettings");

function CTagsSettings:initialise()
	ISCollapsableWindow.initialise(self)
end

function CTagsSettings:render()
	if self:checkIfVisible() then
		for i = 0, self.entryCount - 1 do
			self:drawRect(0, self.entryH * i + self:titleBarHeight(), self.width, self.entryH - 2, 0.95,0.05,0.05,0.05);
			self:drawRectBorderStatic(0, self.entryH * i + self:titleBarHeight(), self.width, self.entryH, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
		end

		-- Draw ranges
		self:drawTextCentre('' .. self.rangeSlider.minValue, self.width * 0.05, self:titleBarHeight() + self.entryH * 0 + 16, 1, 1, 1, 1, UIFont.Small);
		self:drawTextCentre('' .. self.rangeSlider.maxValue, self.width * 0.95, self:titleBarHeight() + self.entryH * 0 + 16, 1, 1, 1, 1, UIFont.Small);
		self:drawTextCentre(getText("UI_RenderRange") .. CTags.settings.maxRange, self.width * 0.50, self:titleBarHeight() + self.entryH * 0 + 2, 1, 1, 1, 1, UIFont.Small);

		-- Draw font titles
		self:drawTextCentre(getText("UI_FontZoomedOut"), self.width * 0.50, self:titleBarHeight() + self.entryH * 1 + 2, 1, 1, 1, 1, UIFont.Small);
		self:drawTextCentre(getText("UI_FontZoomedIn"), self.width * 0.50, self:titleBarHeight() + self.entryH * 2 + 2, 1, 1, 1, 1, UIFont.Small);

		-- Bring to top
		self.rangeSlider:render();
		self.fontSmallChooser:prerender();
		self.fontLargeChooser:prerender();
		self.losBox:render();
		self.hoverBox:render();
		self.tagAnyBox:render();
		self.actionPriorityBox:render();
	end
end

function CTagsSettings:checkIfVisible() -- the game renders UI objects even if they're outside the stencil zone, which can cause severe amounts of lag in large lists. 
	if not self:isReallyVisible() then 
		self.removeWindow();
		return false 
	end
	local y = self:getAbsoluteY()
	local sh = getCore():getScreenHeight()
	if y < (0 - sh) or y > sh then
		return false
	else
		return true
	end
end

function CTagsSettings:onOptionChange(index, state, optionName, refresh)
	if CTagsUI.window and refresh then CTagsUI.removeWindow() end; -- close tag UI
	CTags.settings[optionName] = state;
	CTags:writeSettings(CTags.settings);
end

function CTagsSettings:createChildren()
	ISCollapsableWindow.createChildren(self);
	local titleH = self:titleBarHeight();
	local fonts = { "AutoNormLarge","AutoNormMedium","AutoNormSmall","Code","Cred1","Cred2","DebugConsole","Dialogue","Handwritten","Intro","Large","MainMenu1","MainMenu2","Massive","Medium","MediumNew","NewLarge","NewMedium","NewSmall","Small","Title" };

	local function stylizeCheckbox(checkbox)
		checkbox.borderColor = {r=1, g=1, b=1, a=1};
		checkbox.backgroundColor = {r=0, g=0, b=0, a=0.5};
		checkbox.choicesColor = {r=1, g=1, b=1, a=1};
		checkbox.textGap = 16;
		self:addChild(checkbox)
		checkbox:setWidthToFit()
	end


	self.rangeSlider = ISSliderPanel:new(self.width * 0.10, self.entryCount * self.entryH + titleH +  20, self.width * 0.80, self.entryH/4);
	self.rangeSlider:setVisible(true);
	self.rangeSlider:initialise();
	self.rangeSlider:setAlwaysOnTop(true);
	self.rangeSlider.minValue = 5;
	self.rangeSlider.maxValue = 50;
	self.rangeSlider.currentValue = CTags.settings.maxRange or 10;
	function self.rangeSlider:doOnValueChange(newValue)
		CTagsSettings.window:onOptionChange(0, newValue, "maxRange");
	end	
	self:addChild(self.rangeSlider);
	self.entryCount = self.entryCount + 1;

	self.fontSmallChooser = ISComboBox:new(0, self.entryCount * self.entryH + titleH + 20, self.width, self.entryH - 20, self, 
		function() 
			local font = self.fontSmallChooser:getSelectedText();
			CTagsSettings.window:onOptionChange(0, font, "fontSmall");
		end);
	self.fontSmallChooser.font = UIFont.Small;
	self.fontSmallChooser:initialise();
	self:addChild(self.fontSmallChooser);
	self.fontSmallChooser:addOption("Default");
	self.fontSmallChooser.selected = 1;
	for i,font in pairs(fonts) do
		self.fontSmallChooser:addOption(font);
        if font == CTags.settings.fontSmall then
        	self.fontSmallChooser.selected = i + 1;
        end		
	end	
	self.entryCount = self.entryCount + 1;

    self.fontLargeChooser = ISComboBox:new(0, self.entryCount * self.entryH + titleH + 20, self.width, self.entryH - 20, self, 
    	function() 
			local font = self.fontLargeChooser:getSelectedText();
			CTagsSettings.window:onOptionChange(0, font, "fontBig");
		end);
    self.fontLargeChooser.font = UIFont.Small;
    self.fontLargeChooser:initialise();
    self:addChild(self.fontLargeChooser);
    self.fontLargeChooser:addOption("Default");
    self.fontLargeChooser.selected = 1;
    for i,font in pairs(fonts) do
        self.fontLargeChooser:addOption(font);
        if font == CTags.settings.fontBig then
        	self.fontLargeChooser.selected = i + 1;
        end
    end  
    
    self.entryCount = self.entryCount + 1;

	self.losBox = ISTickBox:new(8, self.entryCount * self.entryH + titleH + 14, self.width, self.entryH, "", self, CTagsSettings.onOptionChange, "isLineOfSight")
	self.losBox:addOption(getText("UI_ModeLOS"), {})
	self.losBox:setSelected(1, CTags.settings.isLineOfSight);
	self.losBox:setAlwaysOnTop(true);
	stylizeCheckbox(self.losBox)
	self.entryCount = self.entryCount + 1;

	self.hoverBox = ISTickBox:new(8, self.entryCount * self.entryH + titleH + 14, self.width, self.entryH, "", self, CTagsSettings.onOptionChange, "isOnHover")
	self.hoverBox:addOption(getText("UI_ModeHovering"), {})
	self.hoverBox:setSelected(1, CTags.settings.isOnHover);
	self.hoverBox:setAlwaysOnTop(true);
	stylizeCheckbox(self.hoverBox)
	self.entryCount = self.entryCount + 1;	

	self.actionPriorityBox = ISTickBox:new(8, self.entryCount * self.entryH + titleH + 14, self.width, self.entryH, "", self, CTagsSettings.onOptionChange, "actionPriority")
	self.actionPriorityBox:addOption(getText("UI_TagActionPriority"), {})
	self.actionPriorityBox:setSelected(1, CTags.settings.actionPriority);
	self.actionPriorityBox:setAlwaysOnTop(true);
	stylizeCheckbox(self.actionPriorityBox)
	self.entryCount = self.entryCount + 1;	

	self.tagAnyBox = ISTickBox:new(8, self.entryCount * self.entryH + titleH + 14, self.width, self.entryH, "", self, CTagsSettings.onOptionChange, "isTagAnything")
	self.tagAnyBox:addOption(getText("UI_ModeTagAnything"), {})
	self.tagAnyBox:setSelected(1, CTags.settings.isTagAnything);
	self.tagAnyBox:setAlwaysOnTop(true);
	stylizeCheckbox(self.tagAnyBox)
	self.entryCount = self.entryCount + 1;	

	-- Resize
	self:setHeight(self.entryCount * self.entryH);
end

-- Entry point
function CTagsSettings.makeWindow(x, y)
	-- Don't store it, regenerate completely
	if CTagsSettings.window then CTagsSettings:removeWindow() end

	local window;
	local sw = getCore():getScreenWidth();
	local sh = getCore():getScreenHeight();

	window = CTagsSettings:new(getMouseX() + 40,getMouseY() - 150, 350, 350, weapon);
	window:setVisible(true)
	window:setResizable(false);
	window:addToUIManager()
	window.pin = true;
	CTagsSettings.window = window;
end

function CTagsSettings.removeWindow()
	local window = CTagsSettings.window;
	if not window then return end;
	window:setVisible(false)
	window:removeFromUIManager()
end

function CTagsSettings:new(x, y, width, height)
	local o = {};
	o = ISCollapsableWindow:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.title = "Container Tags Settings"
	o.x = x
	o.y = y
	o.width = width
	o.height = height
	o.borderColor = {r=1, g=1, b=1, a=0.7};	
	o.backgroundColor = {r=0, g=0, b=0, a=0.9};	
	o.clearStentil = false;

	o.entryCount = 0;
	o.entryH = 46;

	return o;
end
