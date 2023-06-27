function UnRollPoster_OnCreate(items, result, player)
	local SpoonPosters = {
	"Base.SpoonPoster1",
	"Base.SpoonPoster2",
	"Base.SpoonPoster3",
	"Base.SpoonPoster4",
	"Base.SpoonPoster5",
	"Base.SpoonPoster6",
	"Base.SpoonPoster7",
	"Base.SpoonPoster8",
	"Base.SpoonPoster9",
	"Base.SpoonPoster10",
	"Base.SpoonPoster11",
	"Base.SpoonPoster12",
	"Base.SpoonPoster13",
	"Base.SpoonPoster14",
	"Base.SpoonPoster15",
	"Base.SpoonPoster16",
	"Base.SpoonPoster17",
	"Base.SpoonPoster18",
	"Base.SpoonPoster19",
	"Base.SpoonPoster20",
	"Base.SpoonPoster21",
	"Base.SpoonPoster22",
	"Base.SpoonPoster23",
	"Base.SpoonPoster24",
	"Base.SpoonPoster25",
	"Base.SpoonPoster26",
	"Base.SpoonPoster27",
	"Base.SpoonPoster28",
}
	player:getInventory():AddItem(SpoonPosters[ZombRand(#SpoonPosters)+1]);
end

function UnFoldFlag_OnCreate(items, result, player)
	local SpoonFlags = {
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag4",
	"Base.SpoonFlag5",
	"Base.SpoonFlag6",
	"Base.SpoonFlag7",
	"Base.SpoonFlag8",
	"Base.SpoonFlag9",
	"Base.SpoonFlag9",
	"Base.SpoonFlag9",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag11",
	"Base.SpoonFlag11",
	"Base.SpoonFlag11",
	"Base.SpoonFlag12",
	"Base.SpoonFlag13",
	"Base.SpoonFlag14",
	"Base.SpoonFlag1",
	"Base.SpoonFlag2",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag3",
	"Base.SpoonFlag4",
	"Base.SpoonFlag5",
	"Base.SpoonFlag6",
	"Base.SpoonFlag7",
	"Base.SpoonFlag8",
	"Base.SpoonFlag9",
	"Base.SpoonFlag9",
	"Base.SpoonFlag9",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag10",
	"Base.SpoonFlag11",
	"Base.SpoonFlag11",
	"Base.SpoonFlag11",
	"Base.SpoonFlag12",
	"Base.SpoonFlag13",
	"Base.SpoonFlag14",	
	"Base.SpoonFlag15",
	"Base.SpoonFlag16",
	"Base.SpoonFlag17",
	"Base.SpoonFlag18",
	"Base.SpoonFlag19",	
	"Base.SpoonFlag20",
	"Base.SpoonFlag21",
	"Base.SpoonFlag22",
	"Base.SpoonFlag23",
	"Base.SpoonFlag24",
	"Base.SpoonFlag25",
	"Base.SpoonFlag26",
	"Base.SpoonFlag27",
	"Base.SpoonFlag28",	
	"Base.SpoonFlag29",
	"Base.SpoonFlag30",
	"Base.SpoonFlag31",
	"Base.SpoonFlag32",
	"Base.SpoonFlag33",
	"Base.SpoonFlag34",
	"Base.SpoonFlag35",
	"Base.SpoonFlag36",
	"Base.SpoonFlag37",
	"Base.SpoonFlag38",
	"Base.SpoonFlag39",	
	"Base.SpoonFlag40",
	"Base.SpoonFlag41",
	"Base.SpoonFlag42",
	"Base.SpoonFlag43",
	"Base.SpoonFlag44",
	"Base.SpoonFlag45",
	"Base.SpoonFlag46",
	"Base.SpoonFlag47",
	"Base.SpoonFlag48",
}
	player:getInventory():AddItem(SpoonFlags[ZombRand(#SpoonFlags)+1]);
end

function CheckPic_OnCreate(items, result, player)
	local SpoonPics = {
	"Base.SpoonPic1",
	"Base.SpoonPic2",
	"Base.SpoonPic3",
	"Base.SpoonPic3",
	"Base.SpoonPic3",
	"Base.SpoonPic3",
	"Base.SpoonPic4",
	"Base.SpoonPic5",
	"Base.SpoonPic5",
	"Base.SpoonPic5",
	"Base.SpoonPic6",
	"Base.SpoonPic7",
	"Base.SpoonPic8",
	"Base.SpoonPic7",
	"Base.SpoonPic8",
	"Base.SpoonPic7",
	"Base.SpoonPic8",
	"Base.SpoonPic9",
	"Base.SpoonPic10",
	"Base.SpoonPic11",
	"Base.SpoonPic12",
	"Base.SpoonPic13",
	"Base.SpoonPic14",
	"Base.SpoonPic15",
	"Base.SpoonPic16",
	"Base.SpoonPic17",
	"Base.SpoonPic18",
	"Base.SpoonPic19",
	"Base.SpoonPic20",
	"Base.SpoonPic17",
	"Base.SpoonPic18",
	"Base.SpoonPic19",
	"Base.SpoonPic20",
	"Base.SpoonPic17",
	"Base.SpoonPic18",
	"Base.SpoonPic19",
	"Base.SpoonPic20",
	"Base.SpoonPic17",
	"Base.SpoonPic18",
	"Base.SpoonPic19",
	"Base.SpoonPic20",
	"Base.SpoonPic21",
	"Base.SpoonPic22",
	"Base.SpoonPic23",
	"Base.SpoonPic24",
	"Base.SpoonPic25",
	"Base.SpoonPic26",
	"Base.SpoonPic27",
	"Base.SpoonPic28",
	"Base.SpoonPic29",
	"Base.SpoonPic30",
	"Base.SpoonPic31",
	"Base.SpoonPic32",
	"Base.SpoonPic33",
	"Base.SpoonPic34",
	"Base.SpoonPic35",
	"Base.SpoonPic36",
	"Base.SpoonPic37",
	"Base.SpoonPic38",
	"Base.SpoonPic39",
	"Base.SpoonPic40",
}
	player:getInventory():AddItem(SpoonPics[ZombRand(#SpoonPics)+1]);
end

function SocetWire_OnCreate(items, result, player)
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("ElectricWire");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("ElectricWire");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("ElectricWire");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("Screws");
    end
end

function RipBedsheet_OnCreate(items, result, player)
	if ZombRand(3) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(3) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(3) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(3) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(3) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
	if ZombRand(5) == 0 then
        player:getInventory():AddItem("RippedSheetsDirty");
    end
end

function CheckCardboardBoxes_OnCreate(items, result, player)
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("ElectricWire");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Screws");
    end
	if ZombRand(50) == 0 then
        player:getInventory():AddItem("Antibiotics");
    end
	if ZombRand(25) == 0 then
        player:getInventory():AddItem("PillsVitamins");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Soap2");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Screwdriver");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Scissors");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Salt");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Sugar");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("DuctTape");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Glue");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Twine");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Paperclip");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Candle");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("WaterBottleFull");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("WaterBottleFull");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Matches");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Battery");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("ElectricWire");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Screws");
    end
	if ZombRand(50) == 0 then
        player:getInventory():AddItem("Antibiotics");
    end
	if ZombRand(25) == 0 then
        player:getInventory():AddItem("PillsVitamins");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Soap2");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Screwdriver");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Scissors");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Salt");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Sugar");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("DuctTape");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Glue");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Twine");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Paperclip");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Candle");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("WaterBottleFull");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("WaterBottleFull");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Matches");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("ElectronicsScrap");
    end
	if ZombRand(10) == 0 then
        player:getInventory():AddItem("Battery");
    end
	if ZombRand(50) == 0 then
        player:getInventory():AddItem("308Bullets");
    end
	if ZombRand(50) == 0 then
        player:getInventory():AddItem("308Bullets");
    end
	if ZombRand(50) == 0 then
        player:getInventory():AddItem("308Bullets");
    end
	if ZombRand(50) == 0 then
        player:getInventory():AddItem("ShotgunShells");
    end
	if ZombRand(50) == 0 then
        player:getInventory():AddItem("ShotgunShells");
    end
	if ZombRand(50) == 0 then
        player:getInventory():AddItem("ShotgunShells");
    end
	if ZombRand(100) == 0 then
        player:getInventory():AddItem("Revolver_Long");
    end
end