"Square the sum of the first `n` positive integers"
function square_of_sum(n::Integer)::Integer
    # https://www.wolframalpha.com/input/?i=%281+%2B+2+%2B+...+%2B+n%29%5E2
    # (1 + 2 + ... + n)^2 =
    1//4 * n^2 * (n + 1)^2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n::Integer)::Integer
    # https://www.wolframalpha.com/input/?i=1%5E2+%2B+2%5E2+%2B+3%5E2+%2B+...+%2B+n%5E2
    # 1^2 + 2^2 + 3^2 + ... + n^2 =
    1//6 * n * (n + 1) * (2n + 1)
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n::Integer)::Integer
    # The difference can be further simplified:
    # https://stackoverflow.com/questions/15593428/function-to-calculate-the-difference-between-sum-of-squares-and-square-of-sums/15593631
    -(3n^2 + 2n) * (1 - n^2) // 12
end
