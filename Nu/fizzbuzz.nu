use std assert

def fizzbuzz [x] {
    if ($x mod 15 == 0) {
        "Fizz Buzz"
    } else if ($x mod 3 == 0) {
        "Fizz"
    } else if ($x mod 5 == 0) {
        "Buzz"
    } else {
        $x | into string
    }
}

assert ((fizzbuzz 1) == "1")
assert ((fizzbuzz 2) == "2")
assert ((fizzbuzz 3) == "Fizz")
assert ((fizzbuzz 4) == "4")
assert ((fizzbuzz 5) == "Buzz")
assert ((fizzbuzz 15) == "Fizz Buzz")
