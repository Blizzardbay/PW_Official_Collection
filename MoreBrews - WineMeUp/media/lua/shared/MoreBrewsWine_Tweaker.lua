MoreBrews = MoreBrews or {};

local sVars = SandboxVars.MoreBrewsWineMeUp;
sVars.FermentChange = sVars.FermentChange or 10;

Events.OnGameStart.Add(function()
    local rotSpeed = 1;

    if SandboxVars.FoodRotSpeed == 1 then -- very fast
        rotSpeed = 1.7;
    elseif SandboxVars.FoodRotSpeed == 2 then -- fast
        rotSpeed = -1.4;
    elseif SandboxVars.FoodRotSpeed == 4 then -- slow
        rotSpeed = 0.7;
    elseif SandboxVars.FoodRotSpeed == 5 then -- very slow
        rotSpeed = 0.4;    
    end
    --this is to keep the fermenting time close to the intended length of days no matter the in game settings selected
    

    local fermentSeven = math.ceil((0.7 * sVars.FermentChange) * rotSpeed);
    local fermentEight = math.ceil((0.8 * sVars.FermentChange) * rotSpeed);
    local fermentTen = math.ceil((1.0 * sVars.FermentChange) * rotSpeed);
    local fermentTwelve = math.ceil((1.2 * sVars.FermentChange) * rotSpeed);
    local fermentSixteen = math.ceil((1.6 * sVars.FermentChange) * rotSpeed);

    local item1 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingRedWine")
    local item2 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingWhiteWine")
    local item3 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingWildBerryWine")
    local item4 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingRosehipWine")
    local item5 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingPineappleWine")
    local item6 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingStrawberryWine")
    local item7 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingPeachWine")
    local item8 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingPearWine")
    local item9 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingBananaWine")
    local item10 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingHoneyMead")
    local item11 = ScriptManager.instance:getItem("MoreBrews.GallonCarboyFermentingHardCider")
    local item12 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingRedWine")
    local item13 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingWhiteWine")
    local item14 = ScriptManager.instance:getItem("MoreBrews.BarrelRedWineAging")
    local item15 = ScriptManager.instance:getItem("MoreBrews.BarrelRedWineAgingFully")
    local item16 = ScriptManager.instance:getItem("MoreBrews.BarrelWhiteWineAging")
    local item17 = ScriptManager.instance:getItem("MoreBrews.BarrelWhiteWineAgingFully")
    local item18 = ScriptManager.instance:getItem("MoreBrews.BarrelRedWineAgingSmall")
    local item19 = ScriptManager.instance:getItem("MoreBrews.BarrelRedWineAgingFullySmall")
    local item20 = ScriptManager.instance:getItem("MoreBrews.BarrelWhiteWineAgingSmall")
    local item21 = ScriptManager.instance:getItem("MoreBrews.BarrelWhiteWineAgingFullySmall")
    local item22 = ScriptManager.instance:getItem("MoreBrews.FruitYeastStarter")
    local item23 = ScriptManager.instance:getItem("MoreBrews.PotatoYeastStarter")
    local item24 = ScriptManager.instance:getItem("MoreBrews.WildPlantsYeastStarter")

    if item1 then 
        item1:DoParam("DaysTotallyRotten = "  .. fermentTwelve)
        item1:DoParam("DaysFresh = "  .. fermentTwelve)
    end

    if item2 then
        item2:DoParam("DaysTotallyRotten = "  .. fermentTen)
        item2:DoParam("DaysFresh = " .. fermentTen)
    end

    if item3 then
        item3:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item3:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item4 then
        item4:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item4:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item5 then
        item5:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item5:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item6 then
        item6:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item6:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item7 then
        item7:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item7:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item8 then
        item8:DoParam("DaysTotallyRotten = "  .. fermentSeven)
        item8:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item9 then
        item9:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item9:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item10 then
        item10:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item10:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item11 then
        item11:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item11:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item12 then
        item12:DoParam("DaysTotallyRotten = " .. fermentTwelve)
        item12:DoParam("DaysFresh = " .. fermentTwelve)
    end

    if item13 then
        item13:DoParam("DaysTotallyRotten = " .. fermentTen)
        item13:DoParam("DaysFresh = " .. fermentTen)
    end

    if item14 then 
        item14:DoParam("DaysTotallyRotten = "  .. fermentTen)
        item14:DoParam("DaysFresh = "  .. fermentTen)
    end

    if item15 then
        item15:DoParam("DaysTotallyRotten = "  .. fermentSixteen)
        item15:DoParam("DaysFresh = " .. fermentSixteen)
    end

    if item16 then
        item16:DoParam("DaysTotallyRotten = " .. fermentEight)
        item16:DoParam("DaysFresh = " .. fermentEight)
    end

    if item17 then
        item17:DoParam("DaysTotallyRotten = " .. fermentTwelve)
        item17:DoParam("DaysFresh = " .. fermentTwelve)
    end

    if item18 then
        item18:DoParam("DaysTotallyRotten = " .. fermentTen)
        item18:DoParam("DaysFresh = " .. fermentTen)
    end

    if item19 then
        item19:DoParam("DaysTotallyRotten = " .. fermentSixteen)
        item19:DoParam("DaysFresh = " .. fermentSixteen)
    end

    if item20 then
        item20:DoParam("DaysTotallyRotten = " .. fermentEight)
        item20:DoParam("DaysFresh = " .. fermentEight)
    end

    if item21 then
        item21:DoParam("DaysTotallyRotten = "  .. fermentTwelve)
        item21:DoParam("DaysFresh = " .. fermentTwelve)
    end

    if item22 then
        item22:DoParam("DaysTotallyRotten = " .. fermentTen)
        item22:DoParam("DaysFresh = " .. fermentTen)
    end

    if item23 then
        item23:DoParam("DaysTotallyRotten = " .. fermentTen)
        item23:DoParam("DaysFresh = " .. fermentTen)
    end

    if item24 then
        item24:DoParam("DaysTotallyRotten = " .. fermentTen)
        item24:DoParam("DaysFresh = " .. fermentTen)
    end
end);