# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

function score(ch::Char)
    ch = uppercase(ch)
    if ! (Int('A') <= Int(ch) <= Int('Z'))
        return 0
    end

    for (chars, value) in [
        "DG"    => 2,
        "BCMP"  => 3,
        "FHVWY" => 4,
        "K"     => 5,
        "JX"    => 8,
        "QZ"    => 10,
    ]
        if ch in chars
            return value
        end
    end

    return 1
end

function score(str::AbstractString)
    sum(map(score, collect(str)))
end
