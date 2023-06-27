----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--
-- em_cellObjectIconGroup
--
--
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

require("eris_minimap/icons/em_mapIconGroupBase");

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

em_cellObjectIconGroup = em_mapIconGroupBase:new();

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:renderText()
	local drawTextCentre = em_core.minimap.drawTextCentre;
	local context_settings = em_settings.context_settings;
	local colorset = em_settings.color_settings.otherPlayerTitle;
	local r, g, b, a = 1, 1, 1, 1;
	if colorset and colorset.enabled then
		r, g, b, a = colorset.color.r, colorset.color.g, colorset.color.b, colorset.color.a;
	end;
	for plID, plIcon in pairs(self.playerIcons) do
		local iconGroup = plIcon.cellIcons;
		if iconGroup then
			if context_settings.otherplayerToggle.enabled then
				for iconID, icon in pairs(iconGroup["Player"]) do
					if not colorset.enabled then
						r, g, b, a = icon.r, icon.g, icon.b, icon.a;
					end;
					if icon.doRenderText and not icon.isLocalPlayer then
						drawTextCentre(
							em_core.window,
							icon.iconData,
							icon.textX + 1, icon.textY + (icon.iconSize / 2) + 1,
							0, 0, 0, a,
							UIFont.NewMedium
						);
						drawTextCentre(
							em_core.window,
							icon.iconData,
							icon.textX, icon.textY + (icon.iconSize / 2),
							r, g, b, a,
							UIFont.NewMedium
						);
					end;
				end;
			end;
		end;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:render()
	self:renderIcons();
	self:renderText();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:clearNearbyPlayers()
	for plID, plIcon in pairs(self.nearbyPlayers) do plIcon = nil; end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:initOnlinePlayerObjects(_plIcon, _cellObjects)
	local plIcon, cellObjects = _plIcon, _cellObjects;
	local onlinePlayers = getOnlinePlayers();
	local onlinePlayer, ID;
	local objClass = "Player";
	for i = 0, onlinePlayers:size() - 1 do
		onlinePlayer = onlinePlayers:get(i);
		ID = objClass .. onlinePlayer:getUsername();
		if onlinePlayer and cellObjects:contains(onlinePlayer) then
			if self.enabledIcons[objClass] then
				if (not self.mapIcons[objClass][ID]) then
					self:queueInitIcon(plIcon, ID, onlinePlayer, objClass);
				else
					plIcon.cellIcons[objClass][ID] = self.mapIcons[objClass][ID];
				end;
			end;
		end;
	end;
end

function em_cellObjectIconGroup:initCellObjects(_plIcon, _cellObjects)
	local plIcon, cellObjects = _plIcon, _cellObjects;
	local obj, objClass, ID;
	for i = 0, cellObjects:size() - 1 do
		obj = cellObjects:get(i);
		objClass = obj and obj:getObjectName();
		if objClass then
			if self.mapIcons[objClass] then
				if self.enabledIcons[objClass] then
					ID = objClass .. obj:getID();
					if (not self.mapIcons[objClass][ID]) then
						self:queueInitIcon(plIcon, ID, obj, objClass);
					else
						plIcon.cellIcons[objClass][ID] = self.mapIcons[objClass][ID];
					end;
				end;
			end;
		end;
	end;
end

function em_cellObjectIconGroup:updateGroup(_updateTime)
	self.drawIcons = {};
	self:clearNearbyPlayers();
	self:processInitQueue();
	local strMatch = string.match;
	local strMake = tostring;
	local cellObjects;
	local obj, objClass, ID;
	for plID, plIcon in pairs(self.playerIcons) do
		plIcon.cellIcons	= {Zombie = {}, Vehicle = {}, Player = {}};
		plIcon.objLists		= {Zombie = nil, Vehicle = nil, Player = nil};
		cellObjects = plIcon.obj:getCell():getZombieList();
		plIcon.objLists.Zombie = cellObjects;
		if cellObjects then self:initCellObjects(plIcon, cellObjects); end;
		cellObjects = plIcon.obj:getCell():getVehicles();
		plIcon.objLists.Vehicle = cellObjects;
		if cellObjects then self:initCellObjects(plIcon, cellObjects); end;
		if em_core.clientMode then
			cellObjects = plIcon.obj:getCell():getObjectList();
			plIcon.objLists.Player = cellObjects;
			if cellObjects then self:initOnlinePlayerObjects(plIcon, cellObjects); end;
		end;
	end;
	self:update(_updateTime);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:getZombieGroup(_icon)
	local groupSize = 1;
	local gridSize = em_settings.map_settings.zombieGridSize;
	local zgID = math.floor(_icon.x / gridSize) .. "-" .. math.floor(_icon.y / gridSize);
	if self.zombieGroups[zgID] then
		for iconID, _ in pairs(self.zombieGroups[zgID]) do
			self.drawIcons[iconID] = nil;
			groupSize = groupSize + 1;
		end;
	else
		self.zombieGroups[zgID] = {};
	end;
	self.zombieGroups[zgID][_icon.iconID] = _icon;
	return self.zombieGroups[zgID], groupSize < 5 and groupSize or 5;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:updateEnabledIcons(_updateTime)
	if em_core.clientMode and em_core.adminMode then
		self.enabledIcons = {
			Zombie = true,
			Vehicle = true,
			Player = true,
		};
	else
		self.enabledIcons = {
			Zombie = (not em_pluginsettings.disableRemoteZombies) and em_settings.context_settings.zombieToggle.enabled,
			Vehicle = (not em_pluginsettings.disableRemoteVehicles) and em_settings.context_settings.vehToggle.enabled,
			Player = (not em_pluginsettings.disableRemotePlayers) and em_settings.context_settings.otherplayerToggle.enabled,
		};
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:update(_updateTime)
	if em_pluginsettings.disableLocalPlayers then return; end;
	local context_settings = em_settings.context_settings;
	if not context_settings.localplayerToggle.enabled then return; end;
	self:updateEnabledIcons();
	local drawIcons = {};
	self.zombieGroups = {};
	local map_settings = em_settings.map_settings;
	local isMatchingFactionTags = false;
	local isCohabitant = false;
	local zombieGroup, groupSize;
	local vehHasPlayers, vehHasLocalPlayers;
	for plID, plIcon in pairs(self.playerIcons) do
		local iconGroup	= plIcon.cellIcons;
		local objLists	= plIcon.objLists;
		if iconGroup then
			if context_settings.otherplayerToggle.enabled and objLists.Player then
				for iconID, icon in pairs(iconGroup["Player"]) do
					if objLists.Player:contains(icon.obj) then
						if not icon.isLocalPlayer then
							icon.spottedList = {};
							icon:updateLocation();
							if icon.obj:getVehicle() == nil or not context_settings.vehToggle.enabled then
								isMatchingFactionTags = self:isMatchingFactionTags(plIcon, icon);
								isCohabitant = plIcon.cohabitants[icon.username] and true or false;
								if isMatchingFactionTags or isCohabitant or self:canSee2D(plIcon, icon) then
									-- icon.privacySetting = icon.obj:getModData()["minimap_privacy"] or false;
									icon.spottedList[plID] = plIcon;
									self.nearbyPlayers[icon.username] = icon;
									icon:updateTimeStamp(_updateTime);
									icon.direction = self:getFacingDirection(icon.obj);
									icon.iconTexture = self.arrowTex[icon.direction];
									icon.iconDataExt = em_translationData.label_survival_time .. icon.obj:getTimeSurvived();
									icon.iconSize = 24 + map_settings.playerIconSize;
									if icon.direction == "player_circle" then
										icon.a = 0;
										icon.doRenderText = false;
									else
										self:doFadeIn(icon, icon.deferred.step);
										drawIcons[iconID] = icon;
										icon.doRenderText = true;
									end;
								else
									self:doFadeOut(icon, icon.deferred.step);
									if icon.a > 0 then
										drawIcons[iconID] = icon;
										icon.doRenderText = true;
									else
										icon.doRenderText = false;
									end;
								end;
							end;
						else
							iconGroup.Player[iconID] = nil;
							self.mapIcons.Player[iconID] = nil;
						end;
					end;
				end;
			end;
			if context_settings.vehToggle.enabled and objLists.Vehicle then
				for iconID, icon in pairs(iconGroup["Vehicle"]) do
					if objLists.Vehicle:contains(icon.obj) then
						icon:updateLocation();
						if self:canSee2D(plIcon, icon) then
							--TODO: store driver/passenger data
							vehHasPlayers, vehHasLocalPlayers = self:checkVehicleOccupied(icon.obj, plIcon);
							if vehHasPlayers then
								if vehHasLocalPlayers then
									self.lastVehicles[plID] = {iconID = iconID, icon = icon};
								end;
								icon.mapScale = false;
								icon.iconSize = 4 + map_settings.vehicleIconSize;
								icon:setAlpha(1);
							else
								icon.mapScale = true;
								icon.iconSize = 4 + map_settings.vehicleIconSize;
								icon:setAlpha(0.9);
							end;
							icon:updateTimeStamp(_updateTime);
							drawIcons[iconID] = icon;
							self:doFadeIn(icon, icon.deferred.step);
						else
							self:doFadeOut(icon, icon.deferred.step);
							if icon.a > 0 then
								drawIcons[iconID] = icon;
							end;
						end;
					else
						iconGroup.Vehicle[iconID] = nil;
						self.mapIcons.Vehicle[iconID] = nil;
					end;
				end;
				for _, lastVehicle in pairs(self.lastVehicles) do
					lastVehicle.icon.mapScale = false;
					lastVehicle.icon.iconSize = 24 + map_settings.vehicleIconSize;
					lastVehicle.icon:setAlpha(1);
					drawIcons[lastVehicle.iconID] = lastVehicle.icon;
				end;
			end;
			if context_settings.zombieToggle.enabled and objLists.Zombie then
				for iconID, icon in pairs(iconGroup["Zombie"]) do
					if objLists.Zombie:contains(icon.obj) then
						icon:updateLocation();
						icon:updateTimeStamp(_updateTime);
						zombieGroup, groupSize = self:getZombieGroup(icon);
						icon.iconSize = 4 + groupSize + map_settings.zombieIconSize;
						if self:canSee2D(plIcon, icon) then
							drawIcons[iconID] = icon;
							self:doFadeIn(icon, icon.deferred.step);
						else
							self:doFadeOut(icon, icon.deferred.step);
							if icon.a > 0 then
								drawIcons[iconID] = icon;
							end;
						end;
					else
						iconGroup.Zombie[iconID] = nil;
						self.mapIcons.Zombie[iconID] = nil;
					end;
				end;
			end;
		end;
	end;
	local mapTransform = em_core.map.transforms.mapTransform;
	for iconID, icon in pairs(drawIcons) do
		self:doIconTransform(icon, mapTransform);
	end;
	self.drawIcons = drawIcons;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:processInitQueue()
	local i = 0;
	local sqObj;
	local doInitSightCheck = true;
	if em_settings.context_settings.radarMode.enabled then
		if (em_core.clientMode and em_core.adminMode) then
			doInitSightCheck = false;
		end;
		if (not em_core.clientMode) then
			doInitSightCheck = false;
		end;
	end;
	for iconID, initData in pairs(self.iconQueue) do
		if doInitSightCheck then
			for plID, plIcon in pairs(self.playerIcons) do
				sqObj = initData.obj and initData.obj:getSquare() ;
				if sqObj and sqObj:IsOnScreen() and sqObj:isCanSee(plIcon.obj:getPlayerNum()) then
					self.mapIcons[initData.class][iconID] = self:initialiseIcon(em_mapIconBase:new(), initData.obj, initData.class);
					initData.playerIcon.cellIcons[initData.class][iconID] = self.mapIcons[initData.class][iconID];
				end;
			end;
		else
			self.mapIcons[initData.class][iconID] = self:initialiseIcon(em_mapIconBase:new(), initData.obj, initData.class);
			initData.playerIcon.cellIcons[initData.class][iconID] = self.mapIcons[initData.class][iconID];
		end;
		self.iconQueue[iconID] = nil;
		i = i + 1;
		if i > self.queueRate then return; end;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:queueInitIcon(_playerIcon, _id, _obj, _class)
	if (not self.iconQueue[_id]) then
		self.iconQueue[_id] = {
			obj = _obj,
			class = _class,
			playerIcon = _playerIcon,
		};
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:initialiseIcon(_icon, _obj, _class)
	_icon:setObj(_obj);
	_icon:setClass(_class);
	_icon:initID();
	local colorSet = em_settings.color_settings;
	local map_settings = em_settings.map_settings;
	if _class == "Zombie" then
		local setting = colorSet.zombies;
		if setting.enabled then
			_icon:setColor(setting.color.r, setting.color.g, setting.color.b, 0);
		else
			_icon:setColor(1, 0, 0, 0);
		end;
		_icon.iconData = "Zombie";
		_icon.iconDataExt = "Zombie";
		_icon.iconTexture = self.mapIconTex["dot_icon_small"];
		_icon.minViewDist = 5;
		_icon.maxViewDist = 40;
		_icon.iconSize = 4 + map_settings.zombieIconSize;
		_icon.mapScale = true;
		_icon.deferred = {tick = 1, seen = false, deferring = false, fadeOut = false, rate =  10, step = 0.2};
	elseif _class == "Vehicle" then
		local setting = colorSet.emptyVeh;
		if setting.enabled then
			_icon:setColor(setting.color.r, setting.color.g, setting.color.b, 0);
		else
			_icon:setColor(self:getVehicleColor(_obj));
			_icon:setAlpha(0);
		end;
		_icon.iconData = self:getVehicleName(_obj);
		_icon.iconDataExt = math.floor(_obj:getX()) .. " x " .. math.floor(_obj:getY());
		_icon.iconTexture = self.mapIconTex["vehicle_icon"];
		_icon.iconSize = 24 + map_settings.vehicleIconSize;
		_icon.minViewDist = 10;
		_icon.maxViewDist = 50;
		_icon.mapScale = true;
		_icon.deferred = {tick = 1, seen = false, deferring = false, rate = 7, step = 0.2};
	elseif _class == "Player" then
		if not _obj:isLocalPlayer() and not em_pluginsettings.disableRemotePlayers then
			local setting = colorSet.otherplayers;
			if setting.enabled then
				_icon:setColor(setting.color.r, setting.color.g, setting.color.b, 0);
			else
				_icon:setColor(self:getPlayerColor(_obj));
			end;
			_icon.descriptor = _obj:getDescriptor();
			_icon.profName = self:getProfessionName(_icon.descriptor);
			_icon.factionTag = self:getFactionTag(_icon);
			_icon.username = _obj:getUsername();
			_icon.iconData = _icon.factionTag .. _icon.username;
			_icon.iconDataExt =  em_translationData.label_survival_time .. _obj:getTimeSurvived();
			_icon.minViewDist = 15;
			_icon.maxViewDist = 50;
			_icon.mapScale = false;
			_icon.iconSize = 24 + map_settings.playerIconSize;
			_icon.deferred = {tick = 1, seen = false, deferring = false, rate = 3, step = 0.1};
			_icon.doRenderText = false;
			_icon.isLocalPlayer = false;
			if self then self.mapIcons.lookupByUsername[_icon.username] = _icon; end;
		else
			_icon.isLocalPlayer = true;
			_icon.doRenderText = false;
		end;
	end;
	return _icon;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:initialise()
	self.playerIcons = self.metaGroup.groups.localPlayerGroup.drawIcons;
	self:updateGroup();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_cellObjectIconGroup:pre_initialise()
	self.iconSize = 4;
	self.queueRate = 200;
	self:generateProfessionTable();
	self.iconQueue = {};
	self.zombieGroups = {};
	self.lastVehicles = {};
	self.nearbyPlayers = {};
	self.mapIcons = {
		Zombie = {},
		Vehicle = {},
		Player = {},
		lookupByUsername = {}
	};
	self.enabledIcons = {
		Zombie = (not em_pluginsettings.disableRemoteZombies) and em_settings.context_settings.zombieToggle.enabled,
		Vehicle = (not em_pluginsettings.disableRemoteVehicles) and em_settings.context_settings.vehToggle.enabled,
		Player = (not em_pluginsettings.disableRemotePlayers) and em_settings.context_settings.otherplayerToggle.enabled,
	};
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------