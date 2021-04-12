

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



;;;
;;;
;;;
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






