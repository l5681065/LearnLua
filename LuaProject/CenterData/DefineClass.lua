local function _copy(object,lookup_table)
    if type(object) ~= "table" then
        return object
    elseif lookup_table[object] then
        return lookup_table[object]
    end
    local new_table = {}
    lookup_table[object] = new_table
    for key, value in pairs(object) do
        new_table[_copy(key,lookup_table)] = _copy(key,lookup_table)
    end
    return setmetatable(new_table,getmetatable(object))
end


function clone(object)
    return _copy(object,{})
end

function class2(classname,super)
    local cls
    if type(super) == "function" or (super and super.__ctype == 1) then
        cls = {}
        for k, v in pairs(super or {}) do
            cls[k] = v
        end
        cls.__create = super.__create or super
        cls.super = super
        cls.ctor = function() end
        cls.__cname = classname
        cls.__ctype = 1

        function cls.New(...)
            local instance = cls.__create(...)
            for k, v in pairs(cls) do
                instance[k] = v
            end
            instance.class = cls
            instance:ctor(...)
            return instance
        end
        setmetatable(cls,{__call = cls.New})
    else
        cls = super and clone(super) or { ctor = function() end }  
        cls.super = super 
        cls.__cname = classname
        cls.__ctype = 2
        cls.__index = cls
        
        function cls.New(...)
            local instance = setmetatable({},cls)
            instance.class = cls
            instance:ctor(...)
            return instance
        end

        setmetatable(cls,{__call = cls.New})
    end
    return cls
end
                    
function getClassName(obj)
    local t = type(obj)
    if t == "table" then
        local mt = getmetatable(obj)
        while mt and not mt.__cname do
            mt = mt.super
        end
        return mt and mt.__cname or "unknown"
    end
    return t
end