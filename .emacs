
;;;; Load emacs.d stuff
(load-file "~/.emacs.d/init-elpa.el")   ;;; Initialized all need packages
(load-file "~/.emacs.d/init-func.el")   ;;; load basic utilties


;;; load system library
(load-library "dired")


;;; load  misc libraries
(add-to-list 'load-path "~/.emacs.d/misc")
(load-library "w3m-search.el")
;;(load-library "xscheme.el")
(load-library "quickrun.el")
(load-library "window.el")
(load-library "js-beautify.el")
(load-library "chm-view.el")
;;(load-library "rdebug/rdebug.el")
(load-library "sawfish.el")
(load-library "multi-web-mode.el")
(load-library "auto-scroll.el")
(load-library "tidy.el")
(load-library "misc.el")
(load-library "taskwarrior.el")
(load-library "workgroups2")
(load-library "ruby-mode")
(load-library "flymake")
(load-library "dka-w3m-wiki")
;;(load-library "nxhtml/autostart.el")
(load-library "tramp")

;; set variable
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/jde/lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mmm-mode")
(add-to-list 'load-path "~/.emacs.d/misc/emacs-rails")
;;(add-to-list 'load-path "~/.emacs.d/misc/pry")
;;(add-to-list 'load-path "~/.emacs.d/misc/ruby-dev" )

;;(autoload 'turn-on-ruby-dev "ruby-dev" nil t)
;;(add-hook 'ruby-mode-hook 'turn-on-ruby-dev)

;;;;  require here.
(require 'package)
(require 'w3m-load)
(require 'sdcv-mode)
;;(require 'lua-mode)
;;(require 'slime)
;;(slime-setup)
;;(require 'geben)
;;(require 'jde)
;;(require 'cedet)
;;(require 'mmm-mode)
;;(require 'mmm-auto)
;;(require 'rails)
;;(require 'pry)


;;(autoload 'run-ruby "inf-ruby"  "Run an inferior Ruby process")

;;(autoload 'inf-ruby-keys "inf-ruby"  "Set local key defs for inf-ruby in ruby-mode")

;;(add-hook 'ruby-mode-hook
;;          '(lambda ()
;;             (inf-ruby-keys)
;;	     ))


;;;
;;;  custom-set-variables
;;;
(setq custom-file ".custom.el")
(load-file custom-file)

;;;  Global Key Mapping
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
(global-set-key [(shift f12)] '(lambda() (interactive) (find-file "~/.emacs.d/.emacs")))
(global-set-key [(control f12)] '(lambda() (interactive) (load-file "~/.emacs.d/.emacs")))

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
(global-set-key (kbd "s-d") 'delete-word)
(global-set-key (kbd  "s-k") 'jpk/delete-line)
(global-set-key (kbd  "s-<backspace>") 'jpk/backward-delete-word)

;;
(ansi-color-for-comint-mode-on)


;;(setq load-path (append (list "/usr/share/emacs/site-lisp/elib" "/usr/share/emacs/site-lisp/jde/lisp") load-path))
;;(load-file "/usr/lib/erlang/lib/tools-2.6.5.1/emacs/erlang.el")
;;(load-file "/usr/lib/erlang/lib/tools-2.6.5.1/emacs/erlang-start.el")
;;(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")
;;(load-library "cedet")



(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode) ("/*.\.ctp$" . php-mode)) auto-mode-alist))

(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

(setq auto-mode-alist (append '(("/Rakefile$" . ruby-mode) ("/.*\.rake$" . ruby-mode)
				("/Gemfile$" . ruby-mode) ("/.*\.gemspec$" . ruby-mode) ("/.*\.ctl$" . ruby-mode )) auto-mode-alist))

(setq auto-mode-alist (append '(("/.*\.erl$" . erlang-mode)
				) auto-mode-alist))


(setq auto-mode-alist (append '(("/.*\.md$" . markdown-mode) ("/.*\.markdown$" . markdown-mode)) auto-mode-alist))

;;;(load-library "yaml-mode")
(setq auto-mode-alist (append '(("/.*\.yml$" . yaml-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\.jl$" . sawfish-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\.liquid$" . html-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\.pa$" . conf-mode)) auto-mode-alist))

;; ruby <-> elisp
(load-file "~/.emacs.d/misc/relisp.el")
(autoload 'relisp-start-slave "relisp" nil t)
(autoload 'ruby-eval "relisp" nil t)


;; load config
(load-directory "~/.emacs.d/config/")

;; load config-local
(load-directory "~/.emacs.d/config-local/")

;;
(resume)
(put 'erase-buffer 'disabled nil)

(progn
 (server-force-delete)
 (server-start)
 )


;; set proper frame size (only in x)
(if (eq 'x (window-system (selected-frame)))
	(set-frame-size (selected-frame) 300 60)
  (swap-ground-color)
)


;;(smart-tabs-insinuate 'c 'javascript 'python)
(openwith-mode)


(workgroups-mode 1)
