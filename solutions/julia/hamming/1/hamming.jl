"Your optional docstring here"
function distance(a, b)
    if length(a)!=length(b)
        throw(ArgumentError("different lenghts"))
    end
    sum = 0
    for (x,y) in zip(a,b)
        sum += x==y ? 0 : 1
    end
    sum
end
