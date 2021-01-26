(ns space-age)

(defn on-earth [x]
  (/ x 31557600))

(defn- space-age [x correction]
  (/ (on-earth x) correction))

(defn on-mercury [x]
  (space-age x 0.2408467))

(defn on-venus [x]
  (space-age x 0.61519726))

(defn on-mars [x]
  (space-age x 1.8808158))

(defn on-jupiter [x]
  (space-age x 11.862615))

(defn on-saturn [x]
  (space-age x 29.447498))

(defn on-neptune [x]
  (space-age x 164.79132))

(defn on-uranus [x]
  (space-age x 84.016846))
