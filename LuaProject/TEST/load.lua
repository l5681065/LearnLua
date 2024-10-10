a = 100
local content = [[
    return a
]]
local func = load(content)
print(func())

local A = {}
function A:AFunc()
    local content = [[
        return function(self)
            return self.id > 100
        end
    ]]
    self.id = 1000
    local loadFunc = load(content) --load返回的是一个无参匿名方法
    local myFunc = loadFunc()      --执行load返回的方法，拿到content字符串里写的有参匿名方法
    local boolValue = myFunc(self) --执行有参匿名方法，传递self进去，返回boolean值(true)
    print(boolValue)
end
A:AFunc()