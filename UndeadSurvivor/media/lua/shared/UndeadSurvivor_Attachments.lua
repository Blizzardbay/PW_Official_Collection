--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

-- Vilespring: This function adds a weapon to an attachment's list of vaid weapons without removing any.
local function attachmentAddToMountOn(attachment, addValues)
    local attachmentScript = ScriptManager.instance:getItem(attachment);

    if attachmentScript
    then
        local attachmentItem = InventoryItemFactory.CreateItem(attachment);
        local mountOptions = attachmentItem:getMountOn();
        local newList = {};

        for i, addValue in ipairs(type(addValues) ~= "table"
            and {
                addValues
            }
            or addValues
        )
        do
            if not mountOptions:contains(addValue) and InventoryItemFactory.CreateItem(addValue)
            then
                table.insert(newList, addValue);
            end
        end

        if #newList > 0
        then
            for i = 0, mountOptions:size() - 1
            do
                local weapon = mountOptions:get(i);

                if weapon and InventoryItemFactory.CreateItem(weapon)
                then
                    table.insert(newList, weapon);
                end
            end

            attachmentScript:DoParam("MountOn = " .. table.concat(newList, "; "));
        end
    end

    return attachmentScript;
end


-- Adds attachment positions on Items

local group = AttachedLocations.getGroup("Human")
group:getOrCreateLocation("PrepperKnife"):setAttachmentName("Prepper_Vest_Knife")
group:getOrCreateLocation("PrepperFlashlight"):setAttachmentName("Prepper_Vest_Flashlight")
group:getOrCreateLocation("PrepperHolster"):setAttachmentName("Prepper_Trousers_Pistol")
group:getOrCreateLocation("GunMagazine1"):setAttachmentName("Prepper_Vest_Mag1")
group:getOrCreateLocation("GunMagazine2"):setAttachmentName("Prepper_Vest_Mag2")
group:getOrCreateLocation("GunMagazine3"):setAttachmentName("Prepper_Vest_Mag3")
group:getOrCreateLocation("GunMagazine4"):setAttachmentName("Prepper_Vest_Mag4")
group:getOrCreateLocation("Bounty Letter"):setAttachmentName("bounty_letter")

-- Add Headhunter Scope model to Vanilla and FireamsB41 Weapons

local item = ScriptManager.instance:getItem("Base.VarmintRifle")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.HuntingRifle")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.AssaultRifle")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.AssaultRifle2")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.HuntingRifle_Sawn")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.Rugerm7722")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.M24Rifle")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.M1Garand")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.FN_FAL")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.M16A2")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.AR15")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.M60")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.AK47")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

-- Add Attachment Type to Vanilla and FirearmsB41 Magazines (For Prepper Vest)

local item = ScriptManager.instance:getItem("Base.9mmClip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.45Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.44Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.223Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.308Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.556Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.M14Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.Glock17Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.MP5Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.UZIMag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.AK_Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.M60Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.FN_FAL_Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.Mac10Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end


-- Add Vanilla and FirearmsB41 Attachments to Headhunter Rifle

local item = ScriptManager.instance:getItem("Base.308Silencer")    
if item then 
	attachmentAddToMountOn("Base.308Silencer", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.308Silencer", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.ImprovisedSilencer")    
if item then 
	attachmentAddToMountOn("Base.ImprovisedSilencer", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.ImprovisedSilencer", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Silencer_PopBottle")    
if item then 
	attachmentAddToMountOn("Base.Silencer_PopBottle", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.Silencer_PopBottle", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.RecoilPad")    
if item then 
	attachmentAddToMountOn("Base.RecoilPad", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.RecoilPad", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.ExtendedRecoilPad")    
if item then 
	attachmentAddToMountOn("Base.ExtendedRecoilPad", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.ExtendedRecoilPad", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Rifle_Bipod")    
if item then 
	attachmentAddToMountOn("Base.Rifle_Bipod", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.Rifle_Bipod", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Sling")
-- VFE uses a special system for its slings, so it's better to not add to it.
if item and not getActivatedMods():contains("VFExpansion1") then 
	attachmentAddToMountOn("Base.Sling", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.Sling", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Sling_Leather")    
if item then 
	attachmentAddToMountOn("Base.Sling_Leather", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.Sling_Leather", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Sling_Olive")    
if item then 
	attachmentAddToMountOn("Base.Sling_Olive", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.Sling_Olive", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Sling_Camo")    
if item then 
	attachmentAddToMountOn("Base.Sling_Camo", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.Sling_Camo", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.AmmoStraps")    
if item then 
	attachmentAddToMountOn("Base.AmmoStraps", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.AmmoStraps", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Laser")    
if item then 
	attachmentAddToMountOn("Base.Laser", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.Laser", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.IronSight")    
-- VFE uses a special system for its iron sights, so it's better to not add to it.
if item and not getActivatedMods():contains("VFExpansion1") then 
	attachmentAddToMountOn("Base.IronSight", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.IronSight", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.RedDot")    
if item then 
    attachmentAddToMountOn("Base.RedDot", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.RedDot", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.x2Scope")    
if item then 
	attachmentAddToMountOn("Base.x2Scope", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.x2Scope", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.x4Scope")    
if item then 
	attachmentAddToMountOn("Base.x4Scope", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.x4Scope", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.x8Scope")    
if item then 
	attachmentAddToMountOn("Base.x8Scope", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.x8Scope", "HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.x4-x12Scope")    
if item then 
	attachmentAddToMountOn("Base.x4-x12Scope", "DeadlyHeadhunterRifle")
	attachmentAddToMountOn("Base.x4-x12Scope", "HeadhunterRifle")
end


