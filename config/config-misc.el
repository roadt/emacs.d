;; prog-mode
(if (featurep  'prog-mode)
		(add-hook 'prog-mode-hook (lambda () (linum-mode)(outline-minor-mode)(setq truncate-lines t)))
)
