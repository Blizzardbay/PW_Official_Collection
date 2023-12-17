KAMER_WallHealth = KAMER_WallHealth or {}
KAMER_WallHealth.trashcan = {
    menu = nil,
}

---------------------------------------------------------------------------------------------------------------------------------
--                                  Start Checking For Object/Send Data to Server.
---------------------------------------------------------------------------------------------------------------------------------

function KAMER_WallHealth.Check(PlayerIN, context, worldObjects, test)
    if not context or context == nil then return end;
    local saveK = {};
    local d = 0;
    
    for _, k in ipairs(worldObjects) do
        if (instanceof(k, "IsoThumpable") or instanceof(k, "IsoDoor")) and saveK[k] == nil then

            if d == 0 then
                d = d + 1
                local SubMenuOption = nil;

                KAMER_WallHealth.trashcan.menu = ISContextMenu:getNew(context);
            
                SubMenuOption = context:addOptionOnTop(getText("ContextMenu_Kamer_ShowWallHealth_Check_Status"), worldObjects, nil)
                SubMenuOption.iconTexture = getTexture("media/ui/infoIcon.png");
                context:addSubMenu(SubMenuOption, KAMER_WallHealth.trashcan.menu);
            end

            saveK[k] = true
            local square = k:getSquare()
            local o = {}
            o.playerIndex = PlayerIN
            o.index = k:getObjectIndex()
            o.health = k:getHealth()
            o.newHealth = 0
            o.x = square:getX()
            o.y = square:getY()
            o.z = square:getZ()
            if isClient() then
                sendClientCommand("KAMER_WallHealth_Client", "updateHealth", o);
            else
                KAMER_WallHealth.HandleClientRequestsK("KAMER_WallHealth_Server", "updateHealth", o)
            end
        end
    end
end

Events.OnFillWorldObjectContextMenu.Add(KAMER_WallHealth.Check)

---------------------------------------------------------------------------------------------------------------------------------
--                                  Handling Data From Server.
---------------------------------------------------------------------------------------------------------------------------------

function KAMER_WallHealth.HandleClientRequestsK(module, command, args)
    if module ~= "KAMER_WallHealth_Server" then return end;

    if command == "updateHealth" then
        local Player = getSpecificPlayer(args.playerIndex)
        if not Player or Player == nil then return end;
        local GetSquare = Player:getCell():getGridSquare(args.x, args.y, args.z)
        if not GetSquare or GetSquare == nil then return end;
        local GetObjects = GetSquare:getObjects()
        local ob = GetObjects:get(args.index)
        if ob and (instanceof(ob, "IsoThumpable") or instanceof(ob, "IsoDoor")) then
            local objName = ob:getName() or ob:getProperties():Val("CustomName")
            if objName then
                local prepareName = "ContextMenu_" .. string.gsub(objName, " ", "_")
                objName = getText(prepareName)
                if objName == prepareName then
                    objName = ob:getProperties():Val("CustomName") or ob:getName() or "Unknown Object (Unnamed)"
                end
            else
                objName = "Unknown Object (Unnamed)"
            end

            if isClient() then
            ob:setHealth(args.newHealth)
            else
                args.newHealth = ob:getHealth()
            end

            local objMaxHealth = ob:getMaxHealth()
    
            if args.newHealth == 0 then return end
    
            local Object = nil;
            if not KAMER_WallHealth.trashcan.menu or KAMER_WallHealth.trashcan.menu == nil or KAMER_WallHealth.trashcan.menu == "null" then return end;
            Object = KAMER_WallHealth.trashcan.menu:addOption(getText("ContextMenu_Kamer_ShowWallHealth_Check", objName), ob, KAMER_WallHealth.onObjectInfo, ob, Player)
            if Player:DistToSquared(args.x + 0.5, args.y + 0.5) < 2 * 2 then
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(objName);
                tooltip.description = getText("ContextMenu_Kamer_ShowWallHealth_Health", args.newHealth, objMaxHealth);
                Object.toolTip = tooltip;
            end
        end
    end
end

Events.OnServerCommand.Add(KAMER_WallHealth.HandleClientRequestsK)

---------------------------------------------------------------------------------------------------------------------------------
--                                  Pass on.
---------------------------------------------------------------------------------------------------------------------------------

function KAMER_WallHealth.onObjectInfo(self, k, Player)
    if luautils.walkAdjWindowOrDoor(Player, k:getSquare(), k) then
	ISTimedActionQueue.add(Kamer_WallHeathAction:new(Player, k))
    end
end

