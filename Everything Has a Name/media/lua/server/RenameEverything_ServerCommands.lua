-- Use the RenameEverything table if it exists, otherwise, create it to hold the different functions that can be called by RenameEverything mod
RenameEverything = RenameEverything or {}

function RenameEverything.changeItemName(item)
    if isServer() then
        item:getModData().renameEverything_name = 
        print("called")
    end
end

-- Define the function that will be called when the client receives a command
function OnRenameEverythingCommand(module, command, player, args)
    -- Check if the module is "RenameEverything" and if the command exists in the table of commands
    if module == 'RenameEverything' and RenameEverything[command] ~= nil then

        -- Call the appropriate function with the provided arguments
        RenameEverything[command](args[1])
    end
end

-- Add the OnRenameEverythingCommand function to the list of functions that will be called when the client receives a command
Events.OnClientCommand.Add(OnRenameEverythingCommand)