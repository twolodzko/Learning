AssertEq ← &i "../helpers.ua" "AssertEq"

# Challenge 1: Write a program that adds 3 numbers.

AddThree ← ++

---
AssertEq 6 AddThree 1 2 3
AssertEq 11 AddThree 0 10 1
AssertEq 14 AddThree 10 ¯1 5
AssertEq 6 AddThree 0 5 1
---

# Challenge 2: Write a program that divides the second number by the first but keeps the inputs on the stack.

DivKeep ← [÷,,] # use braces to have whole stack for assert

---
AssertEq [2 5 10] DivKeep 5 10
AssertEq [4 6 24] DivKeep 6 24
---

# Challenge 3: Write a program that subtracts the second number from the first then squares the result.

SqDif ← × . -

---
AssertEq 81 SqDif 10 1
AssertEq 4 SqDif 5 3
AssertEq 49 SqDif 9 2
AssertEq 1 SqDif 5 6
---
