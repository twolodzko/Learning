AssertEq ← &i "../helpers.ua" "AssertEq"

# Challenge 1: Write a program that creates a custom modifier called f! which calls its function on each row of
# an array, reverses each row, and reverses the whole array.

f! ← ⇌ ≡(⇌ ^1)

---
dump∘ f!(⊂.) ↯3_4⇡12
dump∘ f!(↯3) [1_2_3 4_5_6]
dump∘ f!(⊟.) 1_2 3_4
---
