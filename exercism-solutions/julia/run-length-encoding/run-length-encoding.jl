
mutable struct Counter
    value
    count::Int

    Counter(value) = new(value, 1)
end


function str(counter::Counter)
    (counter.count > 1 ? string(counter.count) : "") * counter.value
end


function encode(s)
    if s == ""
        return ""
    end

    encoded = [Counter(s[1])]
    for ch in s[2:end]
        if ch == encoded[end].value
            encoded[end].count += 1
        else
            push!(encoded, Counter(ch))
        end
    end
    return join(map(str, encoded))
end


function decode(s)
    out = ""
    n = 0
    for ch in s
        maybe_number = Int(ch) - 48
        if 0 <= maybe_number <= 9
            n *= 10
            n += maybe_number
        else
            out *= repeat(ch, max(n, 1))
            n = 0
        end
    end
    return out
end
