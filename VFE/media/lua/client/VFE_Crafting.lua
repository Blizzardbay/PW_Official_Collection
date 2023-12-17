function onMagazineCouple_OnCreate(items, result, player, firstHand, secondHand)
	local bullets = 0
	local ammo
	local item
    item = items:get(0)
	ammo = item:getAmmoType()
	bullets = bullets + item:getCurrentAmmoCount()
	
	item = items:get(1)
	bullets = bullets + item:getCurrentAmmoCount()
	
	for i = 0, bullets - 1 do -- AddIems(ammo, bullets) makes 5x too many so this way I guess...
		local newBullet = InventoryItemFactory.CreateItem(ammo)
		player:getInventory():AddItem(newBullet)
	end
end

function onMagazineSeperate_OnCreate(items, result, player, firstHand, secondHand)
	player:getInventory():AddItem(result:getType())
end

-- Helper method --
local function tryAttachPart(weapon, part, player)
	if part:getMountOn():contains(weapon:getFullType()) then
		weapon:attachWeaponPart(part)
	elseif player then
		player:getInventory():AddItem(part)
	end
end

-- Sawn-off recipe callback, copies modData to the new sawn-off.
function VFEShotgunSawnoff_OnCreate(items, result, player)
	for i=0,items:size()-1 do
		local item = items:get(i)
		result:setCurrentAmmoCount(item:getCurrentAmmoCount())
		if result:haveChamber() and item:haveChamber() and item:isRoundChambered() then
			result:setRoundChambered(true)
		end
		local modData = result:getModData()
		for k,v in pairs(item:getModData()) do
			modData[k] = v
		end
		local parts = item:getAllWeaponParts()
		for i=1,parts:size() do
			tryAttachPart(result, parts:get(i-1), player)
		end
		if string.find(result:getType(), "NoStock") then
			player:getInventory():AddItem("UnusableWood")
		else
			player:getInventory():AddItem("UnusableMetal")
		end
		VFESetWeaponModel(result,false) -- Sets the model corretly incase of attachments that change weapon model
		return
    end
end

