ModuleA = {}
ModuleA.mName = "ModuleA"
function ModuleA.Fun1()
    print("public func1")

end

local function Func2()
    print("private func2")
end

function ModuleA.Fun3()
    Func2()
end

return ModuleA