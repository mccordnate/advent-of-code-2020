(defun can-find-last (count collection)
  (eql (length collection) (- count 1)))

(defun found-last (collection list)
  (find (reduce #'- collection :initial-value 2020) list))

(defun check-2020-multiple (count test-collection l)
  (cond
    ((not l) nil)
    ((can-find-last count test-collection)
     (let ((last (found-last test-collection l)))
       (when last (return-from check-2020-multiple (* last (reduce #'* test-collection))))))
    (t (let ((result nil))
	 (setq result (check-2020-multiple count (append test-collection (list (car l))) (cdr l)))
	 (when result (return-from check-2020-multiple result))
	 (setq result (check-2020-multiple count test-collection (cdr l)))
	 (return-from check-2020-multiple result)))))
  

(check-2020-multiple 3 () (mapcar #'parse-integer (uiop:read-file-lines "input")))
