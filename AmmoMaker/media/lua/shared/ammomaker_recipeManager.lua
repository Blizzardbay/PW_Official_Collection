--Ammo Maker by STIMP_TM

local function ammoMakerRecipeManager()

    --disable base module recipes

    local RecipeNamesBaseDisable = {
        [1] = "Gather Gunpowder",
        [2] = "Scrap 5.7x28mm Ammunition",
        [3] = "Scrap 380-ACP Ammunition",
        [4] = "Scrap 9mm Ammunition",
        [5] = "Scrap 38-SPC Ammunition",
        [6] = "Scrap 357-MAG Ammunition",
        [7] = "Scrap 45-ACP Ammunition",
        [8] = "Scrap 45-LC Ammunition",
        [9] = "Scrap 44-MAG Ammunition",
        [10] = "Scrap 50-MAG Ammunition",
        [11] = "Scrap 45-70 GOV Ammunition",
        [12] = "Scrap 223-REM Ammunition",
        [13] = "Scrap 5.56x45mm Ammunition",
        [14] = "Scrap 5.45x39mm Ammunition",
        [15] = "Scrap 7.62x39mm Ammunition",
        [16] = "Scrap 308-WIN Ammunition",
        [17] = "Scrap 7.62x51mm Ammunition",
        [18] = "Scrap 7.62x54r Ammunition",
        [19] = "Scrap 30-06 SPG Ammunition",
        [20] = "Scrap 50-BMG Ammunition",
        [21] = "Scrap 410g Shotgun Shell",
        [22] = "Scrap 20g Shotgun Shell",
        [23] = "Scrap 12g Shotgun Shell",
        [24] = "Scrap 10g Shotgun Shell",
        [25] = "Scrap 4g Shotgun Shell",
        [26] = "Scrap Flare Round",
    };

    local function recipesBaseDisable()

        local recipes = getScriptManager():getAllRecipes();

        for i=0,recipes:size()-1 do

            local recipe = recipes:get(i);

            for _, RecipeNameBaseDisable in ipairs(RecipeNamesBaseDisable) do

                if recipe:getOriginalname() == RecipeNameBaseDisable then

                    recipe:setLuaTest("Recipe.OnTest.disabled");
                    recipe:setIsHidden(true);
                    recipe:setNeedToBeLearn(false);

                end

            end

        end

    end

    recipesBaseDisable();

    --set recipes 'is hidden'

    local function recipesSetIsHidden(RecipeNames, isHidden)

        for _, RecipeName in ipairs(RecipeNames) do
    
            local recipe = ScriptManager.instance:getRecipe(RecipeName);

            if recipe then

                recipe:setIsHidden(isHidden);

            end
                
        end
    
    end

    --charcoal

    if SandboxVars.ammomakerOptions.DeactivateCharcoalRecipes == true then

        local RecipeNamesCharcoalHide = {
            [1] = "ammomaker.Make Charcoal from Logs",
            [2] = "ammomaker.Make Charcoal from Branches",
        };

        recipesSetIsHidden(RecipeNamesCharcoalHide, true);

    end

    --archery

    if SandboxVars.ammomakerOptions.ActivateArchery == true then

        local RecipeNamesArcheryShow = {
            [1] = "ammomaker.Make Arrow Head [AM]",
            [2] = "ammomaker.Make Arrow Fletching [AM]",
            [3] = "ammomaker.Make Arrow Wooden [AM]",
            [4] = "ammomaker.Make Bolt Wooden [AM]",
            [5] = "ammomaker.Recycle Arrow Head [AM]",
            [6] = "ammomaker.Recycle Arrow Wooden [AM]",
            [7] = "ammomaker.Recycle Bolt Wooden [AM]",
        };

        recipesSetIsHidden(RecipeNamesArcheryShow, false);

    end

    --afr

    if getActivatedMods():contains("AdditonalFirearmsR") or getActivatedMods():contains("AdditonalFirearmsR rebalance") then

        local RecipeNamesAFRShow = {
            [1] = "ammomaker.Make 5.7x28 [AFR]",
            [2] = "ammomaker.Make 7.62x51 NATO [AFR]",
            [3] = "ammomaker.Recycle 5.7x28 [AFR]",
            [4] = "ammomaker.Recycle 7.62x51 NATO [AFR]",
        };
    
        recipesSetIsHidden(RecipeNamesAFRShow, false);

    end

    --agf

    if getActivatedMods():contains("Arsenal(26)GunFighter") or getActivatedMods():contains("Arsenal(26)GunFighter[MAIN MOD 2.0]") then

        local RecipeNamesAGFShow = {
            [1] = "ammomaker.Make .177 BB [AGF]",
            [2] = "ammomaker.Make 5.45x39 [AGF]",
            [3] = "ammomaker.Make 5.7x28 [AGF]",
            [4] = "ammomaker.Make .22 LR [AGF]",
            [5] = "ammomaker.Make 7.62x51 NATO [AGF]",
            [6] = "ammomaker.Make .30-06 Spring [AGF]",
            [7] = "ammomaker.Make 7.62x39 [AGF]",
            [8] = "ammomaker.Make 7.62x54 R [AGF]",
            [9] = "ammomaker.Make .380 ACP [AGF]",
            [10] = "ammomaker.Make .357 Mag [AGF]",
            [11] = "ammomaker.Make .410 G Buck 00 [AGF]",
            [12] = "ammomaker.Make .44 Mag [AGF]",
            [13] = "ammomaker.Make .45 LC [AGF]",
            [14] = "ammomaker.Make .45-70 Gov [AGF]",
            [15] = "ammomaker.Make .50 AE [AGF]",
            [16] = "ammomaker.Make .50 BMG [AGF]",
            [17] = "ammomaker.Make 20 G Buck 00 [AGF]",
            [18] = "ammomaker.Make .68 Paintballs [AGF]",
            [19] = "ammomaker.Make 10 G Buck 00 [AGF]",
            [20] = "ammomaker.Make 4 G Buck 00 [AGF]",
            [21] = "ammomaker.Make 40mm HE [AGF]",
            [22] = "ammomaker.Make 40mm INC [AGF]",
            [23] = "ammomaker.Make HE Rocket [AGF]",
            [24] = "ammomaker.Recycle .177 BB [AGF]",
            [25] = "ammomaker.Recycle 5.45x39 [AGF]",
            [26] = "ammomaker.Recycle 5.7x28 [AGF]",
            [27] = "ammomaker.Recycle .22 LR [AGF]",
            [28] = "ammomaker.Recycle 7.62x51 NATO [AGF]",
            [29] = "ammomaker.Recycle .30-06 Spring [AGF]",
            [30] = "ammomaker.Recycle 7.62x39 [AGF]",
            [31] = "ammomaker.Recycle 7.62x54 R [AGF]",
            [32] = "ammomaker.Recycle .380 ACP [AGF]",
            [33] = "ammomaker.Recycle .357 Mag [AGF]",
            [34] = "ammomaker.Recycle .410 G Buck 00 [AGF]",
            [35] = "ammomaker.Recycle .44 Mag [AGF]",
            [36] = "ammomaker.Recycle .45 LC [AGF]",
            [37] = "ammomaker.Recycle .45-70 Gov [AGF]",
            [38] = "ammomaker.Recycle .50 AE [AGF]",
            [39] = "ammomaker.Recycle .50 BMG [AGF]",
            [40] = "ammomaker.Recycle 20 G Buck 00 [AGF]",
            [41] = "ammomaker.Recycle 10 G Buck 00 [AGF]",
            [42] = "ammomaker.Recycle 4 G Buck 00 [AGF]",
            [43] = "ammomaker.Recycle 40mm HE [AGF]",
            [44] = "ammomaker.Recycle 40mm INC [AGF]",
            [45] = "ammomaker.Recycle HE Rocket [AGF]",
            [46] = "ammomaker.Make Parts Bottleneck L",
            [47] = "ammomaker.Make Parts Bottleneck M Rim",
            [48] = "ammomaker.Make Parts Straight L",
            [49] = "ammomaker.Make Parts Straight S Rim",
            [50] = "ammomaker.Make Parts Straight L Rim",
            [51] = "ammomaker.Make Hull Shotgun L",
            [52] = "ammomaker.Make Parts Grenade",
            [53] = "ammomaker.Make Arrow Head [AGF]",
            [54] = "ammomaker.Make Arrow Fletching [AGF]",
            [55] = "ammomaker.Make Arrow Shaft [AGF]",
            [56] = "ammomaker.Make Bolt Shaft [AGF]",
            [57] = "ammomaker.Recycle Parts Bottleneck L",
            [58] = "ammomaker.Recycle Parts Bottleneck M Rim",
            [59] = "ammomaker.Recycle Parts Straight L",
            [60] = "ammomaker.Recycle Parts Straight S Rim",
            [61] = "ammomaker.Recycle Parts Straight L Rim",
            [62] = "ammomaker.Recycle Hull Shotgun L",
            [63] = "ammomaker.Recycle Parts Grenade",
            [64] = "ammomaker.Recycle Arrow Head [AGF]",
            [65] = "ammomaker.Recycle Casing 22LR [AGF]",
            [66] = "ammomaker.Recycle Casing 5.7x28mm [AGF]",
            [67] = "ammomaker.Recycle Casing 380-ACP [AGF]",
            [68] = "ammomaker.Recycle Casing 9x19mm [AGF]",
            [69] = "ammomaker.Recycle Casing 38-SPC [AGF]",
            [70] = "ammomaker.Recycle Casing 357-Mag [AGF]",
            [71] = "ammomaker.Recycle Casing 45-ACP [AGF]",
            [72] = "ammomaker.Recycle Casing 45-LC [AGF]",
            [73] = "ammomaker.Recycle Casing 44-MAG [AGF]",
            [74] = "ammomaker.Recycle Casing 45-70 GOV [AGF]",
            [75] = "ammomaker.Recycle Casing 50-MAG [AGF]",
            [76] = "ammomaker.Recycle Casing 223-REM [AGF]",
            [77] = "ammomaker.Recycle Casing 5.56x45mm [AGF]",
            [78] = "ammomaker.Recycle Casing 5.45x39mm [AGF]",
            [79] = "ammomaker.Recycle Casing 7.62x39mm [AGF]",
            [80] = "ammomaker.Recycle Casing 308-WIN [AGF]",
            [81] = "ammomaker.Recycle Casing 7.62x51mm [AGF]",
            [82] = "ammomaker.Recycle Casing 7.62x54mm-R [AGF]",
            [83] = "ammomaker.Recycle Casing 30-06 SPG [AGF]",
            [84] = "ammomaker.Recycle Casing 50-BMG [AGF]",
            [85] = "ammomaker.Recycle Hull 410g [AGF]",
            [86] = "ammomaker.Recycle Hull 20g [AGF]",
            [87] = "ammomaker.Recycle Hull 12g [AGF]",
            [88] = "ammomaker.Recycle Hull 10g [AGF]",
            [89] = "ammomaker.Recycle Hull 4g [AGF]",
            [90] = "Base.Make 5.7x28mm Ammunition",
            [91] = "Base.Make 380-ACP Ammunition",
            [92] = "Base.Make 9mm Ammunition",
            [93] = "Base.Make 38-SPC Ammunition",
            [94] = "Base.Make 357-MAG Ammunition",
            [95] = "Base.Make 45-ACP Ammunition",
            [96] = "Base.Make 45-LC Ammunition",
            [97] = "Base.Make 44-MAG Ammunition",
            [98] = "Base.Make 50-MAG Ammunition",
            [99] = "Base.Make 45-70 GOV Ammunition",
            [100] = "Base.Make 223-REM Ammunition",
            [101] = "Base.Make 5.56x45mm Ammunition",
            [102] = "Base.Make 5.45x39mm Ammunition",
            [103] = "Base.Make 7.62x39mm Ammunition",
            [104] = "Base.Make 308-WIN Ammunition",
            [105] = "Base.Make 7.62x51mm Ammunition",
            [106] = "Base.Make 7.62x54mm-R Ammunition",
            [107] = "Base.Make 30-06 SPG Ammunition",
            [108] = "Base.Make 50-BMG Ammunition",
            [109] = "Base.Make 410g ShotShell",
            [110] = "Base.Make 20g ShotShell",
            [111] = "Base.Make 12g ShotShell",
            [112] = "Base.Make 10g ShotShell",
            [113] = "Base.Make 4g ShotShell",
        };

        recipesSetIsHidden(RecipeNamesAGFShow, false);

        if SandboxVars.ammomakerOptions.ActivateArchery == true then

            local RecipeNamesAGFArcheryShow = {
                [1] = "ammomaker.Make Arrow [AGF]",
                [2] = "ammomaker.Make Bolt [AGF]",
            };

            recipesSetIsHidden(RecipeNamesAGFArcheryShow, false);

        end

    end

    --agf2

    if getActivatedMods():contains("Arsenal(26)GunFighter[MAIN MOD 2.0]") then

        local RecipeNamesAGF2Show = {
            [1] = "ammomaker.Make 12 G Flare [AGF]",
            [2] = "ammomaker.Recycle 12 G Flare [AGF]",
        };

        recipesSetIsHidden(RecipeNamesAGF2Show, false);

    end

    --cj

    if getActivatedMods():contains("CaptainJuezo1") or getActivatedMods():contains("CaptainJuezo1_WIP") then

        local RecipeNamesCJShow = {
            [1] = "ammomaker.Make 5.45x39 [CJ]",
            [2] = "ammomaker.Make .22 LR [CJ]",
            [3] = "ammomaker.Make 7.62x51 NATO [CJ]",
            [4] = "ammomaker.Make 7.62x39 [CJ]",
            [5] = "ammomaker.Make 7.62x54 R [CJ]",
            [6] = "ammomaker.Make .357 Mag [CJ]",
            [7] = "ammomaker.Recycle 5.45x39 [CJ]",
            [8] = "ammomaker.Recycle .22 LR [CJ]",
            [9] = "ammomaker.Recycle 7.62x51 NATO [CJ]",
            [10] = "ammomaker.Recycle 7.62x39 [CJ]",
            [11] = "ammomaker.Recycle 7.62x54 R [CJ]",
            [12] = "ammomaker.Recycle .357 Mag [CJ]",
            [13] = "ammomaker.Make Parts Bottleneck M Rim",
            [14] = "ammomaker.Make Parts Straight S Rim",
            [15] = "ammomaker.Recycle Parts Bottleneck M Rim",
            [16] = "ammomaker.Recycle Parts Straight S Rim",
        };

        recipesSetIsHidden(RecipeNamesCJShow, false);

    end

    if getActivatedMods():contains("CaptainJuezo1_WIP") then

        local RecipeNamesCJWIPShow = {
            [1] = "ammomaker.Make 9x39 [CJ]",
            [2] = "ammomaker.Make .50 BMG [CJ]",
            [3] = "ammomaker.Recycle 9x39 [CJ]",
            [4] = "ammomaker.Recycle .50 BMG [CJ]",
            [5] = "ammomaker.Make Parts Bottleneck L",
            [6] = "ammomaker.Recycle Parts Bottleneck L",
            [7] = "ammomaker.Recycle Casing 9x19mm [CJ]",
        };

        recipesSetIsHidden(RecipeNamesCJWIPShow, false);

    end

    --fa

    if getActivatedMods():contains("firearmmod") then

        local RecipeNamesFAShow = {
            [1] = "ammomaker.Make .22 LR [FA]",
            [2] = "ammomaker.Make 7.62x51 NATO [FA]",
            [3] = "ammomaker.Make .30-06 Spring [FA]",
            [4] = "ammomaker.Make 7.62x39 [FA]",
            [5] = "ammomaker.Make .357 Mag [FA]",
            [6] = "ammomaker.Make .44-40 WCF [FA]",
            [7] = "ammomaker.Recycle .22 LR [FA]",
            [8] = "ammomaker.Recycle 7.62x51 NATO [FA]",
            [9] = "ammomaker.Recycle .30-06 Spring [FA]",
            [10] = "ammomaker.Recycle 7.62x39 [FA]",
            [11] = "ammomaker.Recycle .357 Mag [FA]",
            [12] = "ammomaker.Recycle .44-40 WCF [FA]",
            [13] = "ammomaker.Make Parts Straight S Rim",
            [14] = "ammomaker.Recycle Parts Straight S Rim",
        };

        recipesSetIsHidden(RecipeNamesFAShow, false);

    end

    --far

    if getActivatedMods():contains("firearmmodRevamp") then

        local RecipeNamesFARShow = {
            [1] = "ammomaker.Make .22 LR [FAR]",
            [2] = "ammomaker.Make 7.62x51 NATO [FAR]",
            [3] = "ammomaker.Make .30-06 Spring [FAR]",
            [4] = "ammomaker.Make 7.62x39 [FAR]",
            [5] = "ammomaker.Make .357 Mag [FAR]",
            [6] = "ammomaker.Make .44-40 WCF [FAR]",
            [7] = "ammomaker.Recycle .22 LR [FAR]",
            [8] = "ammomaker.Recycle 7.62x51 NATO [FAR]",
            [9] = "ammomaker.Recycle .30-06 Spring [FAR]",
            [10] = "ammomaker.Recycle 7.62x39 [FAR]",
            [11] = "ammomaker.Recycle .357 Mag [FAR]",
            [12] = "ammomaker.Recycle .44-40 WCF [FAR]",
            [13] = "ammomaker.Make Parts Straight S Rim",
            [14] = "ammomaker.Recycle Parts Straight S Rim",
        };
    
        recipesSetIsHidden(RecipeNamesFARShow, false);
    
    end

    --g93

    if getActivatedMods():contains("Guns93") then

        local RecipeNamesFAShow = {
            [1] = "ammomaker.Make .22 LR [G93]",
            [2] = "ammomaker.Make .25 ACP [G93]",
            [3] = "ammomaker.Make .30-30 Win [G93]",
            [4] = "ammomaker.Make .30 Carbine [G93]",
            [5] = "ammomaker.Make .30-06 Spring [G93]",
            [6] = "ammomaker.Make 7.62x39 [G93]",
            [7] = "ammomaker.Make 7.92x57 Maus [G93]",
            [8] = "ammomaker.Make .380 ACP [G93]",
            [9] = "ammomaker.Make .357 Mag [G93]",
            [10] = "ammomaker.Make 10mm Auto [G93]",
            [11] = "ammomaker.Make .40 S&W [G93]",
            [12] = "ammomaker.Make .45 LC [G93]",
            [13] = "ammomaker.Make 12 G Slug [G93]",
            [14] = "ammomaker.Recycle .22 LR [G93]",
            [15] = "ammomaker.Recycle .25 ACP [G93]",
            [16] = "ammomaker.Recycle .30-30 Win [G93]",
            [17] = "ammomaker.Recycle .30 Carbine [G93]",
            [18] = "ammomaker.Recycle .30-06 Spring [G93]",
            [19] = "ammomaker.Recycle 7.62x39 [G93]",
            [20] = "ammomaker.Recycle 7.92x57 Maus [G93]",
            [21] = "ammomaker.Recycle .380 ACP [G93]",
            [22] = "ammomaker.Recycle .357 Mag [G93]",
            [23] = "ammomaker.Recycle 10mm Auto [G93]",
            [24] = "ammomaker.Recycle .40 S&W [G93]",
            [25] = "ammomaker.Recycle .45 LC [G93]",
            [26] = "ammomaker.Recycle 12 G Slug [G93]",
            [27] = "ammomaker.Make Slug 12",
            [28] = "ammomaker.Make Parts Straight S Rim",
            [29] = "ammomaker.Recycle Slug 12",
            [30] = "ammomaker.Recycle Parts Straight S Rim",
        };

        recipesSetIsHidden(RecipeNamesFAShow, false);

    end

    --psa

    if getActivatedMods():contains("PRitemtest") then

        local RecipeNamesPSAShow = {
            [1] = "ammomaker.Make 5.45x39 [PSA]",
            [2] = "ammomaker.Make .22 LR [PSA]",
            [3] = "ammomaker.Make 7.62x25 Tok [PSA]",
            [4] = "ammomaker.Make 7.62x38 R Nag [PSA]",
            [5] = "ammomaker.Make 7.62x39 [PSA]",
            [6] = "ammomaker.Make 7.62x54 R [PSA]",
            [7] = "ammomaker.Make 9x39 [PSA]",
            [8] = "ammomaker.Make 9x18 Mak [PSA]",
            [9] = "ammomaker.Make 4 G Buck 00 [PSA]",
            [10] = "ammomaker.Recycle 5.45x39 [PSA]",
            [11] = "ammomaker.Recycle .22 LR [PSA]",
            [12] = "ammomaker.Recycle 7.62x25 Tok [PSA]",
            [13] = "ammomaker.Recycle 7.62x38 R Nag [PSA]",
            [14] = "ammomaker.Recycle 7.62x39 [PSA]",
            [15] = "ammomaker.Recycle 7.62x54 R [PSA]",
            [16] = "ammomaker.Recycle 9x39 [PSA]",
            [17] = "ammomaker.Recycle 9x18 Mak [PSA]",
            [18] = "ammomaker.Recycle 4 G Buck 00 [PSA]",
            [19] = "ammomaker.Make Parts Straight S Rim",
            [20] = "ammomaker.Make Hull Shotgun L",
            [21] = "ammomaker.Recycle Parts Straight S Rim",
            [22] = "ammomaker.Recycle Hull Shotgun L",
        };

        recipesSetIsHidden(RecipeNamesPSAShow, false);

    end

    --rfg

    if getActivatedMods():contains("RainsFirearmsandGunParts") or getActivatedMods():contains("RainsFirearmsandGunPartsApocalyPZe") then

        local RecipeNamesRFGShow = {
            [1] = "ammomaker.Make 7.62x51 NATO [RFG]",
            [2] = "ammomaker.Make 7.62x39 [RFG]",
            [3] = "ammomaker.Recycle 7.62x51 NATO [RFG]",
            [4] = "ammomaker.Recycle 7.62x39 [RFG]",
        };
        
        recipesSetIsHidden(RecipeNamesRFGShow, false);
        
    end

    --sg

    if getActivatedMods():contains("ScrapGuns(new version)") then

        local RecipeNamesSGShow = {
            [1] = "ammomaker.Recycle Salvaged Bullets [SG]",
            [2] = "ammomaker.Recycle Scrap Bullets [SG]",
            [3] = "ammomaker.Recycle Nail Bomb [SG]",
            [4] = "ammomaker.Recycle Glass Bomb [SG]",
            [5] = "ammomaker.Recycle Pipe Bomb [SG]",
            [6] = "ammomaker.Recycle Decoy [SG]",
            [7] = "SGuns.Make Salvaged Bullets",
            [8] = "SGuns.Make Scrap Bullets",
            [9] = "SGuns.Make Nail Bomb",
            [10] = "SGuns.Make Glass Bomb",
            [11] = "SGuns.Assemble Pipe Bomb",
            [12] = "SGuns.Make Decoy",
        };

        recipesSetIsHidden(RecipeNamesSGShow, false);

    end

    --sp

    if getActivatedMods():contains("Swatpack") then

        local RecipeNamesSPShow = {
            [1] = "ammomaker.Make 12 G Rubber [SP]",
            [2] = "ammomaker.Recycle 12 G Rubber [SP]",
            [3] = "ammomaker.Recycle Rubber"
        };

        recipesSetIsHidden(RecipeNamesSPShow, false);

    end

    --thc

    if getActivatedMods():contains("TIHFP") then

        local RecipeNamesTHCShow = {
            [1] = "ammomaker.Make .30 Carbine [TF]",
            [2] = "ammomaker.Make .30-06 Spring [TF]",
            [3] = "ammomaker.Make .303 British [TF]",
            [4] = "ammomaker.Make 9x18 Mak [TF]",
            [5] = "ammomaker.Recycle .30 Carbine [TF]",
            [6] = "ammomaker.Recycle .30-06 Spring [TF]",
            [7] = "ammomaker.Recycle .303 British [TF]",
            [8] = "ammomaker.Recycle 9x18 Mak [TF]",
            [9] = "ammomaker.Make Parts Bottleneck M Rim",
            [10] = "ammomaker.Recycle Parts Bottleneck M Rim",
        };

        recipesSetIsHidden(RecipeNamesTHCShow, false);

    end

    --thww2

    if getActivatedMods():contains("TIHFPWW2AF") then

        local RecipeNamesTHWW2Show = {
            [1] = "ammomaker.Make 6.5x50SR Aris [TF]",
            [2] = "ammomaker.Make 6.5x52 Carc [TF]",
            [3] = "ammomaker.Make 7.92x33 Kurz [TF]",
            [4] = "ammomaker.Make 7.92x57 Maus [TF]",
            [5] = "ammomaker.Make 9x25 Maus [TF]",
            [6] = "ammomaker.Recycle 6.5x50SR Aris [TF]",
            [7] = "ammomaker.Recycle 6.5x52 Carc [TF]",
            [8] = "ammomaker.Recycle 7.92x33 Kurz [TF]",
            [9] = "ammomaker.Recycle 7.92x57 Maus [TF]",
            [10] = "ammomaker.Recycle 9x25 Maus [TF]",
        };

        recipesSetIsHidden(RecipeNamesTHWW2Show, false);

    end

    --teb

    if getActivatedMods():contains("TEBFP") then

        local RecipeNamesTEBShow = {
            [1] = "ammomaker.Make 5.45x39 [TF]",
            [2] = "ammomaker.Make 7.62x54 R [TF]",
            [3] = "ammomaker.Make .32 ACP [TF]",
            [4] = "ammomaker.Recycle 5.45x39 [TF]",
            [5] = "ammomaker.Recycle 7.62x54 R [TF]",
            [6] = "ammomaker.Recycle .32 ACP [TF]",
        };

        recipesSetIsHidden(RecipeNamesTEBShow, false);

    end

    --vfe

    if getActivatedMods():contains("VFExpansion1") then

        local RecipeNamesVFEShow = {
            [1] = "ammomaker.Make .22 LR [VFE]",
            [2] = "ammomaker.Make 7.62x39 [VFE]",
            [3] = "ammomaker.Recycle .22 LR [VFE]",
            [4] = "ammomaker.Recycle 7.62x39 [VFE]",
            [5] = "ammomaker.Make Parts Straight S Rim",
            [6] = "ammomaker.Recycle Parts Straight S Rim",
        };

        recipesSetIsHidden(RecipeNamesVFEShow, false);

    end

    --vfe2

    if getActivatedMods():contains("VFExpansion2") then

        local RecipeNamesVFE2Show = {
            [1] = "ammomaker.Make 5.45x39 [VFE]",
            [2] = "ammomaker.Recycle 5.45x39 [VFE]",
        };

        recipesSetIsHidden(RecipeNamesVFE2Show, false);

    end

    --gwp

    if getActivatedMods():contains("GunrunnersWeaponPack") then

        local RecipeNamesGWPShow = {
            [1] = "ammomaker.Make .357 Mag [VFE]",
            [2] = "ammomaker.Recycle .357 Mag [VFE]",
        };

        recipesSetIsHidden(RecipeNamesGWPShow, false);

    end

end

Events.OnGameStart.Add(ammoMakerRecipeManager);