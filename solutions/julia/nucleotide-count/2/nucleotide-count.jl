"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""

function count_nucleotides(strand::String) :: Dict{Char,Integer}
    result = Dict('A'=>0, 'C'=>0, 'G'=>0, 'T'=>0)
    for chr in strand
        if haskey(result, chr)
            result[chr] += 1
        else
            throw(DomainError(chr, "Invalid letter"))
        end
    end
    result
end

