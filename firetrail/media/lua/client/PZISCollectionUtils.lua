local collectionUtils = {};

local SetManager = {};
--SetManager.set = {}

function SetManager:add(key)	
    if self.set[key]==nil then self.size = self.size + 1 end;
	
    self.set[key] = true;
end

function SetManager:remove(key)
    if self.set[key] then self.size = self.size - 1 end;
    self.set[key] = nil;
end

function SetManager:contains(key)
    return self.set[key] ~= nil;
end

function SetManager:merge(otherSetManager)
    for k, _ in pairs(otherSetManager) do
        self.set:add(k);
    end
end

function SetManager:isEmpty()
	return self.size == 0
end

function SetManager:size()
    --local size = 0;
	--
    --for _ in pairs(self.set) do
    --    size = size + 1;
    --end

    return size;
end

function SetManager:getIterable()
	return self.set
end

function SetManager:new(list)
    list = list or {};
	
    local o = {}
    setmetatable(o, self)
    self.__index = self
	
	o.set = {}
	o.size = 0
    --local set = {};
    --setmetatable(set, self);
    --self.__index = self;

    for _, v in ipairs(list) do
        o.set[v] = true;
    end

    return o;
end

collectionUtils.Set = SetManager;

return collectionUtils;

