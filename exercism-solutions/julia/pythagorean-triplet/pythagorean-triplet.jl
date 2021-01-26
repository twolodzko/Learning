
function pythagorean_triplets(N)
    results = []
    # a < b < c
    for a in 1:(N ÷ 3 - 1)
        for b in (a + 1):(N - 2a - 2)
            c = N - a - b
            # if a + b + c > N
            #     break
            # end
            if a^2 + b^2 == c^2
                push!(results, (a, b, c))
            end
        end
    end
    return results
end
