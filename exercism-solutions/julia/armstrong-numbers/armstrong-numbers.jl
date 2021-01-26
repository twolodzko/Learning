
function isarmstrong(number)
    d = digits(number)
    return sum(d .^ length(d)) == number
end
