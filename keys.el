(global-set-key [f1] 'dired)
(global-set-key [(shift f1)] `find-name-dired)
(global-set-key [(control f1)] `rgrep)

(global-set-key [f2] 'ffip)
(global-set-key [(shift f2)] 'find-library)
(global-set-key [(control f2)] 'load-library)

(global-set-key [f3] 'shell)
(global-set-key [(control f3)] 'replace-string)
(global-set-key [(shift f3)] 'grep-current-buffer)

(global-set-key [f4] 'compile)
(global-set-key [(control f4)] 'quickrun)
(global-set-key [(shift f4)] 'inf-ruby)

(global-set-key [(control f5)] 'w3m)
(global-set-key [f5] 'dka-w3m-goto-wiki)
(global-set-key [(shift f5)] 'browse-url)
(global-set-key [(control shift f5)] 'sx-search)

(global-set-key [f6] 'calendar)
;; optional suggestions
(global-set-key [S-f6] 'pry-intercept)
(global-set-key [C-f6] 'pry-intercept-rerun)

(global-set-key [f7] 'todo-show)
(global-set-key [(shift f7)] 'emms)

(global-set-key [f8] 'mark-whole-buffer)
(global-set-key [(shift f8)] 'indent-region)

(global-set-key [f9] 'rename-buffer)
(global-set-key [(shift f9)] 'clone-buffer)

(global-set-key [f10] 'toggle-truncate-lines)
(global-set-key [(shift f10)] 'read-only-mode)


(global-set-key [f11] 'gdb-next)
(global-set-key [(control f11)] 'gud-gdb)
(global-set-key [(shift f11)] 'package-list-packages-no-fetch)

(global-set-key [f12] 'gdb-step)
(global-set-key [(shift f12)] '(lambda() (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key [(control f12)] '(lambda() (interactive) (load-file "~/.emacs.d/init.el")))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c d") 'sdcv-search)

(global-set-key [C-S-left] 'shrink-window-horizontally)
(global-set-key [C-S-right] 'enlarge-window-horizontally)
(global-set-key [C-S-down] 'shrink-window)
(global-set-key [C-S-up] 'enlarge-window)

(global-set-key (kbd "C-#") 'split-window-right)
(global-set-key (kbd "C-$") 'split-window-horizontally)
(global-set-key (kbd "C-^") 'kill-this-buffer)
(global-set-key (kbd "C-&") 'switch-to-buffer)
(global-set-key (kbd "C-*") 'visit-tags-table)
(global-set-key (kbd "C-(") 'select-tags-table)
(global-set-key (kbd "C-)") 'delete-window)
(global-set-key (kbd "C->") 'other-window)
(global-set-key (kbd "C-<") 'select-previous-window)
(global-set-key (kbd "C-:") 'shrink-window-horizontally)
(global-set-key (kbd "C-\"") 'enlarge-window-horizontally)
(global-set-key (kbd "C-?") '(lambda () (interactive) (transpose-windows -1)))
(global-set-key (kbd "C-,") 'switch-to-prev-buffer)
(global-set-key (kbd "C-.") 'switch-to-next-buffer)
(global-set-key [C-menu] 'swap-current-largest-window)
(global-set-key [C-return]  'kill-this-buffer)
(global-set-key (kbd "C-'")  'switch-to-buffer)
(global-set-key [C-S-menu] 'enlarge-window)
(global-set-key (kbd "C-c RET") 'outline-minor-mode)
(global-set-key (kbd "C-|")  'erase-buffer)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-M-g")  'magit-status)
(global-set-key (kbd "C-S-s")  'search-forward)
(global-set-key (kbd "M-M")  'mingus)
(global-set-key (kbd "M-N")  'transmission)

(global-set-key (kbd "\C-c\C-a") 'autotest-switch)

(global-set-key (kbd "M-.")  'find-tag)

;;org mode - info manual suggestion
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;;magit
(global-set-key (kbd "C-x g") 'magit-status)

;; projectile
;(global-set-key (kbd "C-x C-f") 'projectile-find-file)

;; misc
(global-set-key (kbd "M-d") 'jpk/delete-word)
(global-set-key (kbd "M-S-d") 'delete-word)
(global-set-key (kbd  "M-S-k") 'jpk/delete-line)
(global-set-key (kbd  "s-<backspace>") 'jpk/backward-delete-word)

