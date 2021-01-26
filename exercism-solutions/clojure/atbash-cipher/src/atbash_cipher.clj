(ns atbash-cipher)

(def encoding
  (zipmap "abcdefghijklmnopqrstuvwxyz"
          (reverse "abcdefghijklmnopqrstuvwxyz")))

(defn encode [text]
  (->> text
       clojure.string/lower-case
       (#(clojure.string/replace % #"[^a-z0-9]" ""))
       (map #(get encoding % %))
       (partition-all 5)
       (map #(clojure.string/join "" %))
       (clojure.string/join " ")))
