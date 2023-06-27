-- original mod by abreu20011
-- author: rez
-- version: 1.3.1-r0.6.0 (2019-10-11)
-- based on: 40.43

initMod = {};
initMod.NAME_TRAIT = "foodexpiration";

local function initTraits()
	TraitFactory.addTrait(initMod.NAME_TRAIT, getText("UI_mod_fdxpr_trait_name"), 2, getText("UI_mod_fdxpr_trait_description"), false);
end

Events.OnGameBoot.Add(initTraits);
