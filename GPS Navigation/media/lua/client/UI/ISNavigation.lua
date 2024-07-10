require "ISUI/ISPanelJoypad"

local NavUI = require('UI/NavToolTipUI')
local arr = require('Nav')
local NavUtils = require('NavUtils')

ISNavigation = ISPanelJoypad:derive("ISNavigation");

local startTime = 0;

local lastX, lastY = nil, nil
local speedInKmH = 0;

function ISNavigation:getPlayerSpeedInKmH(character, lastTime)
  local currentTime = getGameTime():getCalender():getTimeInMillis()
  
  if lastX == nil or lastY == nil then
      lastX, lastY = character:getX(), character:getY()
      return 0
  end

  local currentX, currentY = character:getX(), character:getY()
  local distance = IsoUtils.DistanceTo(currentX, currentY, lastX, lastY)
  
  -- 시간 간격 (밀리초를 시간 단위로 변환)
  local deltaTime = (currentTime - lastTime) / (1000 * 60 * 60)

  -- 속도 (게임 거리 단위를 km로 변환하는 계수를 사용해야 함)
  if deltaTime ~= 0 then speedInKmH = (distance / deltaTime) end

  lastX, lastY = currentX, currentY

  return speedInKmH
end

local MINZ = 0
local MAXZ = 24

local WATER_TEXTURE = false

function ISNavigation:initDefaultStyleV1(mapAPI)
	--local mapAPI = mapUI.javaObject:getAPIv1()
	local styleAPI = mapAPI:getStyleAPI()

	local r,g,b = 0.851, 0.851, 0.851
	mapAPI:setBackgroundRGBA(r, g, b, 1.0)
	mapAPI:setUnvisitedRGBA(r * 0.915, g * 0.915, b * 0.915, 1.0)
	mapAPI:setUnvisitedGridRGBA(r * 0.777, g * 0.777, b * 0.777, 1.0)

	styleAPI:clear()

	local layer = styleAPI:newPolygonLayer("forest")
	layer:setMinZoom(13.5)
	layer:setFilter("natural", "forest")
	if true then
		layer:addFill(MINZ, 189, 197, 163, 0)
		layer:addFill(13.5, 189, 197, 163, 0)
		layer:addFill(14, 189, 197, 163, 255)
		layer:addFill(MAXZ, 189, 197, 163, 255)
	else
		layer:addFill(MINZ, 255, 255, 255, 255)
		layer:addFill(MAXZ, 255, 255, 255, 255)
		layer:addTexture(MINZ, "media/textures/worldMap/Grass.png")
		layer:addTexture(MAXZ, "media/textures/worldMap/Grass.png")
		layer:addScale(13.5, 4.0)
		layer:addScale(MAXZ, 4.0)
	end
	
	layer = styleAPI:newPolygonLayer("water")
	layer:setMinZoom(MINZ)
	layer:setFilter("water", "river")
	if not WATER_TEXTURE then
		layer:addFill(MINZ, 59, 141, 149, 255)
		layer:addFill(MAXZ, 59, 141, 149, 255)
	else
		layer:addFill(MINZ, 59, 141, 149, 255)
		layer:addFill(14.5, 59, 141, 149, 255)
		layer:addFill(14.5, 255, 255, 255, 255)
		layer:addTexture(MINZ, nil)
		layer:addTexture(14.5, nil)
		layer:addTexture(14.5, "media/textures/worldMap/Water.png")
		layer:addTexture(MAXZ, "media/textures/worldMap/Water.png")
--		layer:addScale(MINZ, 4.0)
--		layer:addScale(MAX, 4.0)
	end

	layer = styleAPI:newPolygonLayer("road-trail")
	layer:setMinZoom(12.0)
	layer:setFilter("highway", "trail")
	layer:addFill(12.25, 185, 122, 87, 0)
	layer:addFill(13, 185, 122, 87, 255)
	layer:addFill(MAXZ, 185, 122, 87, 255)

	layer = styleAPI:newPolygonLayer("road-tertiary")
	layer:setMinZoom(11.0)
	layer:setFilter("highway", "tertiary")
	layer:addFill(11.5, 171, 158, 143, 0)
	layer:addFill(13, 171, 158, 143, 255)
	layer:addFill(MAXZ, 171, 158, 143, 255)

	layer = styleAPI:newPolygonLayer("road-secondary")
	layer:setMinZoom(11.0)
	layer:setFilter("highway", "secondary")
	layer:addFill(MINZ, 242, 242, 242, 255)
	layer:addFill(MAXZ, 242, 242, 242, 255)

	layer = styleAPI:newPolygonLayer("road-primary")
	layer:setMinZoom(11.0)
	layer:setFilter("highway", "primary")
	layer:addFill(MINZ, 242, 242, 242, 255)
	layer:addFill(MAXZ, 242, 242, 242, 255)

	layer = styleAPI:newPolygonLayer("railway")
	layer:setMinZoom(14.0)
	layer:setFilter("railway", "*")
	layer:addFill(MINZ, 200, 191, 231, 255)
	layer:addFill(MAXZ, 200, 191, 231, 255)

	-- Default, same as building-Residential
	layer = styleAPI:newPolygonLayer("building")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "yes")
	layer:addFill(13.0, 210, 158, 105, 0)
	layer:addFill(13.5, 210, 158, 105, 255)
	layer:addFill(MAXZ, 210, 158, 105, 255)

	layer = styleAPI:newPolygonLayer("building-Residential")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "Residential")
	layer:addFill(13.0, 210, 158, 105, 0)
	layer:addFill(13.5, 210, 158, 105, 255)
	layer:addFill(MAXZ, 210, 158, 105, 255)

	layer = styleAPI:newPolygonLayer("building-CommunityServices")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "CommunityServices")
	layer:addFill(13.0, 139, 117, 235, 0)
	layer:addFill(13.5, 139, 117, 235, 255)
	layer:addFill(MAXZ, 139, 117, 235, 255)

	layer = styleAPI:newPolygonLayer("building-Hospitality")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "Hospitality")
	layer:addFill(13.0, 127, 206, 225, 0)
	layer:addFill(13.5, 127, 206, 225, 255)
	layer:addFill(MAXZ, 127, 206, 225, 255)

	layer = styleAPI:newPolygonLayer("building-Industrial")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "Industrial")
	layer:addFill(13.0, 56, 54, 53, 0)
	layer:addFill(13.5, 56, 54, 53, 255)
	layer:addFill(MAXZ, 56, 54, 53, 255)

	layer = styleAPI:newPolygonLayer("building-Medical")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "Medical")
	layer:addFill(13.0, 229, 128, 151, 0)
	layer:addFill(13.5, 229, 128, 151, 255)
	layer:addFill(MAXZ, 229, 128, 151, 255)

	layer = styleAPI:newPolygonLayer("building-RestaurantsAndEntertainment")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "RestaurantsAndEntertainment")
	layer:addFill(13.0, 245, 225, 60, 0)
	layer:addFill(13.5, 245, 225, 60, 255)
	layer:addFill(MAXZ, 245, 225, 60, 255)

	layer = styleAPI:newPolygonLayer("building-RetailAndCommercial")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "RetailAndCommercial")
	layer:addFill(13.0, 184, 205, 84, 0)
	layer:addFill(13.5, 184, 205, 84, 255)
	layer:addFill(MAXZ, 184, 205, 84, 255)
end


function ISNavigation:initialise()
  ISPanel.initialise(self);
  self.msg = ""

  local pw = (self.width) - (self.width * 0.342)
  local ph = (self.height) - (self.height * 0.21)
  local px = ((self.width * 0.342) / 2)
  local py = ((self.height * 0.21) / 2)
	self.panel2 = ISPanel:new(px, py, pw, ph);
	self.panel2.backgroundColor = {r=0, g=0, b=0, a=1};
	self.panel2.borderColor = {r=1, g=1, b=1, a=0};
  self:addChild(self.panel2)

  self.Navi = ISButton:new((self.width / 2) - ((self.width * 0.082) / 2), self.panel2:getBottom() + (self.height * 0.005), (self.width * 0.082), (self.height * 0.072), "GUID", self, NavUtils.onGuidClick);
  self.Navi.internal = "GUID";
  self.Navi:initialise();
  self.Navi.backgroundColor.a = 0;
  self.Navi.borderColor.a = 0;
  self.Navi.backgroundColorMouseOver.a = 100;
  self.Navi:setImage(getTexture("media/textures/NavButton.png"));
  self.Navi:forceImageSize((self.width * 0.082), (self.height * 0.072));
  self.Navi.textColor = {r=1, g=1, b=1, a=1};
  self:addChild(self.Navi)

  self.GPSButton = ISButton:new((self.Navi:getX() - (self.width * 0.1)) - (self.width * 0.082), self.panel2:getBottom() + (self.height * 0.005), (self.width * 0.082), (self.height * 0.072), "GPS", self, self.onClick);
  self.GPSButton.internal = "GPSButton";
  self.GPSButton:initialise();
  self.GPSButton.backgroundColor.a = 0;
  self.GPSButton.borderColor.a = 0;
  self.GPSButton.backgroundColorMouseOver.a = 100;
  self.GPSButton:setImage(getTexture("media/textures/NavButton.png"));
  self.GPSButton:forceImageSize((self.width * 0.082), (self.height * 0.072));
  self.GPSButton.textColor = {r=1, g=1, b=1, a=1};
  self:addChild(self.GPSButton)

  self.ImagePyramidButton = ISButton:new(self.Navi:getRight() + self.width * 0.1, self.panel2:getBottom() + (self.height * 0.005), (self.width * 0.082), (self.height * 0.072), "IPd", self, self.onClick);
  self.ImagePyramidButton.internal = "ImagePyramidButton";
  self.ImagePyramidButton:initialise();
  self.ImagePyramidButton.backgroundColor.a = 0;
  self.ImagePyramidButton.borderColor.a = 0;
  self.ImagePyramidButton.backgroundColorMouseOver.a = 100;
  self.ImagePyramidButton:setImage(getTexture("media/textures/NavButton.png"));
  self.ImagePyramidButton:forceImageSize((self.width * 0.082), (self.height * 0.072));
  self.ImagePyramidButton.textColor = {r=1, g=1, b=1, a=1};
  self:addChild(self.ImagePyramidButton)

  self.mMap = ISMiniMapInner:new(10, 10, self.panel2.width-20, self.panel2.height-20, self.playerNum)
  self.mMap:instantiate()
  if self.mMap.mapAPI then
    local dirs = getLotDirectories()
	  for i=1,dirs:size() do

		  local file = 'media/maps/'..dirs:get(i-1)..'/worldmap.xml'
		  if fileExists(file) then
			  self.mMap.mapAPI:addData(file)
		  end

		  self.mMap.mapAPI:endDirectoryData()

		  self.mMap.mapAPI:addImages('media/maps/'..dirs:get(i-1))
	  end
	  self.mMap.mapAPI:setBoundsFromWorld()
	  self.mMap.mapAPI:setZoom(19)

	  self.mMap.mapAPI:setBoolean("HideUnvisited", true)
	  self.mMap.mapAPI:setBoolean("Players", true)
	  self.mMap.mapAPI:setBoolean("Symbols", true)
	  self.mMap.mapAPI:setBoolean("MiniMapSymbols", true)
		self.mMap.mapAPI:setBoolean("Features", true)

	  self:initDefaultStyleV1(self.mMap.mapAPI)
  end

  self.panel2:addChild(self.mMap)

  self.NavGuid = NavUI.init(0, self.mMap.height - 80, self.mMap.width, 50)
  self.NavGuid:setVisible(false)
  self.mMap:addChild(self.NavGuid)

  local bw = self.width * 0.15
  local bh = self.height * 0.15
  self.nRight = ISButton:new(self.mMap.width - bw - 10, 10, bw, bh, "", self, self.onclick);
  self.nRight.internal = "RIGHT";
  self.nRight:initialise();
  self.nRight.backgroundColor.a = 0;
  self.nRight.borderColor.a = 0;
  self.nRight.backgroundColorMouseOver.a = 0;
  self.nRight:setImage(getTexture("media/textures/Nav_right.png"));
  self.nRight:forceImageSize(bw, bh);
  self.nRight.textColor = {r=1, g=1, b=1, a=0};
  self.nRight:setVisible(false)
  self.mMap:addChild(self.nRight)

  self.nLeft = ISButton:new(self.mMap.width - bw - 10, 10, bw, bh, "", self, self.onclick);
  self.nLeft.internal = "RIGHT";
  self.nLeft:initialise();
  self.nLeft.backgroundColor.a = 0;
  self.nLeft.borderColor.a = 0;
  self.nLeft.backgroundColorMouseOver.a = 0;
  self.nLeft:setImage(getTexture("media/textures/Nav_left.png"));
  self.nLeft:forceImageSize(bw, bh);
  self.nLeft.textColor = {r=1, g=1, b=1, a=0};
  self.nLeft:setVisible(false)
  self.mMap:addChild(self.nLeft)

end

function ISNavigation:onClick(button)
	if button.internal == "GPSButton" then 
    local playerObj = getSpecificPlayer(self.playerNum)
    if playerObj then playerObj:Say("X : " .. tostring(round(playerObj:getX(), 0)) .. " Y : " .. tostring(round(playerObj:getY(), 0)) .. " Z : " .. tostring(round(playerObj:getZ(), 0))) end
  end

  if button.internal == "ImagePyramidButton" then 
    if self.mMap.mapAPI then
      if not self.mMap.mapAPI:getBoolean("ImagePyramid") then
        self.mMap.mapAPI:setBoolean("ImagePyramid", true)
       else self.mMap.mapAPI:setBoolean("ImagePyramid", false)
      end
    end
  end
	
	if self.onclick ~= nil then
		button.player = self.player;
		self.onclick(self.target, button, self.max);
	end
end

function ISNavigation:prerender()
    local red = getSandboxOptions():getOptionByName("NavigationR"):getValue()
    local green = getSandboxOptions():getOptionByName("NavigationG"):getValue()
    local blue = getSandboxOptions():getOptionByName("NavigationB"):getValue()

    self:drawTextureScaledAspect2(getTexture("media/textures/Gps-navigation.png"), 0, 0, self.width, self.height, 1, 1, 1, 1)
    self.mMap:prerenderHack()
    if getSpecificPlayer(self.playerNum):getVehicle() and not getSpecificPlayer(self.playerNum):getVehicle():isEngineRunning() and self.mMap:isVisible() then
      self.mMap:setVisible(false)
      getWorldMarkers():removeAllHomingPoints(getSpecificPlayer(self.playerNum));
    end
    if getSpecificPlayer(self.playerNum):getVehicle() and getSpecificPlayer(self.playerNum):getVehicle():isEngineRunning() and not self.mMap:isVisible() then
      self.mMap:setVisible(true)
      if #arr.dis > 0 then getWorldMarkers():addPlayerHomingPoint(getSpecificPlayer(self.playerNum), tonumber(arr.symbolX[1]), tonumber(arr.symbolY[1]), (red / 255), (green / 255), (blue / 255), 1); end
    end
    if arr.attachedGPS and not arr.attachedGPSPower and self.mMap:isVisible() and not getSpecificPlayer(self.playerNum):getVehicle() then
      self.mMap:setVisible(false)
      getWorldMarkers():removeAllHomingPoints(getSpecificPlayer(self.playerNum));
    end
    if arr.attachedGPS and arr.attachedGPSPower and not self.mMap:isVisible() and not getSpecificPlayer(self.playerNum):getVehicle() then
      self.mMap:setVisible(true)
      if #arr.dis > 0 then getWorldMarkers():addPlayerHomingPoint(getSpecificPlayer(self.playerNum), tonumber(arr.symbolX[1]), tonumber(arr.symbolY[1]), (red / 255), (green / 255), (blue / 255), 1); end
    end
    if #arr.dis > 0 then
      if not self.NavGuid:isVisible() then self.NavGuid:setVisible(true) end
      local cal = Calendar.getInstance();
      if startTime == 0 then startTime = Calendar.getInstance():getTimeInMillis() end
      if not self.lastT then self.lastT = getGameTime():getCalender():getTimeInMillis() end
      cal:setTimeInMillis(Calendar.getInstance():getTimeInMillis() - startTime)
      local sec = cal:get(Calendar.SECOND);
      if not self.lastSec then self.lastSec = sec end

      local dis = round(arr.dis[#arr.dis], 0)
      local dis2 = round(IsoUtils.DistanceTo(getSpecificPlayer(self.playerNum):getX(), getSpecificPlayer(self.playerNum):getY(), arr.symbolX[#arr.symbolX], arr.symbolY[#arr.symbolY]), 0)

      if getSpecificPlayer(self.playerNum):getVehicle() then 
        self.NavGuid:setName(getText("UI_name") .. " [" .. tostring(round(getSpecificPlayer(self.playerNum):getVehicle():getCurrentSpeedKmHour(),0)) .. "]"); 
       else self.NavGuid:setName(getText("UI_name") .. " [" .. tostring(round(self:getPlayerSpeedInKmH(getSpecificPlayer(self.playerNum), self.lastT),0)) .. "]"); 
      end
      self.NavGuid.description = getText("UI_dis") .. " : " .. tostring(round(dis2,0)) .. " " .. self.msg;
      if #arr.dis > 1 then
        local dis1 = round(IsoUtils.DistanceTo(getSpecificPlayer(self.playerNum):getX(), getSpecificPlayer(self.playerNum):getY(), arr.symbolX[1], arr.symbolY[1]), 0)
        self.NavGuid.description = getText("UI_dis") .. " : " .. tostring(round(dis1,0)) .. " [" .. tostring(round(dis2,0)) .. "] " .. self.msg;
      end 

      if self.lastSec ~= sec then
        self.lastT = getGameTime():getCalender():getTimeInMillis()
        self.lastSec = sec
      end

      if sec == 10 then
        local ss = dis - dis2
        if ss ~= 0 then
          local sss = round(dis,0) / ss;
          local time = 10 * sss;
          if time < 0 then
           time = time * -1;
          end
          self.msg = getText("UI_time") .. " : " .. tostring(round(time,0)) .. getText("UI_sec")
          if time > 60 then 
            local min1 = time / 60
            local min2 = time % 60
            self.msg = getText("UI_time") .. " : " .. tostring(round(min1,0)) .. getText("UI_min") .. " " .. tostring(round(min2,0)) .. getText("UI_sec")
          end
          startTime = 0;
        end
      end
      else 
        if self.NavGuid:isVisible() then self.NavGuid:setVisible(false) end
    end
end


function ISNavigation:new(x, y, width, height, playerNum)
	local o = ISPanelJoypad.new(self, x, y, width, height);
	local playerObj = getSpecificPlayer(playerNum) or nil
	if y == 0 then
		if playerObj and playerObj:getJoypadBind() ~= -1 then
			o.y = getPlayerScreenTop(playerNum) + (getPlayerScreenHeight(playerNum) - height) / 2
		else
			o.y = o:getMouseY() - (height / 2)
		end
		o:setY(o.y)
	end
	if x == 0 then
		if playerObj and playerObj:getJoypadBind() ~= -1 then
			o.x = getPlayerScreenLeft(playerNum) + (getPlayerScreenWidth(playerNum) - width) / 2
		else
			o.x = o:getMouseX() - (width / 2)
		end
		o:setX(o.x)
	end

	o.backgroundColor = {r=14.9, g=14.9, b=14.9, a=1};
	o.borderColor = {r=1, g=1, b=1, a=0};
  o.anchorLeft = true;
  o.anchorRight = true;
  o.anchorTop = true;
  o.anchorBottom = true;
  o.playerNum = playerNum;
  o.moveWithMouse = true;
return o;
end

