ACServer = {}
ACServer.ac_commands = {}

-- commands

ACServer.ac_commands.print = function(player, args)
    print (" ----  SERVER PRINT ----")
end

ACServer.ac_commands.toggle = function(player, args)
	local object = findClothingDryer(args.x, args.y, args.z)
	if not object then return end
	object:setActivated(not object:isActivated())
	object:sendObjectChange("dryer.state")
end

--[[
ACServer.ac_commands.settings = function(player, args)
	local object = findClothingDryer(args.x, args.y, args.z)
	if not object then return end

    local md = object:getModData()
    md['targettemp'] = args.targettemp
    md['targetfan'] = args.targetfan

	object:transmitModData()
end
]]

-- virtual ac sync

ACServer.ac_commands.add_virtual_ac = function(player, args)
    local globalModData = GetAirCondModDataModData()
    table.insert(globalModData.WorkingUnits, args)
end

ACServer.ac_commands.remove_virtual_ac = function(player, args)
    local globalModData = GetAirCondModDataModData()
    for k, v in pairs(globalModData.WorkingUnits) do
        if v then
            if v.x == args.x and v.y == args.y and v.z == args.z then
                table.remove(globalModData.WorkingUnits, k)
                break
            end
        end
    end
end

ACServer.ac_commands.update_virtual_ac = function(player, args)
    local globalModData = GetAirCondModDataModData()
    for k, v in pairs(globalModData.WorkingUnits) do
        if v then
            if v.x == args.x and v.y == args.y and v.z == args.z then
                table.remove(globalModData.WorkingUnits, k)
                table.insert(globalModData.WorkingUnits, args)
                break
            end
        end
    end
end

-- main

local onClientCommand = function(module, command, player, args)
    if ACServer[module] and ACServer[module][command] then
        local argStr = ''
        for k, v in pairs(args) do
            argStr = argStr .. ' ' .. k .. '=' .. tostring(v)
        end
        -- print ("received " .. module .. " " .. command .. " " .. tostring(player) .. argStr)
        ACServer[module][command](player, args);
        TransmitAirCondModData()
    end
end

print ("-------------------------------")
print ("---- aircond server ready -----")
print ("-------------------------------")

Events.OnClientCommand.Add(onClientCommand);

