(defun magit-commit-setup-hook ()
  "Enable Evil's insert state in COMMIT_EDITMSG buffer."
  (when (string= (buffer-name) "COMMIT_EDITMSG")
    (evil-insert-state)))

(add-hook 'git-commit-setup-hook 'magit-commit-setup-hook)
