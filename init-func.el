

;;
;; load all .el file under dir
;;
(defun load-directory (dir)
  (let ((load-it (lambda (f) (load-file (concat (file-name-as-directory dir) f)))))
		(mapc load-it (directory-files dir nil "\\.el$"))
    )
  )


;;
;; load config file,  only load if feature has already been loaded
;;
(defun load-config-file (f)
  (if (featurep  (intern (file-name-base f)))
      (load-file f)))

;;
;; load all config files under given directory
;;
(defun load-config-directory (dir)
  (mapc 'load-config-file
           (directory-files dir 1 "\\.el$")))

