(ns run-length-encoding)

(defn rle [lst]
  "run-length-encoding for list of characters"
  ((fn [inp out]
     (if (empty? inp)
       (reverse out)
       (let [n (first (first out))
             x (second (first out))]
         (recur
          (next inp)
          (if (= (first inp) x)
            (conj (next out) (list (inc n) x))
            (conj out (list 1 (first inp))))))))
   lst '()))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (clojure.string/join
   (map
    (fn [x]
      ; special case for skipping 1's
      (if (= (first x) 1)
        (second x)
        (clojure.string/join x)))
    (rle (seq plain-text)))))

(defn split-symbols [lst]
  "split string to integers and characters"
  ((fn [inp out]
     (if (empty? inp)
       (reverse out)
       (let [x (first inp)]
         (if (Character/isDigit x)
           (if (int? (first out))
             (recur
              (next inp)
              (conj
               (next out)
               ; collect digits as a single number
               (+ (* (first out) 10)
                  (Character/digit x 10))))
             (recur
              (next inp)
              (conj out (Character/digit x 10))))
           (recur
            (next inp)
            (conj out x))))))
   lst '()))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  ((fn [inp out]
     (if (empty? inp)
       out
       (let [h (first inp)
             t (next inp)]
         (if (char? h)
           (recur t (str out h))
           (recur
            (next t)
            (str out (clojure.string/join
                      "" (repeat h (first t)))))))))
   (split-symbols cipher-text) ""))
