

(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key [M-t] 'js-beautify))
)
