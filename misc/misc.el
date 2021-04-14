

;;
;;  swap two property value in property list.
;;
(defun plist-swapv (plist p1 p2)
  (let ((pv1 (plist-get plist p1))
	(pv2 (plist-get plist p2)))
    (plist-put plist p2 pv1)
    (plist-put plist p1 pv2))
  plist
)

;;
;; swap the vale of current default face
;;
(defun swap-face-property (p1 p2) 
  (custom-set-faces 
   (list 'default (list (list t (plist-swapv (custom-face-attributes-get 'default
					 (car (frames-on-display-list))) p1 p2))))))

;;
;; swap background color and foreground color
;;
(defun swap-ground-color ()
  (interactive)
  (swap-face-property :foreground :background)
)



;;=============  Buffer  ========

(require 'grep)
(defvar grep-buffer-args nil
  "grep-buffer's default argument, stored lastest argument")

(defun grep-current-buffer (reg) 
  (interactive (list (read-shell-command "grep-current-buffer  (grep regex):" grep-buffer-args)))
  (setq grep-buffer-args reg)
  (compilation-start 
   (concat  grep-command reg  " "
	    (buffer-file-name (current-buffer)))
   'grep-mode)
  )
(add-hook 'grep-mode-hook 
		  (lambda () (toggle-truncate-lines t)))


  
  
;;
;; indent-current-buffer
;;  

(defun indent-buffer ()
  (interactive)
  (progn
  (mark-whole-buffer)
  (indent-region)
)
)


;;  create *scratcth* buffer
(defun create-scratch-buffer nil
   "create a scratch buffer"
   (interactive)
   (switch-to-buffer (get-buffer-create "*scratch*"))
   (lisp-interaction-mode))      

;; kill all file buffers
(defun kill-all-file-buffers ()
  (interactive)
  (mapc (lambda (buffer)
		  (if (buffer-file-name buffer)
			  (kill-buffer buffer)))
		(buffer-list)))

(defun kill-indirect-buffers (&optional buf)
  (interactive)
  (let ((base-buffer (or buf (current-buffer))))
	(mapc 
	 (lambda (buffer)
	   (if (eq (buffer-base-buffer buffer) base-buffer)
		   (kill-buffer  buffer)
		 ))
	 (buffer-list))
))


;; kill buffers except current one
(defun kill-other-buffers ()
  "Kill all other buffers"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; kill all buffers 
(defun kill-all-buffers ()
  "Kill all buffers"
  (interactive)
  (mapc 'kill-buffer (buffer-list)))



;;
;; change current buffer's name to first version name.
;;
(defun rename-buffer-to-first nil
  "change swap or change current buffer's name to first class name"
  (let ((buf (current-buffer)))
    ()))


  
        
;;
;;
;;
(defun tt-maximize-window ()
  
)




;;;  
(defmacro jpk/delete-instead-of-kill (&rest body)
  "Replaces `kill-region' with `delete-region' in BODY."
  `(cl-letf (((symbol-function 'kill-region)
              (lambda (beg end &optional yank-handler)
                (delete-region beg end))))
     ,@body))

(defun jpk/delete-word (arg)
  "Like `kill-word', but does not save to the `kill-ring'."
  (interactive "*p")
  (jpk/delete-instead-of-kill (kill-word arg)))


(defun jpk/delete-line (arg)
  "Like `kill-line', but does not save to the `kill-ring'."
  (interactive "*p")
  (jpk/delete-instead-of-kill (kill-line arg)))

(defun jpk/backward-delete-word (arg)
  "Like `backward-kill-world', but does not save to the `kill-ring'."
  (interactive "*p")
  (jpk/delete-instead-of-kill (backward-kill-word arg)))

;;
;;  delete word  (not yank)
;;
(defun delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

