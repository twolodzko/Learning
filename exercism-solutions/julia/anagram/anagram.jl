
function detect_anagrams(subject, candidates)
    sorted(s) = sort(collect(lowercase(s)))

    subject = lowercase(subject)
    subject_sorted = sorted(subject)

    function check(candidate)
        candidate = lowercase(candidate)
        (candidate != subject) && (sorted(candidate) == subject_sorted)
    end

    filter(check, candidates)
end
