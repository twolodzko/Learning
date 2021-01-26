(ns beer-song)

(defn verse
  "Returns the nth verse of the song."
  [num]
  (case num
    0 "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    1 "1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.\n"
    (str num " bottles of beer on the wall, " num " bottles of beer.
Take one down and pass it around, " (dec num) " bottle" (if (> num 2) "s" "") " of beer on the wall.\n")))

(defn sing
  "Given a start and an optional end, returns all verses in this interval. If
  end is not given, the whole song from start is sung."
  ([start] (sing start 0))
  ([start end]
   (->> (range start (dec end) -1)
        (map verse)
        ; additional newline between verses
        (map #(str % "\n"))
        (reduce str)
        ; remove the final newline character
        (#(clojure.string/join "" (drop-last %))))))
