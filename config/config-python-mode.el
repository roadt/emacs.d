

;;(autoload 'python-mode "python-mode.el" "Python mode." t)
;;(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

(load-library "python")

(defun py-send-line ()
  "send current line to python shell, and move pointer to next-line"
  (interactive)
  (save-excursion
    (let ((beg (line-beginning-position))
	  )
	  (python-shell-send-region beg (line-end-position))
          (python-shell-send-string "\n")
	  ))
  (next-line))

(defun py-execute-block ()
  "send block of python code to python shelll"
  (interactive)
  (save-excursion
    (let ((beg (python-nav-beginning-of-block))
          )
      (python-shell-send-region beg  (python-nav-end-of-block))
      ))
  )
  
(add-hook 'python-mode-hook
	  '(lambda ()
	     (setq outline-regexp   "^class \\|[ 	]*def \\|^#")
	     (local-set-key (kbd "C-c C-v") 'py-send-line)
     	     (local-set-key (kbd "C-c C-r") 'python-shell-send-region)
	     (local-set-key (kbd "C-c C-.") '(lambda () (interactive) (py-execute-block) (python-nav-end-of-block) (next-line)))))

