(ns flatten-array
  (:use clojure.test))

(defn- array? [x]
  (or (seq? x) (vector? x)))

(defn- flatten-rev [[x & xs :as a] acc]
  (if (empty? a) acc
      (recur
       xs
       (cond
         (nil? x) acc
         (array? x) (concat (flatten-rev x '()) acc)
         :else (conj acc x)))))

(defn flatten [arr]
  (reverse
   (flatten-rev arr '())))


;; My tests


(deftest test-flatten
  (is (= (flatten '()) '()))
  (is (= (flatten '(nil)) '()))
  (is (= (flatten '(1)) '(1)))
  (is (= (flatten '(1 2)) '(1 2)))
  (is (= (flatten '(1 (2))) '(1 2)))
  (is (= (flatten '(1 [2])) '(1 2)))
  (is (= (flatten '(1 (nil))) '(1)))
  (is (= (flatten '(1 [[2]] (3))) '(1 2 3)))
  (is (= (flatten '(1 (2 3))) '(1 2 3))))

(run-tests)
