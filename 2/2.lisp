(ql:quickload "cl-utilities")
(use-package :cl-utilities)

(defun is-valid-password (min max item pass)
  (let ((c (count (char item 0) pass))
	(min (parse-integer min))
	(max (parse-integer max)))
    (when (and (>= c min) (<= c max)) t)))

(let
    ((input-list (mapcar #'(lambda (s) (split-sequence #\SPACE (substitute #\SPACE #\- (remove #\: s)))) (uiop:read-file-lines "input"))))
  (loop for list in input-list
	counting (apply #'is-valid-password list) into result
	finally (return result)))
