
;;;; Load emacs.d stuff
(load-file "~/.emacs.d/init-elpa.el")   ;;; Initialized all need packages



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
(load-library "rdebug/rdebug.el")
(load-library "sawfish.el")
(load-library "multi-web-mode.el")
(load-library "auto-scroll.el")
(load-library "tidy.el")
(load-library "misc.el")
(load-library "taskwarrior.el")
;;(load-library "workgroups")

(load-library "ruby-mode")
(load-library "flymake")

;;(load-library "nxhtml/autostart.el")

;; set variable
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/jde/lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mmm-mode")
(add-to-list 'load-path "~/.emacs.d/misc/emacs-rails")
(add-to-list 'load-path "~/.emacs.d/misc/pry")
;;(add-to-list 'load-path "~/.emacs.d/misc/ruby-dev.el" )

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
(require 'pry)


;;; buffer stuff
(defun kill-other-buffers ()
  "Kill all other buffers"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun kill-all-buffers ()
  "Kill all buffers"
  (interactive)
  (mapc 'kill-buffer (buffer-list)))


;;;
;;; w3m  wiki stuff.;
;;
(makunbound 'dka-w3m-wikis)
 (defvar dka-w3m-wikis
  '(
    ("aw" "https://wiki.archlinux.org/index.php?search=")
    ("aur" "https://aur.archlinux.org/packages.php?SB=v&SO=d&K=" "")
    ("aurn" "https://aur.archlinux.org/packages.php?SeB=n&SB=v&SO=d&K=" "")
    ("b" "http://cn.bing.com/search?q=" "")
    ("d" "https://hub.docker.com/search/?q=" "")
    ("deb" "http://wiki.debian.net/" "")
    ("e"  "http://www.emacswiki.org/cgi-bin/wiki.pl?" "RecentChanges")
    ("g" "https://www.google.com/search?q=" "")
    ("gk" "https://www.google.com.hk/search?q=" "")
    ("h" "https://github.com/search?o=desc&s=stars&utf8=%E2%9C%93&q=")
		("lathi" "http://www.lathi.net/twiki-bin/view/Main/" "WebHome")
		("pip" "https://pypi.python.org/pypi?%3Aaction=search&term=%s&submit=search" "")
    ("rg" "https://rubygems.org/search?utf8=%E2%9C%93&query=" "")
		("rfc" "https://tools.ietf.org/html/rfc" "/index")
		("tk" "http://www.torrentkitty.me/search/%s/" "")
    ("w" "https://en.wikipedia.org/w/index.php?search=" "")
    ("wm" "https://en.m.wikipedia.org/w/index.php?search=" "")
))

 (defun dka-w3m-goto-wiki ()
  (interactive)
  (let ((wiki-topic (read-from-minibuffer "Wiki:Topic? "))
        topic wiki wiki-list)
    (message wiki-topic)
    (if (string-match "\\([^/]*\\)/\\(.*\\)" wiki-topic)
        (setq wiki (match-string 1 wiki-topic) 
              topic (match-string 2 wiki-topic)
              wiki-list (assoc wiki dka-w3m-wikis))
      (error "Must specify a wiki name and topic (Wiki:TopicName)"))
    (unless wiki-list
      (error (format "\"%s\" is not a defined wiki" wiki)))
    (unless topic
      (setq topic (nth 2 wiki-list)))
	(w3m-goto-url (if (string-match "%s" (nth 1 wiki-list))
					  (format (nth 1 wiki-list) (w3m-url-encode-string topic))
					  (concat (nth 1 wiki-list) (w3m-url-encode-string topic))))))
			  

;;(autoload 'run-ruby "inf-ruby"  "Run an inferior Ruby process")

;;(autoload 'inf-ruby-keys "inf-ruby"  "Set local key defs for inf-ruby in ruby-mode")

;;(add-hook 'ruby-mode-hook
;;          '(lambda ()
;;             (inf-ruby-keys)
;;	     ))


;;;
;;;
;;;  custom-set-variables
;;;
;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(auto-save-file-name-transforms
   '(("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "/tmp/\\2" t)
     ("(.*)" "~/.emacs.d/autosave/\\1" nil)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backup")))
 '(browse-url-browser-function 'w3m-browse-url)
 '(clocker-mode nil)
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(debug-on-error t)
 '(electric-indent-mode nil)
 '(emms-bilibili-mid 10195618)
 '(emms-player-list '(mplayer mpv simple))
 '(enable-local-variables :all)
 '(erc-autojoin-mode t)
 '(erc-button-mode t)
 '(erc-fill-mode t)
 '(erc-irccontrols-mode t)
 '(erc-list-mode t)
 '(erc-match-mode t)
 '(erc-menu-mode t)
 '(erc-move-to-prompt-mode t)
 '(erc-netsplit-mode t)
 '(erc-networks-mode t)
 '(erc-noncommands-mode t)
 '(erc-pcomplete-mode t)
 '(erc-readonly-mode t)
 '(erc-ring-mode t)
 '(find-file-readonly-roots '("/usr/lib/python2.7/" "/RAD/repos/" "/usr/local/rvm/"))
 '(find-tag-hook 'read-only-mode)
 '(github-notifier-token "336fe6f13a2dcec7687e8a9ea59905f7d91a9fd5")
 '(helm-mode t)
 '(highlight-indentation t)
 '(indent-tabs-mode t)
 '(inf-clojure-program "/usr/bin/clj")
 '(inf-mongo-command "/usr/bin/mongo 127.0.0.1:27017")
 '(inf-ruby-implementations
   '(("ruby" . "/usr/local/rvm/bin/rvm default do irb --prompt default --noreadline -r irb/completion")
     ("jruby" . "jruby -S irb --prompt default --noreadline -r irb/completion")
     ("rubinius" . "rbx -r irb/completion")
     ("yarv" . "irb1.9 -r irb/completion")
     ("macruby" . "macirb -r irb/completion")
     ("pry" . "pry")))
 '(inferior-js-program-command "node --interactive")
 '(inferior-lisp-program "/usr/bin/clisp")
 '(js-indent-level 2)
 '(large-file-warning-threshold 200000000)
 '(linum-format "%5d")
 '(majmodpri-no-nxml nil)
 '(max-lisp-eval-depth 4096)
 '(max-specpdl-size 4096)
 '(mingus-bookmarks
   '(("C"
      (file "8ﾄ-Call Of Duty:MW3.mp3" position 7))
     ("4{"
      (file "^1G-4{.mp3" position 198))))
 '(mingus-mpd-host "venus")
 '(mu-worlds
   '(["mdev" "localhost" 4000 "roadt" "password1234"]
     ["eot" "eotmud.com" 4000 "" ""]))
 '(nxhtml-autoload-web nil t)
 '(openwith-associations
   '(("\\.pdf\\'" "acroread"
      (file))
     ("\\.mp3\\'" "mplayer"
      (file))
     ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mkv\\|mp4\\|rm\\|rmvb\\|part\\|f4v\\|flv\\|mov\\)\\'" "smplayer"
      (file))
     ("\\.\\(?:gif\\)\\'" "display"
      (file))))
 '(openwith-mode t)
 '(org-trello-current-prefix-keybinding "C-c o")
 '(package-archives
   (quote
    (("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
     ("melpa" . " http://elpa.emacs-china.org/melpa/")
     ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org"))
 '(package-enable-at-startup t)
 '(package-selected-packages
   '(kivy-mode auctex ansible-vault ansible ansible-doc indium pallet cask-package-toolset caskxy cask-mode cask fm-bookmarks ob-mongo restclient-test elcord github-stars github-search github-explorer inf-clojure inf-crystal inf-ruby inf-mongo ibuffer-git ibuffer-project ibuffer-projectile ibuffer-vc ox-mediawiki mediawiki proc-net nginx-mode netease-music network-watch gnomenm eshell-bookmark autobookmarks 4clojure php-eldoc eldoc-eval php-boris magit-gitflow helm-phpunit lsp-go lsp-haskell lsp-php lsp-python lsp-rust lsp-typescript lsp-ui lsp-vue geiser cider elpy js-comint company-anaconda company-ansible company-auctex company-axiom company-bibtex company-box company-c-headers company-cabal company-childframe company-coq company-dcd company-dict company-distel company-ebdb company-edbi company-emacs-eclim company-emoji company-erlang company-flow company-flx company-ghc company-ghci company-glsl company-go company-irony-c-headers company-jedi company-lean company-lsp company-lua company-nand2tetris company-nginx company-ngram company-nixos-options company-plsense company-pollen company-posframe company-prescient company-qml company-quickhelp company-racer company-reftex company-restclient company-rtags company-shell company-solidity company-sourcekit company-suggest company-tern company-terraform company-try-hard company-ycm company-ycmd aws-snippets clojure-snippets common-lisp-snippets django-snippets el-autoyas elixir-yasnippets elm-mode elm-yasnippets go-playground go-snippets haskell-snippets java-snippets mocha-snippets php-auto-yasnippets r-autoyas react-snippets vala-snippets yasnippet-classic-snippets julia-mode haxe-imports mingus download-region flycheck-kotlin flycheck kotlin-mode achievements multiple-cursors helm-rails helm-rb company-php jdee bicycle helm-dictionary keymap-utils emaps buffer-watcher graphql-mode sudo-ext dired-toggle-sudo auto-sudoedit counsel-tramp ibuffer-tramp composer emms-player-mpv emms-player-simple-mpv emms-bilibili ob-ipython symon avandu elf-mode elfeed-goodies elfeed-org elfeed-protocol elfeed-web gnus-x-gm-raw hexo json-navigator dsvn magit-svn eimp number elisp-docstring-mode elisp-format elisp-lint elisp-refs elisp-sandbox workgroups weibo w3 typing-game tumble ttrss tree-mode travis top-mode todochiku timer-revert stem ssh show-marks seethru ruby-tools ruby-refactor ruby-guard ruby-end ruby-compilation ruby-block redis rebox2 quack python3-info python-info python popup-complete parenface pacmacs org-if openwith omniref nose newlisp-mode mongo memory-usage matrix-client marmalade-client kite-mini karma jsx-mode jst jss jquery-doc jinja2-mode jenkins-watch jasminejs-mode jabber-otr ipython inf-php inf-groovy helm-xcdoc helm-rubygems-org helm-rubygems-local helm-css-scss haxe-mode groovy-mode go-scratch gitlab gitignore-mode github-notifier github-issues github-clone github-browse-file gist gimme geben furl fold-dwim flymake-cursor flymake fireplace find-things-fast find-temp-file find-file-in-repository find-file-in-project feature-mode erlang eredis ensime emojify emacsshot emacsql-sqlite emacsql-psql emacsql-mysql emacs-eclim elwm elscreen-persist elnode elmine elixir-mode elixir-mix el-spec ecb drupal-mode dockerfile-mode docker-api docker docean docbook dired-open diffview dictionary dictcc dict-tree desktop-registry desktop+ dart-mode cssh crosshairs company-inf-ruby company-arduino coffee-mode cmake-mode clocker cljdoc clippy clang-format chm-view chinese-yasdcv camcorder c-eldoc bts-github bongo autotetris-mode autotest auto-yasnippet auto-compile audio-notes-mode arview aria2 apache-mode anything angularjs-mode angular-snippets angular-mode android-mode alert ack-menu ack ac-js2 ac-inf-ruby ac-html-bootstrap ac-html ac-clang 2048-game))
 '(proxy-mode-http-proxy "http://localhost:8123")
 '(py-indent-tabs-mode t)
 '(py-shebang-startstring "#!/usr/bin/env")
 '(py-tab-indent nil)
 '(python-indent-offset 4)
 '(python-python-command "python2")
 '(python-shell-interpreter "python3")
 '(scheme-program-name "guile")
 '(scroll-bar-mode nil)
 '(scss-sass-options '("--style" "expanded"))
 '(send-mail-function 'sendmail-send-it)
 '(sql-product 'mysql)
 '(standard-indent 2)
 '(tab-width 2)
 '(tags-case-fold-search nil)
 '(timer-revert-delay 1)
 '(todo-default-priority 'last)
 '(tool-bar-mode nil)
 '(tool-bar-style 'text)
 '(transmission-host "venus")
 '(truncate-lines t)
 '(volume-backend 'volume-amixer-backend)
 '(w3m-add-user-agent nil)
 '(w3m-content-type-alist
   '(("text/plain" "\\.\\(?:txt\\|tex\\|el\\)\\'" nil nil)
     ("text/html" "\\.s?html?\\'" browse-url-default-browser nil)
     ("text/sgml" "\\.sgml?\\'" nil "text/plain")
     ("text/xml" "\\.xml\\'" nil "text/plain")
     ("image/jpeg" "\\.jpe?g\\'"
      ("/usr/bin/display" file)
      nil)
     ("image/png" "\\.png\\'"
      ("/usr/bin/display" file)
      nil)
     ("image/gif" "\\.gif\\'"
      ("/usr/bin/display" file)
      nil)
     ("image/tiff" "\\.tif?f\\'"
      ("/usr/bin/display" file)
      nil)
     ("image/x-xwd" "\\.xwd\\'"
      ("/usr/bin/display" file)
      nil)
     ("image/x-xbm" "\\.xbm\\'"
      ("/usr/bin/display" file)
      nil)
     ("image/x-xpm" "\\.xpm\\'"
      ("/usr/bin/display" file)
      nil)
     ("image/x-bmp" "\\.bmp\\'"
      ("/usr/bin/display" file)
      nil)
     ("video/mpeg" "\\.mpe?g\\'"
      ("smplayer")
      nil)
     ("video/quicktime" "\\.mov\\'" nil nil)
     ("application/dvi" "\\.dvi\\'"
      ("xdvi" file)
      nil)
     ("application/postscript" "\\.e?ps\\'"
      ("gs" file)
      nil)
     ("application/pdf" "\\.pdf\\'" nil nil)
     ("application/x-pdf" "\\.pdf\\'" nil nil)
     ("application/xml" "\\.xml\\'" nil w3m-detect-xml-type)
     ("application/rdf+xml" "\\.rdf\\'" nil "text/plain")
     ("application/rss+xml" "\\.rss\\'" nil "text/plain")
     ("application/xhtml+xml" nil nil "text/html")))
 '(w3m-use-cookies t)
 '(workgroups-mode t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white smoke" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :foundry "MS  " :family "Tahoma"))))
 '(font-lock-comment-face ((t (:foreground "red4"))))
 '(hackernews-comment-count-face ((t (:foreground "blue"))))
 '(hackernews-link-face ((t (:foreground "blue"))))
 '(markdown-code-face ((t (:inherit fixed-pitch :background "gray"))))
 '(region ((t (:background "light gray" :distant-foreground "gtk_selection_fg_color")))))





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




;;(add-hook 'outline-minor-mode-hook (lambda () (hide-body)))
(load-file "~/.emacs.d/config/config-files.el")
(load-file "~/.emacs.d/config/config-ruby-mode.el")
(load-file "~/.emacs.d/config/config-sql-mode.el")
(load-file "~/.emacs.d/config/config-scheme-mode.el")
(load-file "~/.emacs.d/config/config-python-mode.el")
(load-file "~/.emacs.d/config/config-php-mode.el")
(load-file "~/.emacs.d/config/config-multi-web-mode.el")
(load-file "~/.emacs.d/config/config-coffee-mode.el")
(load-file "~/.emacs.d/config/config-js2-mode.el")
(load-file "~/.emacs.d/config/config-web-mode.el")
(load-file "~/.emacs.d/config/config-sgml-mode.el")

(add-hook 'prog-mode-hook (lambda () (linum-mode)(outline-minor-mode)(setq truncate-lines t)))

;;
;;(resume)
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



;; redmine settings
(setq org-redmine-auth-api-key "c05ca920aa57c9ad8e8be48af191efd63e72abd3")
(setq org-redmine-uri "http://radt.ddns.net:8001")


;;(smart-tabs-insinuate 'c 'javascript 'python)
(openwith-mode)


;;(workgroups-mode 1)
