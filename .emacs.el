;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs.el is created on db.hit.edu.cn.    Chunyu.<dddkk@sina.com> 

(global-set-key [f1] 'cvs-examine)
(global-set-key [f5] 'undo)
(global-set-key [f6] 'eshell)
(global-set-key [f7] 'calendar)
(global-set-key [f9] 'view-mode)
(global-set-key [f8] 'other-window)
(global-set-key [f11] 'compile)
(global-set-key [f12] 'gdb)

(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xk" 'kill-buffer-directly)
(global-set-key "\C-xm" 'man-follow)
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\C-c\C-v" 'view-mode)
(global-set-key "\C-c\C-z" 'pop-global-mark)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-/" 'hippie-expand)           ; dabbrev-expand
(global-set-key "\C-\\" 'dictionary-search)
(global-set-key "\M-o" 'other-window)            ; M-o
(global-set-key [(home)] 'beginning-of-buffer)
(global-set-key [(end)] 'end-of-buffer)

(setq inhibit-startup-message t)
(setq default-major-mode 'text-mode)
(setq uniquify-buffer-name-style 'forward)
(setq ido-save-directory-list-file nil)
(setq resize-mini-windows nil)
(setq display-time-day-and-date t)
(setq next-line-add-newlines nil)
(setq display-time-24hr-format t)
(setq require-final-newline t)
(setq user-mail-address "dddkk@sina.com")
(setq dired-listing-switches "-avl")    ;`C-u s'
(setq user-full-name "Chunyu Wang")
(setq compile-command "make ")
(setq diary-file "~/.diary")
(setq bookmark-save-flag 1)
(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)
(setq Man-notify-method 'pushy)
(setq dictionary-server "192.168.1.194")

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
(menu-bar-mode -1)
(tool-bar-mode -1)
(ido-mode t)

(set-terminal-coding-system 'chinese-iso-8bit)
(set-keyboard-coding-system 'chinese-iso-8bit)
(set-language-environment 'Chinese-GB)

(setq hippie-expand-try-functions-list
      '(try-expand-line
        try-expand-line-all-buffers
        try-expand-list
        try-expand-list-all-buffers
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-file-name-partially
        try-complete-lisp-symbol
        try-complete-lisp-symbol-partially
        try-expand-whole-kill))

(defalias 'yes-or-no-p 'y-or-n-p)

(set-register ?e '(file . "~/.emacs.el"))
(set-register ?q '(file . "/ftp:chunyu@itrb#8021:/"))
(set-register ?z '(file . "/usr/local/share/zope/var/Z2.log"))
(setenv "DISPLAY" "chunyu:0")
(setq emacs-wiki-directories  '("~/00PAGE/m/Wiki"))
(setq canlock-password "f6d9e4eb8360cf2cd5db9d5d0f83f7f09ac74767")

(ido-mode 1)
(add-hook 'dired-load-hook (lambda () (load "dired-x")))

(if (not window-system) nil
  (set-background-color "DarkSlateGrey")
  (set-foreground-color "Wheat")
  (set-cursor-color "gold1"))
	      (setq default-frame-alist
(autoload 'todo-mode "todo-mode" "Major mode for editing TODO lists." t)
(autoload 'todo-show "todo-mode" "Show TODO items." t)
(autoload 'todo-insert-item "todo-mode" "Add TODO item." t)
(autoload 'big5togb-region "big5togb" "Big5 to GB2312" t)
(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'css-mode "css-mode" "CSS editing mode" t)
(autoload 'htmlize-buffer "htmlize.el" "HTMLize mode" t)
(setq auto-mode-alist 
;; (autoload 'folding-mode          "folding" "Folding mode" t)
                ("\\.css\\'" . css-mode))
              auto-mode-alist))

(defun dos-unix () (interactive) (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos () (interactive) (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))
(defun kill-buffer-directly () (interactive) (kill-buffer nil))
		("\\.s?html?\\'" . html-helper-mode)
(require 'compile)
(require 'jka-compr)
(require 'uniquify)
(require 'dired-tar)

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)

;; Chunyu's .emacs.el ends here.
