(ns nucleotide-count)

(defn nucleotide? [nucleotide]
  (contains? #{\A \T \C \G} nucleotide))

(defn nucleotide-counts [strand]
  ((fn [inp counter]
     (if (empty? inp)
       counter
       (recur
        (next inp)
        (update counter (first inp) inc))))
   strand {\A 0, \T 0, \C 0, \G 0}))

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (if (nucleotide? nucleotide)
    (get (nucleotide-counts strand) nucleotide)
    (throw (AssertionError. "incorrect nucleotide code"))))
