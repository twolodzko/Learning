
isvalid(sides) = all(sides .> 0) && sides[1] + sides[2] >= sides[3]

function is_equilateral(sides)
    sort!(sides)
    isvalid(sides) && (sides[1] == sides[2] == sides[3])
end

function is_isosceles(sides)
    sort!(sides)
    isvalid(sides) && (sides[1] == [2] || sides[2] == sides[3])
end

function is_scalene(sides)
    sort!(sides)
    isvalid(sides) && (sides[1] != sides[2] != sides[3])
end
