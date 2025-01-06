local thread1,bIsMain1 = coroutine.running()
print("thread1:%s,bIsMain1:%s",thread1,bIsMain1)

local func = coroutine.wrap(
    function(i)
        local thread2,bIsMain2 = coroutine.running()
        print("thread2:%s,bIsMain2:%s",thread2,bIsMain2)
        print(string.format("funcParam:%s",i));
    end
)

local thread3,bIsMain3 = coroutine.running()
print("thread3:%s,bIsMain3:%s",thread3,bIsMain3)

func("wrap_param")
local thread4,bIsMain4 = coroutine.running()
print("thread4:%s,bIsMain4:%s",thread4,bIsMain4)

--[[
    输出结果:
thread1:%s,bIsMain1:%s  thread: 0000021FBC8C2168        true
thread3:%s,bIsMain3:%s  thread: 0000021FBC8C2168        true
thread2:%s,bIsMain2:%s  thread: 0000021FBC9613F8        false
funcParam:wrap_param
thread4:%s,bIsMain4:%s  thread: 0000021FBC8C2168        true
]]
--[[
    总结:
    (1)coroutine.wrap(f) 创建一个主体函数为 `f` 的新协程。 f 必须是一个 Lua 的函数。 返回一个函数， 每次调用该函数都会延续该协程。
    (2)func("wrap_param")  可以将参数传给匿名函数
]]