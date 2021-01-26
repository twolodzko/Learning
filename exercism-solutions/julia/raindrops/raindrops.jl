
function raindrops(number)
    # has 3 as a factor, add 'Pling' to the result.
    # has 5 as a factor, add 'Plang' to the result.
    # has 7 as a factor, add 'Plong' to the result.
    # does not have any of 3, 5, or 7 as a factor, the result should be the digits of the number.
    result = ""
    for (factor, string) in [(3, "Pling"), (5, "Plang"), (7, "Plong")]
        if number % factor == 0
            result *= string
        end
    end
    if result == ""
        return "$number"
    else
        return result
    end
end
