(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-W") 'delete-frame)

(global-set-key (kbd "C-w") 'kill-region-or-backward-word)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-x C-j") 'join-line)
(global-set-key (kbd "C-x C-d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-c m") 'magit-status)

(global-set-key (if is-mac (kbd "C-@") (kbd "C-'")) 'er/expand-region)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)

(global-set-key (kbd "C-c o")
                (lambda () (interactive) (ido-find-file-in-dir org-directory)))

(provide 'key-bindings)
