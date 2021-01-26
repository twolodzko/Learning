(ns series)

(defn slices [string length]
  (->> string
       (partition length 1)
       (map #(clojure.string/join "" %))
       distinct))
