(defun sql-send-line ()
  "send the current line to the inferrior sql process"
  (interactive)
  (save-excursion
    (end-of-line)
    (let ((end (point)))
      (beginning-of-line)
      (sql-send-region (point) end)))
  (next-line))

(add-hook 'sql-mode-hook
					(local-set-key (kbd "C-c C-v") 'sql-send-line)
					)
