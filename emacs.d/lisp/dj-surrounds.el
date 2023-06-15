(defun surround-with-delimiters (beg end delimiter)
  "Surround the region between BEG and END with DELIMITER."
  (interactive "r\nsDelimiter: ")
  (save-excursion
    (goto-char beg)
    (insert delimiter)
    (goto-char end)
    (insert (pcase delimiter
              ("(" ")")
              ("[" "]")
              ("<" ">")
              ("\"" "\"")
              ("/*" "*/")
              ("'" "'")))))

