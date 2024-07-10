-- This really needs to use VFESetWeaponModel(weapon, open)

local ISRemoveWeaponUpgrade_performHook = ISRemoveWeaponUpgrade.perform
function ISRemoveWeaponUpgrade:perform()
	if self.part:getFullType() == "Base.x2Scope_Fake" then
		self.weapon:detachWeaponPart(self.part)
		self.character:getInventory():DoRemoveItem(self.part)
		self.part = InventoryItemFactory.CreateItem("Base.x2Scope")
	elseif self.part:getFullType() == "Base.x4Scope_Fake" then
		self.weapon:detachWeaponPart(self.part)
		self.character:getInventory():DoRemoveItem(self.part)
		self.part = InventoryItemFactory.CreateItem("Base.x4Scope")
	elseif self.part:getFullType() == "Base.x8Scope_Fake" then
		self.weapon:detachWeaponPart(self.part)
		self.character:getInventory():DoRemoveItem(self.part)
		self.part = InventoryItemFactory.CreateItem("Base.x8Scope")
	elseif self.part:getFullType() == "Base.Bipod_Fake" then
		self.weapon:detachWeaponPart(self.part)
		self.character:getInventory():DoRemoveItem(self.part)
		self.part = InventoryItemFactory.CreateItem("Base.Bipod")
	elseif self.part:getFullType() == "Base.LaserOn" then
		self.weapon:detachWeaponPart(self.part)
		self.character:getInventory():DoRemoveItem(self.part)
		self.part = InventoryItemFactory.CreateItem("Base.Laser")
	end
	if not self.part:hasTag("NoRemoveAttachment") then
		ISRemoveWeaponUpgrade_performHook(self)
	end
	VFESetWeaponModel(self.weapon, false)
	VFESetWeaponIcon(self.weapon)
end

local ISUpgradeWeapon_performHook = ISUpgradeWeapon.perform
function ISUpgradeWeapon:perform()
	if self.part:getFullType() == "Base.x2Scope_Fake" then
		self.character:getInventory():DoRemoveItem(self.part)
		self.part = InventoryItemFactory.CreateItem("Base.x2Scope")
	elseif self.part:getFullType() == "Base.x4Scope_Fake" then
		self.character:getInventory():DoRemoveItem(self.part)
		self.part = InventoryItemFactory.CreateItem("Base.x4Scope")
	elseif self.part:getFullType() == "Base.x8Scope_Fake" then
		self.character:getInventory():DoRemoveItem(self.part)
		self.part = InventoryItemFactory.CreateItem("Base.x8Scope")
	elseif self.part:getFullType() == "Base.Bipod_Fake" then
		self.character:getInventory():DoRemoveItem(self.part)
		self.part = InventoryItemFactory.CreateItem("Base.Bipod")
	elseif self.part:getFullType() == "Base.LaserOn" then
		self.character:getInventory():DoRemoveItem(self.part)
		self.part = InventoryItemFactory.CreateItem("Base.Laser")
	end
	ISUpgradeWeapon_performHook(self)
	VFESetWeaponModel(self.weapon, false)
	-- VFESetWeaponIcon(self.weapon)
end