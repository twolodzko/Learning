(ns binary-search
  (:use clojure.test))

(defn middle [lst]
  (int (/ (count lst) 2)))

(defn- return-if-found [result]
  (if (nil? result)
    (throw (Exception. "not found"))
    result))

(defn search-for
  ([x lst pos]
   (if (<= (count lst) 1)
     (when (= x (first lst)) pos)
     (let [pair (split-at (middle lst) lst)]
       (if (< x (first (second pair)))
         ; left branch
         (recur
          x
          (first pair)
          pos)
         ; right branch
         (recur
          x
          (second pair)
          (+ pos (count (first pair))))))))
  ([x lst]
   (return-if-found
    (search-for x lst 0))))


;; My tests


(deftest test-middle
  (is (= (middle '()) 0))
  (is (= (middle '(1)) 0))
  (is (= (middle '(1 2)) 1))
  (is (= (middle '(1 2 3)) 1))
  (is (= (middle '(1 2 3 4)) 2)))

(deftest test-search-for
  (is (= (search-for 1 '(1) 0) 0))
  (is (= (search-for 1 '(1 2) 0) 0))
  (is (= (search-for 2 '(1 2) 0) 1))
  (is (nil? (search-for 3 '(1 2) 0)))
  (is (nil? (search-for 0 '(1 2) 0)))
  (is (= (search-for 2 '(1 2 3 4 5) 0) 1))
  (is (= (search-for 4 '(1 2 3 4 5) 0) 3))
  (is (= (search-for 5 '(1 2 3 4 5) 0) 4))
  (is (nil? (search-for 50 '(1 2 3 4 5) 0)))
  (is (= (search-for 1 '(1) 100) 100))
  (is (=
       (search-for 7 '(1 1 3 5 6 7 8 8 9) 0)
       (search-for 7 '(1 1 3 5 6 7 8 8 9)))))

(run-tests)
