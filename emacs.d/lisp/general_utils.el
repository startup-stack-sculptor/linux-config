(defun generate-password (length)
  "Generate a random password of the specified LENGTH."
  (let* ((charset "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+=")
         (charset-length (length charset))
         (password ""))
    (dotimes (_ length)
      (setq password (concat password (char-to-string (elt charset (random charset-length))))))
    password))


(defun to-clip (start end)
  "Process the region between START and END."
  (interactive "r")
  ;; Code to work with the selected region
  (shell-command-on-region start end "xclip -sel clip"))


(defun insert-newline-below ()
  "Inserts a new line below the current line and places the cursor in it."
  (interactive)
  (end-of-line)
  (newline-and-indent))

(define-key evil-insert-state-map (kbd "C-k") 'insert-newline-below)


(defun dired-dotfiles-toggle ()
  "Show/hide dot-files"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
	(progn 
	  (set (make-local-variable 'dired-dotfiles-show-p) nil)
	  (message "h")
	  (dired-mark-files-regexp "^\\\.")
	  (dired-do-kill-lines))
      (progn (revert-buffer) ; otherwise just revert to re-show
	     (set (make-local-variable 'dired-dotfiles-show-p) t)))))



;; prevent Dired from creating a new buffer when pressing "^"
(eval-after-load "dired"
  '(define-key dired-mode-map (kbd "^")
     (lambda () (interactive)(find-alternate-file ".."))))


(defun extract-to-tmp-folder ()
  "Extract the current file in Dired mode to the /tmp/folder directory."
  (interactive)
  (let* ((file (dired-get-filename))
	 (file-name (file-name-nondirectory file))
	 (tmp-folder (concat "/tmp/project/" (file-name-sans-extension file-name))))
    (make-directory tmp-folder t)
    (shell-command (concat "unzip " (shell-quote-argument file) " -d " (shell-quote-argument tmp-folder))))
  (message "File extracted to /tmp/folder"))
