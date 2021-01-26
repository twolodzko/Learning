
function wordcount(sentence)

    sentence = lowercase(sentence)
    sentence = replace(sentence, r"[^\w\s,']'?" => " ")
    sentence = replace(sentence, r"\s'|'\s" =>  " ")

    words = split(sentence, r"[\s,]+")
    words = filter(x -> !(x in ["", "'"]), words)

    counter = Dict{String, Int}()
    for word in words
        if word in keys(counter)
            counter[word] += 1
        else
            counter[word] = 1
        end
    end
    return counter
end
