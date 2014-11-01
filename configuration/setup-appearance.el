(setq visible-bell nil
      ring-bell-function 'ignore)
(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Mouse options, nice scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      scroll-step 1)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Highlight current line
(global-hl-line-mode t)
(make-variable-buffer-local 'global-hl-line-mode)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Rainbow parens for programming
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Add any theme directories to the custom theme load path
(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode t))

;; Unclutter the modeline
;; (require 'diminish)
;; (eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
;; (eval-after-load "eldoc" '(diminish 'eldoc-mode))
;; (eval-after-load "paredit" '(diminish 'paredit-mode))
;; (eval-after-load "tagedit" '(diminish 'tagedit-mode))
;; (eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
;; (eval-after-load "skewer-mode" '(diminish 'skewer-mode))
;; (eval-after-load "skewer-css" '(diminish 'skewer-css-mode))
;; (eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
;; (eval-after-load "smartparens" '(diminish 'smartparens-mode))
;; (eval-after-load "guide-key" '(diminish 'guide-key-mode))

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "clojure-mode" clojure-mode "Clj")

(defadvice split-window-right (after balance activate) (balance-windows))
(defadvice delete-window (after balance activate) (balance-windows))

(provide 'setup-appearance)
