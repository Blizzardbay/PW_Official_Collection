-- Hello there! This has been disabled for now as the icon does not persist between save and load.

-- The table that holds all the methods
VFEWeaponIconTable = {}

-- Main function. Test for support, if not we do nothing
function VFESetWeaponIcon(weapon)
	for index, iconfunction in ipairs(VFEWeaponIconTable) do
		if iconfunction.Name == weapon:getFullType() then
			iconfunction.Apply(weapon, open)
			return
		end	
	end
end

local R1022 = {}
R1022.Name = "Base.1022"
R1022.Apply = function(weapon, open)
	local originalIcon = "Item_1022"
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalIcon = originalIcon .. "FGS"
		end
	end
	weapon:setTexture(getTexture("media/textures/" .. originalIcon .. ".png"))
end
table.insert(VFEWeaponIconTable, R1022);