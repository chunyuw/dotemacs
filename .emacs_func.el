;; $Id$  -*- mode: Emacs-Lisp; coding: gb2312-unix; -*-
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
	(w32-shell-execute "open" file-name nil 1))))

(defun net-message (recipient text)
  "Send a net message with Emacs.\nThis needs Windows/NT, I think."
  (interactive "sHost(or IP): \nsMessage: ")
  (shell-command (format "net send %s %s" recipient text)))

(defun chunyu-maxize-emacs (&optional arg)
  "Maxize emacs and vice versa."
  (interactive "p")
  (if (eq arg 0)
      (w32-send-sys-command #xf120)
    (w32-send-sys-command #xf030)))

(defun chunyu-insert-file-variable ()
  "Insert file variable string \"-*- Major-Mode-Name -*-\" with
comment char"
  (interactive)
  (insert 
   (concat comment-start " -*- "
	   (substring 
	    (symbol-name (symbol-value 'major-mode)) 0 -5) 
	   " -*- " comment-end)))

(defun dired-execute-file (&optional arg)
  (interactive "P")
  (mapcar #'(lambda (file) (w32-shell-execute "open" file))
          (dired-get-marked-files nil arg)))

(defun dired-mouse-execute-file (event)
  "In dired, execute the file or goto directory name you click on."
  (interactive "e")
  (set-buffer (window-buffer (posn-window (event-end event))))
  (goto-char (posn-point (event-end event)))
  (dired-execute-file))

(defun chunyu-metapost-build-mp ()
  "build mp files"
  (interactive)
  (shell-command (format "mptopdf %s" (buffer-name))))

;; Chunyu's .emacs_func.el ends here.
