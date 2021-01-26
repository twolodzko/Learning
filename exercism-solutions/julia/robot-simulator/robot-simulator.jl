import Base: +

#
#       NORTH
# WEST    +    EAST
#       SOUTH
#

const NORTH = :north
const EAST = :east
const SOUTH = :south
const WEST = :west

function rotate(position, direction)
    # Rotate:   Left  -1  <- ->  +1  Right
    compass = (:north, :east, :south, :west)

    idx = findfirst(x -> x == position, compass)

    if direction < 0 && idx == 1
        return compass[end]
    elseif direction > 0 && idx == length(compass)
        return compass[1]
    else
        return compass[idx + direction]
    end
end

struct Point{T<:Integer}
    x::T
    y::T
end

+(a::Point, b::Point) = Point(a.x + b.x, a.y + b.y)

mutable struct Robot
    position::Point
    direction::Symbol

    Robot(position::Tuple{Integer, Integer}, direction::Symbol) = new(Point(position...), direction)
end

position(r::Robot) = r.position
heading(r::Robot) = r.direction

function turn_right!(r::Robot)
    r.direction = rotate(r.direction, +1)
    return r
end

function turn_left!(r::Robot)
    r.direction = rotate(r.direction, -1)
    return r
end

function advance!(r::Robot)
    movements = Dict(
        :north => Point(0, 1),
        :east => Point(1, 0),
        :south => Point(0, -1),
        :west => Point(-1, 0)
    )
    r.position += movements[r.direction]
    return r
end

function move!(r::Robot, path::String)
    for m in path
        if m == 'L'
            turn_left!(r)
        elseif m == 'R'
            turn_right!(r)
        elseif m == 'A'
            advance!(r)
        else
            error("Wrong input")
        end
    end
    return r
end
