;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_func.el, created on 2004/03/28 on ds1.db.hit.edu.cn.

(defun chunyu-message-expand (&optional arg)
  "message mode expand."
  (interactive)
  (if (and (message-mail-p) (message-point-in-header-p))
      (bbdb-complete-name arg)
    (hippie-expand arg)))

(defun chunyu-view-scroll-forward (&optional lines)
  "Move forward one line or LINES lines."
  (interactive "p")
  (let ((pos (point)))
    (view-scroll-lines lines nil 1 t)
    (goto-char pos)
    (next-line lines)))

(defun chunyu-view-scroll-backward (&optional lines)
  "Move backward one line or LINES lines."
  (interactive "p")
  (let ((pos (point)))
    (view-scroll-lines lines t 1 t)
    (goto-char pos)
    (previous-line lines)))

(defun chunyu-bs-backup-unmark ()
  (interactive)
  (bs-up 1)
  (bs-unmark-current 1)
  (bs-up 1))

(defun chunyu-kill-this-buffer ()
  (interactive)
  (if (equal (buffer-name) "*scratch*")
      (progn (erase-buffer)
	     (set-buffer-modified-p nil)
	     (bury-buffer))
    (kill-buffer (current-buffer))))

(defun chunyu-dired-open-explorer ()
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if (file-exists-p file-name)
	(start-process "dir" nil 
		       "cmd.exe" "/c" "start" file-name))))

(defun net-message (recipient text)
  "Send a net message with Emacs.\nThis needs Windows/NT, I think."
  (interactive "s机器名(或IP): \ns消息内容: ")
  (shell-command (format "net send %s %s" recipient text)))

;; Chunyu's .emacs_func.el ends here.
