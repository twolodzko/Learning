(ns reverse-string)

(defn reverse-string [s]
  ((fn [inp out]
     (if (empty? inp) out
         (recur
          (next inp)
          (str (first inp) out))))
   s ""))
