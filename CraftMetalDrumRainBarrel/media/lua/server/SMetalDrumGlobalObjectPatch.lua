if isClient() then
	return
end

require 'MetalDrum/SMetalDrumGlobalObject'
local _, _, barrelCols = unpack(require 'ValidDrums')

local spriteCache = {}

local function genSprites(spriteName)
	if spriteCache[spriteName] then
		return spriteCache[spriteName]
	end
	for _,col in ipairs(barrelCols) do
		local prefix = col.prefix
		if spriteName:sub(1, #col.prefix) == prefix then
		local first = spriteName:sub(#prefix + 1)
		first = first - (first % 4)
			local sprites = { empty = prefix .. first,
					 water = prefix .. first + 1,
					 fire_unlit = prefix .. first + 2,
					 fire_lit = prefix .. first + 3,
			}
			spriteCache[spriteName] = sprites
			return sprites
		end
	end
end

local oldGetSprites = SMetalDrumGlobalObject.getSprites
function SMetalDrumGlobalObject:getSprites(...)
	local sprite = self:getIsoObject() and self:getIsoObject():getSprite()
	local spriteName = sprite and sprite:getName() or ""
	return oldGetSprites(self, ...) or genSprites(spriteName)
end
