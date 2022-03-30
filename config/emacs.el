;; common handler,  not suitable to put in other file 
;; or not bigger enough to make a separate file for it.  

;; prog-mode
(add-hook 'prog-mode-hook (lambda () (linum-mode)(outline-minor-mode)(setq truncate-lines t)))


;; alist
(setq auto-mode-alist (append '(("/.*\.md$" . markdown-mode) ("/.*\.markdown$" . markdown-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\.jl$" . sawfish-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\.liquid$" . html-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\.pa$" . conf-mode)) auto-mode-alist))

