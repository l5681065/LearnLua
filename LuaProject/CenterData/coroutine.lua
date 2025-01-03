function foo()
    print("coroutine foo beginExecute")
    local value,value1= coroutine.yield("pause execute foo ")
    print("coroutine foo recover execute,value: " .. tostring(value)..",value1: "..tostring(value1))
    print("coroutine foo end execute")
end

-- 创建协同程序
local co = coroutine.create(foo)

-- 启动协同程序
local status, result = coroutine.resume(co,1)
print(result) -- 输出: 暂停 foo 的执行

-- 恢复协同程序的执行，并传入一个值
status, result = coroutine.resume(co, 42, 43)
print(result) -- 输出: 协同程序 foo 恢复执行，传入的值为: 42