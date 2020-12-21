(defvar tree-map (uiop:read-file-lines "input"))
(defvar hill-width (length (nth 0 tree-map)))
(defvar hill-height (length tree-map))

(defun get-char (x y)
  (char (nth y tree-map) (mod x hill-width)))

(defun is-tree (c)
  (when (eql c #\#) t))

(defun ride (moveX moveY)
  (loop sum moveX into currX
	sum moveY into currY
	until (eql currY hill-height)
	counting (is-tree (get-char currX currY)) into count
	finally (return count)))
