
function isisogram(s)
    s = replace(lowercase(s), r"[^a-z]" => "")
    length(s) == length(unique(s))
end
