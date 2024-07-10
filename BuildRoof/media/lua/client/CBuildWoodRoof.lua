
local lcl = {}

-- Build Wood Roof
lcl.buildFloorMenu = ISBuildMenu.buildFloorMenu
ISBuildMenu.buildFloorMenu = function(subMenu, player)
    lcl.buildFloorMenu(subMenu, player)
    ISBuildMenu.buildWoodRoofMenu(subMenu, player)
end

ISBuildMenu.buildWoodRoofMenu = function(subMenu, player)
    -- simple wooden floor but on square above
    local roofSprite = ISBuildMenu.getWoodenFloorSprites(player);
    local roofOption = subMenu:addOption(getText("ContextMenu_Wooden_Roof"), worldobjects, ISBuildMenu.onWoodenRoof, nil, roofSprite, player);
    local tooltip = ISBuildMenu.canBuild(1,1,0,0,0,1,roofOption, player);
    tooltip:setName(getText("ContextMenu_Wooden_Roof"));
    tooltip.description = getText("Tooltip_craft_woodenRoofDesc") .. tooltip.description;
    tooltip:setTexture(roofSprite.sprite);
    ISBuildMenu.requireHammer(roofOption)
end

ISBuildMenu.onWoodenRoof = function(worldobjects, nilSquare, sprite, player)
    -- sprite, northSprite
    local roof = ISWoodenRoof:new(sprite.sprite, sprite.northSprite)
    roof.modData["xp:Woodwork"] = 3;
    roof.modData["need:Base.Plank"] = "1";
    roof.modData["need:Base.Nails"] = "1";
    roof.player = player
    roof.completionSound = "BuildWoodenStructureMedium";
    getCell():setDrag(roof, player);
end


