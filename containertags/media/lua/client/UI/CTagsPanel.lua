CTagsPanel = ISPanel:derive("CTagsPanel");

function CTagsPanel:initialise()
	ISPanel.initialise(self)
end
function CTagsPanel:prerender()

end
function CTagsPanel:createChildren()
	local hO = self.y;

	self:onMouseMove(0, 0); -- Just in case you lost it. 

	self.tagsBtn = ISButton:new(10, 10, 40, 35, "", self, CTagsPanel.onOptionMouseDown);
	if CTags.mode == 2 then
		self.tagsBtn:setImage(getTexture("media/textures/note_faction.png"));
	else
		self.tagsBtn:setImage(getTexture("media/textures/note.png"));
	end
	self.tagsBtn:initialise();
	self.tagsBtn:instantiate();
	self.tagsBtn:setDisplayBackground(false);
	CTagsPanel.button = self.tagsBtn;
	self.tagsBtn.borderColor = {r=1, g=1, b=1, a=0.1};
	self.tagsBtn:ignoreWidthChange();
	self.tagsBtn:ignoreHeightChange();
	self:addChild(self.tagsBtn);

	-- Moving menu

	function self.tagsBtn:onRightMouseDown(x, y)
		getSoundManager():playUISound(self.sounds.activate)
		CTagsSettings.makeWindow(x, y)
	end
	function self.tagsBtn:onMouseDown(x, y)
		CTagsPanel.window.move = true;
		if not self:getIsVisible() then
			return;
		end
	    self.pressed = true;
	    if self.onmousedown == nil or not self.enable then
			return;
	    end
		self.onmousedown(self.target, self, x, y);
	end

	function self.tagsBtn:onMouseUp(x, y)
		local diffX = math.abs(CTagsPanel.window.x - CTagsPanel.window.prevPos.x);
		local diffY = math.abs(CTagsPanel.window.y - CTagsPanel.window.prevPos.y);
		if CTagsPanel.window.move and (diffX > 5 or diffY > 5) then return end;
	    if not self:getIsVisible() then
	        return;
	    end
	    local process = false;
	    if self.pressed == true then
	        process = true;
	    end
	    self.pressed = false;
	     if self.onclick == nil then
	        return;
	    end
	    if self.enable and (process or self.allowMouseUpProcessing) then
	        getSoundManager():playUISound(self.sounds.activate)
	        self.onclick(self.target, self, self.onClickArgs[1], self.onClickArgs[2], self.onClickArgs[3], self.onClickArgs[4]);
		    --print(self.title);
	    end
	end	
end

function CTagsPanel:onMouseDown(x, y)
	self.move = true;
end

function CTagsPanel:onMouseMove(x, y)
	if self.move then
		local safeX = math.max(5,math.min(self.core:getScreenWidth() - 60, self.x + x));
		local safeY = math.max(5,math.min(self.core:getScreenHeight() - 60, self.y + y))
		self:setX(safeX);
		self:setY(safeY);
	end
end

function CTagsPanel:onMouseUp(x, y)
	self.move = false;
	self.prevPos = { ["x"] = self.x, ["y"] = self.y }
	CTagsSettings:onOptionChange(0, self.x, "ui_x")
	CTagsSettings:onOptionChange(1, self.y, "ui_y")
end

function CTagsPanel:onMouseMoveOutside(x, y) self:onMouseMove(x, y) end
function CTagsPanel:onMouseUpOutside(x, y)self:onMouseUp(x, y) end


function CTagsPanel.onOptionMouseDown(button, x, y)
	local mode = CTags.mode or 1;
	local button = CTagsPanel.button;
	local iconOn = getTexture("media/textures/note.png");
	local iconOff = getTexture("media/textures/note_off.png");
	local iconFaction = getTexture("media/textures/note_faction.png");


	if (getWorld():getGameMode() == "Multiplayer") then
		-- Factions mode
		if mode == 0 then 
			CTags.mode = 1;
			button:setImage(iconOn)
		end 
		if mode == 1 then 
			local faction = CTags:getFaction();
			if faction then
				CTags.mode = 2;
				button:setImage(iconFaction)
			else
				CTags.mode = 0;
				button:setImage(iconOff)
			end 
		end
		if mode == 2 then 
			CTags.mode = 0;
			button:setImage(iconOff)
		end 
	else 
		-- No factions in SP
		if mode == 0 then 
			CTags.mode = 1;
			button:setImage(iconOn)
		end 
		if mode == 1 then 
			CTags.mode = 0;
			button:setImage(iconOff)
		end
	end
end 

function CTagsPanel.hide()
	local window = CTagsPanel.window;
	if not window then return end;
	window:setVisible(false)
	window:removeFromUIManager()
end

function CTagsPanel.make()
	if CTagsPanel.window then CTagsPanel.hide() end;

	local player = getPlayer();
	local playerNum = player:getPlayerNum()
	local x = getPlayerScreenLeft(playerNum)
	local y = getPlayerScreenTop(playerNum)
	local panel = CTagsPanel:new(CTags.settings.ui_x or 20, CTags.settings.ui_y or 670, 40, 40, player);
	CTagsPanel.window = panel;
	panel:initialise();
	panel:addToUIManager();
	return panel;
end


function CTagsPanel:new(x, y, w, h)
	-- Don't store it, regenerate completely
	if CTagsPanel.window then CTagsPanel:hide() end

	local o = {};
	o = ISPanel:new(x, y, w, h);
	setmetatable(o, self);
	self.__index = self;
	o.x = x;
	o.y = y;
	o.background = true;
	o.backgroundColor = {r=0, g=0, b=0, a=0};
	o.borderColor = {r=0, g=0, b=0, a=0};
	o.anchorLeft = true;
	o.anchorRight = false;
	o.anchorTop = true;
	o.anchorBottom = false;
	o.moveWithMouse = false;
	o.screenW = getCore():getScreenWidth();
	o.screenH = getCore():getScreenHeight();
	o.player = getPlayer();
	o.playerNumber = o.player:getPlayerNum();
	o.core = getCore();
	o.prevPos = { ["x"] = x, ["y"] = y }
	return o;
end