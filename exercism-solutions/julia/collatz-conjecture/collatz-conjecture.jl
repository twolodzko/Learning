
function collatz_steps(n)
    if n < 1
        throw(DomainError("number needs to be >= 1"))
    end

    i = 0
    while n > 1
        n = iseven(n) ? div(n, 2) : 3n + 1
        i += 1
    end
    return i
end
