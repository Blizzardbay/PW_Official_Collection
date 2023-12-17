require "JukeboxSound"
require "Jukeboxes"

UseJukeboxMenu = {};
UseJukeboxMenu.doBuildMenu = function(player, context, worldobjects)

	local JukeboxObject = nil

	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()

		if not square then
			return
		end
	
		for i=1,square:getObjects():size() do
			local thisObject = square:getObjects():get(i-1)
			
			if thisObject:getSprite() then
				local properties = thisObject:getSprite():getProperties()
				local spr = thisObject:getSprite():getName()  

				if properties == nil then
					return
				end

				local customName = nil

				if properties:Is("CustomName") then
					customName = properties:Val("CustomName")
				end
			
				if customName == "Jukebox" then				
					JukeboxObject = thisObject
					JukeboxObject:getModData()
					if not JukeboxObject:getContainer() then
						local index = JukeboxObject:getObjectIndex()
               					sledgeDestroy(JukeboxObject)
						JukeboxObject:getSquare():transmitRemoveItemFromSquareOnServer(JukeboxObject)
						JukeboxObject:getSquare():transmitRemoveItemFromSquare(JukeboxObject)            

                				JukeboxObject = IsoThumpable.new(getCell(), square, spr, false, ISWoodenContainer:new(spr, nil))  
                				JukeboxObject:setIsContainer(true)
                				JukeboxObject:getContainer():setType("jukebox")
                				JukeboxObject:getContainer():setCapacity(50)

						JukeboxObject:getModData()['IsOn'] = false
						JukeboxObject:getModData()['Volume'] = 5
						JukeboxObject:getModData()['Playing'] = false
						JukeboxObject:getModData()['Skip'] = false
						JukeboxObject:getModData()['MP Mode'] = false

						JukeboxObject:getModData()['FrontSquare'] = nil

						JukeboxObject:getModData()['LastSong'] = nil
						JukeboxObject:getModData()['CurrentSong'] = nil
						JukeboxObject:getModData()['NextSong'] = nil

						JukeboxObject:getModData()['Playlist1'] = nil
						JukeboxObject:getModData()['Playlist2'] = nil
						JukeboxObject:getModData()['Playlist3'] = nil
						JukeboxObject:getModData()['Playlist4'] = nil
						JukeboxObject:getModData()['Playlist5'] = nil
						JukeboxObject:getModData()['Playlist6'] = nil
						JukeboxObject:getModData()['Playlist7'] = nil
						JukeboxObject:getModData()['Playlist8'] = nil
						JukeboxObject:getModData()['Playlist9'] = nil
						JukeboxObject:getModData()['Playlist10'] = nil
						JukeboxObject:getModData()['Playlist11'] = nil
						JukeboxObject:getModData()['Playlist12'] = nil
						JukeboxObject:getModData()['Playlist13'] = nil
						JukeboxObject:getModData()['Playlist14'] = nil
						JukeboxObject:getModData()['Playlist15'] = nil
						JukeboxObject:getModData()['Playlist16'] = nil
						JukeboxObject:getModData()['Playlist17'] = nil
						JukeboxObject:getModData()['Playlist18'] = nil
						JukeboxObject:getModData()['Playlist19'] = nil
						JukeboxObject:getModData()['Playlist20'] = nil
						JukeboxObject:getModData()['Playlist21'] = nil
						JukeboxObject:getModData()['Playlist22'] = nil
						JukeboxObject:getModData()['Playlist23'] = nil
						JukeboxObject:getModData()['Playlist24'] = nil
						JukeboxObject:getModData()['Playlist25'] = nil
						JukeboxObject:getModData()['Playlist26'] = nil
						JukeboxObject:getModData()['Playlist27'] = nil
						JukeboxObject:getModData()['Playlist28'] = nil
						JukeboxObject:getModData()['Playlist29'] = nil
						JukeboxObject:getModData()['Playlist30'] = nil
						JukeboxObject:getModData()['Playlist31'] = nil
						JukeboxObject:getModData()['Playlist32'] = nil
						JukeboxObject:getModData()['Playlist33'] = nil
						JukeboxObject:getModData()['Playlist34'] = nil
						JukeboxObject:getModData()['Playlist35'] = nil
						JukeboxObject:getModData()['Playlist36'] = nil
						JukeboxObject:getModData()['Playlist37'] = nil
						JukeboxObject:getModData()['Playlist38'] = nil
						JukeboxObject:getModData()['Playlist39'] = nil
						JukeboxObject:getModData()['Playlist40'] = nil
						JukeboxObject:getModData()['Playlist41'] = nil
						JukeboxObject:getModData()['Playlist42'] = nil
						JukeboxObject:getModData()['Playlist43'] = nil
						JukeboxObject:getModData()['Playlist44'] = nil
						JukeboxObject:getModData()['Playlist45'] = nil
						JukeboxObject:getModData()['Playlist46'] = nil
						JukeboxObject:getModData()['Playlist47'] = nil
						JukeboxObject:getModData()['Playlist48'] = nil
						JukeboxObject:getModData()['Playlist49'] = nil
						JukeboxObject:getModData()['Playlist50'] = nil

                				square:AddTileObject(JukeboxObject, index)
						square:transmitAddObjectToSquare(JukeboxObject, JukeboxObject:getObjectIndex())
						square:transmitModdata()
						JukeboxObject:transmitModData()	
              					JukeboxObject:transmitCompleteItemToServer()
                				JukeboxObject:transmitUpdatedSpriteToServer()
					end
					break
				end
			end 
		end 
	end

	if not JukeboxObject then 
		return 
	end

	if not JukeboxObject:getContainer() then
		return
	end

	local contextMenu = nil

	if JukeboxObject:getModData()['IsOn'] == false then
		contextMenu = "Turn on Jukebox"
		context:addOption(getText(contextMenu),
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "On", nil)
	else
		contextMenu = "Turn off Jukebox"
		context:addOption(getText(contextMenu),
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Off", nil)
	end

	if JukeboxObject:getModData()['IsOn'] == true then
		local contextMenu2 = nil
		local subContext2 = nil

		contextMenu2 = context:addOption("Jukebox Main Menu")
		subContext2 = ISContextMenu:getNew(context);
		context:addSubMenu(contextMenu2, subContext2)
		subContext2:addOption("Play All Music",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "All", nil)
		subContext2:addOption("Play Shuffled",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Shuffled", nil)
		subContext2:addOption("Play Random Song",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Random", nil)
		subContext2:addOption("Replay Current Song",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Replay Current", nil)
		subContext2:addOption("Replay Last Song",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Replay Last", nil)
		subContext2:addOption("Skip Current Song",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Skip Current", nil)

		local contextMenu3 = nil
		local subContext3 = nil

		contextMenu3 = context:addOption("Set Jukebox Volume")
		subContext3 = ISContextMenu:getNew(context);

		context:addSubMenu(contextMenu3, subContext3)

		subContext3:addOption("1",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 1", nil)
		subContext3:addOption("2",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 2", nil)
		subContext3:addOption("3",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 3", nil)
		subContext3:addOption("4",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 4", nil)
		subContext3:addOption("5",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 5", nil)
		subContext3:addOption("6",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 6", nil)
		subContext3:addOption("7",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 7", nil)
		subContext3:addOption("8",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 8", nil)
		subContext3:addOption("9",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 9", nil)
		subContext3:addOption("6",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 6", nil)
		subContext3:addOption("10",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 10", nil)
		subContext3:addOption("11",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Volume 11", nil)


		local JukeboxItems = nil

		if JukeboxObject:getContainer() then
			JukeboxItems = JukeboxObject:getItemContainer():getItems()
		end

		if JukeboxItems then
			local contextMenu4 = nil
			local subContext4 = nil

			contextMenu4 = context:addOption("Choose song to play on Jukebox")
			subContext4 = ISContextMenu:getNew(context);

			context:addSubMenu(contextMenu4, subContext4)

			for i=0, JukeboxItems:size()-1 do
				local item = JukeboxItems:get(i)
				local itemDisplayName = nil

				if item and item:getDisplayName() then
					itemDisplayName = item:getDisplayName()
					subContext4:addOption(itemDisplayName,
						worldobjects,
				  		UseJukeboxMenu.onUseJukebox,
				  		getSpecificPlayer(player),
				  		JukeboxObject,
				  		"Play", item)
				end
			end
		end
	end

	if (getCore():getDebug() or isAdmin()) then
		local contextMenu5 = nil
		local subContext5 = nil

		contextMenu5 = context:addOption("Admin Menu")
		subContext5 = ISContextMenu:getNew(context);

		context:addSubMenu(contextMenu5, subContext5)

		subContext5:addOption("Stop All",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Stop All", nil)
		subContext5:addOption("Set Multiplayer On",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Set MP On", nil)
		subContext5:addOption("Set Multiplayer Off",
				  worldobjects,
				  UseJukeboxMenu.onUseJukebox,
				  getSpecificPlayer(player),
				  JukeboxObject,
				  "Set MP Off", nil)
	end
end

function MachineNoPower(player)
	player:Say("I will need a generator nearby to power it.")
end

function MachineNoMusic(player)
	player:Say("There is no music in the jukebox.")
end

function MachineVolume(machine, volume)
	machine:getModData()['Volume'] = volume
	machine:transmitModData()
end

function MachineAlreadyPlaying(player, machine, soundFile, playItem)
	player:Say("This jukebox is already playing. " .. playItem:getDisplayName() .. " will play next.")
	machine:getModData()['NextSong'] = soundFile
	machine:transmitModData()
end

UseJukeboxMenu.getFrontSquare = function(square, facing)
	local value = nil
	
	if facing == "S" then
		value = square:getS()
	elseif facing == "E" then
		value = square:getE()
	elseif facing == "W" then
		value = square:getW()
	elseif facing == "N" then
		value = square:getN()
	end
	
	return value
end


UseJukeboxMenu.getFacing = function(properties, square)

	local facing = nil

	if properties:Is("Facing") then
		facing = properties:Val("Facing")
	end

	if square:getE() and facing == "E" then
		facing = "E"
	elseif square:getS() and facing == "S" then
		facing = "S" 
	elseif square:getW() and facing == "W" then
		facing = "W"
	elseif square:getN() and facing == "N" then
		facing = "N"
	else 
		facing = nil
	end

	return facing
end


UseJukeboxMenu.walkToFront = function(thisPlayer, JukeboxObject)

	local controllerSquare = nil
	local spriteName = JukeboxObject:getSprite():getName()
	if not spriteName then
		return false
	end

	local properties = JukeboxObject:getSprite():getProperties()
	local facing = UseJukeboxMenu.getFacing(properties, JukeboxObject:getSquare())
	if facing == nil then
		thisPlayer:Say("I am unable to access this machine, the path is blocked.")
		return false
	end
	
	local frontSquare = UseJukeboxMenu.getFrontSquare(JukeboxObject:getSquare(), facing)
	local turn = UseJukeboxMenu.getFrontSquare(frontSquare, facing)

	JukeboxObject:getModData()['FrontSquare'] = frontSquare
	JukeboxObject:transmitModData()
	
	if not frontSquare then
		return false
	end
	if not controllerSquare then
		controllerSquare = JukeboxObject:getSquare()
	end
	if AdjacentFreeTileFinder.privTrySquare(controllerSquare, frontSquare) then
		ISTimedActionQueue.add(ISWalkToTimedAction:new(thisPlayer, frontSquare))
		if turn then
			thisPlayer:faceLocation(turn:getX(), turn:getY())
		end
		return true
	end
	return false
end


UseJukeboxMenu.onUseJukebox = function(worldobjects, player, machine, musicChoice, playItem)
	if UseJukeboxMenu.walkToFront(player, machine) then
		local square = machine:getSquare()
		local soundFile = nil
		local soundRadius = 3
		local volume = 1

		local machineItems = nil
		local machineItemNumber = 0
		local startSong = 0

		if musicChoice == "Stop All" then
    			for _,t in ipairs(Jukeboxes.soundCache) do        
 		       		if t.sound and t.sound:isPlaying() then
          		  		t.sound.stop = true
      		  		end
			end
		elseif musicChoice == "Set MP On" then
			machine:getModData()['MP Mode'] = true
			machine:transmitModData()
			if machine:getModData()['MP Mode'] == true then
				print("Set MP Mode: True")
			end
		elseif musicChoice == "Set MP Off" then
			machine:getModData()['MP Mode'] = false
			machine:transmitModData()
			if machine:getModData()['MP Mode'] == false then
				print("Set MP Mode: False")
			end
		end
		
		if musicChoice == "On" then
			if not ((SandboxVars.AllowExteriorGenerator and square:haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier and square:isOutside() == false)) then
				MachineNoPower(player)
				machine:getModData()['IsOn'] = false
				machine:getModData()['Playing'] = false
				square:playSound("LightSwitch")
				machine:transmitModData()
				return
			else
				machine:getModData()['IsOn'] = true
				square:playSound("LightSwitch")
				machine:transmitModData()
				return
			end
		elseif musicChoice == "Off" then
			machine:getModData()['IsOn'] = false
			machine:getModData()['Playing'] = false
			square:playSound("LightSwitch")
			machine:transmitModData()
			return
		end

		if not ((SandboxVars.AllowExteriorGenerator and square:haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier and square:isOutside() == false)) then
			MachineNoPower(player)
			return
		end

		if machine:getContainer() then
			machineItems = machine:getItemContainer():getItems()
		else
			return
		end

		if musicChoice == "Volume 1" then 
			MachineVolume(machine, 1)
			return
		elseif musicChoice == "Volume 2" then 
			MachineVolume(machine, 2)
			return
		elseif musicChoice == "Volume 3" then 
			MachineVolume(machine, 3)
			return
		elseif musicChoice == "Volume 4" then 
			MachineVolume(machine, 4)
			return
		elseif musicChoice == "Volume 5" then 
			MachineVolume(machine, 5)
			return
		elseif musicChoice == "Volume 6" then 
			MachineVolume(machine, 6)
			return
		elseif musicChoice == "Volume 7" then 
			MachineVolume(machine, 7)
			return
		elseif musicChoice == "Volume 8" then 
			MachineVolume(machine, 8)
			return
		elseif musicChoice == "Volume 9" then 
			MachineVolume(machine, 9)
			return
		elseif musicChoice == "Volume 10" then 
			MachineVolume(machine, 10)
			return
		elseif musicChoice == "Volume 11" then 
			MachineVolume(machine, 11)
			return
		end

		if machineItems:size() == 0 then
			MachineNoMusic(player)
			return
		end

		if musicChoice == "Replay Current" then 
			player:Say("The current song will play next.")
			machine:getModData()['NextSong'] = machine:getModData()['CurrentSong']
			machine:transmitModData()
			return
		elseif musicChoice == "Replay Last" then 
			player:Say("The last song will play next.")
			machine:getModData()['NextSong'] = machine:getModData()['LastSong']
			machine:transmitModData()
			return
		elseif musicChoice == "Skip Current" then
			machine:getModData()['Skip'] = true
			print("Skip")
			return
		end

		--print(machineItems:size() .. " songs detected")
	
		if musicChoice == "All" then 
			machine:getModData()['Playlist1'] = nil
			machine:getModData()['Playlist2'] = nil
			machine:getModData()['Playlist3'] = nil
			machine:getModData()['Playlist4'] = nil
			machine:getModData()['Playlist5'] = nil
			machine:getModData()['Playlist6'] = nil
			machine:getModData()['Playlist7'] = nil
			machine:getModData()['Playlist8'] = nil
			machine:getModData()['Playlist9'] = nil
			machine:getModData()['Playlist10'] = nil
			machine:getModData()['Playlist11'] = nil
			machine:getModData()['Playlist12'] = nil
			machine:getModData()['Playlist13'] = nil
			machine:getModData()['Playlist14'] = nil
			machine:getModData()['Playlist15'] = nil
			machine:getModData()['Playlist16'] = nil
			machine:getModData()['Playlist17'] = nil
			machine:getModData()['Playlist18'] = nil
			machine:getModData()['Playlist19'] = nil
			machine:getModData()['Playlist20'] = nil
			machine:getModData()['Playlist21'] = nil
			machine:getModData()['Playlist22'] = nil
			machine:getModData()['Playlist23'] = nil
			machine:getModData()['Playlist24'] = nil
			machine:getModData()['Playlist25'] = nil
			machine:getModData()['Playlist26'] = nil
			machine:getModData()['Playlist27'] = nil
			machine:getModData()['Playlist28'] = nil
			machine:getModData()['Playlist29'] = nil
			machine:getModData()['Playlist30'] = nil
			machine:getModData()['Playlist31'] = nil
			machine:getModData()['Playlist32'] = nil
			machine:getModData()['Playlist33'] = nil
			machine:getModData()['Playlist34'] = nil
			machine:getModData()['Playlist35'] = nil
			machine:getModData()['Playlist36'] = nil
			machine:getModData()['Playlist37'] = nil
			machine:getModData()['Playlist38'] = nil
			machine:getModData()['Playlist39'] = nil
			machine:getModData()['Playlist40'] = nil
			machine:getModData()['Playlist41'] = nil
			machine:getModData()['Playlist42'] = nil
			machine:getModData()['Playlist43'] = nil
			machine:getModData()['Playlist44'] = nil
			machine:getModData()['Playlist45'] = nil
			machine:getModData()['Playlist46'] = nil
			machine:getModData()['Playlist47'] = nil
			machine:getModData()['Playlist48'] = nil
			machine:getModData()['Playlist49'] = nil
			machine:getModData()['Playlist50'] = nil
			machine:transmitModData()
			for i=0, machineItems:size()-1 do
				local item = machineItems:get(i)
				local itemDisplayName = nil

				if item and item:getDisplayName() then
					itemDisplayName = item:getDisplayName()
					machineItemNumber = machineItemNumber + 1
					--print(machineItemNumber .. ": " .. itemDisplayName)
					if machineItemNumber == 1 then
						playItem = item
					end
					if machine:getModData()['Playlist1'] == nil then
						machine:getModData()['Playlist1'] = item:getType()
					elseif machine:getModData()['Playlist2'] == nil then
						machine:getModData()['Playlist2'] = item:getType()
					elseif machine:getModData()['Playlist3'] == nil then
						machine:getModData()['Playlist3'] = item:getType()
					elseif machine:getModData()['Playlist4'] == nil then
						machine:getModData()['Playlist4'] = item:getType()
					elseif machine:getModData()['Playlist5'] == nil then
						machine:getModData()['Playlist5'] = item:getType()
					elseif machine:getModData()['Playlist6'] == nil then
						machine:getModData()['Playlist6'] = item:getType()
					elseif machine:getModData()['Playlist7'] == nil then
						machine:getModData()['Playlist7'] = item:getType()
					elseif machine:getModData()['Playlist8'] == nil then
						machine:getModData()['Playlist8'] = item:getType()
					elseif machine:getModData()['Playlist9'] == nil then
						machine:getModData()['Playlist9'] = item:getType()
					elseif machine:getModData()['Playlist10'] == nil then
						machine:getModData()['Playlist10'] = item:getType()
					elseif machine:getModData()['Playlist11'] == nil then
						machine:getModData()['Playlist11'] = item:getType()
					elseif machine:getModData()['Playlist12'] == nil then
						machine:getModData()['Playlist12'] = item:getType()
					elseif machine:getModData()['Playlist13'] == nil then
						machine:getModData()['Playlist13'] = item:getType()
					elseif machine:getModData()['Playlist14'] == nil then
						machine:getModData()['Playlist14'] = item:getType()
					elseif machine:getModData()['Playlist15'] == nil then
						machine:getModData()['Playlist15'] = item:getType()
					elseif machine:getModData()['Playlist16'] == nil then
						machine:getModData()['Playlist16'] = item:getType()
					elseif machine:getModData()['Playlist17'] == nil then
						machine:getModData()['Playlist17'] = item:getType()
					elseif machine:getModData()['Playlist18'] == nil then
						machine:getModData()['Playlist18'] = item:getType()
					elseif machine:getModData()['Playlist19'] == nil then
						machine:getModData()['Playlist19'] = item:getType()
					elseif machine:getModData()['Playlist20'] == nil then
						machine:getModData()['Playlist20'] = item:getType()
					elseif machine:getModData()['Playlist21'] == nil then
						machine:getModData()['Playlist21'] = item:getType()
					elseif machine:getModData()['Playlist22'] == nil then
						machine:getModData()['Playlist22'] = item:getType()
					elseif machine:getModData()['Playlist23'] == nil then
						machine:getModData()['Playlist23'] = item:getType()
					elseif machine:getModData()['Playlist24'] == nil then
						machine:getModData()['Playlist24'] = item:getType()
					elseif machine:getModData()['Playlist25'] == nil then
						machine:getModData()['Playlist25'] = item:getType()
					elseif machine:getModData()['Playlist26'] == nil then
						machine:getModData()['Playlist26'] = item:getType()
					elseif machine:getModData()['Playlist27'] == nil then
						machine:getModData()['Playlist27'] = item:getType()
					elseif machine:getModData()['Playlist28'] == nil then
						machine:getModData()['Playlist28'] = item:getType()
					elseif machine:getModData()['Playlist29'] == nil then
						machine:getModData()['Playlist29'] = item:getType()
					elseif machine:getModData()['Playlist30'] == nil then
						machine:getModData()['Playlist30'] = item:getType()
					elseif machine:getModData()['Playlist31'] == nil then
						machine:getModData()['Playlist31'] = item:getType()
					elseif machine:getModData()['Playlist32'] == nil then
						machine:getModData()['Playlist32'] = item:getType()
					elseif machine:getModData()['Playlist33'] == nil then
						machine:getModData()['Playlist33'] = item:getType()
					elseif machine:getModData()['Playlist34'] == nil then
						machine:getModData()['Playlist34'] = item:getType()
					elseif machine:getModData()['Playlist35'] == nil then
						machine:getModData()['Playlist35'] = item:getType()
					elseif machine:getModData()['Playlist36'] == nil then
						machine:getModData()['Playlist36'] = item:getType()
					elseif machine:getModData()['Playlist37'] == nil then
						machine:getModData()['Playlist37'] = item:getType()
					elseif machine:getModData()['Playlist38'] == nil then
						machine:getModData()['Playlist38'] = item:getType()
					elseif machine:getModData()['Playlist39'] == nil then
						machine:getModData()['Playlist39'] = item:getType()
					elseif machine:getModData()['Playlist40'] == nil then
						machine:getModData()['Playlist40'] = item:getType()
					elseif machine:getModData()['Playlist41'] == nil then
						machine:getModData()['Playlist41'] = item:getType()
					elseif machine:getModData()['Playlist42'] == nil then
						machine:getModData()['Playlist42'] = item:getType()
					elseif machine:getModData()['Playlist43'] == nil then
						machine:getModData()['Playlist43'] = item:getType()
					elseif machine:getModData()['Playlist44'] == nil then
						machine:getModData()['Playlist44'] = item:getType()
					elseif machine:getModData()['Playlist45'] == nil then
						machine:getModData()['Playlist45'] = item:getType()
					elseif machine:getModData()['Playlist46'] == nil then
						machine:getModData()['Playlist46'] = item:getType()
					elseif machine:getModData()['Playlist47'] == nil then
						machine:getModData()['Playlist47'] = item:getType()
					elseif machine:getModData()['Playlist48'] == nil then
						machine:getModData()['Playlist48'] = item:getType()
					elseif machine:getModData()['Playlist49'] == nil then
						machine:getModData()['Playlist49'] = item:getType()
					elseif machine:getModData()['Playlist50'] == nil then
						machine:getModData()['Playlist50'] = item:getType()
					end
					machine:transmitModData()
				end
			end
		elseif musicChoice == "Shuffled" then
			machine:getModData()['Playlist1'] = nil
			machine:getModData()['Playlist2'] = nil
			machine:getModData()['Playlist3'] = nil
			machine:getModData()['Playlist4'] = nil
			machine:getModData()['Playlist5'] = nil
			machine:getModData()['Playlist6'] = nil
			machine:getModData()['Playlist7'] = nil
			machine:getModData()['Playlist8'] = nil
			machine:getModData()['Playlist9'] = nil
			machine:getModData()['Playlist10'] = nil
			machine:getModData()['Playlist11'] = nil
			machine:getModData()['Playlist12'] = nil
			machine:getModData()['Playlist13'] = nil
			machine:getModData()['Playlist14'] = nil
			machine:getModData()['Playlist15'] = nil
			machine:getModData()['Playlist16'] = nil
			machine:getModData()['Playlist17'] = nil
			machine:getModData()['Playlist18'] = nil
			machine:getModData()['Playlist19'] = nil
			machine:getModData()['Playlist20'] = nil
			machine:getModData()['Playlist21'] = nil
			machine:getModData()['Playlist22'] = nil
			machine:getModData()['Playlist23'] = nil
			machine:getModData()['Playlist24'] = nil
			machine:getModData()['Playlist25'] = nil
			machine:getModData()['Playlist26'] = nil
			machine:getModData()['Playlist27'] = nil
			machine:getModData()['Playlist28'] = nil
			machine:getModData()['Playlist29'] = nil
			machine:getModData()['Playlist30'] = nil
			machine:getModData()['Playlist31'] = nil
			machine:getModData()['Playlist32'] = nil
			machine:getModData()['Playlist33'] = nil
			machine:getModData()['Playlist34'] = nil
			machine:getModData()['Playlist35'] = nil
			machine:getModData()['Playlist36'] = nil
			machine:getModData()['Playlist37'] = nil
			machine:getModData()['Playlist38'] = nil
			machine:getModData()['Playlist39'] = nil
			machine:getModData()['Playlist40'] = nil
			machine:getModData()['Playlist41'] = nil
			machine:getModData()['Playlist42'] = nil
			machine:getModData()['Playlist43'] = nil
			machine:getModData()['Playlist44'] = nil
			machine:getModData()['Playlist45'] = nil
			machine:getModData()['Playlist46'] = nil
			machine:getModData()['Playlist47'] = nil
			machine:getModData()['Playlist48'] = nil
			machine:getModData()['Playlist49'] = nil
			machine:getModData()['Playlist50'] = nil
			machine:transmitModData()
			startSong = ZombRand(1,machineItems:size())
			for i=0, machineItems:size()-1 do
				local item = machineItems:get(i)
				local itemDisplayName = nil

				if item and item:getDisplayName() and startSong <= machineItemNumber + 1 then
					itemDisplayName = item:getDisplayName()
					machineItemNumber = machineItemNumber + 1
					--print(machineItemNumber .. ": " .. itemDisplayName)
					if machineItemNumber == startSong then
						playItem = item
					end
					if machine:getModData()['Playlist1'] == nil then
						machine:getModData()['Playlist1'] = item:getType()
					elseif machine:getModData()['Playlist2'] == nil then
						machine:getModData()['Playlist2'] = item:getType()
					elseif machine:getModData()['Playlist3'] == nil then
						machine:getModData()['Playlist3'] = item:getType()
					elseif machine:getModData()['Playlist4'] == nil then
						machine:getModData()['Playlist4'] = item:getType()
					elseif machine:getModData()['Playlist5'] == nil then
						machine:getModData()['Playlist5'] = item:getType()
					elseif machine:getModData()['Playlist6'] == nil then
						machine:getModData()['Playlist6'] = item:getType()
					elseif machine:getModData()['Playlist7'] == nil then
						machine:getModData()['Playlist7'] = item:getType()
					elseif machine:getModData()['Playlist8'] == nil then
						machine:getModData()['Playlist8'] = item:getType()
					elseif machine:getModData()['Playlist9'] == nil then
						machine:getModData()['Playlist9'] = item:getType()
					elseif machine:getModData()['Playlist10'] == nil then
						machine:getModData()['Playlist10'] = item:getType()
					elseif machine:getModData()['Playlist11'] == nil then
						machine:getModData()['Playlist11'] = item:getType()
					elseif machine:getModData()['Playlist12'] == nil then
						machine:getModData()['Playlist12'] = item:getType()
					elseif machine:getModData()['Playlist13'] == nil then
						machine:getModData()['Playlist13'] = item:getType()
					elseif machine:getModData()['Playlist14'] == nil then
						machine:getModData()['Playlist14'] = item:getType()
					elseif machine:getModData()['Playlist15'] == nil then
						machine:getModData()['Playlist15'] = item:getType()
					elseif machine:getModData()['Playlist16'] == nil then
						machine:getModData()['Playlist16'] = item:getType()
					elseif machine:getModData()['Playlist17'] == nil then
						machine:getModData()['Playlist17'] = item:getType()
					elseif machine:getModData()['Playlist18'] == nil then
						machine:getModData()['Playlist18'] = item:getType()
					elseif machine:getModData()['Playlist19'] == nil then
						machine:getModData()['Playlist19'] = item:getType()
					elseif machine:getModData()['Playlist20'] == nil then
						machine:getModData()['Playlist20'] = item:getType()
					elseif machine:getModData()['Playlist21'] == nil then
						machine:getModData()['Playlist21'] = item:getType()
					elseif machine:getModData()['Playlist22'] == nil then
						machine:getModData()['Playlist22'] = item:getType()
					elseif machine:getModData()['Playlist23'] == nil then
						machine:getModData()['Playlist23'] = item:getType()
					elseif machine:getModData()['Playlist24'] == nil then
						machine:getModData()['Playlist24'] = item:getType()
					elseif machine:getModData()['Playlist25'] == nil then
						machine:getModData()['Playlist25'] = item:getType()
					elseif machine:getModData()['Playlist26'] == nil then
						machine:getModData()['Playlist26'] = item:getType()
					elseif machine:getModData()['Playlist27'] == nil then
						machine:getModData()['Playlist27'] = item:getType()
					elseif machine:getModData()['Playlist28'] == nil then
						machine:getModData()['Playlist28'] = item:getType()
					elseif machine:getModData()['Playlist29'] == nil then
						machine:getModData()['Playlist29'] = item:getType()
					elseif machine:getModData()['Playlist30'] == nil then
						machine:getModData()['Playlist30'] = item:getType()
					elseif machine:getModData()['Playlist31'] == nil then
						machine:getModData()['Playlist31'] = item:getType()
					elseif machine:getModData()['Playlist32'] == nil then
						machine:getModData()['Playlist32'] = item:getType()
					elseif machine:getModData()['Playlist33'] == nil then
						machine:getModData()['Playlist33'] = item:getType()
					elseif machine:getModData()['Playlist34'] == nil then
						machine:getModData()['Playlist34'] = item:getType()
					elseif machine:getModData()['Playlist35'] == nil then
						machine:getModData()['Playlist35'] = item:getType()
					elseif machine:getModData()['Playlist36'] == nil then
						machine:getModData()['Playlist36'] = item:getType()
					elseif machine:getModData()['Playlist37'] == nil then
						machine:getModData()['Playlist37'] = item:getType()
					elseif machine:getModData()['Playlist38'] == nil then
						machine:getModData()['Playlist38'] = item:getType()
					elseif machine:getModData()['Playlist39'] == nil then
						machine:getModData()['Playlist39'] = item:getType()
					elseif machine:getModData()['Playlist40'] == nil then
						machine:getModData()['Playlist40'] = item:getType()
					elseif machine:getModData()['Playlist41'] == nil then
						machine:getModData()['Playlist41'] = item:getType()
					elseif machine:getModData()['Playlist42'] == nil then
						machine:getModData()['Playlist42'] = item:getType()
					elseif machine:getModData()['Playlist43'] == nil then
						machine:getModData()['Playlist43'] = item:getType()
					elseif machine:getModData()['Playlist44'] == nil then
						machine:getModData()['Playlist44'] = item:getType()
					elseif machine:getModData()['Playlist45'] == nil then
						machine:getModData()['Playlist45'] = item:getType()
					elseif machine:getModData()['Playlist46'] == nil then
						machine:getModData()['Playlist46'] = item:getType()
					elseif machine:getModData()['Playlist47'] == nil then
						machine:getModData()['Playlist47'] = item:getType()
					elseif machine:getModData()['Playlist48'] == nil then
						machine:getModData()['Playlist48'] = item:getType()
					elseif machine:getModData()['Playlist49'] == nil then
						machine:getModData()['Playlist49'] = item:getType()
					elseif machine:getModData()['Playlist50'] == nil then
						machine:getModData()['Playlist50'] = item:getType()
					end
					machine:transmitModData()
				else
					machineItemNumber = machineItemNumber + 1
				end
			end
			machineItemNumber = 0
			for i=0, machineItems:size()-1 do
				local item = machineItems:get(i)
				local itemDisplayName = nil

				if item and item:getDisplayName() and startSong == machineItemNumber + 2 then
					itemDisplayName = item:getDisplayName()
					machineItemNumber = machineItemNumber + 1
					--print(machineItemNumber .. ": " .. itemDisplayName)
					if machine:getModData()['Playlist1'] == nil then
						machine:getModData()['Playlist1'] = item:getType()
					elseif machine:getModData()['Playlist2'] == nil then
						machine:getModData()['Playlist2'] = item:getType()
					elseif machine:getModData()['Playlist3'] == nil then
						machine:getModData()['Playlist3'] = item:getType()
					elseif machine:getModData()['Playlist4'] == nil then
						machine:getModData()['Playlist4'] = item:getType()
					elseif machine:getModData()['Playlist5'] == nil then
						machine:getModData()['Playlist5'] = item:getType()
					elseif machine:getModData()['Playlist6'] == nil then
						machine:getModData()['Playlist6'] = item:getType()
					elseif machine:getModData()['Playlist7'] == nil then
						machine:getModData()['Playlist7'] = item:getType()
					elseif machine:getModData()['Playlist8'] == nil then
						machine:getModData()['Playlist8'] = item:getType()
					elseif machine:getModData()['Playlist9'] == nil then
						machine:getModData()['Playlist9'] = item:getType()
					elseif machine:getModData()['Playlist10'] == nil then
						machine:getModData()['Playlist10'] = item:getType()
					elseif machine:getModData()['Playlist11'] == nil then
						machine:getModData()['Playlist11'] = item:getType()
					elseif machine:getModData()['Playlist12'] == nil then
						machine:getModData()['Playlist12'] = item:getType()
					elseif machine:getModData()['Playlist13'] == nil then
						machine:getModData()['Playlist13'] = item:getType()
					elseif machine:getModData()['Playlist14'] == nil then
						machine:getModData()['Playlist14'] = item:getType()
					elseif machine:getModData()['Playlist15'] == nil then
						machine:getModData()['Playlist15'] = item:getType()
					elseif machine:getModData()['Playlist16'] == nil then
						machine:getModData()['Playlist16'] = item:getType()
					elseif machine:getModData()['Playlist17'] == nil then
						machine:getModData()['Playlist17'] = item:getType()
					elseif machine:getModData()['Playlist18'] == nil then
						machine:getModData()['Playlist18'] = item:getType()
					elseif machine:getModData()['Playlist19'] == nil then
						machine:getModData()['Playlist19'] = item:getType()
					elseif machine:getModData()['Playlist20'] == nil then
						machine:getModData()['Playlist20'] = item:getType()
					elseif machine:getModData()['Playlist21'] == nil then
						machine:getModData()['Playlist21'] = item:getType()
					elseif machine:getModData()['Playlist22'] == nil then
						machine:getModData()['Playlist22'] = item:getType()
					elseif machine:getModData()['Playlist23'] == nil then
						machine:getModData()['Playlist23'] = item:getType()
					elseif machine:getModData()['Playlist24'] == nil then
						machine:getModData()['Playlist24'] = item:getType()
					elseif machine:getModData()['Playlist25'] == nil then
						machine:getModData()['Playlist25'] = item:getType()
					elseif machine:getModData()['Playlist26'] == nil then
						machine:getModData()['Playlist26'] = item:getType()
					elseif machine:getModData()['Playlist27'] == nil then
						machine:getModData()['Playlist27'] = item:getType()
					elseif machine:getModData()['Playlist28'] == nil then
						machine:getModData()['Playlist28'] = item:getType()
					elseif machine:getModData()['Playlist29'] == nil then
						machine:getModData()['Playlist29'] = item:getType()
					elseif machine:getModData()['Playlist30'] == nil then
						machine:getModData()['Playlist30'] = item:getType()
					elseif machine:getModData()['Playlist31'] == nil then
						machine:getModData()['Playlist31'] = item:getType()
					elseif machine:getModData()['Playlist32'] == nil then
						machine:getModData()['Playlist32'] = item:getType()
					elseif machine:getModData()['Playlist33'] == nil then
						machine:getModData()['Playlist33'] = item:getType()
					elseif machine:getModData()['Playlist34'] == nil then
						machine:getModData()['Playlist34'] = item:getType()
					elseif machine:getModData()['Playlist35'] == nil then
						machine:getModData()['Playlist35'] = item:getType()
					elseif machine:getModData()['Playlist36'] == nil then
						machine:getModData()['Playlist36'] = item:getType()
					elseif machine:getModData()['Playlist37'] == nil then
						machine:getModData()['Playlist37'] = item:getType()
					elseif machine:getModData()['Playlist38'] == nil then
						machine:getModData()['Playlist38'] = item:getType()
					elseif machine:getModData()['Playlist39'] == nil then
						machine:getModData()['Playlist39'] = item:getType()
					elseif machine:getModData()['Playlist40'] == nil then
						machine:getModData()['Playlist40'] = item:getType()
					elseif machine:getModData()['Playlist41'] == nil then
						machine:getModData()['Playlist41'] = item:getType()
					elseif machine:getModData()['Playlist42'] == nil then
						machine:getModData()['Playlist42'] = item:getType()
					elseif machine:getModData()['Playlist43'] == nil then
						machine:getModData()['Playlist43'] = item:getType()
					elseif machine:getModData()['Playlist44'] == nil then
						machine:getModData()['Playlist44'] = item:getType()
					elseif machine:getModData()['Playlist45'] == nil then
						machine:getModData()['Playlist45'] = item:getType()
					elseif machine:getModData()['Playlist46'] == nil then
						machine:getModData()['Playlist46'] = item:getType()
					elseif machine:getModData()['Playlist47'] == nil then
						machine:getModData()['Playlist47'] = item:getType()
					elseif machine:getModData()['Playlist48'] == nil then
						machine:getModData()['Playlist48'] = item:getType()
					elseif machine:getModData()['Playlist49'] == nil then
						machine:getModData()['Playlist49'] = item:getType()
					elseif machine:getModData()['Playlist50'] == nil then
						machine:getModData()['Playlist50'] = item:getType()
					end
					machine:transmitModData()
					break
				else
					itemDisplayName = item:getDisplayName()
					machineItemNumber = machineItemNumber + 1
					--print(machineItemNumber .. ": " .. itemDisplayName)
					if machine:getModData()['Playlist1'] == nil then
						machine:getModData()['Playlist1'] = item:getType()
					elseif machine:getModData()['Playlist2'] == nil then
						machine:getModData()['Playlist2'] = item:getType()
					elseif machine:getModData()['Playlist3'] == nil then
						machine:getModData()['Playlist3'] = item:getType()
					elseif machine:getModData()['Playlist4'] == nil then
						machine:getModData()['Playlist4'] = item:getType()
					elseif machine:getModData()['Playlist5'] == nil then
						machine:getModData()['Playlist5'] = item:getType()
					elseif machine:getModData()['Playlist6'] == nil then
						machine:getModData()['Playlist6'] = item:getType()
					elseif machine:getModData()['Playlist7'] == nil then
						machine:getModData()['Playlist7'] = item:getType()
					elseif machine:getModData()['Playlist8'] == nil then
						machine:getModData()['Playlist8'] = item:getType()
					elseif machine:getModData()['Playlist9'] == nil then
						machine:getModData()['Playlist9'] = item:getType()
					elseif machine:getModData()['Playlist10'] == nil then
						machine:getModData()['Playlist10'] = item:getType()
					elseif machine:getModData()['Playlist11'] == nil then
						machine:getModData()['Playlist11'] = item:getType()
					elseif machine:getModData()['Playlist12'] == nil then
						machine:getModData()['Playlist12'] = item:getType()
					elseif machine:getModData()['Playlist13'] == nil then
						machine:getModData()['Playlist13'] = item:getType()
					elseif machine:getModData()['Playlist14'] == nil then
						machine:getModData()['Playlist14'] = item:getType()
					elseif machine:getModData()['Playlist15'] == nil then
						machine:getModData()['Playlist15'] = item:getType()
					elseif machine:getModData()['Playlist16'] == nil then
						machine:getModData()['Playlist16'] = item:getType()
					elseif machine:getModData()['Playlist17'] == nil then
						machine:getModData()['Playlist17'] = item:getType()
					elseif machine:getModData()['Playlist18'] == nil then
						machine:getModData()['Playlist18'] = item:getType()
					elseif machine:getModData()['Playlist19'] == nil then
						machine:getModData()['Playlist19'] = item:getType()
					elseif machine:getModData()['Playlist20'] == nil then
						machine:getModData()['Playlist20'] = item:getType()
					elseif machine:getModData()['Playlist21'] == nil then
						machine:getModData()['Playlist21'] = item:getType()
					elseif machine:getModData()['Playlist22'] == nil then
						machine:getModData()['Playlist22'] = item:getType()
					elseif machine:getModData()['Playlist23'] == nil then
						machine:getModData()['Playlist23'] = item:getType()
					elseif machine:getModData()['Playlist24'] == nil then
						machine:getModData()['Playlist24'] = item:getType()
					elseif machine:getModData()['Playlist25'] == nil then
						machine:getModData()['Playlist25'] = item:getType()
					elseif machine:getModData()['Playlist26'] == nil then
						machine:getModData()['Playlist26'] = item:getType()
					elseif machine:getModData()['Playlist27'] == nil then
						machine:getModData()['Playlist27'] = item:getType()
					elseif machine:getModData()['Playlist28'] == nil then
						machine:getModData()['Playlist28'] = item:getType()
					elseif machine:getModData()['Playlist29'] == nil then
						machine:getModData()['Playlist29'] = item:getType()
					elseif machine:getModData()['Playlist30'] == nil then
						machine:getModData()['Playlist30'] = item:getType()
					elseif machine:getModData()['Playlist31'] == nil then
						machine:getModData()['Playlist31'] = item:getType()
					elseif machine:getModData()['Playlist32'] == nil then
						machine:getModData()['Playlist32'] = item:getType()
					elseif machine:getModData()['Playlist33'] == nil then
						machine:getModData()['Playlist33'] = item:getType()
					elseif machine:getModData()['Playlist34'] == nil then
						machine:getModData()['Playlist34'] = item:getType()
					elseif machine:getModData()['Playlist35'] == nil then
						machine:getModData()['Playlist35'] = item:getType()
					elseif machine:getModData()['Playlist36'] == nil then
						machine:getModData()['Playlist36'] = item:getType()
					elseif machine:getModData()['Playlist37'] == nil then
						machine:getModData()['Playlist37'] = item:getType()
					elseif machine:getModData()['Playlist38'] == nil then
						machine:getModData()['Playlist38'] = item:getType()
					elseif machine:getModData()['Playlist39'] == nil then
						machine:getModData()['Playlist39'] = item:getType()
					elseif machine:getModData()['Playlist40'] == nil then
						machine:getModData()['Playlist40'] = item:getType()
					elseif machine:getModData()['Playlist41'] == nil then
						machine:getModData()['Playlist41'] = item:getType()
					elseif machine:getModData()['Playlist42'] == nil then
						machine:getModData()['Playlist42'] = item:getType()
					elseif machine:getModData()['Playlist43'] == nil then
						machine:getModData()['Playlist43'] = item:getType()
					elseif machine:getModData()['Playlist44'] == nil then
						machine:getModData()['Playlist44'] = item:getType()
					elseif machine:getModData()['Playlist45'] == nil then
						machine:getModData()['Playlist45'] = item:getType()
					elseif machine:getModData()['Playlist46'] == nil then
						machine:getModData()['Playlist46'] = item:getType()
					elseif machine:getModData()['Playlist47'] == nil then
						machine:getModData()['Playlist47'] = item:getType()
					elseif machine:getModData()['Playlist48'] == nil then
						machine:getModData()['Playlist48'] = item:getType()
					elseif machine:getModData()['Playlist49'] == nil then
						machine:getModData()['Playlist49'] = item:getType()
					elseif machine:getModData()['Playlist50'] == nil then
						machine:getModData()['Playlist50'] = item:getType()
					end
					machine:transmitModData()
				end
			end
		elseif musicChoice == "Random" then
			startSong = ZombRand(1,machineItems:size())
			for i=0, machineItems:size()-1 do
				local item = machineItems:get(i)
				local itemDisplayName = nil
	
				if item and item:getDisplayName() and startSong == machineItemNumber + 1 then
					itemDisplayName = item:getDisplayName()
					machineItemNumber = machineItemNumber + 1
					--print(machineItemNumber .. ": " .. itemDisplayName)
					playItem = item
					break
				else
					machineItemNumber = machineItemNumber + 1
				end
			end
		end

		--print("Playlist Entry 1: " .. machine:getModData()['Playlist1'])
		--print("Playlist Entry 2: " .. machine:getModData()['Playlist2'])
		--print("Playlist Entry 3: " .. machine:getModData()['Playlist3'])
		--print("Playlist Entry 4: " .. machine:getModData()['Playlist4'])
		--print("Playlist Entry 5: " .. machine:getModData()['Playlist5'])
		--print("Playlist Entry 6: " .. machine:getModData()['Playlist6'])
		--print("Playlist Entry 7: " .. machine:getModData()['Playlist7'])
		--print("Playlist Entry 8: " .. machine:getModData()['Playlist8'])
		--print("Playlist Entry 9: " .. machine:getModData()['Playlist9'])
		--print("Playlist Entry 10: " .. machine:getModData()['Playlist10'])
		--print("Playlist Entry 11: " .. machine:getModData()['Playlist11'])
		--print("Playlist Entry 12: " .. machine:getModData()['Playlist12'])
		--print("Playlist Entry 13: " .. machine:getModData()['Playlist13'])
		--print("Playlist Entry 14: " .. machine:getModData()['Playlist14'])
		--print("Playlist Entry 15: " .. machine:getModData()['Playlist15'])
		--print("Playlist Entry 16: " .. machine:getModData()['Playlist16'])
		--print("Playlist Entry 17: " .. machine:getModData()['Playlist17'])
		--print("Playlist Entry 18: " .. machine:getModData()['Playlist18'])
		--print("Playlist Entry 19: " .. machine:getModData()['Playlist19'])
		--print("Playlist Entry 20: " .. machine:getModData()['Playlist20'])

		if not playItem then
			return
		elseif playItem:getDisplayName() == "Plank" then
			soundFile = "plank_sound"
		else
			soundFile = playItem:getType()
		end

		if #Jukeboxes.soundCache < 1 then
			machine:getModData()['Playing'] = false
			machine:transmitModData()
		end

    		for _,t in ipairs(Jukeboxes.soundCache) do        
        		if t.sound and t.sound:isPlaying() then
          	  		machine:getModData()['Playing'] = true
				machine:transmitModData()
			else
          	  		machine:getModData()['Playing'] = false
				machine:transmitModData()
        		end
		end

		if machine:getModData()['Playing'] == true then
			MachineAlreadyPlaying(player, machine, soundFile, playItem)
			return
		elseif soundFile then
			machine:getModData()['LastSong'] = machine:getModData()['CurrentSong']
			machine:getModData()['CurrentSong'] = soundFile
			machine:getModData()['Playing'] = true
			machine:transmitModData()

			if (musicChoice == "All" or musicChoice == "Shuffled") and machine:getModData()['CurrentSong'] == machine:getModData()['Playlist1'] then
				machine:getModData()['Playlist1'] = nil
				machine:transmitModData()
			end
	
			Jukeboxes.PlaySound(machine, soundFile)
			return
		end
	end
end

Events.OnPreFillWorldObjectContextMenu.Add(UseJukeboxMenu.doBuildMenu);


local function replaceJukebox(JukeboxObject)
	JukeboxObject:getModData()
	if not JukeboxObject:getContainer() then
		local square = JukeboxObject:getSquare()
		local spr = JukeboxObject:getSprite():getName()  
		local index = JukeboxObject:getObjectIndex()
          	sledgeDestroy(JukeboxObject)
		JukeboxObject:getSquare():transmitRemoveItemFromSquareOnServer(JukeboxObject)
		JukeboxObject:getSquare():transmitRemoveItemFromSquare(JukeboxObject)            

          	JukeboxObject = IsoThumpable.new(getCell(), square, spr, false, ISWoodenContainer:new(spr, nil))  
            	JukeboxObject:setIsContainer(true)
             	JukeboxObject:getContainer():setType("jukebox")
             	JukeboxObject:getContainer():setCapacity(50)

		JukeboxObject:getModData()['IsOn'] = false
		JukeboxObject:getModData()['Volume'] = 5
		JukeboxObject:getModData()['Playing'] = false
		JukeboxObject:getModData()['Skip'] = false
		JukeboxObject:getModData()['MP Mode'] = false

		JukeboxObject:getModData()['FrontSquare'] = nil

		JukeboxObject:getModData()['LastSong'] = nil
		JukeboxObject:getModData()['CurrentSong'] = nil
		JukeboxObject:getModData()['NextSong'] = nil

		JukeboxObject:getModData()['Playlist1'] = nil
		JukeboxObject:getModData()['Playlist2'] = nil
		JukeboxObject:getModData()['Playlist3'] = nil
		JukeboxObject:getModData()['Playlist4'] = nil
		JukeboxObject:getModData()['Playlist5'] = nil
		JukeboxObject:getModData()['Playlist6'] = nil
		JukeboxObject:getModData()['Playlist7'] = nil
		JukeboxObject:getModData()['Playlist8'] = nil
		JukeboxObject:getModData()['Playlist9'] = nil
		JukeboxObject:getModData()['Playlist10'] = nil
		JukeboxObject:getModData()['Playlist11'] = nil
		JukeboxObject:getModData()['Playlist12'] = nil
		JukeboxObject:getModData()['Playlist13'] = nil
		JukeboxObject:getModData()['Playlist14'] = nil
		JukeboxObject:getModData()['Playlist15'] = nil
		JukeboxObject:getModData()['Playlist16'] = nil
		JukeboxObject:getModData()['Playlist17'] = nil
		JukeboxObject:getModData()['Playlist18'] = nil
		JukeboxObject:getModData()['Playlist19'] = nil
		JukeboxObject:getModData()['Playlist20'] = nil
		JukeboxObject:getModData()['Playlist21'] = nil
		JukeboxObject:getModData()['Playlist22'] = nil
		JukeboxObject:getModData()['Playlist23'] = nil
		JukeboxObject:getModData()['Playlist24'] = nil
		JukeboxObject:getModData()['Playlist25'] = nil
		JukeboxObject:getModData()['Playlist26'] = nil
		JukeboxObject:getModData()['Playlist27'] = nil
		JukeboxObject:getModData()['Playlist28'] = nil
		JukeboxObject:getModData()['Playlist29'] = nil
		JukeboxObject:getModData()['Playlist30'] = nil
		JukeboxObject:getModData()['Playlist31'] = nil
		JukeboxObject:getModData()['Playlist32'] = nil
		JukeboxObject:getModData()['Playlist33'] = nil
		JukeboxObject:getModData()['Playlist34'] = nil
		JukeboxObject:getModData()['Playlist35'] = nil
		JukeboxObject:getModData()['Playlist36'] = nil
		JukeboxObject:getModData()['Playlist37'] = nil
		JukeboxObject:getModData()['Playlist38'] = nil
		JukeboxObject:getModData()['Playlist39'] = nil
		JukeboxObject:getModData()['Playlist40'] = nil
		JukeboxObject:getModData()['Playlist41'] = nil
		JukeboxObject:getModData()['Playlist42'] = nil
		JukeboxObject:getModData()['Playlist43'] = nil
		JukeboxObject:getModData()['Playlist44'] = nil
		JukeboxObject:getModData()['Playlist45'] = nil
		JukeboxObject:getModData()['Playlist46'] = nil
		JukeboxObject:getModData()['Playlist47'] = nil
		JukeboxObject:getModData()['Playlist48'] = nil
		JukeboxObject:getModData()['Playlist49'] = nil
		JukeboxObject:getModData()['Playlist50'] = nil

             	square:AddTileObject(JukeboxObject, index)
		square:transmitAddObjectToSquare(JukeboxObject, JukeboxObject:getObjectIndex())
		square:transmitModdata()
		JukeboxObject:transmitModData()	
            	JukeboxObject:transmitCompleteItemToServer()
             	JukeboxObject:transmitUpdatedSpriteToServer()
	end
end

local function GetVanillaJukebox(square)
	if square then
        	local objects = square:getObjects()
        	for i=1, objects:size()-1 do
            		local thisObject = objects:get(i)
           		local spr = thisObject:getSprite()
           		if spr then
                		local properties = spr:getProperties()
               				if properties:Val("CustomName") == "Jukebox" then
					return thisObject
                		end
            		end
        	end
    	end
end


local function onLoadGridsquare(square)
	local Jukebox = GetVanillaJukebox(square)

	if Jukebox then
		replaceJukebox(Jukebox)
	end
end

Events.LoadGridsquare.Add(onLoadGridsquare);
