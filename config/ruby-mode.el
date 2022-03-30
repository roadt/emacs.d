;;; enables outlining for ruby
;;; You may also want to bind hide-body, hide-subtree, show-substree
;;; show-all, show-children, ... to some keys easy folding and unfolding


(defun ruby-send-line ()
  "send the current line to the inferrior ruby process"
  (interactive)
  (save-excursion
    (end-of-line)
    (let ((end (point)))
      (beginning-of-line)
      (ruby-send-region (point) end)))
  (next-line))



(setq auto-mode-alist (append '(("/Rakefile$" . ruby-mode) ("/.*\.rake$" . ruby-mode)
				("/Gemfile$" . ruby-mode) ("/.*\.gemspec$" . ruby-mode) ("/.*\.ctl$" . ruby-mode )) auto-mode-alist))


(add-hook 'ruby-mode-hook
              '(lambda ()
                 (outline-minor-mode)
		 (make-variable-buffer-local 'outline-regexp)
                 (setq outline-regexp
                       " *\\(def \\|class\\|module\\|describe \\|it \\)")
		 (hide-body)
		 (local-set-key (kbd "C-c C-v") 'ruby-send-line)
		 (local-set-key (kbd "C-c C-.") '(lambda () (interactive) (ruby-send-block) (ruby-end-of-block) (next-line)))
		 ))



(global-set-key (kbd "C-c s a") 'show-all)
(global-set-key (kbd "C-c s e") 'show-entry)
(global-set-key (kbd "C-c h b") 'hide-body)
(global-set-key (kbd "C-c h e") 'hide-entry)

(global-set-key (kbd "C-c C-p") 'outline-backward-same-level)
(global-set-key (kbd "C-c C-n") 'outline-forward-same-level)
(global-set-key (kbd "C-c p") 'outline-previous-visible-heading)
(global-set-key (kbd "C-c n") 'outline-next-visible-heading)
(global-set-key (kbd "C-c C-u") 'outline-up-heading)

(global-set-key (kbd "C-c C-o") 'outline-toggle-children)


