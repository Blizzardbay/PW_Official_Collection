
function Recipe.OnCreate.DismantleCoolbag(items, result, player)
    player:getInventory():AddItems("Base.Coldpack", 2);
end

function Recipe.OnCreate.MakeWaterPocket(items, result, player)
    Coolbag.initColdSourceItem(result)
end

