function encode(str)
    if length(str)<=1
        return str
    end
    result = ""
    curchr = str[1]
    curlen = 1
    function encode()
        curlen > 1 && (result*=string(curlen))
        result*=curchr
    end
    for i in 2:length(str)
        chr = str[i]
        if curchr==chr
            curlen+=1
        else
            encode()
            curchr=chr
            curlen=1
        end
    end
    encode()
    return result
end

function decode(str)
    isdigit(ch) = ch>='0' && ch<='9'
    result=""
    ind=1
    function peek()
        if ind>length(str)
            return nothing
        end
        return str[ind]
    end
    while peek() != nothing
        count=0
        while isdigit(peek())
            count=count*10+(peek()-'0')
            ind+=1
        end
        if count==0
            result*=peek()
        else
            result*=peek()^count
        end
        ind+=1
    end
    result
end
