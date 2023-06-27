require"Items/SuburbsDistributions"
require"recipecode"


-- Return Empty Chicken Box
function ChickenFlatUnpack(items, result, player)
	player:getInventory():AddItems("Ramen.RamenChickenFlatEmpty",1);
end

-- Return Empty Beef Box
function BeefFlatUnpack(items, result, player)
	player:getInventory():AddItems("Ramen.RamenBeefFlatEmpty",1);
end

-- Return Empty Shrimp Box
function ShrimpFlatUnpack(items, result, player)
	player:getInventory():AddItems("Ramen.RamenShrimpFlatEmpty",1);
end

-- Return Empty Cheese Box
function CheeseFlatUnpack(items, result, player)
	player:getInventory():AddItems("Ramen.RamenCheeseFlatEmpty",1);
end

-- Return Empty Chili Box
function ChiliFlatUnpack(items, result, player)
	player:getInventory():AddItems("Ramen.RamenChiliFlatEmpty",1);
end

-- Return Empty Oriental Box
function OrientalFlatUnpack(items, result, player)
	player:getInventory():AddItems("Ramen.RamenOrientalFlatEmpty",1);
end

-- Return Empty Pork Box
function PorkFlatUnpack(items, result, player)
	player:getInventory():AddItems("Ramen.RamenPorkFlatEmpty",1);
end

-- Chicken Ramen Pack Opening
function ChickenPackOpen(items, result, player)
	player:getInventory():AddItems("Ramen.RamenChickenFlav",1);
	player:getInventory():AddItems("Ramen.RamenChickenPackEmpty",1);
end

-- Beef Flavor Packet Give
function BeefPackOpen(items, result, player)
	player:getInventory():AddItems("Ramen.RamenBeefFlav",1);
	player:getInventory():AddItems("Ramen.RamenBeefPackEmpty",1);
end

-- Shrimp Flavor Packet Give
function ShrimpPackOpen(items, result, player)
	player:getInventory():AddItems("Ramen.RamenShrimpFlav",1);
	player:getInventory():AddItems("Ramen.RamenShrimpPackEmpty",1);
end

-- Cheese Flavor Packet Give
function CheesePackOpen(items, result, player)
	player:getInventory():AddItems("Ramen.RamenCheeseFlav",1);
	player:getInventory():AddItems("Ramen.RamenCheesePackEmpty",1);
end

-- Chili Flavor Packet Give
function ChiliPackOpen(items, result, player)
	player:getInventory():AddItems("Ramen.RamenChiliFlav",1);
	player:getInventory():AddItems("Ramen.RamenChiliPackEmpty",1);
end

-- Oriental Flavor Packet Give
function OrientalPackOpen(items, result, player)
	player:getInventory():AddItems("Ramen.RamenOrientalFlav",1);
	player:getInventory():AddItems("Ramen.RamenOrientalPackEmpty",1);
end

-- Pork Flavor Packet Give
function PorkPackOpen(items, result, player)
	player:getInventory():AddItems("Ramen.RamenPorkFlav",1);
	player:getInventory():AddItems("Ramen.RamenPorkPackEmpty",1);
end

-- Return Empty Chicken Flavor Packet
function ChickenEmptyFlav(items, result, player)
	player:getInventory():AddItems("Ramen.RamenChickenFlavEmpty",1);
end

-- Return Empty Beef Flavor Packet
function BeefEmptyFlav(items, result, player)
	player:getInventory():AddItems("Ramen.RamenBeefFlavEmpty",1);
end

-- Return Empty Shrimp Flavor Packet
function ShrimpEmptyFlav(items, result, player)
	player:getInventory():AddItems("Ramen.RamenShrimpFlavEmpty",1);
end

-- Return Empty Cheese Flavor Packet
function CheeseEmptyFlav(items, result, player)
	player:getInventory():AddItems("Ramen.RamenCheeseFlavEmpty",1);
end

-- Return Empty Chili Flavor Packet
function ChiliEmptyFlav(items, result, player)
	player:getInventory():AddItems("Ramen.RamenChiliFlavEmpty",1);
end

-- Return Empty Oriental Flavor Packet
function OrientalEmptyFlav(items, result, player)
	player:getInventory():AddItems("Ramen.RamenOrientalFlavEmpty",1);
end

-- Return Empty Pork Flavor Packet
function PorkEmptyFlav(items, result, player)
	player:getInventory():AddItems("Ramen.RamenPorkFlavEmpty",1);
end