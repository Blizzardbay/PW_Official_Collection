
require "BuildingObjects/ISBuildingObject"

function ISMoveableCursor:getObjectList()
    local square = self.currentSquare;
    local objects = {};
    if not square then return objects end
    for i = square:getObjects():size(),1,-1 do
        local obj = square:getObjects():get(i-1);
        local moveProps = ISMoveableSpriteProps.new(obj:getSprite());
		local name = obj:getSprite():getName()		
		-- if not name:contains("WindowBars") then
			-- local add  = true;
		-- end
        if moveProps and moveProps.isMoveable and not name:contains("WindowBars") then
            local add  = true;

            --[[if instanceof(obj,"IsoBarbecue") and obj:isLit() then
                add = false;
            end--]]

            if add then
                table.insert(objects, { object = obj, moveProps = moveProps, isWall = false });
            end
        elseif moveProps and moveProps.spriteProps then
            if moveProps.spriteProps:Is("WallNW") or moveProps.spriteProps:Is("WallN") or moveProps.spriteProps:Is("WallW") then
                local sprList = obj:getChildSprites();
                if sprList then
                    local list_size 	= sprList:size();
                    if list_size > 0 then
                        for i=list_size-1, 0, -1 do
                            local sprite = sprList:get(i):getParentSprite();
                            local moveProps2 = ISMoveableSpriteProps.new( sprite );
                            if moveProps2.isMoveable and moveProps2.type == "WallOverlay" then
                                table.insert(objects, { object = obj, moveProps = moveProps2, isWall = true });
                            end
                        end
                    end
                end
            end
        end
    end
    return objects;
end


			-- local name = _moveProps:getName()		
			-- if not name:contains("WindowBars") then
				-- local add  = true;
			-- end