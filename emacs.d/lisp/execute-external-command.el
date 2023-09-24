
;;; execute-external-commands.el --- utils for interacting with shell
;;
;;; Code:

(defun shell-command-on-buffer ()
  "Asks for a command and executes it in inferior shell with
  current buffer as input."
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: ")))

(global-set-key (kbd "M-k") 'shell-command-on-buffer)

(defun e-run-command ()
  "Run external system programs.  Dmenu/Rofi -like. Tab/C-M-i to completion
n-[b/p] for walk backward or forward early commands history."
  (interactive)
  (require 'subr-x)
  (start-process "RUN" "RUN" (string-trim-right (read-shell-command "RUN: "))))

(defun xdg-open-location (filePathList)
  "Open files in linux desktop"
  (mapc
   (lambda (x)
     (let ((process-connection-type nil))
       (start-process "" nil "xdg-open" x)))
   filePathList))



;;DuckDuckgo search
(defun duckduckgo-search (text)
  "Search DuckDuckGo from Emacs."
  (interactive "sSearch: ")
  (browse-url
   (concat "https://duckduckgo.com/?q="
           (replace-regexp-in-string " " "+" text))))


(defun launch-executable-or-find-file ()
  "Launch the selected executable file in Dired."
  (interactive)
  (let ((file (dired-get-filename)))
    (if (and (not (file-directory-p file))(file-executable-p file))
        (start-process "exec-process" nil file)
      (dired-find-file))))

;; (define-key dired-mode-map (kbd "RET") 'launch-executable-or-find-file)
;; custom behaviour for return
(defun dj-setup-dired-mode ()
  "Setup dired mode with the custom keys."
  (local-set-key (kbd "RET") 'launch-executable-or-find-file))

(add-hook 'dired-mode-hook 'dj-setup-dired-mode)


(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
