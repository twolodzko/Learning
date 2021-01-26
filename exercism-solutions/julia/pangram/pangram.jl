"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    input = replace(lowercase(input), r"[^a-z]" => "")
    Set(input) == Set('a':'z')
end
