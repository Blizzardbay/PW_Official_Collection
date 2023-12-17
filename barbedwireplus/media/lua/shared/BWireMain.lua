BWirePlus = {};

function BWirePlus:sleepDo(seconds, func, condition)
	local time = os.time();
	local targetTime = time + seconds;
	if condition == nil then condition = true end; -- Optional 


	local function OnSleepTick()
		local timeNew = os.time();
		if not condition then 
			Events.OnTick.Remove(OnSleepTick);
			return
		end
		if timeNew >= targetTime then
			Events.OnTick.Remove(OnSleepTick);
			func();
		end
	end
	Events.OnTick.Add(OnSleepTick)
end

function BWirePlus:getZombieByID(ID)
    ---@type IsoCell
    local cell = getCell()
    if not cell then return end

    local zombies = cell:getZombieList()
    if not zombies then return end

    for i=0, zombies:size()-1 do
        ---@type IsoZombie|IsoGameCharacter|IsoMovingObject|IsoObject
        local zombie = zombies:get(i)
        if zombie:getOnlineID()==ID then return zombie end
    end
end

function BWirePlus:isMultiplayer() return getCore():getGameMode() == "Multiplayer" end

function BWirePlus:selectRandom(array)
	local index = ZombRand(1, #array + 1);
	return array[index];
end