(require 'package)

;; initialize package mangement sysystem

(setq package-archives    (quote
    (("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
     ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/"))))

;;(add-to-list 'package-archives             '("melpa" . "https://melpa.org/packages/") t)
;;(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
;;  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
;;)
;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
;;(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
(package-initialize)
(unless package-archive-contents (package-refresh-contents nil))



(defun file-content (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(defun write-content (file-path content)
  "write  content to file-path"
  (with-temp-file  file-path
    (insert 
     (with-output-to-string
       (princ content)
     )))) 

(defun installed-package-names ()
  (mapcar 'car package-alist))


(defun available-package-names ()
  (mapcar 'car package-archive-contents))

(defun tt-store-package-names()
  " store current installed packages into configure file   ~/.emacs.d/pkgnames"
  (interactive)
  (with-temp-file  "~/.emacs.d/pkgnames"
    (insert (with-output-to-string
      (princ (installed-package-names))))
    )
)

(defun tt-read-package-names()
  (car (read-from-string  (file-content "~/.emacs.d/pkgnames")))
  )


(defun tt-ensure-packages-installed ()
  "ensure packages installed, if not,  install them "
  (interactive)
  (setq pkgns  (tt-read-package-names))
  (setq pkgns-avail (available-package-names))
  (dolist (pkgn pkgns)
    (unless (package-installed-p pkgn)
      (if (member pkgn pkgns-avail)
	  (progn 
	    (print (format "Installing %s" pkgn))
            (package-install pkgn)
	    )
	(print (format "Not finding %s" pkgn))
	)
)))

(tt-ensure-packages-installed)


