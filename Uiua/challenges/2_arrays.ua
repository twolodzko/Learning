AssertEq ← &i "../helpers.ua" "AssertEq"

# Challenge 1: Write a program that adds an array to its reverse.

AddRev ← + ⇌ .

---
AssertEq [6 4 6] AddRev 1_2_5
AssertEq [10 2 10] AddRev 3_1_7
AssertEq [. 4_6_8_10] AddRev ↯2_4⇡8
AssertEq 10 AddRev 5
---

# Challenge 2: Write a program that creates a matrix of 0's with as many columns as the first argument
# and as many rows as the second argument.

ZeroMtx ← ↯ ∶ 0 ⊟

---
AssertEq [0_0_0_0 0_0_0_0 0_0_0_0] ZeroMtx 3 4
AssertEq [0_0_0_0_0_0_0 0_0_0_0_0_0_0] ZeroMtx 2 7
AssertEq [0_0_0 0_0_0 0_0_0] ZeroMtx 3 3
AssertEq [[0 0 0 0 0 0 0 0]] ZeroMtx 1 8
---

# Challenge 3: Write a program that adds a 1-row leading axis to an array.

AddAxis ← [;.]

---
AssertEq [1_2_3] AddAxis 1_2_3
AssertEq [1_3_1_5] AddAxis 1_3_1_5
AssertEq [5] AddAxis 5
AssertEq [↯2_3⇡6] AddAxis ↯2_3⇡6
---

# Challenge 4: Write a program that appends the first row of the first argument to the second argument.

AddFstRow ← ⊂ ⊢

---
AssertEq [1 4 5 6] AddFstRow [1 2 3] 4_5_6
AssertEq [3 2 2] AddFstRow 3_3 2_2
AssertEq [1_2_3 10_11_12 13_14_15 16_17_18] AddFstRow [1_2_3 4_5_6] +10↯3_3⇡9
AssertEq [2 9 9 9 9 9 1] AddFstRow [2 4 3] [9 9 9 9 9 1]
---

# Challenge 5: Write a program that splits an array into its first row and the rest of its rows.

SplitFst ← [□⊢ ∶ □↘1 .]

---
AssertEq [□1 □2_3_4] SplitFst 1_2_3_4
AssertEq [□27 □[9 3 1]] SplitFst [27 9 3 1]
AssertEq [□0_1_2 □[3_4_5 6_7_8 9_10_11]] SplitFst ↯4_3⇡12
---

# Challenge 6: Write a program that boxes two strings and puts them in an array.

BoxTwo ← [∶ □ ∶ □]

---
AssertEq [□"Hello" □"World"] BoxTwo "Hello" "World"
AssertEq [□"ui" □"ua"] BoxTwo "ui" "ua"
AssertEq [□"dog" □"cat"] BoxTwo "dog" "cat"
---
