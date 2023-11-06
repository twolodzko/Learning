AssertEq ← &i "helpers.ua" "AssertEq"

IndexesOfSubstrings ← ▽ ≠0. × ⊃(+1⇡⧻) ∘ ⌕

---
AssertEq [] IndexesOfSubstrings "xyz" "abracadabra"
AssertEq [1 8] IndexesOfSubstrings "abr" "abracadabra"
AssertEq [1] IndexesOfSubstrings "abc" "abc"
---
