
validate(square) = 1 <= square <= 64 || throw(DomainError("Invalid value: $square"))

"""Calculate the number of grains on square `square`."""
function on_square(square)
    validate(square)
    BigInt(1) * BigInt(2)^(square - 1)
    # exp(log(BigInt(1)) + log(2) * (square - 1))
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    validate(square)
    sum(on_square(i) for i in 1:square)
end
