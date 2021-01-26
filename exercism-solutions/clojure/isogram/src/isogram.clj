(ns isogram)

(defn isogram? [word]
  (->> word
       clojure.string/lower-case
       (#(clojure.string/replace % #"[ -]" ""))
       (#(= (count %) (count (distinct %))))))
