function fn(str)
    if type(str)~="string" then
        -- 告知error函数错误是发生在调用层级的第2层
        print("--------------")
        error("string expected",2)
        print("--------------")
    end
end

fn(1)
print("--------------")