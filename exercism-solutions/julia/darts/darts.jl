
function score(x, y)
    circles = [
        (1, 10), # inner
        (5, 5),  # middle
        (10, 1), # outer
    ]

    # distance from origin = (0, 0)
    d = sqrt(x^2 + y^2)

    for (radius, score) in circles
        if d <= radius
            return score
        end
    end
    return 0
end
