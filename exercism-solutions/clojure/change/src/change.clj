(ns change
  (:use clojure.test))

(defn- is-valid? [result]
  (if (not (nil? result)) result
      (throw (IllegalArgumentException. "cannot change"))))

(defn issue-greedy
  ([to-issue available-coins change]
   (cond
     (= to-issue 0) change
     (or (< to-issue 0) (empty? available-coins)) nil
     :else (let [coin (first available-coins)]
             (if (>= to-issue coin)
               (recur (- to-issue coin) available-coins (conj change coin))
               (recur to-issue (rest available-coins) change)))))
  ([to-issue available-coins]
   (is-valid?
    (issue-greedy to-issue (sort > available-coins) '()))))

(defn issue [to-issue available-coins]
  (issue-greedy to-issue available-coins))


;; My tests


(deftest test-iter-skip
  (is (= (iter-skip (fn [x] x) '()) '()))
  (is (= (iter-skip (fn [x] x) '(1)) '(())))
  (is (= (iter-skip (fn [x] x) '(1 2)) '((2) (1))))
  (is (= (iter-skip (fn [x] x) '(1 2 3)) '((2 3) (1 3) (1 2)))))

(run-tests)
