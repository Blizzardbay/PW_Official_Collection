Coolbag = Coolbag or {};
if not Coolbag.OPTIONS then Coolbag.OPTIONS = {} end
if not Coolbag.OPTIONS.Mode then Coolbag.OPTIONS.Mode = 1 end
if not Coolbag.OPTIONS.Verbose then Coolbag.OPTIONS.Verbose = false end
Coolbag.NBKgRefrigeratedPerPocket = 10.;--need one pocket per 10 kilograms of capacity (those are big pockets)
Coolbag.FreezingThreshold_WorldItem = 0.;--TODO decide between instinctive 0 value and a more realistic value. maybe with an hysteresis.
Coolbag.FreezingThreshold_InFreezer = 0.21;--B41.50 [t freezer working ~= 0.2] [t min freezer off ~= 1.] .


function Coolbag.getMode()
    if SandboxVars and SandboxVars.Coolbag and SandboxVars.Coolbag.CoolingMode then
        if SandboxVars.Coolbag.CoolingMode == 3 then return Coolbag.OPTIONS.Mode end
        return SandboxVars.Coolbag.CoolingMode
    end
    return 1
end

function Coolbag.getFreezingTime()--hours
    if SandboxVars and SandboxVars.Coolbag and SandboxVars.Coolbag.FreezingTime then
        return SandboxVars.Coolbag.FreezingTime
    end
    return 12
end

function Coolbag.getMeltingTime()--hours
    if SandboxVars and SandboxVars.Coolbag and SandboxVars.Coolbag.MeltingTime then
        return SandboxVars.Coolbag.MeltingTime
    end
    return 24
end

function Coolbag.isTooltipOn()
    if SandboxVars and SandboxVars.Coolbag then
        return SandboxVars.Coolbag.Tooltip
    end
    return true
end