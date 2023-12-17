JukeboxSound = {
	emitter = nil,
    	id = nil,
    	x = 0,
    	y = 0,
    	z = 0,
    	volume = 1,
    	volumeModifier = 0.1,
	sound3d = false,

	lightsource = nil,

	multiplayer = false,
	stop = false,
}

function JukeboxSound:new()
    	local o = {}
	setmetatable(o, self)
    	self.__index = self
	return o
end

function JukeboxSound:setEmitter(emitter)
    	self.emitter = emitter
end

function JukeboxSound:setPos(x,y,z)
    	self.x = x
    	self.y = y
    	self.z = z
    
    	if self.emitter then
        	self.emitter:setPos(x, y, z)
        	self.emitter:tick()
    	end
end

function JukeboxSound:setPosAtObject(device)
    	if not device then 
		return 
	end

    	self:setPos(device:getX(), device:getY(), device:getZ())
end

function JukeboxSound:setVolume(value)
    	if value == nil then 
		value = 1
	end

    	self.volume = value

   	if self.id then
        	self.emitter:setVolume(self.id, self.volume * self.volumeModifier)
        	self.emitter:tick()
   	end
end

function JukeboxSound:setVolumeModifier(value)
    	if value == nil then 
		value = 1
	end

    	self.volumeModifier = value

   	if self.id then
        	self:setVolume(self.volume)
    	end
end

function JukeboxSound:set3D(toggle)
    	if toggle == nil then 
		toggle = false
	end

	self.sound3d = toggle

    	if self.id then
        	self.emitter:set3D(self.id, toggle)
        	self.emitter:tick()
    	end
end

function JukeboxSound:setMultiplayer(toggle)
    	if toggle == nil then 
		toggle = false
	end

    	if toggle == false then
		self.multiplayer = false
	elseif toggle == true then
		self.multiplayer = true
    	end
end

function JukeboxSound:setStop(toggle)
    	if toggle == nil then 
		toggle = false
	end

    	if toggle == false then
		self.stop = false
	elseif toggle == true then
		self.stop = true
    	end
end

function JukeboxSound:stop()
    	if self.emitter and self.id then
        	self.emitter:stopSound(self.id)
    	end

    	self.id = nil
end

function JukeboxSound:isPlaying()
    	if not self.id then 
		return false 
	end
	return self.emitter and self.emitter:isPlaying(self.id)
end

function JukeboxSound:destroy()

end

function JukeboxSound:play(sound)
    	local foundEmitter = self.emitter

    	if foundEmitter then
		print("Already had an emitter")
        	self:stop()
    	elseif IsoWorld.instance:getFreeEmitter(self.x, self.y, self.z) then
		print("Found emitter already onsite")
		self.emitter = IsoWorld.instance:getFreeEmitter(self.x, self.y, self.z)
		self:stop()
	else
		print("Created a new emitter")
        	self.emitter = IsoWorld.instance:getFreeEmitter()
        	self.emitter:setPos(self.x, self.y, self.z)
    	end

    	local newSound = GameSounds.getSound(sound)
    	local newClip = newSound:getRandomClip()

	if self.multiplayer == true then
		self.stop = false
    		self.id = self.emitter:playSound(sound)
		print("Playing Sound")
	else
		self.stop = false
		self.id = self.emitter:playClip(newClip, nil)
		print("Playing Clip")
	end
    	self.emitter:setVolume(self.id, self.volume * self.volumeModifier)
    	self.emitter:set3D(self.id, false)
    	self.emitter:tick()
end
