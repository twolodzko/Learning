
isdigit(x) = Int('0') <= Int(x) <= Int('9')

toint(x) = Int(x) - 48

function luhn(number)
    number = replace(number, " " => "")

    if length(number) < 2
        return false
    end

    sum = 0
    for (i, ch) in enumerate(reverse(number))
        x = Int(ch) - 48
        if x < 0 || x > 9
            return false
        end
        if i % 2 == 0
            x *= 2
            x = x > 9 ? x - 9 : x
        end
        sum += x
    end
    return rem(sum, 10) == 0
end
