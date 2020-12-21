(load "3.lisp")

(defun solve-part-2 ()
  (let ((routes '((1 1)
	   (3 1)
	   (5 1)
	   (7 1)
	   (1 2))))
    (loop for route in routes
	  collect (apply #'ride route) into tree-counts
	  finally (return (reduce #'* tree-counts)))))
