(require 'org)

(setq org-agenda-files '("~/org/todo.org"))
(setq org-default-notes-file "~/org/notes.org")

(setq org-log-done 'time) ; log the time of DONE todo items
(setq org-tag-alist '(("@work" . ?w)
                      ("@home" . ?h)
                      ("@project" . ?p)
                      ("@idea" . ?i)))

(setq org-startup-folded "content")

(setq org-list-indent-offset 0)
(setq org-startup-indented t)

(if is-mac
    (setq org-mobile-directory "/Volumes/org/"))

;; Disable linum mode for Org because indentation seems to get screwed up a bit
(add-hook 'org-mode-hook (lambda () (linum-mode 0)))

(provide 'setup-org)
