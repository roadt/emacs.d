

(defun select-previous-window ()
  (interactive)
  (select-window (previous-window)))

 (defun transpose-windows (arg)
   "Transpose the buffers shown in two windows."
   (interactive "p")
   (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
     (while (/= arg 0)
       (let ((this-win (window-buffer))
             (next-win (window-buffer (funcall selector))))
         (set-window-buffer (selected-window) next-win)
         (set-window-buffer (funcall selector) this-win)
         (select-window (funcall selector)))
       (setq arg (if (plusp arg) (1- arg) (1+ arg))))))


(defun swap-current-largest-window ()
  "swap current window to largest window"
  (interactive)
  (let ((this-win (window-buffer))
       (largest-win (window-buffer (get-largest-window))))
      (set-window-buffer (selected-window) largest-win)
      (set-window-buffer (get-largest-window) this-win)
      (select-window (get-largest-window))
;    (print this-win largest-win)
))










