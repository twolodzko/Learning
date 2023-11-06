AssertEq ← &i "../helpers.ua" "AssertEq"

# Challenge 1: Write a program that capitalizes an all-lowercase string.

Cap ← -32

---
AssertEq "HELLO" Cap "hello"
---

IncFst ← ⊂ +1⊢ ∶ ↘1 .
# IncFst ← ⊂ ⊃(+1⊢) (↘1)

---
AssertEq "array" IncFst "`rray"
AssertEq "You're" IncFst "Xou're"
---
