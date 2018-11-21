(in-package :cl-user)

(defpackage :grounded-guessing-game
  (:documentation "The Guessing Game experiment")
  (:use :common-lisp
        :utils
        :test-framework
        :experiment-framework
        :monitors
        :plot-raw-data
        :physical-robot-world
        #+hunchentoot-available-on-this-platform :web-interface)
  (:nicknames :ggg))
  
