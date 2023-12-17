-----------------------------------------------------------------------
-- Paw Low Loot
-- by Paulo H M Moura
-----------------------------------------------------------------------
-- General mod info
local MOD_ID = "PLLoot";
local MOD_NAME = "Paw Low Sets";
local MOD_VERSION = "1.0";
local MOD_AUTHOR = "PauloHMMoura";
local MOD_DESCRIPTION = "adds new items to the game.";

local debugItems = false;

-- ------------------------------------------------
-- Functions
-- ------------------------------------------------
---
-- Prints out the mod info on startup.
--
local function info()
	print("Mod Loaded: " .. MOD_NAME .. " by " .. MOD_AUTHOR .. " (v" .. MOD_VERSION .. ")");
end

---
-- Add some items to the player's inventory for testing purposes.
-- Nothing to see here
local function giveItems()
    if debugItems then
        local player = getSpecificPlayer(0);
		
		player:getInventory():AddItem("");
		player:getInventory():AddItem("");
    end
end

-- local function getRandomCondition(_item)
	-- _item:setCondition(ZombRand(_item:getConditionMax())+1);
-- end

-- ------------------------------------------------
-- Game hooks
-- ------------------------------------------------
Events.OnGameBoot.Add(info);
Events.OnGameStart.Add(giveItems);
