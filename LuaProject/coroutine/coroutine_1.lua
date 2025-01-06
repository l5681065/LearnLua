function foo()
    print("enter foo")
    local thread,bIsMain = coroutine.running()
    print(string.format("foo_before_yield coroutine.running() thread:%s,bIsMain:%s",thread,bIsMain))

    local status = coroutine.status(co)
    print(string.format("foo_before_yield coroutine.status(co) status:%s",status))


    local returnAny = coroutine.yield("yield param1","yield param2","yield param3")
    print(string.format("foo_after_yield coroutine.yield value:%s",returnAny))

    return "return param1","return param2","return param3"
end


local thread,bIsMain = coroutine.running()
print(string.format("before create coroutine.running() thread:%s,bIsMain:%s",thread,bIsMain))

-- 创建协同程序
co = coroutine.create(foo)
local status_after_create = coroutine.status(co)
print(string.format("after create coroutine.status(co) status:%s",status_after_create))

-- 启动协同程序
local success, param1,param2,param3 = coroutine.resume(co)
print(string.format("after resume coroutine.resume(co) success:%s param1:%s param2:%s param3:%s",success,param1,param2,param3)) 

local success1, param1_1,param2_1,param3_1 = coroutine.resume(co,"outerParam")
print(string.format("end resume coroutine.resume(co) success1:%s param1_1:%s param2_1:%s param3_1:%s",success1,param1_1,param2_1,param3_1)) 

--[[
输出结果:
before create coroutine.running() thread:XXXXXX01 bIsMain:true
after create coroutine.status(co) status:suspended
enter foo
foo_before_yield coroutine.running() thread:XXXX02 ,bIsMain:false
foo_before_yield coroutine.status(co) status:running 
after resume coroutine.resume(co) success:true param1:yield param1 param2:yield param2 param3:yield param3
foo_after_yield coroutine.yield value:outerParam
end resume coroutine.resume(co) success1:true param1_1:return param1 param2_1:return param2 param3_1:return param3
]]--


--[[
总结:
1.coroutine.yield 之后的代码不会立即执行
2.执行完这行local returnAny = coroutine.yield("yield param1","yield param2","yield param3") 代码后
做了两件事:
(1)相当于做了 return "yield param1","yield param2","yield param3"
(2)暂停了协同程序的执行
需要注意的是:执行这行代码后并不执行对returnAny的赋值
3.创建完协程之后,协程的默认状态是suspended
4.coroutine.resume的返回值要么是yield里的参数,要么是函数自己的return的值(函数没有return就是return nil)
]]