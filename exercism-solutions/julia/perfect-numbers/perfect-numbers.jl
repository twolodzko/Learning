
divisors(number) = [i for i in 1:(number - 1) if iszero(number % i)]

function validint(number)
    if number < 1
        throw(DomainError("Number needs to be a positive integer"))
    end
    return true
end

isperfect(number) = validint(number) && sum(divisors(number)) == number

isabundant(number) = validint(number) && sum(divisors(number)) > number

isdeficient(number) = validint(number) && sum(divisors(number)) < number
