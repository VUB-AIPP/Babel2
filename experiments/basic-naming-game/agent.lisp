(in-package :basic-naming-game)

;;;; This file defines the agent class. Use it to
;;;; implement parts of the interaction script.
;;;; The bng-agent is a subclass of the agent class,
;;;; found in the experiment-framework. This agent class
;;;; already has the following slots:
;;;; experiment, id, discourse-role, utterance and
;;;; communicated-successfully

(defclass bng-agent (agent)
  ( ;; Give your bng-agent additional slots here, such as lexicon
   )
  (:documentation "basic Naming Game Agent"))

(defmethod initialize-instance :after ((agent bng-agent) &key)
  ;; Initialization method of the bng-agent. You can use this
  ;; to set certain values when a bng-agent instance is created.
  )

(defmethod produce ((agent bng-agent))
  ;; Parts of the interaction script can be implemented as
  ;; methods on the agents. Here, production is given as an
  ;; example.
  )

;;;; An agent can also access the configuration values of the experiment
;;;; but only if the experiment slot of your agent is set to your experiment!
;;;; Again, use the same method to access configuration values, e.g.:
;;;; (get-configuration agent :population-size)