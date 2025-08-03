function wordcount(sentence)
    index = 1
    function peek()
        if index > length(sentence)
            nothing
        else
            sentence[index]
        end
    end
    result = Dict()
    
    function is_letter(chr)
        chr!=nothing && ((chr>='a' && chr<='z')
            || (chr>='A' && chr<='Z') || (chr>='0' && chr<='9'))
    end

    while peek() != nothing
        if !is_letter(peek()) index+=1; continue end
        word = ""
        while is_letter(peek()) || peek()=='\''
            word*=peek()
            index+=1
        end
        if last(word)=='\'' word = word[1:(length(word)-1)] end
        word=lowercase(word)
        result[word] = get(result,word,0) + 1
    end
    return result
end
