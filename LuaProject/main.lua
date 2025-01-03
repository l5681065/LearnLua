-- Define a class
local MyClass = {}
MyClass.__index = MyClass

-- Constructor
function MyClass:new(param1, param2)
    local instance = setmetatable({}, MyClass)
    instance.param1 = param1
    instance.param2 = param2
    return instance
end

-- Method
function MyClass:myMethod()
    print("Param1: " .. self.param1)
    print("Param2: " .. self.param2)
end

-- Create an instance of the class
local myInstance = MyClass:new("Hello", "World")
myInstance:myMethod()

return MyClass


