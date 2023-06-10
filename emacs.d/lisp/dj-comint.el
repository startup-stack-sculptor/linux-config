(defun run-dj-repl (repl)
  "Start a dj REPL session in a shell buffer."
  (interactive "sEnter the name of repl executable: ")
  (shell)
  (setq result (concat "*" (capitalize repl)" REPL*"))
  (rename-buffer result)
  (comint-send-string (get-buffer-process result) (format "%s\n" repl)))

(defmacro send-dj-line (buffer)
  "Send the current line to the Kotlin REPL buffer."
  `(save-excursion
    (beginning-of-line)
    (set-mark (point))
    (end-of-line)
    (comint-send-region (get-buffer-process ,buffer) (region-beginning) (region-end))
    (comint-send-string (get-buffer-process ,buffer) "\n")
    (setq deactivate-mark t)))

(defun send-kotlin-line ()
  "Send the current line to the Kotlin REPL buffer."
  (interactive)
  (send-dj-line "*Kotlin REPL*"))


(defun send-clojure-line ()
  "Send the current line to the Kotlin REPL buffer."
  (interactive)
  (send-dj-line "*Clj REPL*"))



(defun send-dj-region (start end buffer)
  "Send the region between START and END to REPL buffer."
  ;;(interactive "r")
  (let ((code (buffer-substring-no-properties start end)))
    (with-current-buffer buffer
      (comint-send-string (get-buffer-process (current-buffer)) code))))

(defun send-region-clj (start end)
  (interactive "r")
  (send-dj-region start end "*Clj REPL*"))


(defun send-region-kotlin (start end)
  (interactive "r")
  (send-dj-region start end "*Kotlin REPL*"))
