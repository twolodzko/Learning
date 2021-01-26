"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    d = Dict([(ch, 0) for ch in "ACGT"])
    for ch in strand
        if ch in keys(d)
            d[ch] += 1
        else
            throw(DomainError(ch))
        end
    end
    return d
end
