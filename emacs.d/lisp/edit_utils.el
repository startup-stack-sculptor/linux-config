
;; Sublime-like comments
(defun toggle-comment-on-line-or-region ()
  "Comments or uncomments the region or the current line if there is no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
(global-set-key (kbd "M-/") 'toggle-comment-on-line-or-region)

(defun end-with-semicolon ()
  "Insert semicolon at end of line in Evil insert mode."
  (interactive)
  (save-excursion)
  ;; Typically mapped to the "End" key.
  (call-interactively 'move-end-of-line)
  (insert ";"))


(defun insert-semicolon ()
  "Insert semicolon at end of line in Evil insert mode."
  (interactive)
  (save-excursion)
  ;; Typically mapped to the "End" key.
  (insert ";"))

(global-set-key (kbd ";") 'end-with-semicolon)
(define-key evil-insert-state-map (kbd ";") 'end-with-semicolon)
