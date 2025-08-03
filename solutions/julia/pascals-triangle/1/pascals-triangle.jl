function triangle(n)
    if n<0
        throw(DomainError("negative n"))
    end
    if n==0
        return []
    end
    if n==1
        return [[1]]
    end
    tri0 = triangle(n-1)
    prev = vcat([0],last(tri0),[0])
    newrow = []
    for i in 1:(length(prev)-1)
        push!(newrow,prev[i]+prev[i+1])
    end
    push!(tri0,newrow)
    return tri0
end
