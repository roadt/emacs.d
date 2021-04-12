;;
;;
;;  make sure file under the 'find-file-read-only-roots directory is opened in read only mode.
;;
(defcustom find-file-readonly-roots () "files under these directories are opened readonly")

(defun any (l)
  (if (eq l ()) nil
    (or (first l)
        (any (cdr l)))))

(defun read-only-ff-hook ()
  (let ((fn (buffer-file-name (current-buffer))))
     (if (any (mapcar (lambda (x) (dired-in-this-tree fn  x)) find-file-readonly-roots))
         (read-only-mode))
    ))

(add-hook 'find-file-hook  'read-only-ff-hook)
