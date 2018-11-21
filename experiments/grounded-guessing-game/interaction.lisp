(in-package :ggg)

(defmethod interact :before ((experiment ggg-experiment) interaction &key)
  nil)

(defmethod interact ((experiment ggg-experiment) interaction &key)
  nil)

(defmethod interact :after ((experiment ggg-experiment) interaction &key)
  nil)
