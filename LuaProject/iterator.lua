function square(iteratorMaxCount,currentNumber)
    if currentNumber<iteratorMaxCount
    then
       currentNumber = currentNumber+1
    return currentNumber, currentNumber*currentNumber
    end
 end
 
--  for i,n in square,5,0
--  do
--     print(i,n)
--  end

--输出 1 1
--输出 2 4  
--输出 3 9
--输出 4 16
--输出 5 25


function iter (a, i)
    i = i + 1
    local v = a[i]
    if v then
       return i, v
    end
end
 
function myIpairs (a)
    return iter, a, 0
end

local tempTable = {"a","b","c"}
for i,n in myIpairs(tempTable) do
    print(i,n)
end