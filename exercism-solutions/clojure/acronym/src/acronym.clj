(ns acronym)

(defn acronym [string]
  (->> string
       (#(clojure.string/replace % #"([a-z])([A-Z])" "$1 $2"))
       (#(clojure.string/split % #"[\s-]"))
       (map first)
       (clojure.string/join "")
       (clojure.string/upper-case)))
