(in-package :ggg)

;;; CONFIGURATIONS
(define-configuration-default-value :population-size 10)

;;; EXPERIMENT CLASS
(defclass ggg-experiment (experiment)
  ()
  (:documentation "Grounded Guessing Game Experiment"))
                                     
