function isisogram(s) :: Bool
    letters = Dict()
    for chr in s
        if chr!='-' && chr!=' '
            chr=lowercase(chr)
            if haskey(letters,chr) return false end
            letters[chr]=true
        end
    end
    true
end
