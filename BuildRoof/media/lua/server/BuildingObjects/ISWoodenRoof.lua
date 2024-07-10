--*****************************
--** based on ISWoodenFloor **
--*****************************

ISWoodenRoof = ISBuildingObject:derive("ISWoodenRoof");

--************************************************************************--
--** ISWoodenRoof:new
--**
--************************************************************************--
function ISWoodenRoof:create(x, y, z, north, sprite)
    self.sq = getCell():getGridSquare(x, y, z+1);
    if self.sq == nil then
        self.sq = IsoGridSquare.new(getCell(), nil, x, y, z+1);
        getCell():ConnectNewSquare(self.sq, false);
    end
    self.javaObject = self.sq:addFloor(sprite);
    buildUtil.consumeMaterial(self);

    for i=0,self.sq:getObjects():size()-1 do
        local object = self.sq:getObjects():get(i);
        if object:getProperties() and object:getProperties():Is(IsoFlagType.canBeRemoved) then
            self.sq:transmitRemoveItemFromSquare(object)
            self.sq:RemoveTileObject(object);
            break
        end
    end

    self.sq:disableErosion();
    local args = { x = self.sq:getX(), y = self.sq:getY(), z = self.sq:getZ()+1 }
    sendClientCommand('erosion', 'disableForSquare', args)
end

function ISWoodenRoof:new(sprite, northSprite)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);
    o.buildLow = true;
    o.floor = true;
    return o;
end

function ISWoodenRoof:isValid(square)
    if not self:haveMaterial(square) then return false end
    local below = getCell():getGridSquare(square:getX(), square:getY(), square:getZ())
    if below and below:HasStairs() then
        return false
    end
    for i = 0, square:getObjects():size() - 1 do
        local item = square:getObjects():get(i);
        if (item:getTextureName() and luautils.stringStarts(item:getTextureName(), "vegetation_farming")) or
                (item:getSpriteName() and luautils.stringStarts(item:getSpriteName(), "vegetation_farming")) then
            return false;
        end
    end
    return square:connectedWithFloor() and ISWoodenRoof.canStandRoof(square);
end

function ISWoodenRoof:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z+1, square)
end
function ISWoodenRoof.hasFloor(x,y,z)
    local square = getCell():getGridSquare(x,y,z);
    return square and square:Is(IsoFlagType.solidfloor)
end

function ISWoodenRoof.canStandRoof(square)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()
    local zRoof = z+1
    --print('ISWoodenRoof.canStandRoof ['..x..','..y..','..z..'] e='..tostring(square:getE() or nil)..'/'..tostring(square:getE() and square:getE():Is(IsoFlagType.WallW) or 'false'))
    local hasFast = square:Is(IsoFlagType.WallW) or square:Is(IsoFlagType.WallWTrans)
        or square:Is(IsoFlagType.WallN) or square:Is(IsoFlagType.WallNTrans)--Do not manage pillars. pillars are evil (because of WallSE flag for a WallNW sprite)
        or ISWoodenRoof.hasFloor(x-1,y,zRoof)
        or ISWoodenRoof.hasFloor(x+1,y,zRoof)
        or ISWoodenRoof.hasFloor(x,y-1,zRoof)
        or ISWoodenRoof.hasFloor(x,y+1,zRoof)
    if hasFast then return true end
    local eastSq = getCell():getGridSquare(x+1,y,z);
    if eastSq and (eastSq:Is(IsoFlagType.WallW) or eastSq:Is(IsoFlagType.WallWTrans))then return true end
    local southSq = getCell():getGridSquare(x,y+1,z);
    if southSq and (southSq:Is(IsoFlagType.WallN) or southSq:Is(IsoFlagType.WallNTrans)) then return true end

    return false
end

