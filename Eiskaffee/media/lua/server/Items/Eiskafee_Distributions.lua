require 'Items/SuburbsDistributions'
require "Items/Distributions"
require "Items/ProceduralDistributions"
require "SuburbsDistributions"


local function addSandboxLoot()


--Set Sandbox Settings values.
local SpawnChance = SandboxVars.Eiskaffee.SpawnChance; 




--Adds spawns.

--Random Zombie Drops
    table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Eiskafee.Small_Eiskafee");
    table.insert(SuburbsDistributions["all"]["inventorymale"].items, SpawnChance * 0.005);

    table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Eiskafee.Small_Eiskafee");
    table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, SpawnChance * 0.005);

    --FridgeGeneric
    table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "Eiskafee.Small_Eiskafee");
    table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, SpawnChance * 1);
    table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "Eiskafee.Large_Eiskafee");
    table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, SpawnChance * 1);

    --FridgeRich
    table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "Eiskafee.Small_Eiskafee");
    table.insert(ProceduralDistributions["list"]["FridgeRich"].items, SpawnChance * 1);
    table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "Eiskafee.Large_Eiskafee");
    table.insert(ProceduralDistributions["list"]["FridgeRich"].items, SpawnChance * 1);

    
    --FridgeTrailerPark
    table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "Eiskafee.Small_Eiskafee");
    table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, SpawnChance * 1);
    table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "Eiskafee.Large_Eiskafee");
    table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, SpawnChance * 1);

    --FridgeOther
    table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "Eiskafee.Small_Eiskafee");
    table.insert(ProceduralDistributions["list"]["FridgeOther"].items, SpawnChance * 1);
    table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "Eiskafee.Large_Eiskafee");
    table.insert(ProceduralDistributions["list"]["FridgeOther"].items, SpawnChance * 1);

    --FridgeSnacks
    table.insert(ProceduralDistributions["list"]["FridgeSnacks"].items, "Eiskafee.Small_Eiskafee");
    table.insert(ProceduralDistributions["list"]["FridgeSnacks"].items, SpawnChance * 1);
    table.insert(ProceduralDistributions["list"]["FridgeSnacks"].items, "Eiskafee.Large_Eiskafee");
    table.insert(ProceduralDistributions["list"]["FridgeSnacks"].items, SpawnChance * 1);



   ItemPickerJava.doParse = true
end

local function parseTables()
    if ItemPickerJava.doParse then
        ItemPickerJava.Parse()
        ItemPickerJava.doParse = nil
    end
end

Events.OnInitGlobalModData.Add(addSandboxLoot)
Events.OnLoadedMapZones.Add(parseTables)

  
