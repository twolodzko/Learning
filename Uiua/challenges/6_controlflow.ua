AssertEq ← &i "../helpers.ua" "AssertEq"

# Challenge 1: Write a program that pushes "small" if a number is less than 10, "medium" if it is less than 100,
# and "large" otherwise.

WhatSize ← ("small"|"medium"|"large") + ⊃(≥10) (≥100)

---
AssertEq "medium" WhatSize 17
AssertEq "small" WhatSize 3
AssertEq "medium" WhatSize 50
AssertEq "large" WhatSize 2357
---

# Challenge 2: Write a program that multiplies an array by its reverse until any element is greater than 1000,
# at most 10 times.

MulTill ← ⍢(× ⊃⇌ ∘)(/× ≤1000)

---
AssertEq [9 4096 9] MulTill [1.5 8 2]
AssertEq [6561 65536 6561] MulTill [1 2 3]
---
