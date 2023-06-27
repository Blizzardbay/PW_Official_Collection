require 'Moveables/ISMoveableSpriteProps'
local _, spriteToModded, _, capacity = unpack(require 'ValidDrums')

local oldPickUpMoveableInternal = ISMoveableSpriteProps.pickUpMoveableInternal

function ISMoveableSpriteProps:pickUpMoveableInternal(character, sq, object, ...)
	if not object:hasModData() or not object:getModData().isCMDRBCrafted then
		return oldPickUpMoveableInternal(self, character, sq, object, ...)
	end
	local ret = {oldPickUpMoveableInternal(self, character, sq, object, ...)}
	local item = ret[1]
	if spriteToModded[self.spriteName] and item then
		item:setTooltip("IGUI_ItemCat_Container") -- a tooltip as state, great.
	end
	return unpack(ret)
end

local oldPlaceMoveableInternal = ISMoveableSpriteProps.placeMoveableInternal
function ISMoveableSpriteProps:placeMoveableInternal(sq, item, sprite, ...)
	if spriteToModded[sprite] and item:getTooltip() == "IGUI_ItemCat_Container" then
		local oldIsoThumpableNew = IsoThumpable.new
		local obj
		function IsoThumpable.new(...)
			local ret = {oldIsoThumpableNew(...)}
			obj = ret[1]
			return unpack(ret)
		end
		local ret = {oldPlaceMoveableInternal(self, sq, item, sprite, ...)}
		IsoThumpable.new = oldIsoThumpableNew
		CMDRB_WithProps(obj:getSprite():getProperties(), function()
			obj:setIsContainer(true)
		end)
		return unpack(ret)
	end
	return oldPlaceMoveableInternal(self, sq, item, sprite, ...)
end
