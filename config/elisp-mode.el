;;; enables outlining for ruby
;;; You may also want to bind hide-body, hide-subtree, show-substree
;;; show-all, show-children, ... to some keys easy folding and unfolding

(defun el-send-line ()
  "send the current line to the inferrior ruby process"
  (interactive)
  (save-excursion
    (end-of-line)
    (let ((end (point)))
      (beginning-of-line)
      (eval-region (point) end t)))
  (next-line))

(add-hook 'emacs-lisp-mode-hook
					'(lambda ()
						 (outline-minor-mode)
						 ;;(column-highlight-mode)
						 ;;								 (make-variable-buffer-local 'outline-regexp)
						 ;;                 (setq outline-regexp  " *\\(def \\|class\\|module\\|describe \\|it \\)")
						 (hide-body)
						 (local-set-key (kbd "C-c C-v") 'el-send-line)
						 ))





