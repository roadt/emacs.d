;;
;;
;;
(add-hook 'lua-mode-hook
              '(lambda ()
                 (outline-minor-mode)
;;		 (make-variable-buffer-local 'outline-regexp)
;;                 (setq outline-regexp
;;                       " *\\(def \\|class\\|module\\|describe \\|it \\)")
;;		 (hide-body)
		 (local-set-key (kbd "C-c C-v") '(lambda () (interactive) (lua-send-current-line) (next-line)))
		 (local-set-key (kbd "C-c C-r") 'lua-send-region)
		 (local-set-key (kbd "C-c C-.") '(lambda () (interactive) (lua-send-region (lua-beginning-of-proc) (lua-end-of-proc)) (next-line)))
		 ))
