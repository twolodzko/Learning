(ns rotational-cipher)

(defn rotate-char [ch n]
  (if (not (Character/isLetter ch)) ch
      ;; ASCII codes: A -> 65, a -> 97
      (let [base (if (Character/isUpperCase ch) 65 97)]
        (char (+ (mod (+ (- (int ch) base) n) 26) base)))))

(defn rotate [string n]
  (->> string
       (map #(rotate-char % n))
       (clojure.string/join "")))
