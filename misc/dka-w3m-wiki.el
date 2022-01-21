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
		("lathi" "http://www.lathi.net/twiki-bin/view/Main/" "WebHome")
    ("n" "https://www.npmjs.com/search?q=" "")
		("p" "https://pypi.org/search/?q=" "")
		("py" "https://pypi.org/project/" "")
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
			  
