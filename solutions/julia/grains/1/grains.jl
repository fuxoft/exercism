"""Calculate the number of grains on square `square`."""
function on_square(square)
    check(square)
    BigInt(2)^(square-1)
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    check(square)
    BigInt(2)^square - 1
end

function check(square)
    if square<1 || square>64
        throw(DomainError("wrong square"))
    end
end