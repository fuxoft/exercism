function luhn(str0::String) :: Bool
    nospaces = filter((ch->ch!=' '),str0)
    if any(ch->!isnumeric(ch),nospaces) return false end
    numbers = [chr-'0' for chr in nospaces]
    if length(numbers)<=1 return false end
    if isodd(length(numbers)) numbers=[0;numbers] end
    for i in 1:2:(length(numbers))
        n=numbers[i]*2
        numbers[i]=n>9 ? n-9 : n
    end
    @show numbers
    return 0==mod(sum(numbers),10)
end