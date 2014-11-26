(require 'package)
(require 'cl)

(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar required-packages '(ace-jump-mode
                            ack-and-a-half
                            auto-complete
                            cider
                            clojure-mode
                            dash-at-point
                            expand-region
                            flx
                            flx-ido
                            ghc
                            haskell-mode
                            highlight-parentheses
                            hl-sexp
                            ido-vertical-mode
                            js3-mode
                            json-mode
                            magit
                            markdown-mode
                            multiple-cursors
                            org-journal
                            paredit
                            php-mode
                            pkg-info
                            puppet-mode
                            projectile
                            rainbow-delimiters
                            ruby-mode
                            smooth-scrolling
                            solarized-theme
                            undo-tree
                            wrap-region
                            yaml-mode))

(mapcar (lambda (p) (package-installed-p p)) required-packages)

(defun packages-installed-p (packages)
  (let ((value t))
    (dolist (package packages value)
      (when (not (package-installed-p package))
        (return nil)))))

(unless (packages-installed-p required-packages)
  ;; check for new packages (package versions)
  (message "%s" "Refreshing package database ...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p)))
  (delete-other-windows))

(provide 'setup-packages)
