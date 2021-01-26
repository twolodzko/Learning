using Dates

function add_gigasecond(date::DateTime)
    return date + Second(1e+9)
end
