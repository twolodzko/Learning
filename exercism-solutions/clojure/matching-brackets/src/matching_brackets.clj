(ns matching-brackets
  (:use clojure.test))

(defn bracket? [ch]
  (contains? #{\( \) \[ \] \{ \}} ch))

(def closing-bracket {\( \)
                      \[ \]
                      \{ \}})

(defn valid?
  ([string stack]
   (if (empty? string)
     (empty? stack)
     (let [ch (first string)]
       (if (bracket? ch)
         (cond
           (= ch (peek stack)) (recur
                                (rest string)
                                (pop stack))
           :else (if-let
                  [br (get closing-bracket ch)]
                   (recur
                    (rest string)
                    (conj stack br))
                   ; no match means that it's a closing bracket
                   ; but we didn't expect it here
                   false))
         (recur (rest string) stack)))))
  ([string]
   (valid? string '())))


;; My tests


(deftest test-valid?
  (is (valid? ""))
  (is (valid? "()"))
  (is (valid? "[]"))
  (is (valid? "{}"))
  (is (valid? "a{bcd}e"))
  (is (valid? "([{(())}])"))
  (is (valid? " (   xx[zz{(d(2+2)e)%}&&])0  "))
  (is (false? (valid? ")")))
  (is (false? (valid? ")(")))
  (is (false? (valid? "(]")))
  (is (false? (valid? ")")))
  (is (false? (valid? "())")))
  (is (false? (valid? "[(])"))))

(run-tests)
