(when (file-directory-p "/usr/local/go/misc/")
  (add-to-list 'load-path "/usr/local/go/misc/emacs/" t)
  (require 'go-mode-load))

(provide 'setup-golang-mode)
