(require 'org)

(setq org-agenda-files '("~/org/todo.org"
                         "~/org/work.org"
                         "~/org/personal.org"))
(setq org-default-notes-file "~/org/notes.org")

;; Has to be setup up before requiring 'org-journal, otherwise defaults to
;; something like ~/Documents/journal
(setq org-journal-dir "~/journal/")
(require 'org-journal)

(setq org-log-done 'time) ; log the time of DONE todo items
(setq org-tag-alist '(("@work" . ?w)
                      ("@project" . ?p)
                      ("@idea" . ?i)
                      ("@reflection" . ?r)))

(setq org-startup-folded "content")

(setq org-list-indent-offset 0)

;; Indent and hide stars for headlines
(setq org-startup-indented t)

(if is-mac
    (setq org-mobile-directory "/Volumes/org/"))

;; Disable linum mode for Org because indentation seems to get screwed up a bit
(add-hook 'org-mode-hook (lambda () (linum-mode 0)))
(add-hook 'org-mode-hook (lambda () (setq global-hl-line-mode nil)))

(setq org-export-latex-classes nil)

(add-to-list 'org-export-latex-classes
             '("tuftehandout"
               "\\documentclass{tufte-handout}
\\usepackage{color}
\\usepackage{amssymb}
\\usepackage{amsmath}
\\usepackage{gensymb}
\\usepackage{nicefrac}
\\usepackage{units}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}
                \\usepackage{color}
                \\usepackage{amssymb}
                \\usepackage{amsmath}
                \\usepackage{gensymb}
                \\usepackage{nicefrac}
                \\usepackage{fullpage}
                \\usepackage{units}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(provide 'setup-org)
