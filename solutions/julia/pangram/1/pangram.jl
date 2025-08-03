"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    letters=Dict()
    for chr in input
        if chr >= 'a' && chr <= 'z' chr=chr-32 end
        if chr >= 'A' && chr <= 'Z' letters[chr]=true end
    end
    length(letters)==26
end

