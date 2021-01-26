(ns etl
  (:use clojure.test))

(defn- array? [lst]
  (or (seq? lst) (vector? lst)))

(defn- lower-case-keys [dct]
  (into
   {}
   (map
    #(vector
      (clojure.string/lower-case (first %))
      (second %))
    dct)))

(defn- map'
  ([[x & xs :as dct] acc]
   (if (empty? dct)
     (reverse acc)
     (let [k (first x)
           v (second x)]
       (recur
        xs
        (if (array? v)
          (concat
           (map hash-map (reverse v) (repeat (count v) k))
           acc)
          (conj acc (hash-map v k)))))))
  ([dct] (map' dct '())))

(defn- reduce'
  ([[x & xs :as lst] dct]
   (if (empty? lst) dct
       (recur xs (merge-with list dct x))))
  ([lst]
   (reduce' lst {})))

(defn transform [source]
  (-> source
      map'
      reduce'
      lower-case-keys))


;; My tests


(deftest test-lower-case-keys
  (is (= (lower-case-keys {"A" 1, "b" 2, "CDe" 3}) {"a" 1, "b" 2, "cde" 3})))

(deftest test-map'
  (is (= (map' {:a 1}) '({1 :a})))
  (is (= (map' {:a 1, :b 2, :c 3}) '({1 :a}, {2 :b}, {3 :c})))
  (is (= (map' {:a 1, :b '(2 3), :c 4}) '({1 :a}, {2 :b}, {3 :b} {4 :c}))))

(deftest test-reduce'
  (is (= (reduce' '({:a 1} {:a 2} {:c 3})) {:a '(1 2), :c 3})))

(deftest test-transform
  (is (= (transform {1 "a", 2 "b", 3 "c"}) {"a" 1, "b" 2, "c" 3}))
  (is (= (transform {1 '("ONE" "EIN")}) {"one" 1, "ein" 1})))

(run-tests)
