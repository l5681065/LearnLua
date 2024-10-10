function TryToPrint(param)
    local result = assert(param, "非法的结果")
    print(result)
end


print("-------------------------------------")
TryToPrint(1)
TryToPrint(nil)
TryToPrint(false)
TryToPrint(true)
print("-------------------------------------")