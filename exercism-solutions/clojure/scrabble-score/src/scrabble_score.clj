(ns scrabble-score)

(defn score-letter [chr]
  (case chr
    (\D \G) 2
    (\B \C \M \P) 3
    (\F \H \V \W \Y) 4
    \K 5
    (\J \X) 8
    (\Q \Z) 10
    1))

(defn score-word [word]
  (->> word
       clojure.string/upper-case
       (map score-letter)
       (reduce +)))
