(add-hook 'emacs-lisp-mode-hook 'hl-sexp-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook '(lambda () (setq global-hl-line-mode nil)))

(provide 'setup-elisp-mode)
