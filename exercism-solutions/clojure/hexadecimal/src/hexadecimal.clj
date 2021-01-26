(ns hexadecimal)

(defn pow [x n]
  (reduce * (repeat n x)))

(defn transform [x]
  (- (int x)
     (case x
       (\0 \1 \2 \3 \4 \5 \6 \7 \8 \9) 48
       (\A \B \C \D \E \F) 55)))

(defn hex-to-int [hex]
  (let [str (clojure.string/upper-case hex)]
    (if (not-every?
         #(contains? #{\0 \1 \2 \3 \4 \5 \6 \7
         \8 \9 \A \B \C \D \E \F} %) str) 0
        (->> str
             (map transform)
             (map #(* %2 (pow 16 %1))
                  (range (dec (count hex)) -1 -1))
             (reduce +)))))
