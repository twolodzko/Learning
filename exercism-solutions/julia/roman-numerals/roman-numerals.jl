# see: http://www.novaroma.org/via_romana/numbers.html

function digits(number)
    digits_list = Int[]
    m = 10
    while (m / 10) <= number
        digit = number % m
        push!(digits_list, digit / (m / 10))
        number -= digit
        m *= 10
    end
    return digits_list
end


function to_roman(number)
    if number <= 0 || number > 3000
        error("number cannot be converted")
    end

    roman = [
        ['I', 'V'], # ones
        ['X', 'L'], # test
        ['C', 'D'], # hundreads
        ['M'],      # thousands
    ]

    digits_list = digits(number)
    r = ""

    for i in 1:length(digits_list)
        d = digits_list[i]
        if 1 <= d <= 3
            for _ in 1:d
                r *= roman[i][1]
            end
        elseif d == 4
            r *= roman[i][2] * roman[i][1]
        elseif 5 <= d <= 8
            for _ in 1:(d - 5)
                r *= roman[i][1]
            end
            r *= roman[i][2]
        elseif d == 9
            r *= roman[i+1][1] * roman[i][1]
        end
    end

    return reverse(r)
end
