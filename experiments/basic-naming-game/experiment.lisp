(in-package :basic-naming-game)

;;;; This file defines your experiment class.
;;;; The bng-experiment is a subclass of the
;;;; experiment class, found in the experiment-framework.
;;;; This class already has the following slots:
;;;; id, agents, series-number, world, interactions

(defclass bng-experiment (experiment)
  ( ;; Define additional slots here
   )
  (:documentation "Basic Naming Game Experiment"))

(defmethod initialize-instance :after ((experiment bng-experiment) &key)
  ;; Initialize parameters of the experiment, e.g.
  ;; creating a population of agents or
  ;; defining the world of the experiment
  )

;;;; With Babel2, you can define 'configuration-default-values'
;;;; for parameters of the experiment. These are defined as shown below.
;;;; Use these to define all the parameters of your experiment!
;;;; Population size is given as an example. 

(define-configuration-default-value :population-size 10)

;;;; You can access configuration values through a method that
;;;; can be called on an experiment, e.g.:
;;;; (get-configuration experiment :population-size)