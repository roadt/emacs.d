

;;
;; load all .el file under dir
;;
(defun load-directory (dir)
  (let ((load-it (lambda (f) (load-file (concat (file-name-as-directory dir) f)))))
		(mapc load-it (directory-files dir nil "\\.el$"))
    )
  )


;;
;; load config file,   load if feature has already been loaded,
;; otherwise register eval-after-load
;;
(defun make-loader (init-file)
	(lexical-let ((f init-file))
		(lambda () (load-file f))))

(defun load-config-file (f)
  (let ((bn (file-name-base f)))
		(if (featurep (intern bn))
				(load-file f)
			(eval-after-load (intern bn) (make-loader f)))))


;;
;; load all config files under given directory
;;
(defun load-config-directory (dir)
  (mapc 'load-config-file
           (directory-files dir 1 "\\.el$")))

