(defun run-dj-repl (repl)
  "Start a REPL session in a shell buffer."
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


(defmacro send-line-to-repl (language)
  "Send the current line to the specified REPL buffer based on the language."
  `(defun ,(intern (format "l-%s-line" language)) ()
     (interactive)
     (send-dj-line (format "*%s REPL*" (capitalize ,language)))))

(send-line-to-repl "kotlin")
(send-line-to-repl "clj")

(defun send-dj-region (start end buffer)
  "Send the region between START and END to REPL buffer."
  ;;(interactive "r")
  (let ((code (buffer-substring-no-properties start end)))
    (with-current-buffer buffer
      (comint-send-string (get-buffer-process (current-buffer)) (concat code "\n")))))


(defmacro send-region-to-repl (language)
  "Send region to specified REPL buffer"
  `(defun ,(intern (format "to-%s" language)) (start end)
     (interactive "r")
     (send-dj-region start end (format "*%s REPL*" (capitalize ,language)))))

(send-region-to-repl "kotlin")
