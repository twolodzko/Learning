
# ping command with nicely formatted output
def ping [
    host: string
    --count (-c): int = 0
] {
    # see: https://github.com/nushell/nushell/issues/9338#issuecomment-1574845045
    let responses = (
        if $count >= 1 {
            ^ping -c $count $host
        } else {
            ^ping $host
        }
    )

    $responses
    | lines
    | filter { |row| $row =~ "bytes from" }
    | parse "{packets} bytes from {from} ({addr}): icmp_seq={icmp_seq} ttl={ttl} time={time} ms"
    | update packets { into filesize }
    | update icmp_seq { into int }
    | update ttl { into int }
    | update time { |it| $"($it.time)ms" | into duration }
}
