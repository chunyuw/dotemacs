(defun insert-my-name-and-date ()
  "insert your name and time."
  (interactive)
  (insert "your name\n")
  (insert "China.\n")
  (insert (format-time-string "%a %b %e, %Y %l:%M %p\n")))

(defun dos-unix () (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos () (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

