local OPTIONS = {
    removevanilladrinks = true,
}

if ModOptions and ModOptions.getInstance then
    local settings = ModOptions:getInstance(OPTIONS, "CAR", "Hanabi's Drinks")

    settings.names = {
        removevanilladrinks = "Remove Base Game Pops",        
    }
end

CAR = {}
CAR.OPTIONS = OPTIONS