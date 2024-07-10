if not getActivatedMods():contains("BuildingMenu") then return; end

local BuildingMenu = require("BuildingMenu01_Main");
local CL = require("CL_Drying");

local function addClothesLinesToMenu()
    local clothesLineEndRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
            "Saw",
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = 4
            },
            {
                Material = "Base.Screws",
                Amount = 10
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Wire",
                Amount = 5
            },
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = 10
            }
        }
    };

    local clothesLineMiddleRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
        },
        useConsumable = {
            {
                Consumable = "Base.Wire",
                Amount = 5
            },
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = 10
            }
        }
    };

    local clothesLinesObjects = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_ClothesLines",
            "Tooltip_ClothesLines",
            BuildingMenu.onBuildWoodenContainer,
            clothesLineEndRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                blockAllTheSquare = false,
                canPassThrough = true,
                dismantable = true,
                isCorner = true,
                isHigh = true,
            },
            {
                sprite = "appliances_laundry_01_26",
                northSprite = "appliances_laundry_01_29",
                eastSprite = "appliances_laundry_01_27",
                southSprite = "appliances_laundry_01_28"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_ClothesLines",
            "Tooltip_ClothesLines",
            BuildingMenu.onBuildWoodenContainer,
            clothesLineMiddleRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                blockAllTheSquare = false,
                canPassThrough = true,
                dismantable = true,
                isCorner = true,
                isHigh = true,
            },
            {
                sprite = "appliances_laundry_01_31",
                northSprite = "appliances_laundry_01_30",
            }
        ),
    };
    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Appliances"),
        "",
        getText("IGUI_BuildingMenuSubCat_Appliances_Laundry"),
        "",
        clothesLinesObjects
    );
end
Events.OnGameStart.Add(addClothesLinesToMenu);


--- @param buildingObj ISBuildingObject
local function onBuildActionPerformed(buildingObj)
    if (buildingObj.sprite and CL.textureNames[buildingObj.sprite]) or (buildingObj.northSprite and CL.textureNames[buildingObj.northSprite]) or (buildingObj.eastSprite and CL.textureNames[buildingObj.eastSprite]) or (buildingObj.southSprite and CL.textureNames[buildingObj.southSprite]) then
        local obj = buildingObj.javaObject;
        if obj then CL.ClothesLinesInSquare[obj] = true; end
    end
end
Events.OnBuildActionPerformed.Add(onBuildActionPerformed)