AssertEq ← &i "helpers.ua" "AssertEq"

Avg ← ÷ ⊃⧻ /+

---
AssertEq NaN Avg []
AssertEq 1 Avg [1]
AssertEq 2 Avg [1 2 3]
AssertEq 2.5 Avg [1 2 3 4]
AssertEq 3 Avg [1 2 3 4 5]
---

RollAvg ← ÷ ⊃(+1⇡⧻) \+

---
AssertEq [] RollAvg []
AssertEq [1] RollAvg [1]
AssertEq [1 1.5 2] RollAvg [1 2 3]
AssertEq [1 1.5 2 2.5 3] RollAvg [1 2 3 4 5]
---

WtdAvg ← ÷ ⊃/+ (/+×) ∶

---
AssertEq NaN WtdAvg [] []
AssertEq 1 WtdAvg [1] [1]
AssertEq 2 WtdAvg [1 2 3] [1 1 1]
AssertEq 2 WtdAvg [1 2 3] [2 2 2]
AssertEq 1.5 WtdAvg [1 2 3] [5 2 1]
---
