--***********************************************************
--**                    ShadowCop		                   **
--**       Contextual inventory menu for Crematorium       **
--***********************************************************

require 'Camping/CCampfireSystem'

ISCrematoriumMenu = {};
ISCrematoriumMenu.campfire = nil;
ISCrematoriumMenu.currentSquare = nil;

ISCrematoriumMenu.doCrematoriumMenu = function(player, context, worldobjects)

	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory();
	
	if playerObj:getVehicle() then return end
	
	local containers = ISInventoryPaneContextMenu.getContainers(playerObj)
	local campfire = nil
	local fireplace = nil
	
	-- Search for campfire
	for i,v in ipairs(worldobjects) do
		ISCrematoriumMenu.campfire = CCampfireSystem.instance:getLuaObjectOnSquare(v:getSquare())
		if ISCrematoriumMenu.campfire ~= nil then
			campfire = ISCrematoriumMenu.campfire;
		end		
	end
		
	-- Search for Fireplace
	local objects = {}
	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()
		if square then
			for i=1,square:getObjects():size() do
				local object = square:getObjects():get(i-1)
				if instanceof(object, "IsoFireplace") then
					fireplace = object
				end
			end
		end
	end
	
	-- Search for corpse
	if (campfire ~= nil and campfire.isLit) or (fireplace ~= nil and fireplace:isLit()) then
		for i=1,containers:size() do
			local container = containers:get(i-1)
			for j=1,container:getItems():size() do
				local item = container:getItems():get(j-1)
				local type = item:getType()
				if CrematoriumFuelType[type] and item == playerObj:getPrimaryHandItem() and item == playerObj:getSecondaryHandItem() then
					if CrematoriumFuelType[type] > 0 then					
						context:addOption(getText("ContextMenu_Cremate_Corpse"), worldobjects, ISCrematoriumMenu.onBurnCorpse, item, player, campfire, fireplace);
					end
				end
			end
		end
	end
end

ISCrematoriumMenu.onBurnCorpse = function(worldobjects, fuelItem, player, campfire, fireplace)
	local fuelAmt = CrematoriumFuelType[fuelItem:getType()]
	if not fuelAmt or fuelAmt < 0 then return end
	local playerObj = getSpecificPlayer(player)
	if campfire ~= nil then	
		if not ISCampingMenu.walkToCampfire(playerObj, campfire:getSquare()) then return end
		if playerObj:isEquipped(fuelItem) then
			ISTimedActionQueue.add(ISBurnCorpseCampfireAction:new(playerObj, campfire, fuelItem, round((fuelAmt * 60)-math.min(campfire.fuelAmt*0.05,(fuelAmt * 60)-1),0), 100));			
		end
	end
	
	if fireplace ~= nil then
		if not luautils.walkAdj(playerObj, fireplace:getSquare(), true) then return end
		if playerObj:isEquipped(fuelItem) then
			ISTimedActionQueue.add(ISBurnCorpseFireplaceAction:new(playerObj, fireplace, fuelItem, round((fuelAmt * 60)-math.min(fireplace:getFuelAmount()*0.4,(fuelAmt * 60)-1),0), 150));	
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(ISCrematoriumMenu.doCrematoriumMenu);
