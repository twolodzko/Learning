
function removebracketspair(string)
    for brackets in ["()", "[]", "{}"]
        string = replace(string, brackets => "")
    end
    return string
end

function matching_brackets(string)
    string = replace(string, r"[^\[\](){}]" => "")
    tmp = removebracketspair(string)
    while length(tmp) < length(string)
        string = tmp
        tmp = removebracketspair(string)
    end
    return isempty(string)
end
