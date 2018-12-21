(in-package :robot-interface)

(export '(speak recognise-words))

(defun speak (robot speech &key (speed 100))
  "Make the robot say something"
  #+nao (nao-speak robot speech :speed speed))

(defun recognise-words (robot words)
  "Recognise the given list of words. To stop the speech recognition, touch the middle of Nao's head"
  #+nao (let ((subscriber (nao-start-speech-recognition robot words)))
          (when (nao-detect-touch robot :head :middle)
            (nao-stop-speech-recognition robot subscriber))))
