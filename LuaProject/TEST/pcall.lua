function divide(a, b)
    if b == 0 then
        error("Division by zero")
    end
    return a / b
end

status, result = pcall(divide, 10, 0)
if status then
    print("Result:", result)
else
    print("Error:", result)
end


status, result = pcall(
    function(i) 
        if i > 0 then
            return i
        else
            error(0)  
        end
    end, 
    -1)
if status then
    print("Result:", result)
else
    print("Error:", result)
end

