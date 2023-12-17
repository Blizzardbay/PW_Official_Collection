require "JukeboxSound/JukeboxSound"

Jukeboxes = {}
Jukeboxes.soundCache = {}
Jukeboxes.cacheSize = 10			

function Jukeboxes.PlaySound(device, soundFile)
    	local sound = JukeboxSound:new()

    	sound:setPosAtObject(device)
    	sound:setVolumeModifier(0.1)
    	sound:setVolume(device:getModData()['Volume'])
	sound:set3D(false)
	--sound:setMultiplayer(true)
	if device:getModData()['MP Mode'] == true then
		sound:setMultiplayer(true)
		print("MP Mode is true at play")
	else
		sound:setMultiplayer(false)
		print("MP Mode is false at play")
	end
    	sound:play(soundFile)


    	t = t or {}
    	t.device = device
    	t.sound = sound

    	tickCounter2 = 200

    	table.insert(Jukeboxes.soundCache, 1, t)
    		if #Jukeboxes.soundCache>Jukeboxes.cacheSize then
        		for i=Jukeboxes.cacheSize+1,#Jukeboxes.soundCache do
            			table.remove(Jukeboxes.soundCache,i)
        		end
   		end
    	return t
end

local maxRange = 75
local actualRange = 75
local distanceToJukebox = 0

local volumeModifier = 0
local finalVolume = 0

local tickCounter1 = 0
local tickCounter2 = 0

function Jukeboxes.adjustSounds()
    	if tickCounter2 < 1000 then 
        	tickCounter2=tickCounter2+1
    	else
		local TMJJukeboxAttractZombies = SandboxVars.TrueMusicJukebox.TMJJukeboxAttractZombies;
		if TMJJukeboxAttractZombies then
	       		for _,t in ipairs(Jukeboxes.soundCache) do
        		    	if Jukeboxes.isPlaying(t) then
                			actualRange = t.device:getModData()['Volume'] * t.sound.volumeModifier * maxRange
					if t.device:getModData()['FrontSquare'] ~= nil then
                				addSound(t.device, t.device:getModData()['FrontSquare']:getX(), t.device:getModData()['FrontSquare']:getY(), t.device:getModData()['FrontSquare']:getZ(), actualRange, t.device:getModData()['Volume'] * t.sound.volumeModifier)
					else
						addSound(t.device, t.device:getX(), t.device:getY(), t.device:getZ(), actualRange, t.device:getModData()['Volume'] * t.sound.volumeModifier)
					end
            			end
        		end
		end
        	tickCounter2 = 0
    	end

    	if tickCounter1 < 5 then 
		tickCounter1=tickCounter1+1 
		return 
	end

   	tickCounter1 = 0

    	highestVolume = 0

    	for _,t in ipairs(Jukeboxes.soundCache) do        
        	if t.sound and t.sound:isPlaying() then
            		t.sound:setPosAtObject(t.device)
            		Jukeboxes.updateVolume(t)
			if t.sound.stop == true then
				t.sound.emitter:stopSound(t.sound.id)
			end
			if t.device:getItemContainer():getItems():size() == 0 then
				t.sound.emitter:stopSound(t.sound.id)
			end
        	end

		if t.device:getModData()['IsOn'] == true then
			if not ((SandboxVars.AllowExteriorGenerator and t.device:getSquare():haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier and t.device:getSquare():isOutside() == false)) then
				t.device:getModData()['IsOn'] = false
				t.device:transmitModData()
				t.sound.emitter:stopSound(t.sound.id)
			end
			if t.device:getModData()['Skip'] == true then
				t.device:getModData()['Skip'] = false
				t.device:transmitModData()
				t.sound.emitter:stopSound(t.sound.id)
			end
		elseif t.device:getModData()['IsOn'] == false then
			t.sound.emitter:stopSound(t.sound.id)
		end

		local JukeboxItems = t.device:getItemContainer():getItems()
		local JukeboxMusicItem = nil

		for i=0, JukeboxItems:size()-1 do
			local item = JukeboxItems:get(i)

			if t.device:getModData()['CurrentSong'] == item:getType() then
				JukeboxMusicItem = item
			end
		end
		
		if not JukeboxMusicItem then
			t.sound.emitter:stopSound(t.sound.id)
		end

        	if Jukeboxes.isPlaying(t) then
                	distanceToJukebox = IsoUtils.DistanceManhatten(t.device:getX(), t.device:getY(), getPlayer():getX(), getPlayer():getY())
			actualRange = t.device:getModData()['Volume'] * t.sound.volumeModifier * maxRange
                    	volumeModifier = (actualRange - distanceToJukebox) / actualRange
                    	if volumeModifier < 0 then 
				volumeModifier = 0 
			end
                   	t.sound:setVolume(t.device:getModData()['Volume'] * volumeModifier)
                    	finalVolume = t.device:getModData()['Volume'] * t.sound.volumeModifier * volumeModifier
                    	if finalVolume > highestVolume then 
				highestVolume = finalVolume 
			end
		elseif t.device:getModData()['NextSong'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['NextSong'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['NextSong']
			t.device:getModData()['NextSong'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist1'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist1'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist1']
			t.device:getModData()['Playlist1'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist2'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist2'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist2']
			t.device:getModData()['Playlist2'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist3'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist3'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist3']
			t.device:getModData()['Playlist3'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist4'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist4'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist4']
			t.device:getModData()['Playlist4'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist5'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist5'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist5']
			t.device:getModData()['Playlist5'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist6'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist6'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist6']
			t.device:getModData()['Playlist6'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist7'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist7'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist7']
			t.device:getModData()['Playlist7'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist8'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist8'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist8']
			t.device:getModData()['Playlist8'] = nil 
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist9'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist9'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist9']
			t.device:getModData()['Playlist9'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist10'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist10'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist10']
			t.device:getModData()['Playlist10'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist11'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist11'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist11']
			t.device:getModData()['Playlist11'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist12'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist12'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist12']
			t.device:getModData()['Playlist12'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist13'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist13'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist13']
			t.device:getModData()['Playlist13'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist14'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist14'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist14']
			t.device:getModData()['Playlist14'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist15'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist15'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist15']
			t.device:getModData()['Playlist15'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist16'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist16'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist16']
			t.device:getModData()['Playlist16'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist17'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist17'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist17']
			t.device:getModData()['Playlist17'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist18'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist18'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist18']
			t.device:getModData()['Playlist18'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist19'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist19'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist19']
			t.device:getModData()['Playlist19'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist20'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist20'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist20']
			t.device:getModData()['Playlist20'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist21'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist21'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist21']
			t.device:getModData()['Playlist21'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist22'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist22'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist22']
			t.device:getModData()['Playlist22'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist23'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist23'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist23']
			t.device:getModData()['Playlist23'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist24'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist24'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist24']
			t.device:getModData()['Playlist24'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist25'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist25'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist25']
			t.device:getModData()['Playlist25'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist26'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist26'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist26']
			t.device:getModData()['Playlist26'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist27'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist27'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist27']
			t.device:getModData()['Playlist27'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist28'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist28'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist28']
			t.device:getModData()['Playlist28'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist29'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist29'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist29']
			t.device:getModData()['Playlist29'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist30'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist30'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist30']
			t.device:getModData()['Playlist30'] = nil
		elseif t.device:getModData()['Playlist31'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist31'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist31']
			t.device:getModData()['Playlist31'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist32'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist32'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist32']
			t.device:getModData()['Playlist32'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist33'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist33'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist33']
			t.device:getModData()['Playlist33'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist34'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist34'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist34']
			t.device:getModData()['Playlist34'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist35'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist35'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist35']
			t.device:getModData()['Playlist35'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist36'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist36'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist36']
			t.device:getModData()['Playlist36'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist37'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist37'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist37']
			t.device:getModData()['Playlist37'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist38'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist38'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist38']
			t.device:getModData()['Playlist38'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist39'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist39'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist39']
			t.device:getModData()['Playlist39'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist40'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist40'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist40']
			t.device:getModData()['Playlist40'] = nil
		elseif t.device:getModData()['Playlist41'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist41'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist41']
			t.device:getModData()['Playlist41'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist42'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist42'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist42']
			t.device:getModData()['Playlist42'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist43'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist43'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist43']
			t.device:getModData()['Playlist43'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist44'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist44'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist44']
			t.device:getModData()['Playlist44'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist45'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist45'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist45']
			t.device:getModData()['Playlist45'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist46'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist46'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist46']
			t.device:getModData()['Playlist46'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist47'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist47'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist47']
			t.device:getModData()['Playlist47'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist48'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist48'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist48']
			t.device:getModData()['Playlist48'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist49'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist49'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist49']
			t.device:getModData()['Playlist49'] = nil
			t.device:transmitModData()
		elseif t.device:getModData()['Playlist50'] ~= nil and t.device:getModData()['IsOn'] == true and t.sound.stop == false then
			Jukeboxes.PlaySound(t.device, t.device:getModData()['Playlist50'])
			t.device:getModData()['LastSong'] = t.device:getModData()['CurrentSong']
			t.device:getModData()['CurrentSong'] = t.device:getModData()['Playlist50']
			t.device:getModData()['Playlist50'] = nil
		else
			t.device:getModData()['Playing'] = false
			t.device:transmitModData()
        	end
    	end

    	local optionsVolume = getCore():getOptionMusicVolume()/10
    	local optionsVolumeModified = optionsVolume - optionsVolume*highestVolume*10

    	if optionsVolumeModified < 0 then 
		optionsVolumeModified = 0 
	end

    	getSoundManager():setMusicVolume(optionsVolumeModified)
end

Events.OnTick.Add(Jukeboxes.adjustSounds)


function Jukeboxes.OnMainMenuEnter()
    getSoundManager():setMusicVolume(getCore():getOptionMusicVolume()/10)
end

Events.OnMainMenuEnter.Add( Jukeboxes.OnMainMenuEnter )

function Jukeboxes.updateVolume(t)
        t.sound:setVolume(t.device:getModData()['Volume'])
end

function Jukeboxes.isPlaying(t)
    	if t.sound and t.sound:isPlaying() then 
		t.device:getModData()['Playing'] = true
		t.device:transmitModData()	
		return true 
	else
		t.device:getModData()['Playing'] = false
		t.device:transmitModData()	
		return false
	end
end