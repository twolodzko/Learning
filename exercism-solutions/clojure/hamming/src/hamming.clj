(ns hamming)

(defn distance [strand1 strand2]
  (when (= (count strand1) (count strand2))
    (reduce + (map #(if (not= %1 %2) 1 0) strand1 strand2))))
