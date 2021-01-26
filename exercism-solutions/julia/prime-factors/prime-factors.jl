
function prime_factors(number)
    factors = []
    divisor = 2
    while divisor <= number
        quotient, reminder = divrem(number, divisor)

        if iszero(reminder)
            push!(factors, divisor)
            number = quotient
            divisor = 1
        end

        divisor += 1
    end
    return factors
end
