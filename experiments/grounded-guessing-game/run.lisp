
(ql:quickload :grounded-guessing-game)
(in-package :ggg)

(run-experiments '(
                   
                   
                   )
                 :number-of-interactions 2500
                 :number-of-series 10)

(create-graph-for-single-strategy
 :experiment-name "baseline"
 :measure-names '("discriminative-success"
                  "communicative-success"
                  "communicative-success-given-discriminative-success"
                  "lexicon-size")
 :y-axis '(1 1 1 2)
 :y1-max 1.0
 :xlabel "# Games"
 :y1-label "Success"
 :y2-label "Lexicon Size")

(create-graph-comparing-strategies
 :experiment-names '("speaker-all-hearer-all"
                     "speaker-all-hearer-one"
                     "speaker-one-hearer-all"
                     "speaker-one-hearer-one")
 :measure-name "lexicon-size"
 :xlabel "# Games"
 :y-max nil
 :y1-label "Lexicon Size")








;; how to plot #games/agent instead of total number of games?
;; use the :record-every-x-interactions configuration and set it to half the population size
;; Run a number of interactions, e.g. 5000

;; If increasing the population size (e.g. from 10 to 20, so 2x),
;; also adapt the :record-every-x-interactions (2x)
;; and the number of interactions (2x)

;; How many items on the x-axis will there be for a given configuration?
;; Given 10 agents and 5000 interactions. In every interaction, there are 2 agents
;; (a speaker and a hearer). So, each agent will participate in 1 / (population-size / 2)
;; interactions. So, there will be nr-of-interactions * (1 / (population-size / 2)) items
;; on the x-axis.
