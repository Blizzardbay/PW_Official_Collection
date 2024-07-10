function getACId (square)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()
    local id = tonumber(tostring(x) .. tostring(y) .. tostring(z))
    return id
end

function isConnectedAC (obj)
    local isAC = false
    local objName = obj:getObjectName()
    if objName == "ClothingDryer" then
        local sprite = obj:getSprite();
        if sprite then
            local objectSpriteName = sprite:getName();
            if objectSpriteName == AC_SPRITE_1 or objectSpriteName == AC_SPRITE_2 then
                isAC = true
            end
        end
    end
    return isAC
end

function isUnconnectedAC (obj)
    local isAC = false
    local objName = obj:getObjectName()
    if objName ~= "ClothingDryer" then
        local sprite = obj:getSprite();
        if sprite then
            local objectSpriteName = sprite:getName();
            if objectSpriteName == AC_SPRITE_1 or objectSpriteName == AC_SPRITE_2 then
                isAC = true
            end
        end
    end
    return isAC
end

function detectOrientationAC (obj)
    local sprite = obj:getSprite();
    local orientation = ""
    if sprite then
        local objectSpriteName = sprite:getName();
        if objectSpriteName == AC_SPRITE_1 then
            orientation = "H"
        elseif objectSpriteName == AC_SPRITE_2 then
            orientation = "V"
        else
            print ("[ERR] Not AC unit!")
        end
    end
    return orientation
end

function findClothingDryer(x, y, z)
	local gs = getCell():getGridSquare(x, y, z)
	if not gs then return nil end
	for i=1,gs:getObjects():size() do
		local obj = gs:getObjects():get(i-1)
		if obj and instanceof(obj, 'IsoClothingDryer') then
			return obj
		end
	end
	print ('no clothing dryer at '..x..','..y..','..z)
	return nil
end
