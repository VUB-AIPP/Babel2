
(ql:quickload :basic-naming-game)
(in-package :basic-naming-game)

;;;; To test your experiment manually, we make an instance of it.
;;;; This instance will have all the default parameter configurations.
;;;; You can add configurations through the :configurations keyword.

(defparameter *experiment*
  (make-instance 'bng-experiment
                 :configurations '((:population-size . 10))))

;;;; To run a single interaction, use #'run-interaction

(run-interaction *experiment*)

;;;; To run a series of interactions, use #'run-series

(run-series *experiment* 10)

;;;; To run multiple series of interactions, use #'run-batch

(run-batch *experiment* 10 2)

;;;; To run multiple series of interactions for different
;;;; configurations, you can use #'run-batch-for-different-configurations
;;;; Additionally, we provide the helper functions to easily
;;;; run and store batches for different configurations. These are
;;;; defined in 'run-helpers.lisp'.

;;;; Using 'run-experiment', you can define different strategies (or
;;;; parameter configurations), give each of them a name and run
;;;; each of them for the same amount of series and interactions.
;;;; Below, we give a simple example of different strategies:
(run-experiments '(
                   ;(name-of-experiment ((:key . :value)
                   ;                     (:key . :value)
                   ;                     ))
                   (small-population-size ((:population-size . 3)))
                   (large-population-size ((:population-size . 50)))
                   )
                 :number-of-interactions 20
                 :number-of-series 1)

;;;; When the experiments have finished running, you can create plots from them.
;;;; For this, use the names of the strategies as 'experiment-names' and use the
;;;; name of the file (as defined in your export monitor) as the 'measure-names'.
;;;; Some examples:

(create-graph-for-single-strategy
 :experiment-name "small-population-size"
 :measure-names '("communicative-success"
                  "lexicon-size")
 :y-axis '(1 2)  ;; Specify which measure goes on which axis. 1 = left y-axis, 2 = right y-axis
 :y1-max 1.0
 :y2-max 20)

(create-graph-comparing-strategies
 :experiment-names '("small-population-size"
                     "large-population-size")
 :measure-name "communicative-success"
 :y-max 1.0)