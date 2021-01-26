
function rotate(rot, ch::Char)
    for abc in [('a':'z'), ('A':'Z')]
        i = findfirst(x -> x == ch, abc)
        if !isnothing(i)
            return abc[1 + mod(i + rot - 1, length(abc))]
        end
    end
    return ch
end

rotate(rot, string::AbstractString) = map(x -> rotate(rot, x), string)
