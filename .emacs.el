; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs.el is created on db.hit.edu.cn.    Chunyu.<dddkk@sina.com> 

(global-set-key [f1] 'cvs-examine) 
(global-set-key [f2] 'browse-url-lynx-emacs) 
(global-set-key [f3] 'eshell) 
(global-set-key [f4] 'kill-buffer-directly)
(global-set-key [f5] 'undo)
(global-set-key [f6] 'ansi-term)
(global-set-key [f7] 'calendar)
(global-set-key [f8] 'other-window) 
(global-set-key [f9] 'py-shell)
(global-set-key [f10] 'man-follow)
(global-set-key [f11] 'compile)
(global-set-key [f12] 'gdb)

(global-set-key "\C-x\C-b" 'electric-buffer-list) ; ibuffer
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\C-c\C-v" 'view-mode)
(global-set-key "\C-c\C-z" 'pop-global-mark)
(global-set-key "\C-z"     'set-mark-command)
(global-set-key [(home)]   'beginning-of-buffer)
(global-set-key [(end)]    'end-of-buffer)
;;(global-set-key [mouse-3]  'mouse-buffer-menu)


;;(setq text-mode-hook 'turn-on-auto-fill)
;;(setq inhibit-startup-message t)
;;(setq default-major-mode 'text-mode)
(setq display-time-day-and-date t)
(setq next-line-add-newlines nil)
(setq display-time-24hr-format t)
(setq require-final-newline t)
(setq user-mail-address "dddkk@sina.com")
(setq dired-listing-switches "-avl") ;;`C-u s'
(setq user-full-name "Chunyu")
;;(setq gdb-command-name "gdb ")
(setq compile-command "make ")
(setq diary-file "~/.diary")
;;(setq scroll-step 0)
;; (prefer-coding-system 'chinese-iso-8bit)
(auto-compression-mode t)
(column-number-mode t)
(display-time-mode t)
(show-paren-mode t)
(menu-bar-mode nil)
(global-font-lock-mode t)

(set-terminal-coding-system 'chinese-iso-8bit)
;;(set-keyboard-coding-system 'chinese-iso-8bit)
(set-language-environment 'Chinese-GB)

(cond ((if window-system  t nil)
       ;;(set-background-color "DarkSlateGrey")
       ;;(set-foreground-color "Wheat")
       ;;(set-cursor-color "gold1")
       (tool-bar-mode nil)
       ))
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ))
	      (setq default-frame-alist
;;(require 'python-mode)
;;(setq auto-mode-alist
;;      (cons '("\\.py$" . python-mode) auto-mode-alist))
;;(setq interpreter-mode-alist
;;      (cons '("python" . python-mode) interpreter-mode-alist))

(defun dos-unix () (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos () (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))
(defun kill-buffer-directly () (interactive)
  (kill-buffer nil))
(defun load-python () (interactive)
   (require 'python-mode)
   (setq auto-mode-alist
	 (cons '("\\.py$" . python-mode) auto-mode-alist))
   (setq interpreter-mode-alist
	 (cons '("python" . python-mode) interpreter-mode-alist)))
(require 'jka-compr)
(require 'dired-tar)
;;(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|\\.pyo\\|\\.pyc$")
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)

;; Chunyu's .emacs.el ends here.
