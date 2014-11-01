(require 'ido)
(ido-mode t)

(ido-everywhere t)
(ido-vertical-mode t)
(flx-ido-mode t) ; needs flx and flx-ido packages, see essential packages

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-use-filename-at-point nil
      ido-use-faces nil
      ido-max-prospects 10)


(provide 'setup-ido)
