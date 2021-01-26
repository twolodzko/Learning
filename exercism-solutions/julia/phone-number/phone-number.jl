
function clean(phone_number)
    cleaned = replace(phone_number, r"[^0-9]" => "")
    try
        match(r"^1?([2-9][0-9]{2}[2-9][0-9]{6})$", cleaned).captures[1]
    catch
        nothing
    end
end
