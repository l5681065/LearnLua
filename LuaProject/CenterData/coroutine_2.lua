function foo()
    print("enter foo")
    local thread,bIsMain = coroutine.running()
    print("foo_before_yield coroutine.running() thread:%s,bIsMain:%s",thread,bIsMain)

    local status = coroutine.status(co)
    print("foo_before_yield coroutine.status(co) status:%s",status)


    local yieldReturn1,yieldReturn2,yieldReturn3 = coroutine.yield("yield param1","yield param2","yield param3")
    print("foo_after_yield coroutine.yield yieldReturn1:%s yieldReturn2:%s yieldReturn3:%s",yieldReturn1,yieldReturn2,yieldReturn3)

    return "foo return1","foo return2","foo return3"
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

-- 恢复协同程序的执行，并传入一个值
local success1,param1_1,param2_1,param3_1 = coroutine.resume(co, "resume param1","resume param2","resume param3")
print(string.format("success1:%s param1_1:%s,param2_1:%s,param3_1:%s",success1,param1_1,param2_1,param3_1)) 

local thread1,bIsMain1 = coroutine.running()
print("end coroutine.running() thread:%s,bIsMain:%s",thread,bIsMain)

--[[
输出结果:
before create coroutine.running() thread:XXXXXX01 bIsMain:true
after create coroutine.status(co) status:suspended
enter foo
foo_before_yield coroutine.running() thread:XXXX02 ,bIsMain:false
foo_before_yield coroutine.status(co) status:running 
after resume coroutine.resume(co) success:true param1:yield param1 param2:yield param2 param3:yield param3
foo_after_yield coroutine.yield yieldReturn1:%s yieldReturn2:%s yieldReturn3:%s resume param1   resume param2   resume param3
success1:true param1_1:foo return1,param2_1:foo return2,param3_1:foo return3
end coroutine.running() thread:XXXXXX01 bIsMain:true
]]--

--[[
总结:
执行完这行 local success1,param1_1,param2_1,param3_1 = coroutine.resume(co, "resume param1","resume param2","resume param3") 代码后做了如下几件事:
(1)恢复了foo的执行，并传入了三个参数
(2)传入的三个参数以此对yieldReturn1,yieldReturn2,yieldReturn3赋值
(3)之后的代码继续执行,由于没有yield语句,所以foo函数的返回值"foo return1","foo return2","foo return3",给了param1_1,param2_1,param3_1赋值
]]--