(ns collatz-conjecture)

(defn collatz [num]
  (if (<= num 0)
    (throw (AssertionError. "number needs to be positive"))
    ((fn [x n]
       (if (= x 1) n
           (recur
            (if (even? x)
              (/ x 2)
              (+ (* x 3) 1))
            (inc n))))
     num 0)))
