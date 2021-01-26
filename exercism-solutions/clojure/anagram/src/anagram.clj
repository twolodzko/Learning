(ns anagram)

(defn- anagram? [word candidate]
  (let [candidate (clojure.string/lower-case candidate)]
    (and
     (not= word candidate)
     (= (sort word) (sort candidate)))))

(defn anagrams-for [word prospect-list]
  (let [word (clojure.string/lower-case word)]
    (filter #(anagram? word %) prospect-list)))
