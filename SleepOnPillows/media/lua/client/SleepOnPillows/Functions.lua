local self = {};

self.getCoords = function(source)
	return {x = math.floor(source:getX()), y = math.floor(source:getY()), z = math.floor(source:getZ())};
end

self.getLootSquares = function(x, y, z)
	local squares = {
		getSquare(x-1, y+1, z), getSquare(x, y+1, z), getSquare(x+1, y+1, z),
		getSquare(x-1, y, z), getSquare(x, y, z), getSquare(x+1, y, z),
		getSquare(x-1, y-1, z), getSquare(x, y-1, z), getSquare(x+1, y-1, z),
	};
	return squares
end

self.searchSurrounding = function(source, checkTarget)
	local sourceCoords = self.getCoords(source);
	local squares = self.getLootSquares(sourceCoords.x, sourceCoords.y, sourceCoords.z);

	for i in ipairs(squares) do
		local objects = squares[i]:getObjects();

		for j = 0, objects:size() - 1 do
			local object = objects:get(j);
            
			if instanceof(object, "IsoWorldInventoryObject") then
				local item = object:getItem();

				item:getModData().onGround = {x = object:getWorldPosX(), y = object:getWorldPosY(), z = object:getWorldPosZ()};

				if item:getFullType() == checkTarget then
                    			return true;
                		end
			end
		end
	end
	return false
end

return self