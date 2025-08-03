scores = Dict()
for (nu,letters) in [(1,"AEIOULNRST"),(2,"DG"),(3,"BCMP"),(4,"FHVWY"),(5,"K"),(8,"JX"),(10,"QZ")]
    for ltr in letters
        scores[ltr]=nu
    end
end
function score(str)
    total = 0
    for ltr in str
        if ltr>='a' && ltr<='z'
            ltr-=32
        end
        if ltr>='A' && ltr<='Z'
            total+=scores[ltr]
        end
    end
    return total
end
