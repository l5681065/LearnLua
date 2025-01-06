-- coroutine_test.lua 文件
-- 创建了一个新的协同程序对象 co，其中协同程序函数打印传入的参数 i
co = coroutine.create(
    function(i)
        print(i);
    end
)
-- 使用 coroutine.resume 启动协同程序 co 的执行，并传入参数 1。协同程序开始执行，打印输出为 1
coroutine.resume(co, "resume param1")   -- resume param1

-- 通过 coroutine.status 检查协同程序 co 的状态，输出为 dead，表示协同程序已经执行完毕
print(coroutine.status(co))  -- dead

--[[
输出结果:
resume param1
dead
]]--

--[[
总结:
(1)coroutine.resume(co, "resume param1")这行代码,不仅可以启动协程,还可以给co里的匿名函数传参数
(2)协程执行完,状态就死了
]]