require "Moveables/ISMoveableDefinitions"


function ISMoveableDefinitions.armored_load()
    local moveableDefinitions = ISMoveableDefinitions:getInstance()
	moveableDefinitions.addToolDefinition( "CordlessDrill",   {"Base.CordlessDrill"},                                            Perks.Woodwork,      75,    "Drill1",    true  )
    
end

Events.OnGameBoot.Add(ISMoveableDefinitions.armored_load);

