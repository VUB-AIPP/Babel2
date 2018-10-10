(in-package :basic-naming-game)

;;;; Use this file to implement the interaction script.
;;;; The experiment-framework already contains an interaction
;;;; class. You probably do not need to subclass this, but
;;;; you can if you want. The interaction class contains the
;;;; following slots:
;;;; experiment, interaction-number, interacting-agents and
;;;; communicated-successfully.

;;;; Overload the 'interact' method to implement the interaction
;;;; script. The interact method will be called when running an
;;;; experiment either through 'run-interaction', 'run-series' or
;;;; any other available method.

;;;; Make sure to take a look at what the experiment-framework
;;;; already provides! By default, the speaker and hearer will
;;;; be randomly chosen before every interaction through the method
;;;; 'determine-interacting-agents'. If you want, you can overload
;;;; this method.

;;;; You can access the speaker and hearer of the current interaction
;;;; through the 'speaker' or 'hearer' method, which can be called both
;;;; on an experiment or on an interaction. Alternatively, you can
;;;; get both agents through calling 'interacting-agents' on an
;;;; experiment.

(defmethod interact :before ((experiment bng-experiment) interaction &key)
  ;; Do stuff before an interaction, e.g.
  ;; preparing the agents of the interaction
  )

(defmethod interact ((experiment bng-experiment) interaction &key)
  ;; Implement the interaction script here
  )

(defmethod interact :after ((experiment bng-experiment) interaction &key)
  ;; Do stuff after an interaction, e.g.
  ;; the lexicon alignment mechanism
  )