function candiv(n,d,str)
    rem(n,d)==0 ? str : ""
end

function raindrops(number)
   res = candiv(number,3,"Pling") * candiv(number,5,"Plang") * candiv(number,7,"Plong")
   isempty(res) ? string(number) : res
end
