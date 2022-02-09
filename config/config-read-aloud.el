
;; defuns



;; execution
(if (featurep 'read-aloud)
    (progn
      (global-set-key (kbd "\C-c\C-r") 'read-aloud-this)
      )
  )
