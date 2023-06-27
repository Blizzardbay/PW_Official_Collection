MoreBrews = MoreBrews or {};

local sVars = SandboxVars.MoreBrews;
sVars.FermentChange = sVars.FermentChange or 10;
sVars.RottenChange = sVars.RottenChange or 10;

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
    
    local fermentFour = math.ceil((0.4 * sVars.FermentChange) * rotSpeed);
    local fermentFive = math.ceil((0.5 * sVars.FermentChange) * rotSpeed);
    local fermentSeven = math.ceil((0.7 * sVars.FermentChange) * rotSpeed);

    local rottenFourteen = math.ceil((1.4 * sVars.RottenChange) * rotSpeed);
    local rottenEighteen = math.ceil((1.8 * sVars.RottenChange) * rotSpeed);
    local rottenTwentyTwo = math.ceil((2.2 * sVars.RottenChange) * rotSpeed);

    local item1 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingAmericanLager")
    local item2 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingAPA1")
    local item3 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingAPA1DryHopped")
    local item4 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingAPA2")
    local item5 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingAPA2DryHopped")
    local item6 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingIPA1")
    local item7 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingIPA1DryHopped")
    local item8 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingIPA2")
    local item9 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingIPA2DryHopped")
    local item10 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingLightLager")
    local item11 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingPilsner")
    local item12 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingPorter")
    local item13 = ScriptManager.instance:getItem("MoreBrews.CarboyFermentingStout")
    local item14 = ScriptManager.instance:getItem("MoreBrews.CarboyAmericanLager")
    local item15 = ScriptManager.instance:getItem("MoreBrews.CarboyAPA1")
    local item16 = ScriptManager.instance:getItem("MoreBrews.CarboyAPA1DryHopped")
    local item17 = ScriptManager.instance:getItem("MoreBrews.CarboyAPA2")
    local item18 = ScriptManager.instance:getItem("MoreBrews.CarboyAPA2DryHopped")
    local item19 = ScriptManager.instance:getItem("MoreBrews.CarboyIPA1")
    local item20 = ScriptManager.instance:getItem("MoreBrews.CarboyIPA1DryHopped")
    local item21 = ScriptManager.instance:getItem("MoreBrews.CarboyIPA2")
    local item22 = ScriptManager.instance:getItem("MoreBrews.CarboyIPA2DryHopped")
    local item23 = ScriptManager.instance:getItem("MoreBrews.CarboyLightLager")
    local item24 = ScriptManager.instance:getItem("MoreBrews.CarboyPilsner")
    local item25 = ScriptManager.instance:getItem("MoreBrews.CarboyPorter")
    local item26 = ScriptManager.instance:getItem("MoreBrews.CarboyStout")

    if item1 then 
        item1:DoParam("DaysTotallyRotten = "  .. fermentSeven)
        item1:DoParam("DaysFresh = "  .. fermentSeven)
    end

    if item2 then
        item2:DoParam("DaysTotallyRotten = "  .. fermentSeven)
        item2:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item3 then
        item3:DoParam("DaysTotallyRotten = " .. fermentFour)
        item3:DoParam("DaysFresh = " .. fermentFour)
    end

    if item4 then
        item4:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item4:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item5 then
        item5:DoParam("DaysTotallyRotten = " .. fermentFour)
        item5:DoParam("DaysFresh = " .. fermentFour)
    end

    if item6 then
        item6:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item6:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item7 then
        item7:DoParam("DaysTotallyRotten = " .. fermentFour)
        item7:DoParam("DaysFresh = " .. fermentFour)
    end

    if item8 then
        item8:DoParam("DaysTotallyRotten = "  .. fermentSeven)
        item8:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item9 then
        item9:DoParam("DaysTotallyRotten = " .. fermentFive)
        item9:DoParam("DaysFresh = " .. fermentFive)
    end

    if item10 then
        item10:DoParam("DaysTotallyRotten = " .. fermentFive)
        item10:DoParam("DaysFresh = " .. fermentFive)
    end

    if item11 then
        item11:DoParam("DaysTotallyRotten = " .. fermentFive)
        item11:DoParam("DaysFresh = " .. fermentFive)
    end

    if item12 then
        item12:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item12:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item13 then
        item13:DoParam("DaysTotallyRotten = " .. fermentSeven)
        item13:DoParam("DaysFresh = " .. fermentSeven)
    end

    if item14 then 
        item14:DoParam("DaysTotallyRotten = "  .. rottenEighteen)
        item14:DoParam("DaysFresh = "  .. rottenEighteen)
    end

    if item15 then
        item15:DoParam("DaysTotallyRotten = "  .. rottenEighteen)
        item15:DoParam("DaysFresh = " .. rottenEighteen)
    end

    if item16 then
        item16:DoParam("DaysTotallyRotten = " .. rottenTwentyTwo)
        item16:DoParam("DaysFresh = " .. rottenTwentyTwo)
    end

    if item17 then
        item17:DoParam("DaysTotallyRotten = " .. rottenFourteen)
        item17:DoParam("DaysFresh = " .. rottenFourteen)
    end

    if item18 then
        item18:DoParam("DaysTotallyRotten = " .. rottenEighteen)
        item18:DoParam("DaysFresh = " .. rottenEighteen)
    end

    if item19 then
        item19:DoParam("DaysTotallyRotten = " .. rottenFourteen)
        item19:DoParam("DaysFresh = " .. rottenFourteen)
    end

    if item20 then
        item20:DoParam("DaysTotallyRotten = " .. rottenEighteen)
        item20:DoParam("DaysFresh = " .. rottenEighteen)
    end

    if item21 then
        item21:DoParam("DaysTotallyRotten = "  .. rottenEighteen)
        item21:DoParam("DaysFresh = " .. rottenEighteen)
    end

    if item22 then
        item22:DoParam("DaysTotallyRotten = " .. rottenTwentyTwo)
        item22:DoParam("DaysFresh = " .. rottenTwentyTwo)
    end

    if item23 then
        item23:DoParam("DaysTotallyRotten = " .. rottenFourteen)
        item23:DoParam("DaysFresh = " .. rottenFourteen)
    end

    if item24 then
        item24:DoParam("DaysTotallyRotten = " .. rottenFourteen)
        item24:DoParam("DaysFresh = " .. rottenFourteen)
    end

    if item25 then
        item25:DoParam("DaysTotallyRotten = " .. rottenEighteen)
        item25:DoParam("DaysFresh = " .. rottenEighteen)
    end

    if item26 then
        item26:DoParam("DaysTotallyRotten = " .. rottenEighteen)
        item26:DoParam("DaysFresh = " .. rottenEighteen)
    end
end);