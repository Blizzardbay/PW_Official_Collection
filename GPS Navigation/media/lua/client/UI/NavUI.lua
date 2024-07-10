require('Vehicles/ISUI/ISVehicleMenu')

local Vmu = ISVehicleMenu;
local VmuShow = Vmu.showRadialMenu

local arr = require('Nav')


function ISVehicleMenu.showRadialMenu(playerObj)
  VmuShow(getSpecificPlayer(arr.playerNumber))
  local vehicle = playerObj:getVehicle()
  if vehicle and vehicle:isDriver(playerObj) then
    local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
    local haveGPS = playerObj:getInventory():getCountTypeRecurse("NAV.GPS");
    if haveGPS < 1 and not vehicle:getModData().setGPS then 
      menu:addSlice(getText("UI_not_Nav"), getTexture("media/textures/Item_GpsNAV.png"), ISVehicleMenu.notGPS, playerObj, vehicle )
      return
    end
    if not vehicle:getModData().setGPS then
     menu:addSlice(getText("UI_install_Nav"), getTexture("media/textures/Item_GpsNAV.png"), ISVehicleMenu.onGPS, playerObj, vehicle )
     else menu:addSlice(getText("UI_uninstall_Nav"), getTexture("media/textures/unGpsNAV.png"), ISVehicleMenu.onGPS, playerObj, vehicle )
    end
  end
end

function ISVehicleMenu.onGPS(playerObj, vehicle)
  ISTimedActionQueue.add(ISSetGPS:new(playerObj))
end

function ISVehicleMenu.notGPS(playerObj, vehicle)
  playerObj:Say(getText("UI_not_Nav"))
end