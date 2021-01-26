import Base: AbstractSet, length, in, isempty, issubset, ==, push!, intersect, intersect!, union, union!, iterate, copy

mutable struct CustomSet{T} <: AbstractSet{T}
    values::AbstractArray{T}
    CustomSet(values::AbstractArray{T}) where {T} = new{T}(unique(values))
end

length(s::CustomSet) = length(s.values)

in(n, s::CustomSet) = in(n, s.values)

isempty(s::CustomSet) = isempty(s.values)

intersect(a::CustomSet, b::CustomSet) = CustomSet([x for x in a.values if x in b.values])

issubset(a::CustomSet, b::CustomSet) = intersect(a, b) == a

disjoint(a::CustomSet, b::CustomSet) = isempty(intersect(a, b))

==(a::CustomSet, b::CustomSet) = sort(a.values) == sort(b.values)

function push!(s::CustomSet, x)
    if !(x in s)
        push!(s.values, x)
    end
end

function intersect!(a::CustomSet, b::CustomSet)
    a.values = intersect(a, b).values
end

complement(a::CustomSet, b::CustomSet) = CustomSet([x for x in a.values if !(x in b.values)])

function complement!(a::CustomSet, b::CustomSet)
    a.values = complement(a, b).values
end

union(a::CustomSet, b::CustomSet) = CustomSet([a.values; b.values])

function union!(a::CustomSet, b::CustomSet)
    a.values = unique([a.values; b.values])
end

iterate(s::CustomSet, i...) = iterate(s.values, i...)

copy(s::CustomSet) = CustomSet([s.values...])
