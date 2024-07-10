---Like DoParam but for vehicles
---@param vehicle string Name of the vehicle script
---@param param string The parameter(s) to apply to this script
---@param module string Optional: the module of the vehicle
---@see Item#DoParam
---@see VehicleScript#Load
local DoVehicleParam = function(vehicle, param, module)
	module = module or "Base"
	local vehicleScript = ScriptManager.instance:getVehicle(module .. "." .. vehicle)
	if not vehicleScript then return end
	vehicleScript:Load(vehicle, "{" .. param .. "}")
end


---Utility to change the armor of a vehicle
---@param vehicle string Name of the vehicle script
---@param armor string Name of a armor template
---@param doors string Name of a armor template
---@param trunk string Name of a armor template
---@param seat string Name of a armor template
---@param baseModel string Name of a model
---@see DoVehicleParam
local showSeatAnimation = not getActivatedMods():contains("VVA_cullseats")
local SetAnimationsAdvanced = function(vehicle, armor, doors, trunk, seat, baseModel, module) 
	module = module or "Base"
	DoVehicleParam(vehicle, "template! = " .. armor .. ",", module)
	DoVehicleParam(vehicle, "template! = " .. doors .. ",", module)
	DoVehicleParam(vehicle, "template! = " .. trunk .. ",", module)
	if showSeatAnimation then
		DoVehicleParam(vehicle, "template! = " .. seat .. ",", module)
	end
	if baseModel then
		DoVehicleParam(vehicle, "model { file = " .. baseModel .. ",}", module)
	end
end


local vehicleLayouts = {}
vehicleLayouts["Vehicles_VanSeats_a"] = {
	exterior = "VanSeats_animatedDoors",
	doors = "ThreeDoor",
	rear = "RearDoorVersion",
	seats = "SixSeats",
}

vehicleLayouts["Vehicles_LuxuryCar_a"] = {
	exterior = "LuxuryCar_animatedDoors",
	doors = "TwoDoor",
	rear = "TrunkDoorVersion",
	seats = "TwoSeats",
}

vehicleLayouts["Vehicles_Van_a"] = {
	exterior = "Van_animatedDoors",
	doors = "TwoDoor",
	rear = "RearDoorVersion",
	seats = "TwoSeats",
}
vehicleLayouts["Vehicles_Van_NoRandom_a"] = vehicleLayouts["Vehicles_Van_a"]
vehicleLayouts["Vehicles_Ambulance_a"] = vehicleLayouts["Vehicles_Van_a"]
vehicleLayouts["Vehicles_VanRadio_a"] = vehicleLayouts["Vehicles_Van_a"]

vehicleLayouts["Vehicles_ModernCar_a"] = {
	exterior = "ModernCar_animatedDoors",
	doors = "FourDoor",
	rear = "TrunkDoorVersion",
	seats = "FourSeats",
}
vehicleLayouts["Vehicles_ModernCar02_a"] = {
	exterior = "ModernCar02_animatedDoors",
	doors = "FourDoor",
	rear = "TrunkDoorVersion",
	seats = "FourSeats",
}
vehicleLayouts["Vehicles_CarNormal_a"] = {
	exterior = "CarNormal_animatedDoors",
	doors = "FourDoor",
	rear = "TrunkDoorVersion",
	seats = "FourSeats",
}
vehicleLayouts["Vehicles_CarLights_a"] = vehicleLayouts["Vehicles_CarNormal_a"]
vehicleLayouts["Vehicles_CarTaxi_a"] = vehicleLayouts["Vehicles_CarNormal_a"]
vehicleLayouts["Vehicles_CarLights_NoRandom_a"] = vehicleLayouts["Vehicles_CarNormal_a"]

vehicleLayouts["Vehicles_OffRoad_a"] = {
	exterior = "OffRoad_animatedDoors",
	doors = "TwoDoor",
	rear = "TrunkDoorVersion",
	seats = "TwoSeats",
}

vehicleLayouts["Vehicles_PickUpTruck_a"] = {
	exterior = "PickUpTruck_animatedDoors",
	doors = "TwoDoor",
	rear = "OpenBedVersion",
	seats = "TwoSeats",
}
vehicleLayouts["Vehicles_PickUpTruck_NoRandom_a"] = vehicleLayouts["Vehicles_PickUpTruck_a"]
vehicleLayouts["Vehicles_PickUpTruckLights_a"] = vehicleLayouts["Vehicles_PickUpTruck_a"]
vehicleLayouts["Vehicles_PickUpTruckLights_NoRandom_a"] = vehicleLayouts["Vehicles_PickUpTruck_a"]

vehicleLayouts["Vehicles_PickUpVan_a"] = {
	exterior = "PickUpVan_animatedDoors",
	doors = "TwoDoor",
	rear = "TrunkDoorVersion",
	seats = "TwoSeats",
}
vehicleLayouts["Vehicles_PickUpVan_NoRandom_a"] = vehicleLayouts["Vehicles_PickUpVan_a"]
vehicleLayouts["Vehicles_PickUpVanLights_a"] = vehicleLayouts["Vehicles_PickUpVan_a"]
vehicleLayouts["Vehicles_PickUpVanLights_NoRandom_a"] = vehicleLayouts["Vehicles_PickUpVan_a"]

vehicleLayouts["Vehicles_SmallCar_a"] = {
	exterior = "SmallCar_animatedDoors",
	doors = "TwoDoor",
	rear = "TrunkDoorVersion",
	seats = "FourSeats",
}
vehicleLayouts["Vehicles_SmallCar02_a"] = {
	exterior = "SmallCar02_animatedDoors",
	doors = "TwoDoor",
	rear = "TrunkDoorVersion",
	seats = "FourSeats",
}
vehicleLayouts["Vehicles_SportsCar_a"] = {
	exterior = "SportsCar_animatedDoors",
	doors = "TwoDoor",
	rear = "TrunkDoorVersion",
	seats = "CullSeats",
}

vehicleLayouts["Vehicle_StepVan_a"] = {
	exterior = "StepVan_animatedDoors",
	doors = "TwoDoor",
	rear = "RearDoorVersion",
	seats = "TwoSeats",
}
vehicleLayouts["Vehicle_StepVan_NoRandom_a"] = vehicleLayouts["Vehicle_StepVan_a"]

vehicleLayouts["Vehicles_SUV_a"] = {
	exterior = "SUV_animatedDoors",
	doors = "FourDoor",
	rear = "TrunkDoorVersion",
	seats = "FourSeats",
}
vehicleLayouts["Vehicles_CarStationWagon_a"] = {
	exterior = "CarStationWagon_animatedDoors",
	doors = "FourDoor",
	rear = "TrunkDoorVersion",
	seats = "FourSeats",
}
vehicleLayouts["Vehicles_CarTaxiArg_a"] = {
	exterior = "CarTaxiArg_animatedDoors",
	doors = "FourDoor",
	rear = "TrunkDoorVersion",
	seats = "FourSeats",
}
vehicleLayouts["Vehicle_87gmcarmored_a"] = {
	exterior = "87gmcarmored_animatedDoors",
	doors = "TwoDoor",
	rear = "TrunkDoorVersion",
	seats = "TwoSeats",
}

local SetAnimationsConfig = function (vehicle, baseModel, module)
	module = module or "Base"
	local info = vehicleLayouts[baseModel]
	if info then
		SetAnimationsAdvanced(vehicle, info.exterior, info.doors, info.rear, info.seats, baseModel, module)
	end
end

		SetAnimationsConfig("CarLights",		"Vehicles_CarLights_a");
		SetAnimationsConfig("CarLightsPolice",		"Vehicles_CarLights_NoRandom_a");
		SetAnimationsConfig("CarNormal",		"Vehicles_CarNormal_a");
		SetAnimationsConfig("CarTaxi",			"Vehicles_CarTaxi_a");
		SetAnimationsConfig("CarTaxi2",			"Vehicles_CarTaxi_a");
		SetAnimationsConfig("CarStationWagon",		"Vehicles_CarStationWagon_a");
		SetAnimationsConfig("CarStationWagon2",		"Vehicles_CarStationWagon_a");
		SetAnimationsConfig("ModernCar",		"Vehicles_ModernCar_a");
		SetAnimationsConfig("ModernCar02",		"Vehicles_ModernCar02_a");
		SetAnimationsConfig("CarLuxury",		"Vehicles_LuxuryCar_a");
		SetAnimationsConfig("SmallCar",			"Vehicles_SmallCar_a");
		SetAnimationsConfig("SmallCar02",		"Vehicles_SmallCar02_a");
		SetAnimationsConfig("SUV",			"Vehicles_SUV_a");
		SetAnimationsConfig("OffRoad",			"Vehicles_OffRoad_a");
		SetAnimationsConfig("PickUpVanLights",		"Vehicles_PickUpVanLights_NoRandom_a");
		SetAnimationsConfig("PickUpVanLightsPolice",	"Vehicles_PickUpVanLights_NoRandom_a");
		SetAnimationsConfig("PickUpVanLightsFire",	"Vehicles_PickUpVanLights_NoRandom_a");
		SetAnimationsConfig("PickUpVanMccoy",		"Vehicles_PickUpVan_NoRandom_a");
		SetAnimationsConfig("PickUpVan",		"Vehicles_PickUpVan_a");
		SetAnimationsConfig("PickUpTruckLights",	"Vehicles_PickUpTruckLights_a");
		SetAnimationsConfig("PickUpTruckLightsFire",	"Vehicles_PickUpTruckLights_NoRandom_a");
		SetAnimationsConfig("PickUpTruckMccoy",		"Vehicles_PickUpTruck_NoRandom_a");
		SetAnimationsConfig("PickUpTruck",		"Vehicles_PickUpTruck_a");
		SetAnimationsConfig("StepVan",			"Vehicle_StepVan_a");
		SetAnimationsConfig("StepVan_Heralds",		"Vehicle_StepVan_a");
		SetAnimationsConfig("StepVanMail",		"Vehicle_StepVan_NoRandom_a");
		SetAnimationsConfig("StepVan_Scarlet",		"Vehicle_StepVan_a");
		SetAnimationsConfig("VanSeats",			"Vehicles_VanSeats_a");
		SetAnimationsConfig("Van",			"Vehicles_Van_a");
		SetAnimationsConfig("Van_KnoxDisti",		"Vehicles_Van_a");
		SetAnimationsConfig("Van_Transit",		"Vehicles_Van_a");
		SetAnimationsConfig("VanSpiffo",		"Vehicles_Van_NoRandom_a");
		SetAnimationsConfig("VanSpecial",		"Vehicles_Van_NoRandom_a");
		SetAnimationsConfig("Van_MassGenFac",		"Vehicles_Van_a");
		SetAnimationsConfig("Van_LectroMax",		"Vehicles_Van_a");
		SetAnimationsConfig("VanRadio",			"Vehicles_VanRadio_a");
		SetAnimationsConfig("VanRadio_3N",		"Vehicles_VanRadio_a");
		SetAnimationsConfig("VanAmbulance",		"Vehicles_Ambulance_a");
		SetAnimationsConfig("SportsCar",		"Vehicles_SportsCar_a");

	if getActivatedMods():contains("STR") then
		SetAnimationsConfig("Van_ravencreekdoc",	"Vehicles_Van_a");
		SetAnimationsConfig("Van_meadedoc",		"Vehicles_Van_a");
		SetAnimationsConfig("Van_jeffersondoc",		"Vehicles_VanSeats_a");
		SetAnimationsConfig("STFR_87gmcarmoredcar",	"Vehicle_87gmcarmored_a");
	end

	if getActivatedMods():contains("STFR") then
		SetAnimationsConfig("StepVan_swat",		"Vehicle_StepVan_a");
		SetAnimationsConfig("Van_doc",			"Vehicles_Van_a");
		SetAnimationsConfig("STFR_87gmcarmoredcar",	"Vehicle_87gmcarmored_a");
	end

	if getActivatedMods():contains("VVehicleEnhancer") then
		SetAnimationsConfig("CarOldsFull",		"Vehicles_CarNormal_a");
		SetAnimationsConfig("CarNormalPoncho",		"Vehicles_CarNormal_a");
		SetAnimationsConfig("CarLightsStatepolice",	"Vehicles_CarLights_NoRandom_a");
		SetAnimationsConfig("CarLightsSheriff",		"Vehicles_CarLights_NoRandom_a");
		SetAnimationsConfig("CarLightsFireDept",	"Vehicles_CarLights_NoRandom_a");
		SetAnimationsConfig("CarLightsFireDept2",	"Vehicles_CarLights_NoRandom_a");
		SetAnimationsConfig("CarOldWagon",		"Vehicles_CarStationWagon_a");
		SetAnimationsConfig("CarPonchoWagon",		"Vehicles_CarStationWagon_a");
		SetAnimationsConfig("PickUpVanf76",		"Vehicles_PickUpVan_a");
		SetAnimationsConfig("PickUpTruckf76",		"Vehicles_PickUpTruck_a");
		SetAnimationsConfig("73cayenne",		"Vehicles_PickUpTruck_a");
		SetAnimationsConfig("Vanateam",			"Vehicles_Van_a");
		SetAnimationsConfig("Vanboogie",		"Vehicles_Van_a");
		SetAnimationsConfig("Boltrs",			"Vehicles_SmallCar_a");
		SetAnimationsConfig("SmallCarSwiffer",		"Vehicles_SmallCar02_a");
		SetAnimationsConfig("280sport",			"Vehicles_ModernCar02_a");
	end
	if getActivatedMods():contains("TallerMecanico") then		
		SetAnimationsConfig("VanSnakeneta",		"Vehicles_Van_NoRandom_a");
		SetAnimationsConfig("VanGenova",		"Vehicles_Van_NoRandom_a");
		SetAnimationsConfig("CarTaxiArg",		"Vehicles_CarTaxiArg_a");
		SetAnimationsConfig("StepVan_Nubasian",		"Vehicle_StepVan_a");

		SetAnimationsConfig("Vancmneta",		"Vehicles_Van_NoRandom_a");
		SetAnimationsConfig("PickUpTruckKelo",		"Vehicles_PickUpVan_NoRandom_a");
		SetAnimationsConfig("StepVanNubAsian",		"Vehicle_StepVan_NoRandom_a");
		SetAnimationsConfig("StepVanNumark",		"Vehicle_StepVan_NoRandom_a");
		SetAnimationsConfig("StepVanHoneyLove",		"Vehicle_StepVan_NoRandom_a");
	end
	if getActivatedMods():contains("MysteryMachineOGSN") then
		SetAnimationsConfig("VanMysterymachine",	"Vehicles_Van_a");
	end
	if getActivatedMods():contains("SaveOurStation_KnoxCountry") then
		SetAnimationsConfig("SWWS_PickUp",		"Vehicles_PickUpTruckLights_NoRandom_a");
		SetAnimationsConfig("SWWS_PickUpVan",		"Vehicles_PickUpVanLights_NoRandom_a");
		SetAnimationsConfig("SWWS_Radio",		"Vehicles_VanRadio_a");		
	end