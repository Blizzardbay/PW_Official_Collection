local OPTIONS = {
    removevanilladuplicates = true,
}

if ModOptions and ModOptions.getInstance then
    local settings = ModOptions:getInstance(OPTIONS, "HanabSnacks", "Hanabi's Snacks")

    settings.names = {
        removevanilladuplicates = "Remove Base Game Duplicates",        
    }
end

HanabSnacks = {}
HanabSnacks.OPTIONS = OPTIONS