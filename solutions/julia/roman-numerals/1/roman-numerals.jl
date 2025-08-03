function to_roman(number)
    if number<=0 throw(ErrorException("too low")) end
    nums=[(1,"I"),(4,"IV"),(5,"V"),(9,"IX"),(10,"X"),(40,"XL"),(50,"L"),
        (90,"XC"),(100,"C"),(400,"CD"),(500,"D"),(900,"CM"),(1000,"M")]
    result=""
    while(number>0)
        n,digs=pop!(nums)
        while number>=n
            number-=n
            result*=digs
        end
    end
    return result
end
