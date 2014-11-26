(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splashing allowed!
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(add-to-list 'load-path
             (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'load-path
             (expand-file-name "configuration" user-emacs-directory))

(setq custom-theme-directory
      (expand-file-name "themes" user-emacs-directory))

;; Customizations (M-x customize variants) go to a special file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(setq is-mac (equal system-type 'darwin))

(if is-mac
    (setq default-directory (expand-file-name user-login-name "/Users/"))
  (setq default-directory (expand-file-name user-login-name "/home/")))

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Store backup files sensibly. Rather than storing the originals and backup
;; files side-by-side, store the backups in a special directory (~/.emacs-backups)
;; Keep only recent versions, different versions are copied.
(setq backup-dir (expand-file-name "backups" user-emacs-directory))
(setq backup-directory-alist `(("." . ,backup-dir)))
(setq vc-make-backup-files t ; make backups even if file is under VCS
      backup-by-copying t    ; don't screw up symlinks
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(require 'server)
(if (and (display-graphic-p)
         (not (server-running-p)))
  (server-start))

;; Install and require packages
(require 'setup-packages)

;; Configure everything
(require 'setup-sane-defaults)
(require 'setup-appearance)
(require 'setup-windmove)

(require 'mode-mappings)
(require 'key-bindings)

(require 'setup-ido)
(require 'setup-projectile)
(require 'setup-auto-complete)

(require 'setup-org)

(require 'setup-elisp-mode)
(require 'setup-clojure-mode)
(require 'setup-haskell-mode)
(require 'setup-ruby-mode)
(require 'setup-golang-mode)
