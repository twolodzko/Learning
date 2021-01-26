"Your optional docstring here"
function distance(a, b)
    if length(a) != length(b)
        throw(ArgumentError("Lengths of the sequencess differ"))
    end

    count = 0
    for i in 1:length(a)
        if a[i] != b[i]
            count += 1
        end
    end
    return count
end
