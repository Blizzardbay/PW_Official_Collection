VirtualAC = {}

function VirtualAC.Add (ac)
    local globalModData = GetAirCondModDataModData()
    local x = ac:getX()
    local y = ac:getY()
    local z = ac:getZ()
    local orientation = detectOrientationAC(ac)

    if x and y and z then 

        local entry = {}
        entry.x = x
        entry.y = y
        entry.z = z
        entry.orientation = orientation
        entry.temp = 20
        entry.fanspeed = 3
        entry.state = false

        table.insert(globalModData.WorkingUnits, entry)

        if isClient() then
            sendClientCommand(getPlayer(), 'ac_commands', 'add_virtual_ac', entry)
        end
    end
end

function VirtualAC.Remove (x, y, z)
    local globalModData = GetAirCondModDataModData()

    if x and y and z then 
        for k, v in pairs(globalModData.WorkingUnits) do
            if v then
                if v.x == x and v.y == y and v.z == z then
                    table.remove(globalModData.WorkingUnits, k)
                    if isClient() then
                        sendClientCommand(getPlayer(), 'ac_commands', 'remove_virtual_ac', {x=x, y=y, z=z})
                    end
                    break
                end
            end
        end
    end
end

function VirtualAC.Toggle (x, y, z, st)
    local globalModData = GetAirCondModDataModData()

    local entry = {}
    entry.x = x
    entry.y = y
    entry.z = z

    -- revese fix
    entry.orientation = "H"
    entry.temp = 20
    entry.fanspeed = 3
    entry.state = st

    for k, v in pairs(globalModData.WorkingUnits) do
        if v then
            if v.x == x and v.y == y and v.z == z then
                entry.orientation = v.orientation
                entry.temp = v.temp
                entry.fanspeed = v.fanspeed
                entry.state = st
                table.remove(globalModData.WorkingUnits, k)
                break
            end
        end
    end
    table.insert(globalModData.WorkingUnits, entry)

    if isClient() then
        sendClientCommand(getPlayer(), 'ac_commands', 'update_virtual_ac', entry)
    end

end

function VirtualAC.Settings (x, y, z, temp, fanspeed)
    local globalModData = GetAirCondModDataModData()

    local entry = {}
    entry.x = x
    entry.y = y
    entry.z = z
    entry.temp = temp
    entry.fanspeed = fanspeed

    --reverse fix
    entry.orientation = "H"
    entry.state = false


    for k, v in pairs(globalModData.WorkingUnits) do
        if v then
            if v.x == x and v.y == y and v.z == z then
                entry.orientation = v.orientation
                entry.state = v.state
                table.remove(globalModData.WorkingUnits, k)
                break
            end
        end
    end
    table.insert(globalModData.WorkingUnits, entry)

    if isClient() then
        sendClientCommand(getPlayer(), 'ac_commands', 'update_virtual_ac', entry)
    end

end



function VirtualAC.Get (x, y, z)
    local globalModData = GetAirCondModDataModData()

    for k, v in pairs(globalModData.WorkingUnits) do
        if v then
            if v.x == x and v.y == y and v.z == z then
                return v
            end
        end
    end
    return false
end
