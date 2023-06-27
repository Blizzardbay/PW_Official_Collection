local IS_DEBUG = getCore():getDebug()

local DEBUG = {}

function DEBUG.getDoorSprites(door)
    if door then
        local sprite = door:getSprite()
        local openSprite = door:getOpenSprite()
        local config = EADAY.getDoorConfig(door)
        print("Config is stored: ", not (not config))
        if config then
            print("Config name: ", config.name)
            local N = not (not config.north.sprite)
            local W = not (not config.west.sprite)
            local configured
            if N and W then
                configured = "N & W"
            elseif N then
                configured = "N"
            elseif W then
                configured = "W"
            end
            print("Config for: ", configured)
        end
        print("Is north: ", door:getNorth())
        local isGarageDoor = openSprite:getProperties():Is("GarageDoor")
        print("isGarageDoor: ", isGarageDoor)
        print("IsoDoor type: ", door:getType())
        print("Main sprite: ", sprite:getName())
        print("Open sprite: ", openSprite:getName())
        print("Health: ", door:getHealth())
        print("MaxHealth: ", door:getMaxHealth())
        -- print("BreakSound: ", not (not config))
        print("keyId: ", door:getKeyId())
        print("Object: ", door)
        print("DDI: ", IsoDoor.getDoubleDoorIndex(door))
    -- print("getDoubleDoorIndex: ", door:getDoubleDoorIndex())
    end
end

function DEBUG.unlockDoor(door)
    print("Unlocking door: ", door)
    door:setLockedByKey(false)
    -- door:setKeyId(-1)
end
function DEBUG.createDoor(doorConfig)
    local player = getPlayer()
    local inv = player:getInventory()
    -- add doorItem and hinges to inventory
    local doorItem = inv:AddItem(doorConfig.fullType)
    inv:AddItem("Base.Hinge")
    inv:AddItem("Base.Hinge")
    -- Check if has screwdriver and crowbar and add to inventory if not
    local hasScrewdriver = inv:getFirstTypeRecurse("Base.Screwdriver")
    if not hasScrewdriver then
        inv:AddItem("Base.Screwdriver")
    end
    local hasCrowbar = inv:getFirstTypeRecurse("Base.Crowbar")
    if not hasCrowbar then
        inv:AddItem("Base.Crowbar")
    end
    -- assign modData
    local orientation
    local DMD = doorItem:getModData()
    if doorConfig.north.sprite then
        orientation = "north"
    else
        orientation = "west"
    end
    DMD.EADAY = {
        maxHealth = 500,
        health = 500,
        name = name,
        closedSprite = doorConfig.north.sprite or doorConfig.west.sprite,
        openSprite = doorConfig.north.openSprite or doorConfig.west.openSprite,
        orientation = orientation,
        -- breakSound = door:getBreakSound(),
        keyId = -1,
        thumpDmg = 5
    }
    -- call the action
    EADAY.installDoor(player)(doorItem)
end
local function deleteObjectFromWorld(object)
    local square = object:getSquare()
    square:transmitRemoveItemFromSquare(object)
end
function DEBUG.deleteDoor(door)
    deleteObjectFromWorld(door)
end
local function addDoorToWorld(square, spriteName, north)
    if not spriteName then
        getPlayer:Say("Missing sprite config")
        return
    end
    local cell = square:getCell()
    local newDoor = IsoDoor.new(cell, square, getSprite(spriteName), north)
    square:AddSpecialObject(newDoor)
    newDoor:transmitCompleteItemToServer()
end
function DEBUG.materializeDoor(frame)
    return function(doorConfig)
        -- local cell = getWorld():getCell()
        local square = frame:getSquare()
        -- local cell = square:getCell()
        local north = frame.getNorth()
        local spriteName = doorConfig[EADAY.getObjectOrientation(frame)].sprite
        addDoorToWorld(square, spriteName, north)
    end
end
function DEBUG.replaceDoor(door)
    return function(doorConfig)
        local square = door:getSquare()
        -- local cell = square:getCell()
        local north = door:getNorth()
        deleteObjectFromWorld(door)
        local spriteName = doorConfig[EADAY.getObjectOrientation(door)].sprite
        addDoorToWorld(square, spriteName, north)
    end
end

local function addDoorListOptions(option, context, handler)
    local subMenu = ISContextMenu:getNew(context)
    -- print(option, subMenu)
    context:addSubMenu(option, subMenu)
    for i, DCFG in ipairs(EADAY.DoorConfigs) do
        subMenu:addOption(DCFG.name, DCFG, handler)
    end
end

local function addWorldDebugOptions(player, context, worldObjects)
    -- print(player)
    -- print(context)
    -- print(worldObjects)
    local door = EADAY.getSpecificObjectFromWorldObjects(worldObjects, EADAY.isDoor)

    if door then
        context:addOption("EADAY: Get door info", door, DEBUG.getDoorSprites)
        context:addOption("EADAY: Unlock door", door, DEBUG.unlockDoor)
        context:addOption("EADAY: Delete door", door, DEBUG.deleteDoor)
        local replaceDoorOption = context:addOption("EADAY: Replace door", door, nil)
        addDoorListOptions(replaceDoorOption, context, DEBUG.replaceDoor(door))
    else
        local frame = EADAY.getSpecificObjectFromWorldObjects(worldObjects, EADAY.isFrame)
        if frame then
            local materializeDoorOption = context:addOption("EADAY: Replace door", frame, nil)
            addDoorListOptions(materializeDoorOption, context, DEBUG.materializeDoor(frame))
        end
    end
    local createDoorOption = context:addOption("EADAY: Create door", door, nil)
    addDoorListOptions(createDoorOption, context, DEBUG.createDoor)
end
if IS_DEBUG then
    -- print("DEBUG DETECTED")
    -- Events.OnFillInventoryObjectContextMenu.Add(addDebugOptions)
    Events.OnFillWorldObjectContextMenu.Add(addWorldDebugOptions)
end
