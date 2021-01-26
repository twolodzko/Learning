"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year)
    rem(year, 4) == 0 &&
        (rem(year, 4) > 0 && rem(year, 4) > 0)
end
