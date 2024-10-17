function CheckChinese(s)
    local ret = {};
    local f = '[%z\1-\127\194-\244][\128-\191]*';
    local line, lastLine, isBreak = '', false, false;
    for v in string.gmatch(s,f) do
        table.insert(ret, {c=v,isChinese=(#v~=1)});
    end
    return ret;
end
for k, v in ipairs(CheckChinese('a����b+')) do
    print(k,v.c,#v.c,v.isChinese);
end

