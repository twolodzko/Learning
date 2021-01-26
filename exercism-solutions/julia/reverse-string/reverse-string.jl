import Unicode: graphemes

const TEST_GRAPHEMES = true

function myreverse(string)
    string = collect(graphemes(string))
    out = ""
    for i in length(string):-1:1
        out *= string[i]
    end
    return out
end
