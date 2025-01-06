function foo()
    print("enter foo")
    local thread,bIsMain = coroutine.running()
    print("foo_before_yield coroutine.running() thread:%s,bIsMain:%s",thread,bIsMain)

    local status = coroutine.status(co)
    print("foo_before_yield coroutine.status(co) status:%s",status)
end


local thread,bIsMain = coroutine.running()
print("before create coroutine.running() thread:%s,bIsMain:%s",thread,bIsMain)

-- 创建协同程序
co = coroutine.create(foo)
local status_after_create = coroutine.status(co)
print("after create coroutine.status(co) status:%s",status_after_create)

-- 启动协同程序
local success, param1,param2,param3 = coroutine.resume(co)
print(string.format("after resume coroutine.resume(co) success:%s param1:%s param2:%s param3:%s",success,param1,param2,param3)) 



--[[
输出结果:
before create coroutine.running() thread:XXXXXX01 bIsMain:true
after create coroutine.status(co) status:suspended
enter foo
foo_before_yield coroutine.running() thread:XXXX02 ,bIsMain:false
foo_before_yield coroutine.status(co) status:running 
after resume coroutine.resume(co) success:true param:nil
]]--

--[[
总结:执行 local success, param1,param2,param3 = coroutine.resume(co) 这行代码时
先执行foo函数，然后给 success,param1,param2,param3 赋值
然后这行代码执行完毕
赋值的结果是true nil nil nil
为什么是param1 param2 param3  nil nil nil呢？因为foo函数中没有return语句
可以查看coroutine_0_1.lua中的代码
]]--