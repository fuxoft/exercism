trans = Dict('G'=>'C','C'=>'G','T'=>'A','A'=>'U')

function to_rna(dna)
    map(dna) do chr
        if ! haskey(trans,chr)
            throw(ErrorException("bad char"))
        end
        trans[chr]
    end
end
