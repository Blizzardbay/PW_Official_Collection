--[[sapph: hello! so... i spent like, 2 days in a row trying to add this code, unfortunally i`m dumb,so...
HUGE thanks to poltergeist, cause he basically did everything here! --]]

--this checks if the power is on.
local function CheckPoweredSquare(square)
	return (SandboxVars.AllowExteriorGenerator and square:haveElectricity() or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier))
end

--checks on the recipe if the player is near a fridge, and if the power is on.
function FridgeCraft(recipe, playerObj, item)
    local test = function(square) return square ~= nil and CheckPoweredSquare(square) and CheckFridge(square) end
    local square = playerObj:getSquare()
    return square ~= nil and ( test(square)
        or test(square:getAdjacentSquare(playerObj:getDir()))
        or test(square:getAdjacentSquare(playerObj:getDir():RotRight()))
        or test(square:getAdjacentSquare(playerObj:getDir():RotLeft()))
    )
end

--checks if the player is near a fridge.
function CheckFridge(square)
    return square:getContainerItem("fridge") ~= nil
end

--gives back an empty tray after completing the recipe.
function Recipe_IceTray(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("SapphCooking.IceTray", 1);
end

