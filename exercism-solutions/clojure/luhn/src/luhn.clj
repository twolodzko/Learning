(ns luhn)

(defn char->int [ch] (- (int ch) 48))

(defn luhn-transform [x]
  (#(if (> % 9) (- % 9) %) (* 2 x)))

(defn lunh-sum [digits]
  (reduce + (map-indexed
             #(if (even? %1)
                (char->int %2)
                (luhn-transform (char->int %2)))
             (reverse digits))))

(defn valid? [number]
  (let [digits (clojure.string/replace number #"\D" "")]
    (and
     (nil? (re-find #"[^\d ]" number))
     (> (count digits) 1)
     (= (mod (lunh-sum digits) 10) 0))))
