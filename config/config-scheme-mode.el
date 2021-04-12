
(defun scheme-send-line ()
  "send the current line to the inferrior ruby process"
  (interactive)
  (save-excursion
    (end-of-line)
    (let ((end (point)))
      (beginning-of-line)
      (scheme-send-region (point) end)))
  (next-line))

(add-hook 'scheme-mode-hook
              '(lambda ()
;;                 (outline-minor-mode)
;;		 (make-variable-buffer-local 'outline-regexp)
;;                 (setq outline-regexp
;;                       " *\\(def \\|class\\|module\\|describe \\|it \\)")
;;		 (hide-body)
		 (local-set-key (kbd "C-c C-v") 'scheme-send-line)
;;		 (local-set-key (kbd "C-c C-.") '(lambda () (interactive) (ruby-send-block) (ruby-end-of-block) (next-line)))
		 ))
