local function replaceHotDogMachine(HotDogMachineObject)
	if not HotDogMachineObject:getContainer() then
		local square = HotDogMachineObject:getSquare()
		local spr = HotDogMachineObject:getSprite():getName()  
		local index = HotDogMachineObject:getObjectIndex()
          	sledgeDestroy(HotDogMachineObject)
		HotDogMachineObject:getSquare():transmitRemoveItemFromSquareOnServer(HotDogMachineObject)
		HotDogMachineObject:getSquare():transmitRemoveItemFromSquare(HotDogMachineObject)            

          	HotDogMachineObject = IsoThumpable.new(getCell(), square, spr, false, ISWoodenContainer:new(spr, nil))  
            	HotDogMachineObject:setIsContainer(true)
             	HotDogMachineObject:getContainer():setType("hotdogMachine")
             	HotDogMachineObject:getContainer():setCapacity(5)

		if ((SandboxVars.AllowExteriorGenerator and square:haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier and square:isOutside() == false)) then
			HotDogMachineObject:getContainer():setCustomTemperature(1.5)
		end

             	square:AddTileObject(HotDogMachineObject, index)
		square:transmitAddObjectToSquare(HotDogMachineObject, HotDogMachineObject:getObjectIndex())
		square:transmitModdata()
		HotDogMachineObject:transmitModData()	
            	HotDogMachineObject:transmitCompleteItemToServer()
             	HotDogMachineObject:transmitUpdatedSpriteToServer()

		local FAFreshTheatreSpawnChance = SandboxVars.FunctionalAppliances.FAFreshTheatreChance

		if (FAFreshTheatreSpawnChance == 6) then
			FAFreshTheatreSpawnChance = 0
		end

		local RollRand = ZombRand(1,100)+(FAFreshTheatreSpawnChance*10)
		if RollRand >= 101 then
			HotDogMachineObject:getContainer():AddItem("Base.Sausage")
			if RollRand >= 121 then
				HotDogMachineObject:getContainer():AddItem("Base.Sausage")
				if RollRand >= 131 then
					HotDogMachineObject:getContainer():AddItem("FunctionalAppliances.FAHotdog")
				end
			end
		end
	end 
end

local function replaceNapkinDispensers(NapkinDispensersObject)
	if not NapkinDispensersObject:getContainer() then
		local square = NapkinDispensersObject:getSquare()
		local spr = NapkinDispensersObject:getSprite():getName()  
		local index = NapkinDispensersObject:getObjectIndex()
          	sledgeDestroy(NapkinDispensersObject)
		NapkinDispensersObject:getSquare():transmitRemoveItemFromSquareOnServer(NapkinDispensersObject)
		NapkinDispensersObject:getSquare():transmitRemoveItemFromSquare(NapkinDispensersObject)            

          	NapkinDispensersObject = IsoThumpable.new(getCell(), square, spr, false, ISWoodenContainer:new(spr, nil))  
            	NapkinDispensersObject:setIsContainer(true)
		NapkinDispensersObject:getContainer():setType("napkinDispenser")
             	NapkinDispensersObject:getContainer():setCapacity(5)

             	square:AddTileObject(NapkinDispensersObject, index)
		square:transmitAddObjectToSquare(NapkinDispensersObject, NapkinDispensersObject:getObjectIndex())
		square:transmitModdata()
		NapkinDispensersObject:transmitModData()	
            	NapkinDispensersObject:transmitCompleteItemToServer()
             	NapkinDispensersObject:transmitUpdatedSpriteToServer()


		NapkinDispensersObject:getContainer():AddItem("Base.PaperNapkins")
		local RollRand = ZombRand(1,100)
		if RollRand >= 30 then
			NapkinDispensersObject:getContainer():AddItem("Base.PaperNapkins")
			if RollRand >= 60 then
				NapkinDispensersObject:getContainer():AddItem("Base.PaperNapkins")
				if RollRand >= 90 then
					NapkinDispensersObject:getContainer():AddItem("Base.PaperNapkins")
				end
			end
		end
	end 
end

local function replacePaperTowelDispensers(PaperTowelDispensersObject)
	if not PaperTowelDispensersObject:getContainer() then
		local square = PaperTowelDispensersObject:getSquare()
		local spr = PaperTowelDispensersObject:getSprite():getName()  
		local index = PaperTowelDispensersObject:getObjectIndex()
          	sledgeDestroy(PaperTowelDispensersObject)
		PaperTowelDispensersObject:getSquare():transmitRemoveItemFromSquareOnServer(PaperTowelDispensersObject)
		PaperTowelDispensersObject:getSquare():transmitRemoveItemFromSquare(PaperTowelDispensersObject)            

          	PaperTowelDispensersObject = IsoThumpable.new(getCell(), square, spr, false, ISWoodenContainer:new(spr, nil))  
            	PaperTowelDispensersObject:setIsContainer(true)
		PaperTowelDispensersObject:getContainer():setType("papertowelDispenser")
             	PaperTowelDispensersObject:getContainer():setCapacity(5)

             	square:AddTileObject(PaperTowelDispensersObject, index)
		square:transmitAddObjectToSquare(PaperTowelDispensersObject, PaperTowelDispensersObject:getObjectIndex())
		square:transmitModdata()
		PaperTowelDispensersObject:transmitModData()	
            	PaperTowelDispensersObject:transmitCompleteItemToServer()
             	PaperTowelDispensersObject:transmitUpdatedSpriteToServer()

		PaperTowelDispensersObject:getContainer():AddItem("Base.PaperNapkins")
		local RollRand = ZombRand(1,100)
		if RollRand >= 30 then
			PaperTowelDispensersObject:getContainer():AddItem("Base.PaperNapkins")
			if RollRand >= 60 then
				PaperTowelDispensersObject:getContainer():AddItem("Base.PaperNapkins")
				if RollRand >= 90 then
					PaperTowelDispensersObject:getContainer():AddItem("Base.PaperNapkins")
				end
			end
		end
	end 
end

local function DoesItRing(PayPhones)
	if PayPhones and SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier then
		local randomNumb = ZombRand(1,100)
		if randomNumb < 20 then
			PayPhones:getModData()['Ring'] = "TRUE"
		else
			PayPhones:getModData()['Ring'] = "FALSE"
		end
	else
		PayPhones:getModData()['Ring'] = "FALSE"
	end

	PayPhones:transmitModData()
end

local function replacePopcornMachine(PopcornMachineObject)
	if not PopcornMachineObject:getContainer() then
		local square = PopcornMachineObject:getSquare()
		local spr = PopcornMachineObject:getSprite():getName()  
		local index = PopcornMachineObject:getObjectIndex()
          	sledgeDestroy(PopcornMachineObject)
		PopcornMachineObject:getSquare():transmitRemoveItemFromSquareOnServer(PopcornMachineObject)
		PopcornMachineObject:getSquare():transmitRemoveItemFromSquare(PopcornMachineObject)            

          	PopcornMachineObject = IsoThumpable.new(getCell(), square, spr, false, ISWoodenContainer:new(spr, nil))  
            	PopcornMachineObject:setIsContainer(true)
             	PopcornMachineObject:getContainer():setType("popcornMachine")
             	PopcornMachineObject:getContainer():setCapacity(5)

		if ((SandboxVars.AllowExteriorGenerator and square:haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier and square:isOutside() == false)) then
			PopcornMachineObject:getContainer():setCustomTemperature(1.5)
		end

             	square:AddTileObject(PopcornMachineObject, index)
		square:transmitAddObjectToSquare(PopcornMachineObject, PopcornMachineObject:getObjectIndex())
		square:transmitModdata()
		PopcornMachineObject:transmitModData()	
            	PopcornMachineObject:transmitCompleteItemToServer()
             	PopcornMachineObject:transmitUpdatedSpriteToServer()

		local FAFreshTheatreSpawnChance = SandboxVars.FunctionalAppliances.FAFreshTheatreChance

		if (FAFreshTheatreSpawnChance == 6) then
			FAFreshTheatreSpawnChance = 0
		end

		local RollRand = ZombRand(1,100)+(FAFreshTheatreSpawnChance*10)
		if RollRand >= 101 then
			PopcornMachineObject:getContainer():AddItem("FunctionalAppliances.FATheaterPopcorn")
			if RollRand >= 121 then
				PopcornMachineObject:getContainer():AddItem("FunctionalAppliances.FAButteredPopcorn")
				if RollRand >= 131 then
					PopcornMachineObject:getContainer():AddItem("FunctionalAppliances.FAButteredPopcorn")
				end
			end
		end
	end
end

local function SyrupPickOne(index)
	return ZombRand(index)+1
end

local FASyrupsList = {
	"FunctionalAppliances.FAOrangeSodaSyrupBox",
	"FunctionalAppliances.FALemonLimeSodaSyrupBox",
	"FunctionalAppliances.FARootBeerSodaSyrupBox",
	"FunctionalAppliances.FAColaSodaSyrupBox",
}

local function replaceSodaFountain(SodaFountainObject)
	if not SodaFountainObject:getContainer() then
		local square = SodaFountainObject:getSquare()
		local spr = SodaFountainObject:getSprite():getName()  
		local index = SodaFountainObject:getObjectIndex()
          	sledgeDestroy(SodaFountainObject)
		SodaFountainObject:getSquare():transmitRemoveItemFromSquareOnServer(SodaFountainObject)
		SodaFountainObject:getSquare():transmitRemoveItemFromSquare(SodaFountainObject)            

          	SodaFountainObject = IsoThumpable.new(getCell(), square, spr, false, ISWoodenContainer:new(spr, nil))  
            	SodaFountainObject:setIsContainer(true)
             	SodaFountainObject:getContainer():setType("slurpNBurp")
             	SodaFountainObject:getContainer():setCapacity(50)

             	square:AddTileObject(SodaFountainObject, index)
		square:transmitAddObjectToSquare(SodaFountainObject, SodaFountainObject:getObjectIndex())
		square:transmitModdata()
		SodaFountainObject:transmitModData()	
            	SodaFountainObject:transmitCompleteItemToServer()
             	SodaFountainObject:transmitUpdatedSpriteToServer()

		local FASyrupsSpawnChance = SandboxVars.FunctionalAppliances.SyrupsChance

		if (FASyrupsSpawnChance == 6) then
			FASyrupsSpawnChance = 0
		end

		if FASyrupsSpawnChance > 0 then
			SodaFountainObject:getContainer():AddItem("FunctionalAppliances.FACO2Tank")
			SodaFountainObject:getContainer():AddItem(FASyrupsList[SyrupPickOne(#FASyrupsList)])
		end

		local RollRand = ZombRand(1,100)+(FASyrupsSpawnChance*10)
		if RollRand >= 101 then
			SodaFountainObject:getContainer():AddItem(FASyrupsList[SyrupPickOne(#FASyrupsList)])
			if RollRand >= 121 then
				SodaFountainObject:getContainer():AddItem(FASyrupsList[SyrupPickOne(#FASyrupsList)])
			end
		end
	end
end

local function onLoadGridsquare(square)
	local SodaFountain = nil
	local PopcornMachine = nil
	local PayPhones = nil
	local PaperTowelDispensersObject = nil
	local NapkinDispensersObject = nil
	local HotDogMachine = nil

	if square then
        	local objects = square:getObjects()
        	for i=1, objects:size()-1 do
            		local thisObject = objects:get(i)
           		local spr = thisObject:getSprite()
           		if spr then
                		local properties = spr:getProperties()
                		if properties:Val("GroupName") == "SlurpBurp" then
					SodaFountain = thisObject
               			elseif properties:Val("CustomName") == "Popcorn Machine" then
					PopcornMachine = thisObject
               			elseif properties:Val("GroupName") == "Pay" and properties:Val("CustomName") == "Phones" then
					PayPhones = thisObject
               			elseif properties:Val("GroupName") == "Air" and properties:Val("CustomName") == "Blower" then
					PaperTowelDispensersObject = thisObject
               			elseif properties:Val("GroupName") == "Shop" and properties:Val("CustomName") == "Dispenser" then
					NapkinDispensersObject = thisObject
                		elseif properties:Val("GroupName") == "Fossoil Candy" then
					HotDogMachine = thisObject
                		end
            		end
        	end
    	end

	if SodaFountain then
		replaceSodaFountain(SodaFountain)
	end

	if PopcornMachine then
		replacePopcornMachine(PopcornMachine)
	end

	if PayPhones then
		DoesItRing(PayPhones)
	end

	if PaperTowelDispensersObject then
		replacePaperTowelDispensers(PaperTowelDispensersObject)
	end

	if NapkinDispensersObject then
		replaceNapkinDispensers(NapkinDispensersObject)
	end

	if HotDogMachine then
		replaceHotDogMachine(HotDogMachine)
	end
end

Events.LoadGridsquare.Add(onLoadGridsquare);