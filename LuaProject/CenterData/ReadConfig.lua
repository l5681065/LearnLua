Config = {
    S1 = "YOYO",
    Count = 2,
}
local Config_AllValue = {}
function Config_AllValue:__newindex(key,value)
    print(string.format("__newindex Key:%s,Value:%s",key,value))
    rawset(self,key,value)
end
function Config_AllValue:__index(key)
    print(string.format("__index Key:%s",key))
    return rawget(self,key)
end

setmetatable(Config_AllValue,Config_AllValue)

local C = Config;
Config.name = {C.S1,C.S1}
Config.season = {1,2}
Config.uiPos = {{1,2},{3,4}}
Config_IdToIndexMap ={
    [100100] = 1,
    [100101] = 2,
}


function Config:__index(id)
    local index = Config_IdToIndexMap[id]
    if not index then
        return nil
    end

    if Config_AllValue[id] then
       return  Config_AllValue[id]
    end
    Config_Value = {}
    Config_Value.__index = function(tab,field_name)
        if field_name == "ID" then
            return id
        end
        local fiedls = Config[field_name]
        if field_name == nil then 
            return nil
        end
        return fiedls[index]
    end
    setmetatable(Config_Value,Config_Value)
    Config_AllValue[id] = Config_Value
    return Config_Value
end
setmetatable(Config,Config)

local cfg = Config[100100]
local seaon1 = cfg.season

local cfg1 = Config[100101]
local season2 = cfg1.season