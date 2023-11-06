AssertEq ← &i "../helpers.ua" "AssertEq"

# Challenge 1: Write a program that for arguments A, B, and C, computes (A + B) × C.

AddMul ← ×+

---
AssertEq 9 AddMul 1 2 3
AssertEq 8 AddMul 2 2 2
AssertEq 24 AddMul 5 7 2
AssertEq ¯2 AddMul 3 ¯1 ¯1
---

# Challenge 2: Write a program that calculates the hypotenuse of a right triangle with sides A and B (√(A² + B²)).

Hyp ← √ + ⁿ2 ∶ ⁿ2

---
AssertEq 5 Hyp 3 4
AssertEq 15 Hyp 12 9
---
