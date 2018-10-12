(in-package :cl-user)

(defpackage :basic-naming-game
  (:documentation "The basic Naming Game experiment")
  (:use :common-lisp
        :utils
        :test-framework
        :experiment-framework
        :monitors
        :plot-raw-data
        #+hunchentoot-available-on-this-platform :web-interface))
  
