local tmp = {}
tmp[1] = "a"
tmp[2] = "b"
tmp[4] = "b"
tmp["a"] = "b"

for k, v in pairs(tmp) do
    print(string.format("pairs k:%s,v:%s",k,v))
end

local tmp1 = {}
tmp1[1] = "a"
tmp1[2] = "b"
tmp1[4] = "b"
tmp1["a"] = "b"
for k, v in ipairs(tmp1) do
    print(string.format("ipairs k:%s,v:%s",k,v))
end

-- [Running] E:\LuaExe\lua-5.4.2_Win64_bin\lua54.exe "g:\GitHubProject\LearnLua\LuaProject\TEST\pair&ipairs"
-- pairs k:1,v:a
-- pairs k:2,v:b
-- pairs k:4,v:b
-- pairs k:a,v:b
-- ipairs k:1,v:a
-- ipairs k:2,v:b

--结论 pair变量中间即使中断也可以遍历  pair变量中间中断不能遍历  