(ns bob)
(use 'clojure.string)

(defn response-for [s]
  (let [c (replace s #"[^A-Za-z!?]" "")]
    (cond
      (and (= c (upper-case c)) (ends-with? c "?")) "Calm down, I know what I'm doing!"
      (= "" c) "Fine. Be that way!"
      (ends-with? c "?") "Sure."
      (= c (upper-case c)) "Whoa, chill out!"
      :else "Fine. Be that way!")))
