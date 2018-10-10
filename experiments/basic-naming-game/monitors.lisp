(in-package :basic-naming-game)

;;;; Use this file to define your monitors
;;;; and event handlers. Some events are already
;;;; pre-defined such as interaction-started,
;;;; interaction-finished and interacting-agents-determined.
;;;; These are notified in 'run-interaction'. Here you can
;;;; see what variables are available for use in the
;;;; event handlers.

;;;; Recording, displaying and exporting communicative success
;;;; is given as an example. The event handler triggers on the
;;;; interaction-finished event.

;;;; For more information on monitors and how to use them, we
;;;; refer to the Babel2 manual.

(define-monitor record-communicative-success
                :class 'data-recorder
                :average-window 100
                :documentation "records the game outcome of each game (1 or 0).")

(define-monitor display-communicative-success
                :class 'gnuplot-display
                :documentation "Plots the communicative success."
                :data-sources '((average record-communicative-success))
                :update-interval 100
                :caption '("communicative success")
                :x-label "# Games" 
                :y1-label "Communicative Success" 
                :y1-max 1.0 :y1-min 0 
                :draw-y1-grid t)

(define-monitor export-communicative-success
                :class 'lisp-data-file-writer
                :documentation "Exports communicative success"
                :data-sources '(record-communicative-success)
                :file-name (babel-pathname :name "communicative-success" :type "lisp"
                                           :directory '("experiments" "basic-naming-game" "raw-data"))
                :add-time-and-experiment-to-file-name nil
                :column-separator " "
                :comment-string "#")

(define-event-handler (record-communicative-success interaction-finished)
                      (record-value monitor
                                    (if (communicated-successfully interaction) 1 0)))