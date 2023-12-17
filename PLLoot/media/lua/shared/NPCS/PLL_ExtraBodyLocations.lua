--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

-- Locations must be declared in render-order.
-- Location IDs must match BodyLocation= and CanBeEquipped= values in items.txt.
local group = BodyLocations.getGroup("Human")

group:getOrCreateLocation("Pupils")
group:getOrCreateLocation("Wig")

group:getOrCreateLocation("Belt419")
group:getOrCreateLocation("Belt420")
group:getOrCreateLocation("Belt421")
group:getOrCreateLocation("TorsoRig")
group:getOrCreateLocation("TorsoRig2")
group:getOrCreateLocation("waistbags")
group:getOrCreateLocation("waistbagsComplete")
group:getOrCreateLocation("waistbagsf")
group:getOrCreateLocation("Kneepads")
group:getOrCreateLocation("NeckPiece")
group:getOrCreateLocation("armbandas")

group:setExclusive("waistbags", "FannyPackBack")
group:setExclusive("waistbagsf", "FannyPackFront")

group:setExclusive("waistbagsComplete", "FannyPackBack")
group:setExclusive("waistbagsComplete", "FannyPackFront")
group:setHideModel("waistbagsComplete", "FannyPackFront")
--group:setHideModel("Billboard", "TorsoRig")
--group:getOrCreateLocation("Wig")

--group:setHideModel("Wig", "JacketHat")

--group:setExclusive("FullSuitHead", "Wig")
--group:setExclusive("FullHat", "Wig")

--group:setExclusive("JacketHat", "Wig")
--group:setExclusive("SweaterHat", "Wig")
