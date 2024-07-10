local CL = {}
CL.ClothesLinesInSquare = {}

CL.textureNames = {
    ["appliances_laundry_01_26"] = true,
    ["appliances_laundry_01_27"] = true,
    ["appliances_laundry_01_28"] = true,
    ["appliances_laundry_01_29"] = true,
    ["appliances_laundry_01_30"] = true,
    ["appliances_laundry_01_31"] = true
}

function CL.loadGridsquare(square)
    if square:getObjects() then
        local objects = square:getObjects();
        for i = 0, objects:size() - 1 do
            local obj = objects:get(i);
            local textureName = obj:getTextureName();
            if textureName and CL.textureNames[textureName] then
                CL.ClothesLinesInSquare[obj] = true;
            end
        end
    end
end

function CL.everyTenMinutes()
    if CL.ClothesLinesInSquare then
        for obj in pairs(CL.ClothesLinesInSquare) do
            local container = obj:getItemContainer();
            if container and not container:isEmpty() then
                local items = container:getItems();
                for x = 0, items:size() - 1 do
                    local item = items:get(x);
                    if item:IsClothing() then
                        if not RainManager.isRaining() and item:getWetness() > 0 then
                            item:setWetness(item:getWetness() - 15);
                        elseif RainManager.isRaining() then
                            item:setWetness(item:getWetness() + 10);
                        end
                    end
                end
            end
        end
    end
end

Events.LoadGridsquare.Add(CL.loadGridsquare)
Events.EveryTenMinutes.Add(CL.everyTenMinutes)

return CL