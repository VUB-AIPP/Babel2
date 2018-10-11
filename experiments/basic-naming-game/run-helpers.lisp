(in-package :basic-naming-game)

;;;; The 'strategies' parameter contains different configurations.
;;;; For every parameter of the experiment that is not present in
;;;; strategies, the default values will be used through the
;;;; keyword arguments of 'run-experiments'. So, if no :population-size
;;;; is specified in a given strategy, the default of 10 will be used.
;;;; Make sure you add a keyword argument with default value for each
;;;; parameter of your experiment. Additionally, add each parameter
;;;; of your experiment to the :shared-configuration keyword.

;;;; The 'monitors' keyword argument contains a list of all the monitors
;;;; that must be active during your experiment. Note that activating
;;;; an export monitor will automatically activate the associated record
;;;; monitor since this is required as a source of data.

;;;; The :output-dir specifies where the data of each experiment will be
;;;; stored in files.

(defun run-experiments (strategies
                         &key
                         (number-of-interactions 5)
                         (number-of-series 1)
                         (monitors
                           (list "export-communicative-success"))
                         (population-size 10)
                         ;; add experiment parameters with default values here
                         )
  (format t "~%Starting experimental runs")
  (run-batch-for-different-configurations
    :experiment-class 'bng-experiment  ;; make sure this is the name of your experiment class
    :number-of-interactions number-of-interactions
    :number-of-series number-of-series
    :monitors monitors
    :shared-configuration `((:population-size . ,population-size)
                            ;; add experiment parameters with reference to keyword argument here
                            )
    :configurations strategies
    :output-dir (babel-pathname :directory `("experiments" "basic-naming-game" "raw-data")))
  (format t "~%Experimental runs finished and data has been generated. You can now plot graphs."))

;;;; Below are helper functions to create plots. These assume that you
;;;; have exported data using an export monitor. These helper functions
;;;; are simple wrappers around functions of the plot-raw-data package.
;;;; If you need more fine-tuned control over your graphs, look in that
;;;; package and add keyword arguments here.

(defun create-graph-for-single-strategy (&key experiment-name measure-names y-axis y1-max y2-max)
  ;; This function allows you to plot one or more measures for a single experiment
  ;; e.g. communicative success and lexicon size
  (format t "~%Creating graph for experiment ~a with measures ~a" experiment-name measure-names)
  (raw-files->evo-plot
    :raw-file-paths
    (loop for measure-name in measure-names
          collect `("experiments" "basic-naming-game" "raw-data" ,experiment-name ,measure-name))
    :average-windows 100
    :plot-directory `("experiments" "basic-naming-game" "graphs")
    :error-bars '(:stdev)
    :error-bar-modes '(:lines)
    :use-y-axis y-axis
    :y1-min 0
    :y1-max y1-max
    :y2-min 0
    :y2-max y2-max)
  (format t "~%Graphs have been created"))

(defun create-graph-comparing-strategies (&key experiment-names measure-name (y-max 1))
  ;; This function allows you to compare a given measure accross different
  ;; experiments, e.g. comparing lexicon size
  (format t "~%Creating graph for experiments ~a with measure ~a" experiment-names measure-name)
  (raw-files->evo-plot
    :raw-file-paths
    (loop for experiment-name in experiment-names
          collect `("experiments" "basic-naming-game" "raw-data" ,experiment-name ,measure-name))
    :average-windows 100
    :captions experiment-names
    :plot-directory '("experiments" "basic-naming-game" "graphs")
    :error-bars '(:stdev)
    :error-bar-modes '(:lines)
    :y1-min 0
    :y1-max y-max)
  (format t "~%Graphs have been created"))

(defun create-stacked-bars-comparing-strategies (&key experiment-names measure-names)
  ;; This functions allows you to plot one or multiple measures for different
  ;; experiments. These will be plotted as stacked bars.
  (format t "~%Creating graph for experiments ~a with measures ~a" experiment-names measure-names)
  (file-structure->stacked-bar-plot
    :raw-file-paths
    (loop for experiment-name in experiment-names
          collect (loop for measure-name in measure-names
                        collect `("experiments" "basic-naming-game" "raw-data" ,experiment-name ,measure-name)))
    :plot-directory '("experiments" "basic-naming-game" "graphs")))

(defun create-grouped-bars-comparing-strategies (&key experiment-names measure-names)
  ;; This functions allows you to plot one or multiple measures for different
  ;; experiments. These will be plotted as grouped bars.
  (format t "~%Creating graph for experiments ~a with measures ~a" experiment-names measure-names)
  (file-structure->grouped-bar-plot
    :raw-file-paths
    (loop for experiment-name in experiment-names
          collect (loop for measure-name in measure-names
                        collect `("experiments" "basic-naming-game" "raw-data" ,experiment-name ,measure-name)))
    :plot-directory '("experiments" "basic-naming-game" "graphs")
    :error-bars :stdev))

;;;; To create competition graphs, we provide the following helper function.
;;;; This function also takes a list of keys and values for passing on the
;;;; experiment parameters, e.g. ((:population-size . 10) ...)

(defun create-competition-graph (&key 
                                 (configurations nil)
                                 (nr-of-interactions 2000))
  (format t "~%Running ~a experiments in order to create a
  competition graph. Please be patient." nr-of-interactions)
  (activate-monitor name-of-your-competition-monitor)  ;; change this into the name of your alist recorder monitor
  (run-batch 'bng-experiment nr-of-interactions 1
             :configuration (make-configuration :entries configurations))
  (deactivate-monitor name-of-your-competition-monitor)  ;; change this into the name of your alist recorder monitor
  (format t "~%Graphs have been created"))