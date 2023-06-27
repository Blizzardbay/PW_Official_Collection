
require ("Coolbag_shared")


local upperLayer_render = ISToolTipInv.render

local function getCoolbagPocketConfig(itemObj)
    local pocketItem = itemObj
    local currentTime = getGameTime():getWorldAgeHours();--force update before updating tooltip
    Coolbag.UpdatePocket(pocketItem, currentTime);--update melting/freezing process if not already started
    local pocketModData = pocketItem:getModData();

    return pocketModData
end

function ISToolTipInv:drawIcePocketToolTip(text)
    local yoff = self:getHeight()-1
    local font = getCore():getOptionTooltipFont();
    local drawFont = UIFont.Medium;
    if font == "Large" then drawFont = UIFont.Large; elseif font == "Small" then drawFont = UIFont.Small; end;
    local height = getTextManager():getFontHeight(drawFont)
    local ttWidth = self:getWidth()
    local width = getTextManager():MeasureStringX(drawFont, text)
    if ttWidth < width then ttWidth = width end
    self:drawRect(0, yoff, ttWidth, height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
    self:drawRectBorder(0, yoff, ttWidth, height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    self:drawText(text, 5, yoff, 1, 1, 0.8, 1, drawFont);
end

function ISToolTipInv:render()
    if Coolbag.isTooltipOn() and (not ISContextMenu.instance or not ISContextMenu.instance.visibleCheck) then
        local itemObj = self.item;
        if itemObj and itemObj:getFullType() == "Base.IcePocket" then
            local pocketModData = getCoolbagPocketConfig(itemObj)
            
            if pocketModData == nil or pocketModData.freezingRatio == nil then
                self:drawIcePocketToolTip(getText("UI_Coolbag_TT_Bug"))
            elseif Coolbag.isFreezing(itemObj) then
                local hours = (1-pocketModData.freezingRatio)*Coolbag.getFreezingTime()
                local minutes = 0
                hours, minutes = math.modf(hours)
                minutes = minutes * 60
                minutes = math.modf(minutes)
                self:drawIcePocketToolTip(getText("UI_Coolbag_TT_FullFreezing",hours,minutes));
            else
                local hours = (pocketModData.freezingRatio)*Coolbag.getMeltingTime()
                local minutes = 0
                hours, minutes = math.modf(hours)
                minutes = minutes * 60
                minutes = math.modf(minutes)
                self:drawIcePocketToolTip(getText("UI_Coolbag_TT_Melting",hours,minutes));
            end
        end
        if itemObj and itemObj:getFullType() == "Base.WaterPocket" then
            local pocketModData = getCoolbagPocketConfig(itemObj)
            
            if pocketModData.freezingRatio == nil then
                self:drawIcePocketToolTip(getText("UI_Coolbag_TT_Bug"))
            elseif Coolbag.isFreezing(itemObj) then
                local hours = (1-pocketModData.freezingRatio)*Coolbag.getFreezingTime()
                local minutes = 0
                hours, minutes = math.modf(hours)
                minutes = minutes * 60
                minutes = math.modf(minutes)
                self:drawIcePocketToolTip(getText("UI_Coolbag_TT_Freezing",hours,minutes));
            else
                local hours = (pocketModData.freezingRatio)*Coolbag.getMeltingTime()
                local minutes = 0
                hours, minutes = math.modf(hours)
                minutes = minutes * 60
                minutes = math.modf(minutes)
                self:drawIcePocketToolTip(getText("UI_Coolbag_TT_FullMelting",hours,minutes));
            end
        end
    end
    return upperLayer_render(self);
end
