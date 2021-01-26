(ns binary)

(defn pow [x n]
  (reduce * (repeat n x)))

(defn to-decimal [binary]
  (if (not-every? #(contains? #{\0 \1} %) binary) 0
      (->> binary
           (map #(- (int %) 48))
           (map #(* %2 (pow 2 %1))
                (range (dec (count binary)) -1 -1))
           (reduce +))))
