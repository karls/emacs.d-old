(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;; (add-hook 'cider-repl-mode-hook 'subword-mode)

(add-hook 'clojure-mode-hook 'hl-sexp-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook
          '(lambda () (local-set-key (kbd "s-r") 'clojure-system-reset)))
(add-hook 'clojure-mode-hook '(lambda () (setq global-hl-line-mode nil)))

;; (add-to-list 'dash-at-point-mode-alist '(clojure-mode . "clj"))

(provide 'setup-clojure-mode)
