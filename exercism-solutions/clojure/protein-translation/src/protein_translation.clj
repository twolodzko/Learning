(ns protein-translation)

(defn translate-codon [codon]
  (case codon
    "AUG" "Methionine"
    ("UUU" "UUC") "Phenylalanine"
    ("UUA" "UUG") "Leucine"
    ("UCU" "UCC" "UCA" "UCG") "Serine"
    ("UAU" "UAC") "Tyrosine"
    ("UGU" "UGC") "Cysteine"
    "UGG" "Tryptophan"
    ("UAA" "UAG" "UGA") "STOP"
    (throw (Exception. "invalid input"))))

(defn- collect-until
  ([value [x & xs :as a] acc]
   (if (or (empty? a) (= x value)) acc
       (recur value xs (conj acc x))))
  ([value lst] (reverse (collect-until value lst '()))))

(defn translate-rna [rna]
  (->> rna
       (partition 3)
       (map #(reduce str %))
       (map translate-codon)
       (collect-until "STOP")))
