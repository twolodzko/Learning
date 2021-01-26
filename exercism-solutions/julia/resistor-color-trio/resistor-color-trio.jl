
translate = Dict(
    "black"  => 0,
    "brown"  => 1,
    "red"    => 2,
    "orange" => 3,
    "yellow" => 4,
    "green"  => 5,
    "blue"   => 6,
    "violet" => 7,
    "grey"   => 8,
    "white"  => 9,
)

function label(colors)
    n = [translate[c] for c in colors]
    str = "$(n[1])$(n[2])$(repeat('0', n[3])) "
    replace(str, r"000 " => " kilo") * "ohms"
end
