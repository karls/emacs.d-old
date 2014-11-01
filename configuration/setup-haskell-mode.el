(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook '(lambda ()
                                (local-set-key (kbd "s-s") 'ghc-save-buffer)))

;; By default, cabal files seem to be a bit screwed up because of indentation
(add-hook 'haskell-cabal-mode-hook (lambda ()
                                     (setq c-basic-offset 2
                                           tab-width 2
                                           indent-tabs-mode nil)))

(add-to-list 'completion-ignored-extensions ".hi")
(setq haskell-program-name "ghci -ignore-dot-ghci")

;; (add-to-list 'dash-at-point-mode-alist '(haskell-mode . "hs"))

(provide 'setup-haskell-mode)
