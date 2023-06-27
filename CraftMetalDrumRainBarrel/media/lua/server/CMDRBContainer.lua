require 'BuildingObjects/ISWoodenContainer'

CMDRBContainer = ISWoodenContainer:derive("CMDRBContainer")

function CMDRBContainer:setCapacityOnCreate()
	self.capacityOnCreate = true
end

function CMDRBContainer:new(...)
	local o = ISWoodenContainer.new(self, ...)
	o.canBeLockedByPadlock = false
	o.canBarricade = false
	o.canPassThrough = false
	o.ignoreNorth = true
	return o
end

function CMDRBContainer:create(...)
	ISWoodenContainer.create(self, ...)
	if self.capacityOnCreate then
		CMDRB_WithProps(self.javaObject:getSprite():getProperties(), function()
			self.javaObject:setIsContainer(true)
		end)
	end
end
