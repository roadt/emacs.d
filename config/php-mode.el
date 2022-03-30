(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode) ("/*.\.ctp$" . php-mode)) auto-mode-alist))

(add-hook 'php-mode-hook
					'(lambda ()
						 (local-unset-key (kbd "C-."))
						 ))

(print "hello php-mode config loaded")
