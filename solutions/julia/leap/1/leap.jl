"""
    divis(x,y)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function divis(x,y) :: Bool
    x % y == 0
end

function is_leap_year(year) :: Bool
    if divis(year,100)
        if divis(year,400)
            true
        else
            false
        end
    else
        divis(year,4)
    end
end
