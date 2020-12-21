(ql:quickload "cl-utilities")
(use-package :cl-utilities)

(defun is-valid-password (occ1 occ2 item pass)
  (let ((first (char pass (- (parse-integer occ1) 1)))
	(second (char pass (- (parse-integer occ2) 1)))
	(item (char item 0)))
    (when (not (eql (eql first item) (eql second item))) t)))

(let
    ((input-list (mapcar #'(lambda (s) (split-sequence #\SPACE (substitute #\SPACE #\- (remove #\: s)))) (uiop:read-file-lines "input"))))
  (loop for list in input-list
	counting (apply #'is-valid-password list) into result
	finally (return result)))
