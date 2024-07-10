CTagsUI = ISCollapsableWindow:derive("CTagsUI");

function CTagsUI:initialise()
	ISCollapsableWindow.initialise(self)
end

function CTagsUI:createChildren()
	ISCollapsableWindow.createChildren(self);
	local titleH = self:titleBarHeight();
	local inputH = 28;

	self.textField = ISTextBox:new(0.001, titleH, self.width, inputH, "", self.text);
	self.textField.anchorRight = true;
	self.textField.anchorLeft = false;
	self.textField:initialise();
	self.textField:enableColorPicker();
	self.textField.yes:setVisible(false);
	self.textField.no:setVisible(false);
	self.textField:onPickedColor(self.color);
	self.textField:setVisible(true);
	function self.textField:onMouseMove(dx, dy) end
	function self.textField:onMouseMoveOutside(dx, dy) end
	self:addChild(self.textField);

	self.applyButton = ISButton:new(0, titleH + inputH, self.width, self.height - (inputH + titleH), "Apply", self, function () CTagsUI:apply(self) end);
	self.applyButton.anchorRight = true;
	self.applyButton.anchorLeft = false;
	self.applyButton:initialise();
	self.applyButton.borderColor.a = 0.0;
	self.applyButton.backgroundColor.a = 1;
	self.applyButton.backgroundColorMouseOver.a = 0.5;
	self.applyButton:setVisible(true);
	self:addChild(self.applyButton);
end

function CTagsUI:loop() 
	local faction = CTags:getFaction();
	if not faction and CTags.mode == 2 then 
		CTagsUI:removeWindow() 
		return
	end

	if not CTagsUI.window:isVisible() then
		CTagsUI:removeWindow() 
		return
	end
	-- Loop
	CTags:sleepDo(0.1, CTagsUI.loop);
end

function CTagsUI:apply(ui)
	local object = ui.object;
	local square = object:getSquare();
	local squareID = ui.squareID;
	local spriteName = ui.spriteName;
	local textField = ui.textField;
	local text = textField.entry:getText();
	local color = textField.colorBtn.backgroundColor;
	local player = getPlayer();
	local faction = CTags:getFaction();
	local renderOffset = ui.renderOffset;

	-- Too long
	if ui.maxChars and textField.entry:getInternalText():len() > ui.maxChars then
		ui.applyButton.tooltip = getText("IGUI_TextBox_TooManyChar", ui.maxChars);
		return
	end

	-- Personal
	if ui.mode == 1 then
		local tagData = ModData.getOrCreate("ContainerTagData");
		if not tagData.tags then tagData.tags = {} end;
		local tags = tagData.tags;

		if textField.entry:getInternalText():len() == 0 then
			tagData.tags[squareID] = {};
		else 
			tagData.tags[squareID] = { ['square'] = {square:getX(), square:getY(), square:getZ(), renderOffset}, ['tag'] = text, ['color'] = {color.r, color.g, color.b}, ['spriteName'] = spriteName };
		end
	end 

	-- Faction
	if ui.mode == 2 then
		if faction then
			local factionName = faction:getName();

			if textField.entry:getInternalText():len() == 0 then
				sendClientCommand(player, "CTags", "delete", { ['factionName'] = factionName, ['square'] = {square:getX(), square:getY(), square:getZ(), renderOffset}, ['spriteName'] = spriteName });
			else
				sendClientCommand(player, "CTags", "update", { ['factionName'] = factionName, ['square'] = {square:getX(), square:getY(), square:getZ(), renderOffset}, ['tag'] = text, ['color'] = {color.r, color.g, color.b}, ['spriteName'] = spriteName });
			end	
		end 	
	end 

	CTagsUI:removeWindow();
end 

-- Entry point
function CTagsUI.makeWindow(x, y, object, objectName, squareID, renderOffset, spriteName, playerName)
	-- Don't store it, regenerate completely
	if CTagsUI.window then CTagsUI:removeWindow() end

	local window;
	local sw = getCore():getScreenWidth();
	local sh = getCore():getScreenHeight();
	local Hmax = 1;
	local Wmax = 1; 
	local w = (sw / 5) * Wmax <= sw and (sw / 5) * Wmax or sw
	local h = (sh / 15) * Wmax <= sh and (sh / 15) * Hmax or sh
	local mode = CTags.mode or 1;

	-- Tags are off
	if mode == 0 then return end;

	window = CTagsUI:new(x, y, w, h, mode, object, objectName, squareID, renderOffset, spriteName, playerName);
	window:setVisible(true)
	window:setResizable(false);
	window:addToUIManager()
	window.pin = true;
	CTagsUI.window = window;

	-- Conditionals
	CTags:sleepDo(0, CTagsUI.loop);
end

function CTagsUI.removeWindow()
	local window = CTagsUI.window;
	if not window then return end;
	window.textField.colorPicker:setVisible(false);
	window:setVisible(false)
	window:removeFromUIManager()
end

function CTagsUI:new(x, y, width, height, mode, object, objectName, squareID, renderOffset, spriteName, playerName)
	local o = {};
	o = ISCollapsableWindow:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.title = "Container Tags";
	o.x = x
	o.y = y
	o.width = width
	o.height = height
	o.object = object
	o.squareID = squareID;
	o.renderOffset = renderOffset;
	o.spriteName = spriteName;
	o.playerName = playerName;
	o.clearStentil = false;
	o.maxChars = 32;
	o.mode = mode; 

	-- Find data
	local tagData;
	local tags;

	-- Personal tagger
	if o.mode == 1 then 
		tagData = ModData.getOrCreate("ContainerTagData");
		if not tagData.tags then tagData.tags = {} end;
		tags = tagData.tags;
	end 

	-- Faction tagger
	if o.mode == 2 then
		local faction = CTags:getFaction();
		
		if faction then
			local factionName = faction:getName();
			tagData = ModData.getOrCreate("ContainerTagDataFaction");
			if not tagData.tags then tagData.tags = {} end;
			if not tagData.tags[factionName] then tagData.tags[factionName] = {} end;
			tags = tagData.tags[factionName];
			o.factionName = factionName;
			o.faction = faction;
		else 
			tagData = {};
			tags = {};
		end
	end

	-- Finalize
	if tags[squareID] then
		local tag = tags[squareID];
		local text = tag.tag or "";
		local color = tag.color or {};
		o.color = { r = color[1] or 1, g = color[2] or 1, b = color[3] or 1};
		o.text = text
		o.title = objectName .. ' (' .. (tag.playerName or o.playerName) .. ')';
	else
		o.color = { r = 1, g = 1, b = 1 }
		o.text = "";
		o.title = objectName .. ' (' .. o.playerName .. ')';
	end 

	return o;
end
