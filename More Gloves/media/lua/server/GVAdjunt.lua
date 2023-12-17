function Adjust(Name, Property, Value)
local Item = ScriptManager.instance:getItem(Name)
Item:DoParam(Property.." = "..Value)
end

Adjust("Base.Gloves_LeatherGloves","BiteDefense","15")
Adjust("Base.Gloves_LeatherGloves","ScratchDefense","30")
Adjust("Base.Gloves_LeatherGloves","Insulation","0.20")
Adjust("Base.Gloves_LeatherGloves","WindResistance","0.45")

Adjust("Base.Gloves_LeatherGlovesBlack","BiteDefense","15")
Adjust("Base.Gloves_LeatherGlovesBlack","ScratchDefense","30")
Adjust("Base.Gloves_LeatherGlovesBlack","Insulation","0.20")
Adjust("Base.Gloves_LeatherGlovesBlack","WindResistance","0.45")

Adjust("Base.Gloves_Surgical","Insulation","0.10")
Adjust("Base.Gloves_Surgical","WindResistance","0.10")

Adjust("Base.Gloves_WhiteTINT","BiteDefense","0")
Adjust("Base.Gloves_WhiteTINT","ScratchDefense","10")
Adjust("Base.Gloves_WhiteTINT","Insulation","0.40")
Adjust("Base.Gloves_WhiteTINT","WindResistance","0.20")

Adjust("Base.Gloves_FingerlessGloves","ScratchDefense","5")
Adjust("Base.Gloves_FingerlessGloves","Insulation","0.20")
Adjust("Base.Gloves_FingerlessGloves","WindResistance","0.10")

Adjust("Base.Gloves_LongWomenGloves","Insulation","0.05")
Adjust("Base.Gloves_LongWomenGloves","WindResistance","0.10")