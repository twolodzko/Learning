
function transform(input::AbstractDict)
    output = Dict{Char,Int}()
    for (k, v) in input
        for vi in v
            output[lowercase(vi)] = k
        end
    end
    return output
end
