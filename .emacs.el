;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs.el is created on db.hit.edu.cn.    Chunyu.<dddkk@sina.com>

(global-set-key [f1] 'cvs-examine)
(global-set-key [f5] 'undo)
(global-set-key [f6] 'eshell)
(global-set-key [f7] 'calendar)
(global-set-key [f9] 'view-mode)
(global-set-key [f8] 'other-window)
(global-set-key [f10] 'man-follow)
(global-set-key [f11] 'compile)
(global-set-key [f12] 'gdb)

(global-set-key "\C-x\C-b" 'bs-show) ;; `ibuffer' or `electric-buffer-list' other choices
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xk" 'kill-buffer-directly)
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\C-c\C-v" 'view-mode)
(global-set-key "\C-c\C-z" 'pop-global-mark)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-/" 'hippie-expand) ;;dabbrev-expand
(global-set-key [(home)] 'beginning-of-buffer)
(global-set-key [(end)] 'end-of-buffer)

;;(setq text-mode-hook 'turn-on-auto-fill)
;;(setq inhibit-startup-message t)
;;(setq default-major-mode 'text-mode)
(setq uniquify-buffer-name-style 'forward)
(setq bs-default-configuration 'all) ;; all, files or files-and-scratch
(setq display-time-day-and-date t)
(setq next-line-add-newlines nil)
(setq display-time-24hr-format t)
(setq require-final-newline t)
(setq user-mail-address "dddkk@sina.com")
(setq dired-listing-switches "-avl")  ;;Set it by hand with `C-u s'.
(setq user-full-name "Chunyu")
;;(setq gdb-command-name "gdb ")
(setq compile-command "make ")
(setq diary-file "~/.diary")
;;(setq scroll-step 0)
(setq bookmark-save-flag 1)


(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("" . "~/tmp")))
;; (prefer-coding-system 'chinese-iso-8bit)
(global-font-lock-mode t)
(auto-compression-mode t)
(column-number-mode t)
(display-time-mode t)
(show-paren-mode t)
(menu-bar-mode nil)
(iswitchb-mode)

(defalias 'yes-or-no-p 'y-or-n-p)

(set-register ?q '(file . "/ftp:chunyu@itrb#8021:/"))
(setenv "DISPLAY" "chunyu:0")

(set-terminal-coding-system 'chinese-iso-8bit)
;;(set-keyboard-coding-system 'chinese-iso-8bit)
(set-language-environment 'Chinese-GB)

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name
        try-complete-file-name-partially
	try-complete-lisp-symbol
        try-complete-lisp-symbol-partially
        try-expand-whole-kill))

(cond ((if window-system  t nil)
       (set-background-color "DarkSlateGrey")
       (set-foreground-color "Wheat")
       (set-cursor-color "gold1")
       (tool-bar-mode nil)
       ))

(add-hook 'dired-load-hook
	  (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ))
	      (setq default-frame-alist
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))

(defun dos-unix () (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos () (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))
(defun kill-buffer-directly () (interactive) (kill-buffer nil))
		("\\.s?html?\\'" . html-helper-mode)
(require 'jka-compr)
(require 'uniquify)
(require 'dired-tar)
(require 'iptables-save-mode)

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(canlock-password "f6d9e4eb8360cf2cd5db9d5d0f83f7f09ac74767"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)

;; Chunyu's .emacs.el ends here.
