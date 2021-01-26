(ns accumulate)

(defn accumulate [func lst]
  ((fn [lst out]
     (if (empty? lst)
       (reverse out)
       (recur
        (rest lst)
        (cons (func (first lst)) out))))
   lst []))
