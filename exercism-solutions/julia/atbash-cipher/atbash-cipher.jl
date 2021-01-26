
function addspaces(str)
    out = ""
    for (i, ch) in enumerate(str)
        out *= ch
        if i % 5 == 0 && i < length(str)
            out *= " "
        end
    end
    return out
end

dict = Dict(('a':'z') .=> ('z':-1:'a'))

function decode(input)
    function translate(ch)
        ch = lowercase(ch)
        try
            return dict[ch]
        catch KeyError
            return (ch in '0':'9') ? ch : ""
        end
    end

    input |>
        collect |>
        x -> map(translate, x) |>
        join
end

function encode(input)
    addspaces(decode(input))
end
