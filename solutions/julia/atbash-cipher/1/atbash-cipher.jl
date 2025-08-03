function encode(input)
    input = filter((chr -> isletter(chr) || isdigit(chr)), input) |> lowercase
    return insert_spaces(encode2(input))
end

function decode(input)
    input = filter((chr -> chr!=' '),input)
    return encode2(input)
end

function encode2(str)
    map(str) do chr
        if isletter(chr)
            'a' + ('z'-chr)
        else
            chr
        end
    end
end

function insert_spaces(str)
    if length(str) <= 5
        str
    else
        str[1:5]*" "*insert_spaces(str[6:length(str)])
    end
end