AssertEq ← &i "helpers.ua" "AssertEq"

All ← =1 /×
Any ← >0 /+

---
AssertEq 1 All [1 1 1]
AssertEq 0 All [1 0 1 1]
AssertEq 1 All [1 1 1]
AssertEq 0 All [0 0 0]
AssertEq 1 All [1]
AssertEq 0 All [0]

AssertEq 1 All <10 [1 2 3]
AssertEq 0 All <2 [1 2 3]

AssertEq 1 Any [1 1 1]
AssertEq 0 Any [0 0 0]
AssertEq 1 Any [1 0 1]
AssertEq 1 Any [1]
AssertEq 0 Any [0]

AssertEq 1 Any <10 [1 2 3]
AssertEq 1 Any <2 [1 2 3]
AssertEq 0 Any <1 [1 2 3]
---
