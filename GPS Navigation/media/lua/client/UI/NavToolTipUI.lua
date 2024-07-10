local NavToolTipUI = {};
local tTip = nil;


function NavToolTipUI.init(x, y, width, height)
  tTip = ISToolTip:new();
  tTip:initialise();
  tTip:setOwner(self);
  tTip:setX(x);
  tTip:setY(y);
  tTip:setWidth(width);
  tTip:setHeight(height);
  tTip.descriptionPanel.maxLineWidth = 500;
  tTip.followMouse = false;
  --tTip:setTexture("media/textures/navicon.png");
  tTip:doLayout();
  --getCore():setOptionTooltipFont("Medium")
  tTip.descriptionPanel.marginLeft = 5;
  tTip.descriptionPanel.marginTop = 15;
  --tTip.borderColor = {r=204, g=255, b=204, a=1};
  tTip.backgroundColor = {r=0, g=0, b=0, a=0.3};
  --tTip:addToUIManager();
  return tTip
end

return NavToolTipUI
