(defun duplicate-region (&optional num start end)
  "Duplicates the region bounded by START and END NUM times.
If no START and END is provided, the current region-beginning and
region-end is used."
  (interactive "p")
  (save-excursion
   (let* ((start (or start (region-beginning)))
          (end (or end (region-end)))
          (region (buffer-substring start end)))
     (goto-char end)
     (dotimes (i num)
       (insert region)))))

(defun duplicate-current-line (&optional num)
  "Duplicate the current line NUM times."
  (interactive "p")
  (save-excursion
   (when (eq (point-at-eol) (point-max))
     (goto-char (point-max))
     (newline)
     (forward-char -1))
   (duplicate-region num (point-at-bol) (1+ (point-at-eol)))))

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated."
  (interactive "p")
  (if (region-active-p)
      (let ((beg (region-beginning))
            (end (region-end)))
        (duplicate-region arg beg end))
    (duplicate-current-line arg)))

;; Kill region if selected, or backward word
(defun kill-region-or-backward-word ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))
