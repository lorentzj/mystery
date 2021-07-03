(defun ????? (str)
	(let ((closed-str (concatenate 'string str " ")))
		(format nil "~{~a~}"
			(map 'list
				#'(lambda (i)
					(concatenate 'string
						(loop 
							for j across str and pos from 0
							when (eq j i) collect (char closed-str (1+ pos)))))
			(remove-duplicates str :from-end t)))))

(defun print-until-empty (s target)
		(format target "~a~%" s)
		(if (string= s (format nil "~v@{~A~:*~}" (length s) " "))
			nil
			(print-until-empty (????? s) target)))