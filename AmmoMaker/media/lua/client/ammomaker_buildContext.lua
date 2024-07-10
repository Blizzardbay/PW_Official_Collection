--Ammo Maker by STIMP_TM

local function ammoMakerBuildContext(player, context, worldobjects)

    --create tools tables

    local toolsHammer = {
        [1] = "Base.Hammer",
        [2] = "Base.HammerStone",
        [3] = "Base.BallPeenHammer",
        [4] = "Base.Sledgehammer",
        [5] = "Base.Sledgehammer2",        
        [6] = "Base.ClubHammer",
    };

    local toolsSaw = {
        [1] = "Base.Saw",
        [2] = "Base.GardenSaw",
    };

    --set player variables

    local playerObject = getSpecificPlayer(player);
    local playerInventory = playerObject:getInventory();

    --get player inventory item count

    local function getPlayerInventoryItemCount(itemTypes)

        local itemCount = 0;

        for _, itemType in ipairs(itemTypes) do

            itemCount = itemCount + playerInventory:getItemCountFromTypeRecurse(itemType);

        end

        return itemCount;
    
    end

    --set player inventory item count variables

    local playerPlanks = playerInventory:getItemCountFromTypeRecurse("Base.Plank");
    local playerNails = playerInventory:getItemCountFromTypeRecurse("Base.Nails") + playerInventory:getItemCountFromTypeRecurse("Base.NailsBox") * 100;
    local playerHammer = getPlayerInventoryItemCount(toolsHammer);
    local playerSaw = getPlayerInventoryItemCount(toolsSaw);
    local playerWoodwork = playerObject:getPerkLevel(Perks.Woodwork);

    --set bird feeder variables

    local birdFeederName = "Bird Feeder";
    local birdFeederSprite = {};
    birdFeederSprite.east = "ammomaker_tilesheet_0_0";
    birdFeederSprite.north = "ammomaker_tilesheet_0_1";

    --build bird feeder

    local function onBuildBirdFeeder(worldobjects, sprite, player, name)

        local birdFeeder = ammomaker_ISBirdFeeder:new(sprite.east, sprite.north);

        birdFeeder.player = player;
        birdFeeder.name = name;
        birdFeeder.containerType = "ammomaker_BirdFeeder";
        birdFeeder.modData["need:Base.Plank"] = 2;
        birdFeeder.modData["need:Base.Nails"] = 2;
        birdFeeder.modData["xp:Woodwork"] = 4;

        getCell():setDrag(birdFeeder, player);

    end

    --get build context data

    local function getContextData(buildType)

        local contextData = {};
        local description = "";
        local canBuild = true;

        if buildType == birdFeederName then

            description = "Turns seeds into bird excrement during daytime. The stationary alternative to foraging. <LINE> <LINE> ";

            if playerPlanks >= 2 then
                description = description .. " <RGB:1,1,1> <INDENT:0> Materials: <RGB:0.8,1,0.2> <SETX:60> Plank " .. playerPlanks .. "/2 <LINE> ";
            else
                description = description .. " <RGB:1,1,1> <INDENT:0> Materials: <RGB:1,0,0> <SETX:60> Plank " .. playerPlanks .. "/2 <LINE> ";
                canBuild = false;
            end

            if playerNails >= 2 then
                description = description .. " <RGB:0.8,1,0.2> <INDENT:60> Nails " .. playerNails .. "/2 <LINE> ";
            else
                description = description .. " <RGB:1,0,0> <INDENT:60> Nails " .. playerNails .. "/2 <LINE> ";
                canBuild = false;
            end

            if playerHammer >= 1 then
                description = description .. " <RGB:1,1,1> <INDENT:0> Tools: <RGB:0.8,1,0.2> <SETX:60> Hammer <LINE> ";
            else
                description = description .. " <RGB:1,1,1> <INDENT:0> Tools: <RGB:1,0,0> <SETX:60> Hammer <LINE> ";
                canBuild = false;
            end

            if playerSaw >= 1 then
                description = description .. " <RGB:0.8,1,0.2> <INDENT:60> Saw <LINE> ";
            else
                description = description .. " <RGB:1,0,0> <INDENT:60> Saw <LINE> ";
                canBuild = false;
            end

            if playerWoodwork >= 4 then
                description = description .. " <RGB:1,1,1> <INDENT:0> Skills: <RGB:0.8,1,0.2> <SETX:60> Carpentry " .. playerWoodwork .. "/4 <LINE> ";
            else
                description = description .. " <RGB:1,1,1> <INDENT:0> Skills: <RGB:1,0,0> <SETX:60> Carpentry " .. playerWoodwork .. "/4 <LINE> ";
                canBuild = false;
            end

            contextData[1] = canBuild;
            contextData[2] = description;

            return contextData;

        end
    
    end

    --add options to world context menu

    local carpentryMenu = context:getOptionFromName(getText("ContextMenu_Build"));

    if carpentryMenu then

        --construct custom menu

        local carpentrySubMenu = context:getSubMenu(carpentryMenu.subOption);
        local ammoMakerMainMenu = carpentrySubMenu:addOption("Ammo Maker");
        local ammoMakerSubMenu = ISContextMenu:getNew(carpentrySubMenu);
        local birdFeederOption = ammoMakerSubMenu:addOption(birdFeederName, worldobjects, onBuildBirdFeeder, birdFeederSprite, player, birdFeederName);
        
        carpentrySubMenu:addSubMenu(ammoMakerMainMenu, ammoMakerSubMenu)

        local birdFeederContextData = getContextData(birdFeederName);

        if not birdFeederContextData[1] then

            if not ISBuildMenu.cheat then
                ammoMakerMainMenu.onSelect = nil;
                ammoMakerMainMenu.notAvailable = true;
                birdFeederOption.onSelect = nil;
                birdFeederOption.notAvailable = true;
            end

        end

        --construct bird feeder tool tip

        local birdFeederPreview = ISToolTip:new();
        birdFeederPreview:initialise();
        birdFeederPreview:setVisible(false);
        birdFeederPreview:setName(birdFeederName);
        birdFeederPreview.description = birdFeederContextData[2];
        birdFeederPreview.footNote = "Press \"" .. Keyboard.getKeyName(getCore():getKey("Rotate building")) .. "\" to rotate during construction";
        birdFeederPreview:setTexture(birdFeederSprite.east);
        birdFeederOption.toolTip = birdFeederPreview;

    end

end

Events.OnFillWorldObjectContextMenu.Add(ammoMakerBuildContext);