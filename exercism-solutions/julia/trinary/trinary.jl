
function trinary_to_decimal(str)
    dec = 0
    for (i, ch) in enumerate(reverse(str))
        d = Int(ch) - 48
        if !(0 <= d <= 2)
            return 0
        end
        dec += d * 3^(i - 1)
    end
    return dec
end
