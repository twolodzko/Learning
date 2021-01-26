(ns pangram)

(defn pangram? [string]
  (= 26
     (->> string
          (clojure.string/lower-case)
          (filter #(Character/isLetter %))
          (set)
          (count))))
