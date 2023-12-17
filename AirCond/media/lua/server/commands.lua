ACServer = {}
ACServer.ac_commands = {}

-- local 
local function findClothingDryer(x, y, z)
	local gs = getCell():getGridSquare(x, y, z)
	if not gs then return nil end
	for i=1,gs:getObjects():size() do
		local obj = gs:getObjects():get(i-1)
		if obj and instanceof(obj, 'IsoClothingDryer') then
			return obj
		end
	end
	print ('no clothing dryer at '..x..','..y..','..z)
	return nil
end

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

ACServer.ac_commands.settings = function(player, args)
	local object = findClothingDryer(args.x, args.y, args.z)
	if not object then return end

    local md = object:getModData()
    md['targettemp'] = args.targettemp
    md['targetfan'] = args.targetfan

	object:transmitModData()
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
    end
end

print ("-------------------------------")
print ("---- aircond server ready -----")
print ("-------------------------------")

Events.OnClientCommand.Add(onClientCommand);

