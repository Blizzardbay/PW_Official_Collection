
-- Build Metal Roof
ISBlacksmithMenu.buildMetalRoofMenu = function(subMenuMW, player)
    local playerObj = getSpecificPlayer(player)
    if subMenuMW and playerObj and playerObj:isRecipeKnown("Make Metal Roof") or ISBuildMenu.cheat then
        -- simple metal floor but on square above
        local metalFloorOption = subMenuMW:addOption(getText("ContextMenu_MetalRoof2"), player, ISBlacksmithMenu.onMetalRoof, "1");
        local toolTip = ISBlacksmithMenu.addToolTip(metalFloorOption, getText("ContextMenu_MetalRoof2"), "constructedobjects_01_86");
        local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(0,1,0,0,1,1,0,playerObj,toolTip);
        toolTip.description = getText("Tooltip_craft_metalRoofDesc") .. ' <LINE> ' .. toolTip.description;
        if not canDo then metalFloorOption.notAvailable = true; end
    end
end

ISBlacksmithMenu.onMetalRoof = function(player, torchUse)
    local roof = ISWoodenRoof:new("constructedobjects_01_86","constructedobjects_01_86");
    roof.firstItem = "BlowTorch";
    roof.secondItem = "WeldingMask";
    roof.craftingBank = "BlowTorch";
    roof.noNeedHammer = true;
    roof.modData["xp:MetalWelding"] = 5;
    roof.modData["need:Base.SmallSheetMetal"] = "1";
    roof.modData["need:Base.ScrapMetal"] = "1";
    roof.modData["use:Base.BlowTorch"] = torchUse;
    roof.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    roof.player = player
    roof.completionSound = "BuildMetalStructureSmallScrap";
    getCell():setDrag(roof, player);
end

ISBlacksmithMenu.doBuildRoofMenu = function(player, context, worldobjects, test)
    if test or not context then return end
    
    local buildMWOption = context:getOptionFromName(getText("ContextMenu_MetalWelding"))
    if not buildMWOption then return end
    --print ('ISBlacksmithMenu.doBuildRoofMenu buildMWOption '..tab2str(buildMWOption))
    local subMenuMW = context:getSubMenu(buildMWOption.subOption)
    if subMenuMW then
        --print ('ISBlacksmithMenu.doBuildRoofMenu subMenuMW '..tab2str(buildMWOption))
        ISBlacksmithMenu.buildMetalRoofMenu(subMenuMW, player)
    end
end

Events.OnFillWorldObjectContextMenu.Add(ISBlacksmithMenu.doBuildRoofMenu);
