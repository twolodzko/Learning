(ns binary-search-tree
  (:use clojure.test))

(defn value [node]
  (first node))

(defn singleton [x]
  (list x nil nil))

(defn left [node]
  (second node))

(defn right [node]
  (second (rest node)))

(defn insert [x node]
  (if (<= x (value node))
    (list
     (value node)
     (if (nil? (left node))
       (singleton x)
       (insert x (left node)))
     (right node))
    (list
     (value node)
     (left node)
     (if (nil? (right node))
       (singleton x)
       (insert x (right node))))))

(defn from-list
  ([lst tree]
   (if (empty? lst)
     tree
     (recur
      (next lst)
      (insert (first lst) tree))))
  ([lst]
   (from-list
    (next lst)
    (singleton (first lst)))))

(defn to-list
  ([tree acc]
   (if (nil? tree) '()
       (concat
        (to-list (left tree))
        (conj acc (value tree))
        (to-list (right tree)))))
  ([tree]
   (to-list tree [])))


;; My tests


(deftest test-singleton
  (is (= (singleton 1) '(1 nil nil))))

(deftest test-value
  (is (= (value (singleton 1)) 1)))

(deftest test-left
  (is (nil? (left '(4 nil nil))))
  (is (nil? (left '(4 nil (5 nil nil)))))
  (is (=
       (left '(4 (3 nil nil) nil))
       '(3 nil nil)))
  (is (=
       (left '(4 (2 nil (3 nil nil)) nil))
       '(2 nil (3 nil nil)))))

(deftest test-right
  (is (nil? (right '(4 nil nil))))
  (is (nil? (right '(4 (3 nil nil) nil))))
  (is (=
       (right '(4 nil (5 nil nil)))
       '(5 nil nil)))
  (is (=
       (right '(5 nil (6 nil (7 nil nil))))
       '(6 nil (7 nil nil)))))

(deftest test-insert
  (is (=
       (insert 1 (singleton 2))
       '(2 (1 nil nil) nil)))
  (is (=
       (insert 3 (singleton 2))
       '(2 nil (3 nil nil))))
  (is (=
       (insert 1 (insert 1 (singleton 1)))
       '(1 (1 (1 nil nil) nil) nil)))
  (is (=
       (insert 2 '(7 (3 nil (4 nil nil)) (9 nil (12 nil nil))))
       '(7 (3 (2 nil nil) (4 nil nil)) (9 nil (12 nil nil))))))

(deftest test-from-list
  (is (=
       (from-list [4 2 6 5 1 1])
       '(4 (2 (1 (1 nil nil) nil) nil) (6 (5 nil nil) nil)))))

(deftest test-from-to-list
  (is (=
       (to-list (from-list '(5 7 1 2 3 4 2 8 1 3)))
       '(1 1 2 2 3 3 4 5 7 8))))

(run-tests)
