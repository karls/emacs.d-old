(require 'projectile)

(projectile-global-mode nil)

(setq projectile-globally-ignored-files '("TAGS" ".nrepl-port"))
(setq projectile-globally-ignored-files (quote ("TAGS")))
(setq projectile-globally-ignored-directories
      '(".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" "venv" "build"
	"vendor" ".cabal-sandbox" "dist" ".vagrant" "node_modules" 
	"bower_components" ".bundle"))

(defadvice projectile-ack (after _)
  (switch-to-buffer-other-window "*Ack-and-a-half*"))
(ad-activate 'projectile-ack)


(provide 'setup-projectile)
