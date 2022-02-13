
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
(setq custom-file ".emacs.d/.custom.el")
(load-file custom-file)

;;;  Global Key Mapping
(load-file  "~/.emacs.d/keys.el")

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
(wg-switch-to-workgroup "wg0")
