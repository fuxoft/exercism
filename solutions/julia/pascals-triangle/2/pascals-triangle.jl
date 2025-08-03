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
    newrow = [val+prev[i+1] for (i,val) in enumerate(prev[1:(length(prev)-1)])]
    push!(tri0,newrow)
    return tri0
end
