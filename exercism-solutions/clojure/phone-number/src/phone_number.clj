(ns phone-number)

(def null-number (reduce str (repeat 10 \0)))

(defn number [num-string]
  (let [only-digits (clojure.string/replace num-string #"\D" "")
        no-country-code (clojure.string/replace only-digits #"1(\d{10})" "$1")]
    (if (= 10 (count no-country-code))
      no-country-code
      null-number)))

(defn area-code [num-string] (subs (number num-string) 0 3))

(defn pretty-print [num-string]
  (clojure.string/replace (number num-string) #"(\d{3})(\d{3})(\d{4})" "($1) $2-$3"))
