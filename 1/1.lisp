(defun check-2020 (l)
  (cond
    ((find (- 2020 (car l)) (cdr l)) (return-from check-2020 (* (car l) (- 2020 (car l)))))
    (t (check-2020 (cdr l)))))
  

(check-2020 (mapcar #'parse-integer (uiop:read-file-lines "input")))
