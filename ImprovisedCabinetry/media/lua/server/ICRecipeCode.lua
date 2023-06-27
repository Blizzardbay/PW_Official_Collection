-- Give XP on Completion of Cabinets
function Recipe.OnGiveXP.ImprovisedCabinetry_XPWoodCabinet(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Woodwork, 10);
end

function Recipe.OnGiveXP.ImprovisedCabinetry_XPMetalCabinet(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 10);
end

function Recipe.OnGiveXP.ImprovisedCabinetry_XPWoodPanel(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Woodwork, 5)
end

function Recipe.OnGiveXP.ImprovisedCabinetry_XPMetalHinge(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 5)
end

function Recipe.OnCreate.ImprovisedCabinetry_SteelShelves(items, result, player, selectedItem)
    local item = InventoryItemFactory.CreateItem("Moveables.Moveable")
    item:ReadFromWorldSprite("furniture_shelving_01_24");
    player:getInventory():AddItem(item)
end