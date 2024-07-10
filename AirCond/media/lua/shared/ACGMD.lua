AirCondModData = {}

function InitAirCondModData(isNewGame)

    local modData = ModData.getOrCreate("WorkingAirConditioners")

    if isClient() then
        ModData.request("WorkingAirConditioners")
    end

    if not modData.WorkingUnits then modData.WorkingUnits = {} end

    AirCondModData = modData
end

function LoadAirCondModData(key, modData)
    if isClient() then
        if key and key == "WorkingAirConditioners" and modData then
            AirCondModData = modData
        end
    end
end

function TransmitAirCondModData()
    ModData.transmit("WorkingAirConditioners")
end

function GetAirCondModDataModData()
    return AirCondModData
end

Events.OnInitGlobalModData.Add(InitAirCondModData)
Events.OnReceiveGlobalModData.Add(LoadAirCondModData)
