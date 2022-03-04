

(add-hook 'coffee-mode-hook
          '(lambda ()
                                        ; (coffee-cos-mode)
		         (local-set-key (kbd "M-r") 'coffee-compile-buffer)
		         ))






