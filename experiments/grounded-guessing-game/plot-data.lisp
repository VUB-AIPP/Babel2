(in-package :ggg)

(defun run-experiments (strategies
                         &key
                         (number-of-interactions 5)
                         (number-of-series 1)
                         (monitors
                          (list "export-communicative-success"))
                           (population-size 10))
  (format t "~%Starting experimental runs")
  (run-batch-for-different-configurations
    :experiment-class 'ggg-experiment  ;; make sure this is the name of your experiment class
    :number-of-interactions number-of-interactions
    :number-of-series number-of-series
    :monitors monitors
    :shared-configuration `((:population-size . ,population-size))
    :configurations strategies
    :output-dir (babel-pathname :directory `("experiments" "grounded-guessing-game" "raw-data")))
  (format t "~%Experimental runs finished and data has been generated. You can now plot graphs."))

(defun create-graph-for-single-strategy (&key experiment-name measure-names y-axis y1-max y2-max xlabel y1-label y2-label)
  ;; This function allows you to plot one or more measures for a single experiment
  ;; e.g. communicative success and lexicon size
  (format t "~%Creating graph for experiment ~a with measures ~a" experiment-name measure-names)
  (raw-files->evo-plot
    :raw-file-paths
    (loop for measure-name in measure-names
          collect `("experiments" "grounded-guessing-game" "raw-data" ,experiment-name ,measure-name))
    :average-windows 500
    :plot-directory `("experiments" "grounded-guessing-game" "graphs")
    :error-bars '(:stdev)
    :error-bar-modes '(:lines)
    :use-y-axis y-axis
    :y1-min 0
    :y1-max y1-max
    :y2-min 0
    :y2-max y2-max
    :x-label (if xlabel xlabel "Number of Games")
    :y1-label (when y1-label y1-label)
    :y2-label (when y2-label y2-label))
  (format t "~%Graphs have been created"))

(defun create-graph-comparing-strategies (&key experiment-names measure-name (y-min 0) (y-max 1) xlabel y1-label y2-label)
  ;; This function allows you to compare a given measure accross different
  ;; experiments, e.g. comparing lexicon size
  (format t "~%Creating graph for experiments ~a with measure ~a" experiment-names measure-name)
  (raw-files->evo-plot
    :raw-file-paths
    (loop for experiment-name in experiment-names
          collect `("experiments" "grounded-guessing-game" "raw-data" ,experiment-name ,measure-name))
    :average-windows 500
    :captions experiment-names
    :plot-directory '("experiments" "grounded-guessing-game" "graphs")
    :error-bars '(:stdev)
    :error-bar-modes '(:lines)
    :y1-min y-min
    :y1-max y-max
    :x-label (if xlabel xlabel "Number of Games")
    :y1-label (when y1-label y1-label)
    :y2-label (when y2-label y2-label))
  (format t "~%Graphs have been created"))

(defun create-stacked-bars-comparing-strategies (&key experiment-names measure-names)
  ;; This functions allows you to plot one or multiple measures for different
  ;; experiments. These will be plotted as stacked bars.
  (format t "~%Creating graph for experiments ~a with measures ~a" experiment-names measure-names)
  (file-structure->stacked-bar-plot
    :raw-file-paths
    (loop for experiment-name in experiment-names
          collect (loop for measure-name in measure-names
                        collect `("experiments" "grounded-guessing-game" "raw-data" ,experiment-name ,measure-name)))
    :plot-directory '("experiments" "grounded-guessing-game" "graphs")))

(defun create-grouped-bars-comparing-strategies (&key experiment-names measure-names)
  ;; This functions allows you to plot one or multiple measures for different
  ;; experiments. These will be plotted as grouped bars.
  (format t "~%Creating graph for experiments ~a with measures ~a" experiment-names measure-names)
  (file-structure->grouped-bar-plot
    :raw-file-paths
    (loop for experiment-name in experiment-names
          collect (loop for measure-name in measure-names
                        collect `("experiments" "grounded-guessing-game" "raw-data" ,experiment-name ,measure-name)))
    :plot-directory '("experiments" "grounded-guessing-game" "graphs")
    :error-bars :stdev))
