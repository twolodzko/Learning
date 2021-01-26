function to_rna(dna)
    replacements = Dict(
        'G' => 'C',
        'C' => 'G',
        'T' => 'A',
        'A' => 'U'
    )

    try
        map(ch -> replacements[ch], dna)
    catch KeyError
        error("invalid strand")
    end
end
