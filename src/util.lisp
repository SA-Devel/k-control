(in-package :util)





(ql:quickload 'secure-random)




(defmacro generator (dictionary length)
  (let* ((row        (lambda () (secure-random:number 47)))
	 (column     (lambda () (secure-random:number 2)))
	 (element    (lambda () (aref dictionary (funcall row) (funcall column))))
	 (collection (loop repeat length collect (funcall element))))
    `(concatenate 'string ,@collection)))




(defmacro password (length)
  (ignore-errors
   `(cond ((typep ,length 'fixnum)
	   (format nil "~2% Result:  ~A~3%" (generator ,*dictionary* ,length)))
	  (t " Incorrect input number!"))))
