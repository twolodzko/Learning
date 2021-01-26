import Base: push!, empty!, isempty, first, last, length, size, append!, pop!, convert, pushfirst!, getindex, setindex!

# Activate bonus
const enable_bonus_tests = true


mutable struct CircularBuffer{T} <: AbstractVector{T}
    data::Array{T, 1}
    first::Integer
    length::Integer

    function CircularBuffer{T}(capacity::Integer) where {T}
        new{T}(Array{T, 1}(undef, capacity), 1, 0)
    end
end

CircularBuffer(capacity::Integer) = CircularBuffer{Any}(capacity)

capacity(cb::CircularBuffer) = length(cb.data)

isempty(cb::CircularBuffer) = iszero(cb.length)
isfull(cb::CircularBuffer) = cb.length == capacity(cb)

_move_pos(cb::CircularBuffer, i) = mod1(cb.first + i, capacity(cb))
_last_pos(cb::CircularBuffer) = _move_pos(cb, cb.length - 1)

function push!(cb::CircularBuffer{T}, item::T; overwrite::Bool=false) where {T}
    if isfull(cb)
        if !overwrite
            throw(BoundsError())
        else
            cb.first = _move_pos(cb, 1)
        end
    else
        cb.length += 1
    end

    pos = _last_pos(cb)
    cb.data[pos] = item
    return cb
end

function first(cb::CircularBuffer)
    if isempty(cb)
        throw(BoundsError())
    end
    return cb.data[cb.first]
end

function popfirst!(cb::CircularBuffer)
    value = first(cb)
    cb.first = _move_pos(cb, 1)
    cb.length -= 1
    return value
end

function last(cb::CircularBuffer)
    if isempty(cb)
        throw(BoundsError())
    end
    return cb.data[_last_pos(cb)]
end

function pop!(cb::CircularBuffer)
    value = last(cb)
    cb.length -= 1
    return value
end

function empty!(cb::CircularBuffer{T}) where {T}
    cb.data = Array{T, 1}(undef, capacity(cb))
    cb.length = 0
    return cb
end

length(cb::CircularBuffer) = cb.length

size(cb::CircularBuffer) = (length(cb),)

function append!(cb::CircularBuffer, items::AbstractArray; overwrite::Bool=false)
    for el in items
        push!(cb, el, overwrite=overwrite)
    end
    return cb
end

function pushfirst!(cb::CircularBuffer{T}, item::T; overwrite::Bool=false) where {T}
    if isfull(cb)
        if !overwrite
            throw(BoundsError())
        end
    else
        cb.length += 1
    end

    cb.first = cb.first == 1 ? capacity(cb) : cb.first - 1
    cb.data[cb.first] = item
    return cb
end

function getindex(cb::CircularBuffer, i::Integer)
    checkbounds(cb, i)
    return cb.data[_move_pos(cb, i-1)]
end

function setindex!(cb::CircularBuffer{T}, val::T, i::Integer) where {T}
    checkbounds(cb, i)
    cb.data[_move_pos(cb, i-1)] = val
    return cb
end

function convert(::Type{Array}, cb::CircularBuffer{T}) where {T}
    return T[item for item in cb]
end
