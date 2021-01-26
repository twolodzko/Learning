(ns armstrong-numbers)

(defn get-digits [n]
  ((fn [x out]
     (if (= x 0) out
         (recur (quot x 10) (conj out (mod x 10)))))
   n '()))

(defn pow [x n]
  (reduce * (repeat n x)))

(defn armstrong? [num]
  (let [l (get-digits num)]
    (= num (reduce + (map (fn [x] (pow x (count l))) l)))))
