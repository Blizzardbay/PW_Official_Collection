local function OnFillContainerVFE(roomName, containerType, itemContainer)
	local containerItems = itemContainer:getItems()
    if containerItems then
        local shotgunsSpawned= {};
        for i = 0, containerItems:size()-1 do
            local item = containerItems:get(i);
            if item then
                if item:getFullType() == "Base.ShotgunSilent" then
                    table.insert(shotgunsSpawned, item)
                end
            end
        end
		if #shotgunsSpawned > 0 then
			local VFEShotgunSilent = ModData.getOrCreate("VFEShotgunSilent")
			if VFEShotgunSilent.hasSpawned then
				-- Remove new shotguns
				for k, itemToRemove in pairs(shotgunsSpawned) do
					itemContainer:Remove(itemToRemove)
				end
				-- Get and remove ammo
				local shotgunAmmoSpawned= {};
				for i = 0, containerItems:size()-1 do
					local item = containerItems:get(i);
					if item then
						if item:getFullType() == "Base.ShotgunShells" or item:getFullType() == "Base.ShotgunShellsBox" then
						table.insert(shotgunAmmoSpawned, item)
						end
					end
				end
				if #shotgunAmmoSpawned > 0 then
					for k, itemToRemove in pairs(shotgunAmmoSpawned) do
						itemContainer:Remove(itemToRemove)
					end
				end
			else
				-- Remove extra shotguns in the case more than one spawned, but don't worry about the ammo.
				if #shotgunsSpawned > 1 then
					table.remove(shotgunsSpawned, 1)
					for k, itemToRemove in pairs(shotgunsSpawned) do
						itemContainer:Remove(itemToRemove)
					end
				end
				VFEShotgunSilent.hasSpawned = true
				ModData.add("VFEShotgunSilent", VFEShotgunSilent)
			end
		end
    end
end

Events.OnFillContainer.Add(OnFillContainerVFE)