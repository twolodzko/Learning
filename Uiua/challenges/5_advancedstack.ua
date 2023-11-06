AssertEq ← &i "../helpers.ua" "AssertEq"

# Challenge 1: Write a program that moves the 4th value on the stack to the top.

FourthToTop ← [∶⊙∶⊙⊙∶]

---
AssertEq [4 1 2 3] FourthToTop 1 2 3 4
---

# Challenge 2: Write a program that adds the second argument to the third and divides by the first.

SumDiv ← ÷ ⊙+

---
AssertEq 4 SumDiv 2 3 5
AssertEq 5 SumDiv 1 2 3
AssertEq 5 SumDiv 5 10 15
---

# Challenge 3: Write a program that finds both the sum and product of three arguments.

SumAndProd ← [⊃(++) (××)]

---
AssertEq [15 120] SumAndProd 4 5 6
AssertEq [30 1000] SumAndProd 10 10 10
AssertEq [9_11 15_40] SumAndProd 1_2 3_4 5
---

# Challenge 4: Write a program that for numbers A, B, C, and D calculates (A+C)×(B+D).

ProdOfSums ← × ⊃(+⋅⊙⋅∘) (+⊙⋅∘)

---
AssertEq 24 ProdOfSums 1 2 3 4
AssertEq ¯33 ProdOfSums 10 ¯3 1 0
AssertEq ¯25 ProdOfSums 3 ¯7 2 2
---
