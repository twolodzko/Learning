(ns sublist)

(defn sublist? [list1 list2]
  (if (> (count list1) (count list2)) false
      (or
       (every? true? (map = list1 list2))
       (recur list1 (rest list2)))))

(defn classify [list1 list2]
  (cond
    (= list1 list2) :equal
    (sublist? list1 list2) :sublist
    (sublist? list2 list1) :superlist
    :else :unequal))
