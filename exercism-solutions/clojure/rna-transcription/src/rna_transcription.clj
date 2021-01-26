(ns rna-transcription)

(defn transcribe [x]
  (case x
    \G \C
    \C \G
    \T \A
    \A \U
    (throw (AssertionError. (str "Wrong character: " x)))))

(defn to-rna [dna]
  (clojure.string/join
   "" (map transcribe (seq dna))))
