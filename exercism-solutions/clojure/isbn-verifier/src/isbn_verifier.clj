(ns isbn-verifier)

(defn isbn? [isbn]
  "validate ISBN-10 code"
  (let [nums (->> isbn
                  (filter #(not= % \-))
                  (map #(if (= % \X) 10 (Character/digit % 10))))]
    (and
     (= (count nums) 10)
     ; Character/digit returns digit or -1 for non-digit chars
     (every? #(>= % 0) nums)
     ; only the last character can be X
     (every? #(< % 10) (butlast nums))
     (= 0 (mod (->> nums
                    (map * (range 10 0 -1))
                    (reduce +))
               11)))))
