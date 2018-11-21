(in-package :ggg)

;;; AGENT CLASS
(defclass ggg-agent (agent)
  ()
  (:documentation "Grounded Guessing Game Agent"))

(defmethod speakerp ((agent ggg-agent))
  "Returns t if the agent is the speaker"
  (eql (discourse-role agent) 'speaker))

(defmethod hearerp ((agent ggg-agent))
  "Returns t if the agent is the hearer"
  (eql (discourse-role agent) 'hearer))
