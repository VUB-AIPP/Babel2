(in-package :asdf)

(defsystem :basic-naming-game
  :description "The basic Naming Game experiment"
  :depends-on (:utils
               :experiment-framework
               :test-framework
               :monitors
               :plot-raw-data
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
   (:file "run-helpers")))