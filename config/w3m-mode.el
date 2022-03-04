


(defun toggle-env-http-proxy ()
  "set/unset the environment variable http_proxy which w3m uses"
  (interactive)
  (let ((proxy "http://127.0.0.1:8123"))
    (if (string= (getenv "http_proxy") proxy)
        ;; clear the proxy
        (progn
          (setenv "http_proxy" "")
          (setenv "https_proxy" "")
          (message "env http_proxy is empty now"))
      ;; set the proxy
      (setenv "http_proxy" proxy)
      (setenv "https_proxy" proxy)
      (message "env http_proxy is %s now" proxy))))
