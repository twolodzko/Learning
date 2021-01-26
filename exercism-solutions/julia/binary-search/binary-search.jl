
function binarysearch(arr, val; lt = <, rev = false, by = identity)
    n = length(arr)

    if n == 0
        return 1:0
    end

    val = by(val)
    arr = by.(arr)
    compare = rev ? (a, b) -> lt(b, a) : lt

    i = 1
    while n > 1
        m = div(n, 2)
        if compare(val, arr[m+1])
            arr = arr[1:m]
        else
            arr = arr[(m+1):end]
            i += m
        end
        n = length(arr)
    end

    if compare(val, arr[1])
        return i:(i-1)
    elseif compare(arr[1], val)
        return (i + 1):i
    else
        return i:i
    end
end
