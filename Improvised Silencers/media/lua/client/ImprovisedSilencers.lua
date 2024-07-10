-- Silencer.modName = "Silencer";
-- Silencer.version = "1.0";
-- Silencer.author = "Nolan";
-- Unofficial fixed version made by 00912

local silencedVolumeValue = 0.3
local silencedSoundRadius = 0.2
local metalPipeSilencedVolumeValue = 0.5
local metalPipeSilencedSoundRadius = 0.4
local torchSilencedVolumeValue = 0.7
local torchSilencedSoundRadius = 0.6
local waterBottleSilencedVolumeValue = 0.8
local waterBottleSilencedSoundRadius = 0.8
local silencedSwingSound = 'silenced_shot'
local craftedSilencedSwingSound = 'crafted_silenced_shot'
local metalSilencedSwingSound = 'metal_silenced_shot'

--for singleplayer trading 
if(ItemValueTable == nil) then ItemValueTable = {}; end
ItemValueTable["ImprovisedSilencers.Silencer"] = 6.00;
ItemValueTable["ImprovisedSilencers.MetalPipeSilencer"] = 4.00;
ItemValueTable["ImprovisedSilencers.TorchSilencer"] = 2.00;
ItemValueTable["ImprovisedSilencers.WaterBottleSilencer"] = 1.00;

-- hook function for silencer handling
local silencerOnEquipPrimary = function(character, inventoryItem)
	if inventoryItem ~= nil then
		local scriptItem = inventoryItem:getScriptItem()
		local ssv = scriptItem:getSoundVolume()
		local ssr = scriptItem:getSoundRadius()
		if inventoryItem:getStringItemType() == "RangedWeapon" then 
			if inventoryItem:getCanon() then
				local canonName = inventoryItem:getCanon():getFullType()	-- minor change to improve compatibility
				if canonName  == "ImprovisedSilencers.Silencer" then		-- as long as no other mod has module named Silencer *and* has item called Silencer and HMSilencer
					inventoryItem:setSoundVolume(silencedVolumeValue*ssv)   -- then we got good compatibility
					inventoryItem:setSoundRadius(silencedSoundRadius*ssr)	-- there's still room to improve
					inventoryItem:setSwingSound(silencedSwingSound)			-- like having an item GUID then methods/functions to test GUID
					return
				elseif canonName == "ImprovisedSilencers.MetalPipeSilencer" then
					inventoryItem:setSoundVolume(metalPipeSilencedVolumeValue*ssv)
					inventoryItem:setSoundRadius(metalPipeSilencedSoundRadius*ssr)
					inventoryItem:setSwingSound(silencedSwingSound)
					return
				elseif canonName == "ImprovisedSilencers.TorchSilencer" then
					inventoryItem:setSoundVolume(torchSilencedVolumeValue*ssv)
					inventoryItem:setSoundRadius(torchSilencedSoundRadius*ssr)
					inventoryItem:setSwingSound(craftedSilencedSwingSound)
					return
                elseif canonName == "ImprovisedSilencers.WaterBottleSilencer" then
					inventoryItem:setSoundVolume(waterBottleSilencedVolumeValue*ssv)
					inventoryItem:setSoundRadius(waterBottleSilencedSoundRadius*ssr)
					inventoryItem:setSwingSound(craftedSilencedSwingSound)
					return
				end
			end
			if SUFVsilencerWeaponTable[scriptItem:getFullName()] ~= nil then -- this new unmount silencer code should compatible with any other mods now
				inventoryItem:setSoundVolume(ssv)							 -- but might have potential problem with mods that
				inventoryItem:setSoundRadius(ssr)							 -- modify vanilla weapons
				inventoryItem:setSwingSound(scriptItem:getSwingSound())
			end
		end
	end
end

Events.OnEquipPrimary.Add(silencerOnEquipPrimary)

Events.OnGameStart.Add(function()											 -- make sure our player is setup on game start
	local player = getPlayer()
	silencerOnEquipPrimary(player, player:getPrimaryHandItem())
end)