
function secret_handshake(code)
    messages = ["wink", "double blink", "close your eyes", "jump"]
    answer = String[]
    for i in 1:4
        q = div(code, 2)
        if 2q != code
            push!(answer, messages[i])
        end
        code = q
    end
    q = div(code, 2)
    return 2q != code ? reverse(answer) : answer
end
