require 'MetalDrum/BuildingObjects/ISMetalDrum'
local _, spriteToModded = unpack(require 'ValidDrums')

local oldCreate = ISMetalDrum.create
function ISMetalDrum:create(x, y, z, north, sprite, ...)
	local consumed = {buildUtil.consumeMaterial(self)}
	for _,item in ipairs(consumed[1]) do
		local moddedSprite = spriteToModded[item:getType()]
		sprite = moddedSprite and moddedSprite.convert or sprite
	end
	local oldConsume = buildUtil.consumeMaterial
	function buildUtil.consumeMaterial(...)
		return unpack(consumed)
	end
	local ret = {oldCreate(self, x, y, z, north, sprite, ...)}
	buildUtil.consumeMaterial = oldConsume
	return unpack(ret)
end
