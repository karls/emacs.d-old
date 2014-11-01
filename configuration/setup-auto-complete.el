(require 'auto-complete)

(global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)
(setq ac-use-menu-map t)

;; Default settings
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)

(provide 'setup-auto-complete)
