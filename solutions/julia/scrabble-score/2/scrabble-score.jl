scores = Dict()
for (nu,letters) in [(1,"AEIOULNRST"),(2,"DG"),(3,"BCMP"),(4,"FHVWY"),(5,"K"),(8,"JX"),(10,"QZ")]
    for ltr in letters
        scores[ltr]=nu
    end
end
function score(str)
    mapreduce((chr -> get(scores,uppercase(chr),0)),+,str;init=0)
end
