
function acronym(phrase)
    phrase = replace(uppercase(phrase), "'" => "")
    phrase = replace(phrase, r"[^A-Z]+" => " ")

    out = ""
    for word in split(phrase, " ")
        out *= word[1]
    end
    return out
end
