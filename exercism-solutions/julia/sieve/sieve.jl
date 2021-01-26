
function sieve(limit)
    candidates = 2:limit
    out = Int[]
    while length(candidates) > 0
        x = candidates[1]
        push!(out, x)
        candidates = filter(c -> (c .% x) .!= 0, candidates)
    end
    return out
end
