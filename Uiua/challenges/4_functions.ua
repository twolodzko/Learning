AssertEq ← &i "../helpers.ua" "AssertEq"

# Challenge 1: Write a program that calculates the product of the first n positive integers.

ProdN ← /×+1⇡

---
AssertEq 120 ProdN 5
AssertEq 3628800 ProdN 10
AssertEq 1 ProdN 0
AssertEq 720 ProdN 6
---

# Challenge 2: Write a program that adds the each column of a matrix to the next.

SumCols ← ≡/+

---
AssertEq [6 15] SumCols [1_2_3 4_5_6]
AssertEq [18 4 14] SumCols [6_9_1_2 3_0_0_1 2_3_4_5]
AssertEq [13] SumCols [2_2_2_2_5]
---

# Challenge 3: Write a program that wraps a string in brackets.

# AddBrck ← ⇌⊂@] ⇌⊂@[
AddBrck ← $"[_]"

---
AssertEq "[HELLO]" AddBrck "HELLO"
---
