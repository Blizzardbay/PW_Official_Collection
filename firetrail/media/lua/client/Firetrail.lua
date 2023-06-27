Firetrail = {}

local collectionUtil = require("PZISCollectionUtils");
local Set = collectionUtil.Set;

--Firetrail.Set = nil
Firetrail.currentIndex = 1
Firetrail.pathsSet = {} --logic to connects multiple sets paths
local function predicatePetrol(item)
	return (item:hasTag("Petrol") or item:getType() == "PetrolCan") and (item:getDrainableUsesInt() > 0)
end

Firetrail.getDistanceBetween = function(x1, y1, x2, y2)
    local dx = x1 - x2;
    local dy = y1 - y2;

    return math.sqrt( (dx*dx) + (dy*dy) ); --math.pow is slower 3.4x than x*x Вишня
end

--mp compatibility
local mp_isClient = isClient()
--local mp_isServer = isServer()
local mp_isMultiplayer = getWorld():getGameMode() == "Multiplayer"
local randDurationFireEnergy = {250,300,350}
Firetrail.StartFire = function(square)
	
	if mp_isMultiplayer then
		if mp_isClient then
			--you can't send objects, it should be primary types - Ρоltergeist {["squareServer"]= square, ["square_x"]= square:getX(),["square_y"]= square:getY(),["square_z"]= square:getZ(),["square_cell"]= square:getCell()}
			sendClientCommand(Firetrail.playerObj, "firetrail", "StartFire", {["square_x"]= square:getX(),["square_y"]= square:getY(),["square_z"]= square:getZ()})
		end
	else
		IsoFireManager.StartFire(square:getCell(), square, true, 100, randDurationFireEnergy[ZombRand(3)+1]);
	end
end

function Firetrail:isActionValid()
    if not ISBuildMenu.cursor then
        return false
    end


    local square = ISBuildMenu.cursor.sq
    if square then
		if Firetrail.isStartFire then
			local playerSq = Firetrail.playerObj:getCurrentSquare()
			local dist = Firetrail.getDistanceBetween(playerSq:getX(),playerSq:getY(),square:getX(),square:getY())
			if dist > 1.8 then return false end
			
			for i,v in pairs(Firetrail.pathsSet) do
				if v:contains(square) then
					return true
				end
			end
			
			--be able to light the world others puddles
			for i,v in pairs(square:getLuaTileObjectList()) do
				if v:getName() == "GasPuddle" then return true end
			end
			
			return false
			--return Firetrail.Set:contains(square)
		else
			return true
		end
    end

    return false
end

local randDurationFireEnergy = {250,300,350}
--local nonDuplicateChainIndex = 1
local function startChainReactionFire(tableSet, currentIndex)
		--Firetrail.playerObj:Say(#Firetrail.pathsSet.." "..currentIndex.." chain")
	for sqElem,_ in pairs(tableSet) do
		--IsoFireManager.StartFire(sqElem:getCell(), sqElem, true, 100, randDurationFireEnergy[ZombRand(3)+1]);
		Firetrail.StartFire(sqElem)
		Firetrail.pathsSet[currentIndex]:remove(sqElem)
		for i,v in pairs(sqElem:getLuaTileObjectList()) do
			if v:getName() == "GasPuddle" then
				sqElem:RemoveTileObject(v);
			end
		end
		
		--chain reaction
		--for x = currentIndex+1, #Firetrail.pathsSet do
		for x = 1, #Firetrail.pathsSet do
			if x~=currentIndex and Firetrail.pathsSet[x]:contains(sqElem) then
				Firetrail.pathsSet[x]:remove(sqElem)
				startChainReactionFire(Firetrail.pathsSet[x]:getIterable(), x)
			end
		end
	end
end

local clickedSquare = nil
Firetrail.activateChainReaction = function(remoteSquare)
	local square = clickedSquare or remoteSquare
	clickedSquare = nil
	--nonDuplicateChainIndex = 1
	
	--for i,v in pairs(Firetrail.pathsSet) do
	--	if v:contains(square) then
	--		startChainReactionFire(v:getIterable(), i)
	--		return
	--	end
	--end
	
	Firetrail.spreadBFSOptimized(square) --be able to light the world others trail too
	
	
end

--if you want to use your modded items, use table.insert(Firetrail.currentSupportedItemsStartFire, "Type (1st column on item list debug)")
Firetrail.currentSupportedItemsStartFire = {"Lighter", "Matches", "BlowTorch"} --add new items types here getFirstTypeRecurse, or add a tag StartFire to it containsTagRecurse

Firetrail.onSquareClick = function(worldobjects, square)

	if luautils.walkAdj(Firetrail.playerObj, square, true) then
		
		if Firetrail.isStartFire then
			Firetrail.playerObj:faceLocation(square:getX(),square:getY())
		
			--if Set:contains(square) then --trust isActionValid
				
				if Firetrail.playerInv:containsTagRecurse("StartFire") then
					ISWorldObjectContextMenu.equip(Firetrail.playerObj, Firetrail.playerObj:getPrimaryHandItem(), Firetrail.playerInv:getFirstTagRecurse("StartFire"), true, false)
				else --easy to add new types to light fire
					for i,v in pairs(Firetrail.currentSupportedItemsStartFire) do
						if Firetrail.playerInv:containsTypeRecurse(v) then
							ISWorldObjectContextMenu.equip(Firetrail.playerObj, Firetrail.playerObj:getPrimaryHandItem(), Firetrail.playerInv:getFirstTypeRecurse(v), true, false)
							break;
						end
					end				
				end
				--if Firetrail.playerInv:containsTypeRecurse("Lighter") then
				--	ISWorldObjectContextMenu.equip(Firetrail.playerObj, Firetrail.playerObj:getPrimaryHandItem(), Firetrail.playerInv:getFirstTypeRecurse("Lighter"), true, false)
				--elseif Firetrail.playerObj:getInventory():containsTypeRecurse("Matches") then
				--	ISWorldObjectContextMenu.equip(Firetrail.playerObj, Firetrail.playerObj:getPrimaryHandItem(), Firetrail.playerInv:getFirstTypeRecurse("Matches"), true, false)
				--elseif Firetrail.playerObj:getInventory():containsTypeRecurse("BlowTorch") then
				--	ISWorldObjectContextMenu.equip(Firetrail.playerObj, Firetrail.playerObj:getPrimaryHandItem(), Firetrail.playerInv:getFirstTypeRecurse("BlowTorch"), true, false)
				--end
				
				--need to do sets connections
				
				--mvp with single set
				--local tableSet = Firetrail.Set:getIterable()
				--local randDurationFireEnergy = {250,300,350}
				--for i,_ in pairs(tableSet) do
				--	IsoFireManager.StartFire(i:getCell(), i, true, 100, randDurationFireEnergy[ZombRand(3)+1]);
				--	Firetrail.Set:remove(i)
				--end
				
				clickedSquare = square
				--nonDuplicateChainIndex = 1
				--for i,v in pairs(Firetrail.pathsSet) do
				--	if v:contains(square) then
				--		startChainReactionFire(v:getIterable(), i)
				--	end
				--end
				
				ISTimedActionQueue.add(ISFireTrailAction:new(Firetrail.playerObj, square, 35, true));
				--IsoFireManager.StartFire(square:getCell(), square, true, 100, 200);
			--end
		else
			ISWorldObjectContextMenu.equip(Firetrail.playerObj, Firetrail.playerObj:getSecondaryHandItem(), Firetrail.playerInv:getFirstEvalRecurse(predicatePetrol), false, false)
			
			if #Firetrail.pathsSet == 0 then				
				table.insert(Firetrail.pathsSet, Set:new(nil))
				Firetrail.currentIndex = 1
				--Firetrail.playerObj:Say(#Firetrail.pathsSet.." "..Firetrail.currentIndex.."if")
			else
				local foundIndex = -1
				for i,v in pairs(Firetrail.pathsSet) do
					--local d5 = Firetrail.pathsSet
					--if v:isEmpty() then Firetrail.playerObj:Say("true empty") else Firetrail.playerObj:Say("false empty") end
					--if v:contains(square) then Firetrail.playerObj:Say("true contains")else Firetrail.playerObj:Say("false contains") end
					if v:contains(square) or v:isEmpty() then
						foundIndex = i
						break
					end
				end				
				
				if foundIndex == -1 then
					table.insert(Firetrail.pathsSet, Set:new(nil))
					Firetrail.currentIndex = #Firetrail.pathsSet
				else
					Firetrail.currentIndex = foundIndex
				end
				--Firetrail.playerObj:Say(#Firetrail.pathsSet.." "..Firetrail.currentIndex.." "..foundIndex.."else")
				
			end
			
			
			--can balance how much tiles per use by changing time
			ISTimedActionQueue.add(ISFireTrailAction:new(Firetrail.playerObj, square, 200, false))
		end

	end
	
end

--ISWorldObjectContextMenu.onBurnCorpse = function(worldobjects, player, corpse)
--    local playerObj = getSpecificPlayer(player)
--    local playerInv = playerObj:getInventory()
--    if corpse:getSquare() and luautils.walkAdj(playerObj, corpse:getSquare()) then
--        if playerInv:containsTagRecurse("StartFire") then
--            ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), playerInv:getFirstTagRecurse("StartFire"), true, false)
--        elseif playerInv:containsTypeRecurse("Lighter") then
--            ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), playerInv:getFirstTypeRecurse("Lighter"), true, false)
--        elseif playerObj:getInventory():containsTypeRecurse("Matches") then
--            ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), playerInv:getFirstTypeRecurse("Matches"), true, false)
--        end
--        ISWorldObjectContextMenu.equip(playerObj, playerObj:getSecondaryHandItem(), playerInv:getFirstEvalRecurse(predicatePetrol), false, false)
--        ISTimedActionQueue.add(ISBurnCorpseAction:new(playerObj, corpse, 110));
--    end
--end


function Firetrail.onSetupCursor(worldobjects, isStartFire)
	
	Firetrail.isStartFire = isStartFire
	
    -- if Firetrail.playerObj:getJoypadBind() ~= -1 then return end -- this line disables controllers
	
    ISBuildMenu.cursor = ISBuildCursorMouse:new(Firetrail.playerObj, Firetrail.onSquareClick, Firetrail.isActionValid)
    ISBuildMenu.cursor.sprite = 'media/ui/FloorTileCursor.png'
    getCell():setDrag(ISBuildMenu.cursor, Firetrail.playerObj:getPlayerNum())
end

Firetrail.OnFillWorldObjectContextMenu = function(player, context, worldobjects)
    local playerObj = getSpecificPlayer(player)
    Firetrail.player = player
    Firetrail.playerObj = playerObj
    Firetrail.playerInv = playerObj:getInventory()
	
	
	--if playerInv:containsEvalRecurse(predicatePetrol) and (playerInv:containsTagRecurse("StartFire") or playerInv:containsTypeRecurse("Lighter") or playerInv:containsTypeRecurse("Matches")) then
	--		if test == true then return true; end
    --        context:addOption(getText("ContextMenu_Burn_Corpse"), worldobjects, ISWorldObjectContextMenu.onBurnCorpse, player, body);
    --    end
	local submenu = context:getNew(context);
	local haveFireOption = false
	if Firetrail.playerInv:containsEvalRecurse(predicatePetrol) then
        submenu:addOption(getText("ContextMenu_Firetrail_create"), worldobjects, Firetrail.onSetupCursor, false);
		haveFireOption=true
    end
	
	local containsAnyStartFireSource = Firetrail.playerInv:containsTagRecurse("StartFire")	
	for i,v in pairs(Firetrail.currentSupportedItemsStartFire) do
		containsAnyStartFireSource = containsAnyStartFireSource or Firetrail.playerInv:containsTypeRecurse(v)
		if containsAnyStartFireSource then break end
	end
	
	if containsAnyStartFireSource then
        submenu:addOption(getText("ContextMenu_Firetrail_ignite"), worldobjects, Firetrail.onSetupCursor, true);
		haveFireOption=true
    end
	
	if haveFireOption then
		local fireoption = context:addOption(getText("ContextMenu_Firetrail"), nil, nil) --edit capacity
		context:addSubMenu(fireoption,submenu)
	end
end

--compatibility with external fire
function Firetrail.spreadBFSOptimized(square)
	--if are from existing paths ignore, low cost
	for i,v in pairs(Firetrail.pathsSet) do
		if v:contains(square) then
			--enable external activation
			startChainReactionFire(v:getIterable(), i)
			return true --exit this function as soon as possible
		end
	end
	
	--if are from other players or exists on map + spreadCostlyActivation, higher cost (disable this if impact fps)
	for i,v in pairs(square:getLuaTileObjectList()) do
		if v:getName() == "GasPuddle" then
		
			--IsoFireManager.StartFire(square:getCell(), square, true, 100, randDurationFireEnergy[ZombRand(3)+1]);			
			Firetrail.StartFire(square)
			square:RemoveTileObject(v);
			
			--activate other paths, not chain activation, costly
			Firetrail.spreadBFSOptimized(square:getAdjacentSquare(IsoDirections.E)	)
			Firetrail.spreadBFSOptimized(square:getAdjacentSquare(IsoDirections.N)  )
			Firetrail.spreadBFSOptimized(square:getAdjacentSquare(IsoDirections.NE) )
			Firetrail.spreadBFSOptimized(square:getAdjacentSquare(IsoDirections.NW) )
			Firetrail.spreadBFSOptimized(square:getAdjacentSquare(IsoDirections.S)  )
			Firetrail.spreadBFSOptimized(square:getAdjacentSquare(IsoDirections.SE) )
			Firetrail.spreadBFSOptimized(square:getAdjacentSquare(IsoDirections.SW) )
			Firetrail.spreadBFSOptimized(square:getAdjacentSquare(IsoDirections.W)  )
			--Firetrail.activateChainReaction(square)
		end
	end	
end

function Firetrail:new() --used in process instance	
    local o = {}
    setmetatable(o, self)
    self.__index = self
	
	o.processQueue = {}
	o.QueueSize = 0
	o.FPS_PROTECTION = 22 --its is working, tested and comproved, only execute hardwork if current fps is higher than fps_protection 24fps cinema, 30fps games, 60, 120
	--o.pathsSet = pathsSet

    return o;
end

Firetrail.process_instance = Firetrail:new() --(Firetrail.pathsSet)
function Firetrail.getInstance()
	return Firetrail.process_instance
end
--Firetrail.processQueue = {}
function Firetrail.triggerGasolineIfDetectNewFire(fire)
	if fire==nil then return end
	local Firetrail_instance = Firetrail.getInstance()
	table.insert(Firetrail_instance.processQueue,fire)
	Firetrail_instance.QueueSize = Firetrail_instance.QueueSize + 1
end

local statisticsData = getMPStatistics()
function Firetrail.doHardWorkWhenFpsIsNotDown(...)
	local Firetrail_instance = Firetrail.getInstance()
	local clientFPS = getAverageFPS()
	--print(clientFPS)
	if clientFPS >= Firetrail_instance.FPS_PROTECTION and Firetrail_instance.QueueSize ~= 0 then --do later in better scenario, better later results than low fps
		while getAverageFPS() >= Firetrail_instance.FPS_PROTECTION and Firetrail_instance.QueueSize ~= 0 do
			local fire = table.remove(Firetrail_instance.processQueue, 1)
			Firetrail_instance.QueueSize = Firetrail_instance.QueueSize - 1
			local square = fire:getSquare()
			Firetrail.spreadBFSOptimized(square)		
		end	
	end
--statisticsData.clientFPS
--statisticsData.serverFPS
end

Events.OnFillWorldObjectContextMenu.Add(Firetrail.process_instance.OnFillWorldObjectContextMenu)

Events.OnNewFire.Add(Firetrail.process_instance.triggerGasolineIfDetectNewFire)

Events.EveryOneMinute.Add(Firetrail.process_instance.doHardWorkWhenFpsIsNotDown)


--other mods compatibility
table.insert(Firetrail.currentSupportedItemsStartFire, "Torchlit") --torch id:1542069453