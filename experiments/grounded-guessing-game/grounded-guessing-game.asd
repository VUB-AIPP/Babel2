(in-package :asdf)

(defsystem :grounded-guessing-game
  :description "The GroundednGuessing Game experiment based on Martin Loetzsch (2014)"
  :depends-on (:utils
               :experiment-framework
               :test-framework
               :monitors
               :plot-raw-data
               :physical-robot-world
               #+hunchentoot-available-on-this-platform :web-interface)
  :serial t
  :components
  ((:file "package")
   (:file "utils")
   (:file "world")
   (:file "lexicon")
   (:file "agent")
   (:file "experiment")
   (:file "interaction")
   (:file "monitors")
   (:file "plot-data")))
