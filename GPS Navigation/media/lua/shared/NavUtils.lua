local Nav = {};
local sym, number = nil;

local arr = require('Nav')

function Nav.GetAngle(vstart, vend)
    
  local v2 = Vector2.new(vend:getX()-vstart:getX(), vend:getY()-vstart:getY());
  local angle = math.atan2(v2:getY(), v2:getX()) * (180 / math.pi);
  return angle;
  
end

function Nav.getGTA4()
  return getSandboxOptions():getOptionByName("NavigationGTA4Voice"):getValue()
end

function Nav.getVol()
  return getSandboxOptions():getOptionByName("NavigationVolume"):getValue()
end

function Nav.getLang()
  local lang = Translator.getLanguage():name()
  if lang ~= "EN" and lang ~= "KO" then
    lang = "EN"
  end
  return lang
end

function Nav.selectplaySound(str, vol)
  local play = getSoundManager():PlaySound(str,false,0);
  getSoundManager():PlayAsMusic(str,play,false,0);
  play:setVolume(vol);  
  return play
end

function Nav.playSound(str, vol)
  local play = getSoundManager():PlaySound(str .. Nav.getLang(),false,0);
  getSoundManager():PlayAsMusic(str .. Nav.getLang(),play,false,0);
  play:setVolume(vol);  
  return play
end

function Nav.onGuidClick()
  ISWorldMap.ShowWorldMap(arr.playerNumber);
  if ISWorldMap_instance.mapAPI then ISWorldMap_instance.mapAPI:centerOn(getSpecificPlayer(arr.playerNumber):getX(), getSpecificPlayer(arr.playerNumber):getY()) end
  --ISWorldMap:onCenterOnPlayer()
  Nav.playSound("tip_", Nav.getVol())

  local step = WelcomeStep:new()
  step:addMessage(getText("IGUI_Tutorial_NavGPS"), getCore():getScreenWidth()/2, getCore():getScreenHeight()/2, 500, 160, true);
  step:doMessage();
end

function Nav.getAngleOffset2D(_angle1, _angle2)
	return 180 - math.abs(math.abs(_angle1 - _angle2) - 180);
end

function Nav.getAngle2D(_x1, _y1, _x2, _y2)
	local angle = math.atan2(_x1 - _x2, -(_y1 - _y2));
	if angle < 0 then angle = math.abs(angle) else angle = 2 * math.pi - angle end;
	return math.deg(angle);
end

function Nav.removeSymbols(symbol, num)
  sym = symbol;
  number = num;
  sendClientCommand(getPlayer(), "Nav_module", "removeSymbols", nil)
end

function Nav.bresenhamLine(x1, y1, x2, y2)
  local points = {}
    
  local dx = math.abs(x2 - x1)
  local dy = math.abs(y2 - y1)
  local sx = (x1 < x2) and 1 or -1
  local sy = (y1 < y2) and 1 or -1
  local err = dx - dy
  
  while true do
      table.insert(points, {x1, y1})
      
      if x1 == x2 and y1 == y2 then
          break
      end
      
      local e2 = 2 * err
      if e2 > -dy then
          err = err - dy
          x1 = x1 + sx
      end
      
      if e2 < dx then
          err = err + dx
          y1 = y1 + sy
      end
  end
  
  return points
end

function Nav_OnClientCommand(module, command, player, args)
  if module ~= "Nav_module" then return end
  if command == "removeSymbols" then
    sym:removeSymbolByIndex(number)
  end
end

Events.OnClientCommand.Add(Nav_OnClientCommand)


return Nav