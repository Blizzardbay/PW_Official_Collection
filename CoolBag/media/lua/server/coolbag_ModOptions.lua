require "coolbag"

-- Connecting the options to the menu, so user can change them.
if ModOptions and ModOptions.getInstance then
  local settings = ModOptions:getInstance(Coolbag.OPTIONS, "CoolBag", "Coolbag")

  ModOptions:loadFile();

  local optVerbose    = settings:getData("Verbose");
  local optCoolMode   = settings:getData("Mode")
  optCoolMode.name      = "UI_Coolbag_CoolMode";
  optVerbose.name       = "UI_Verbose";
  optCoolMode.tooltip   = "UI_Coolbag_Tooltip_CoolMode";
  optVerbose.tooltip    = "UI_Tooltip_Verbose";

  
  optCoolMode[1] = getText("UI_Coolbag_ModeDropDown_1")
  optCoolMode[2] = getText("UI_Coolbag_ModeDropDown_2")
  --optCoolMode[3] = getText("UI_Coolbag_ModeDropDown_3")

end
