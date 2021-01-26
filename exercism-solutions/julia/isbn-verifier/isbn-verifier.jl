import Base: isvalid, iterate, show

struct ISBN <: AbstractString
    string::AbstractString

    function ISBN(string::AbstractString)
        if !isvalid(ISBN, string)
            throw(DomainError("Invalid ISBN"))
        end
        string = replace(string, r"-" => "")
        new(string)
    end
end

macro isbn_str(s) ISBN(s) end

iterate(isbn::ISBN) = iterate(isbn.string)

iterate(isbn::ISBN, i::Integer) = iterate(isbn.string, i)

show(io::IO, isbn::ISBN) =
    show(io, replace(isbn.string, r"(.)(.{3})(.{5})(.)" => s"\1-\2-\3-\4"))

function isvalid(::Type{ISBN}, string::String)
    string = replace(string, r"-" => "")

    if length(string) != 10
        return false
    end

    tot = 0
    for (i, ch) in enumerate(string)
        if i == 10 && ch == 'X'
            x = 10
        elseif ch in '0':'9'
            x = Int(ch) - 48
        else
            return false
        end

        tot += x * i
    end

    return tot % 11 == 0
end
