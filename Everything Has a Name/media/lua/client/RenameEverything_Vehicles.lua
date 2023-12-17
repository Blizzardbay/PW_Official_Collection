require "CommonTemplates/ISUI/ISContextMenuExtension"

ISRenameEverything = ISRenameEverything or {};

ISRenameEverything.old_ISVehicleMenu_showRadialMenu = ISVehicleMenu.showRadialMenu

function ISVehicleMenu.showRadialMenu(playerObj)
    ISRenameEverything.old_ISVehicleMenu_showRadialMenu(playerObj)
    if playerObj:getVehicle() then return end
    local playerIndex = playerObj:getPlayerNum()
    local menu = getPlayerRadialMenu(playerIndex)
    local vehicle_name = nil
    local isSoloGame = (not isClient() and not isServer())

    if menu:isReallyVisible() then
        if menu.joyfocus then
            setJoypadFocus(playerIndex, nil)
        end
        menu:undisplay()
        return
    end
    local vehicle = ISVehicleMenu.getVehicleToInteractWith(playerObj)

    if vehicle then
        if vehicle:getModData().renameEverything_vehicleName then
            vehicle_name = vehicle:getModData().renameEverything_vehicleName .. "\n\n"
        else
            vehicle_name = getText("ContextMenu_unnamed") .. "\n\n"
        end
        local player = playerObj:getPlayerNum()

        --1. If Singleplayer, player should be able to rename all vehicles.
        --2. If Multiplayer, check if only admins can rename vehicles is enabled
        --3. If option is enabled, check if player is admin
        --4. If Admin, allow him to rename
        --5. If option is not enabled, check if player has keys
        --6. If so, allow him to rename

        if isSoloGame then
            menu:addSlice(vehicle_name .. getText("ContextMenu_clickToRename"), getTexture("media/ui/vehicles/rename.png"), ISRenameEverything.onRenameVehicle, player, vehicle);
        else
            if SandboxVars.EverythingHasAName.OnlyAdminCanRenameVehicles == true then
                if isAdmin() or isDebugEnabled() then
                    menu:addSlice(vehicle_name .. getText("ContextMenu_clickToRename"), getTexture("media/ui/vehicles/rename.png"), ISRenameEverything.onRenameVehicle, player, vehicle);
                end
            else
                if SandboxVars.EverythingHasAName.MustHaveKeys == true then
                    if (playerObj:getInventory():haveThisKeyId(vehicle:getKeyId()) or vehicle:isKeysInIgnition()) then
                        menu:addSlice(vehicle_name .. getText("ContextMenu_clickToRename"), getTexture("media/ui/vehicles/rename.png"), ISRenameEverything.onRenameVehicle, player, vehicle);
                    end
                else
                    menu:addSlice(vehicle_name .. getText("ContextMenu_clickToRename"), getTexture("media/ui/vehicles/rename.png"), ISRenameEverything.onRenameVehicle, player, vehicle);
                end
            end
        end
    end
end

ISRenameEverything.onRenameVehicle = function(player, vehicle)
    if vehicle:getModData().renameEverything_vehicleName then
        vehicle_name = vehicle:getModData().renameEverything_vehicleName
    else
        vehicle_name = getText("ContextMenu_unnamed")
    end

    local modal = ISTextBox:new(0, 0, 280, 180, getText("ContextMenu_label_vehicles"), vehicle_name, nil, ISRenameEverything.onRenameVehicleClick, player, getSpecificPlayer(player), vehicle);
    modal:initialise();
    modal:addToUIManager();
    modal.entry:focus()
end

function ISRenameEverything:onRenameVehicleClick(button, player, vehicle)
    if button.internal == "OK" then
        if button.parent.entry:getText() and button.parent.entry:getText() ~= "" then
            vehicle:getModData().renameEverything_vehicleName = button.parent.entry:getText()
        end
    end
end