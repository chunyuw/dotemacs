;; $Id$  -*- mode: emacs-lisp; coding: gb2312; -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs.el, created on 2001/12/11 on db.hit.edu.cn.

(global-set-key [f1] 'cvs-examine)
(global-set-key [f5] 'undo)
(global-set-key [f6] 'eshell)
(global-set-key [f7] 'calendar)
(global-set-key [f9] 'view-mode)
(global-set-key [f8] 'other-window)
(global-set-key [f11] 'compile)
(global-set-key [f12] 'gdb)

(global-unset-key "\C-\\")

(global-set-key "\C-x\C-b" 'bs-show)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xk" 'kill-this-buffer)
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\C-c\C-v" 'view-mode)
(global-set-key "\C-c\C-z" 'pop-global-mark)
(global-set-key "\C-\\" 'toggle-truncate-lines)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-n" 'gnus)
(global-set-key "\M-`" 'next-error)
(global-set-key [(home)] 'beginning-of-buffer)
(global-set-key [(end)] 'end-of-buffer)
(global-set-key [(insertchar)] 'overwrite-mode)
(global-set-key [(control meta s)] 'isearch-forward)
(global-set-key [(control meta r)] 'isearch-backward)
(global-set-key [(control s)] 'isearch-forward-regexp)
(global-set-key [(control r)] 'isearch-backward-regexp)
(global-set-key "\C-xB" 'bury-buffer)
(global-set-key "\C-xE" 'apply-macro-to-region-lines)
(global-set-key "\C-xI" 'insert-buffer)

(global-set-key "\C-c\C-_" 'mst-under-line)

(define-prefix-command 'ctl-x-m-map)
(global-set-key "\C-xm" 'ctl-x-m-map)
(define-key ctl-x-m-map "s" 'dictionary-search)
(define-key ctl-x-m-map "c" 'boxquote-shell-command)
(define-key ctl-x-m-map "f" 'boxquote-describe-function)
(define-key ctl-x-m-map "i" 'boxquote-insert-file)
(define-key ctl-x-m-map "k" 'boxquote-describe-key)
(define-key ctl-x-m-map "p" 'boxquote-paragraph)
(define-key ctl-x-m-map "r" 'boxquote-region)
(define-key ctl-x-m-map "t" 'boxquote-title)
(define-key ctl-x-m-map "u" 'boxquote-unbox)
(define-key ctl-x-m-map "v" 'boxquote-describe-variable)
(define-key ctl-x-m-map "y" 'boxquote-yank)
(define-key ctl-x-m-map "e" 'cvs-examine)
(define-key ctl-x-m-map "m" 'man-follow)
(define-key ctl-x-m-map "g" 'run-scheme)
(define-key ctl-x-m-map "b" 'list-bookmarks)
(define-key ctl-x-m-map "l" 'browse-kill-ring)
(define-key ctl-x-m-map "a" 'align-current)
(define-key ctl-x-m-map "w" 'ibuffer)

(define-prefix-command 'meta-m-map)
(global-set-key "\M-m" 'meta-m-map)
(define-key meta-m-map "\M-m" 'back-to-indentation)
(define-key meta-m-map "\M-o" 'other-window)
(define-key meta-m-map "\M-n" 'gnus)
(define-key meta-m-map "\M-i" 'imenu)
(define-key meta-m-map "\M-k" 'emacs-wiki-find-file)
(define-key meta-m-map "\M-p" 'emacs-wiki-publish)
(define-key meta-m-map "c"    'calendar)

(setq inhibit-startup-message t
      default-major-mode 'text-mode
      initial-major-mode 'lisp-interaction-mode ; 'text-mode
      next-line-add-newlines nil
      require-final-newline t
      resize-mini-windows nil		; 'grow-only
      track-eol t
      Man-notify-method 'pushy
      uniquify-buffer-name-style 'forward
      confirm-kill-emacs nil
      suggest-key-bindings 1
      line-number-display-limit 1000000
      kill-ring-max 100
      vc-follow-symlinks t
      enable-recursive-minibuffers t
      ring-bell-function 'ignore)

(setq truncate-partial-width-windows nil
      Info-use-header-line nil
      sentence-end-double-space nil
      makefile-electric-keys t
      compilation-window-height 10
      scroll-preserve-screen-position t
      apropos-do-all nil)

(setq bookmark-save-flag 1
      bookmark-default-file "~/.emacs.d/.emacs.bmk")

(setq dired-listing-switches "-avl"
      dired-recursive-copies t
      dired-recursive-deletes t
      cvs-dired-use-hook 'always)

(setq abbrev-file-name "~/.emacs.d/.abbrev_defs"
      custom-file "~/.emacs.d/.emacs_custom.el"
      custom-buffer-done-function 'kill-buffer)

(setq display-time-24hr-format t
      display-time-day-and-date t
      display-time-use-mail-icon t
      display-time-interval 10)

(setq gnus-inhibit-startup-message t
      gnus-init-file "~/.emacs.d/.gnus.el")

(setq mail-signature-file "~/.sig/default"
      mail-user-agent 'gnus-user-agent
      mail-alias-file "~/.mailrc"
      user-full-name "Chunyu Wang"
      user-mail-address "chunyu@hit.edu.cn")

(setq time-stamp-active t
      time-stamp-warn-inactive t
      time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chunyu")

(setq diary-file "~/.emacs.d/.diary"
      calendar-latitude +45.75
      calendar-longitude +126.63
      calendar-location-name "Harbin"
      calendar-remove-frame-by-deleting t
      calendar-week-start-day 1
      chinese-calendar-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"]
      chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"]
      general-holidays
      '((holiday-fixed 1 1 "元旦") (holiday-fixed 4 1 "愚人节")
	(holiday-float 5 0 2 "母亲节") (holiday-float 6 0 3 "父亲节"))
      christian-holidays nil
      hebrew-holidays nil
      islamic-holidays nil
      solar-holidays nil)

(setq mark-diary-entries-in-calendar t
      appt-issue-message nil
      mark-holidays-in-calendar nil
      view-calendar-holidays-initially nil)

(setq todo-file-do "~/.emacs.d/todo-do"
      todo-file-done "~/.emacs.d/todo-done"
      todo-file-top "~/.emacs.d/todo-top")

(setq version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t
      backup-directory-alist '(("." . "~/var/tmp"))
      backup-by-copying t
      backup-by-copying-when-linked t
      backup-by-copying-when-mismatch t)

(setq font-lock-maximum-decoration t
      font-lock-global-modes '(not shell-mode text-mode)
      font-lock-verbose t
      font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000)))

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

(setq ido-enable-tramp-completion t
      ido-use-filename-at-point t
      ido-save-directory-list-file nil)

(setq tramp-unified-filenames t
      tramp-auto-save-directory "~/var/tramp"
      ;; ange-ftp-smart-gateway nil
      ange-ftp-smart-gateway nil
      ;; ange-ftp-gateway-ftp-program-name nil
      ;; ange-ftp-local-host-regexp ".*$"
      ange-ftp-generate-anonymous-password "user@cyber.net"
      ange-ftp-default-user t)

(setq quack-default-program "guile"
      quack-fontify-style nil)

(setq bbdb-file "~/.emacs.d/.bbdb")

(setq canlock-password "a6763075ef97955033c40069155a4ef7b1d67fee"

(setq frame-title-format "emacs@%b")
      dictionary-server "192.168.1.191")

(setq help-at-pt-display-when-idle 
      '(keymap local-map button kbd-help))

(setq-default kill-whole-line t)

(set-register ?e '(file . "~/.emacs.d/.emacs.el"))
(set-register ?g '(file . "~/.emacs.d/.gnus.el"))
(set-register ?q '(file . "/ftp:chunyu@itrb#8021:/"))
(set-register ?z '(file . "/usr/local/share/zope/var/Z2.log"))
(set-register ?w '(file . "~/Wiki"))
(set-register ?j '(file . "~/work/xmldb/loader"))
(setenv "DISPLAY" "chunyu:0")

(set-language-environment    'Chinese-GB)
(set-keyboard-coding-system  'chinese-iso-8bit)
(set-terminal-coding-system  'chinese-iso-8bit)
(set-clipboard-coding-system 'chinese-iso-8bit)
(set-selection-coding-system 'chinese-iso-8bit)
;; (prefer-coding-system 'chinese-iso-8bit)
;; (define-coding-system-alias 'gb18030 'gb2312)

(fset 'yes-or-no-p 'y-or-n-p)

(find-function-setup-keys)
(minibuffer-electric-default-mode 1)
(partial-completion-mode 1)
(utf-translate-cjk-mode 1)
(global-font-lock-mode 1)
(auto-compression-mode 1)
(column-number-mode 1)
(blink-cursor-mode -1)
(display-time-mode 1)
(show-paren-mode 1)
(menu-bar-mode (if window-system 1 -1))
(icomplete-mode 1)
(ido-mode 1)
;; (add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
(add-hook 'dired-load-hook
          (lambda ()
	    (load "dired-x")
	    (define-key dired-mode-map "b" 'dired-mark-extension)))

(add-hook 'diary-hook 'appt-make-list)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'write-file-hooks 'time-stamp)

(setq dired-view-command-alist
      '(("[.]\\(ps\\|ps_pages\\|eps\\)\\'" . "gv -spartan -color -watch %s")
	("[.]pdf\\'" . "xpdf %s")
	("[.]dvi\\'" . "xdvi -sidemargin 0.5 -topmargin 1 %s")))

(add-hook 'message-setup-hook
	  (lambda ()
	    (define-key message-mode-map "\M-/" 'chunyu-message-expand)))

(add-hook 'ido-define-mode-map-hook
	  (lambda ()
	    (define-key ido-mode-map "\M-\d" 'ido-delete-backward-updir)))

(add-hook 'c-mode-common-hook
	  (lambda ()
(eval-after-load "help-mode"
  '(progn (define-key help-mode-map "l" 'help-go-back)))

(eval-after-load "view"
  '(progn (define-key view-mode-map "j" 'chunyu-view-scroll-forward)
	  (define-key view-mode-map "k" 'chunyu-view-scroll-backward)))

(defun mst-under-line ()
  (interactive)
  (end-of-line)
  (let ((end (current-column)))
    (newline)
    (loop repeat end do (insert "-"))
    (newline)))

	    (c-toggle-auto-hungry-state 1)
	    (which-func-mode 1)))

(add-hook 'bs-mode-hook 'hl-line-mode)

(defun chunyu-message-expand (&optional arg)
  "message mode expand."
  (interactive)
  (if (message-point-in-header-p)
      (bbdb-complete-name arg)
    (hippie-expand arg)))

(defun chunyu-view-scroll-forward (&optional lines)
  "Movie forward, default one line, with prefix number N, move N lines."
  (interactive "p")
  (let ((pos (point)))
    (view-scroll-lines lines nil 1 t)
    (goto-char pos)
    (next-line lines)))

(defun chunyu-view-scroll-backward (&optional lines)
  "Movie backward, default one line, with prefix number N, move N lines."
  (interactive "p")
  (let ((pos (point)))
    (view-scroll-lines lines t 1 t)
       (set-face-background 'region "blue")
    (previous-line lines)))

(cond ((not window-system) ;; text console
       (setq frame-background-mode 'dark)
       (setq Info-use-header-line nil)
       (setq dired-view-command-alist
	     (append '(("[.]\\(jpe?g\\|gif\\|png\\)\\'" . "ee %s"))
		     dired-view-command-alist)))

      (window-system ;; both X-Window and MS Windows systems
       (global-set-key (kbd "C--") 'undo)
       (setq x-stretch-cursor nil)
       (auto-image-file-mode 1)
       (scroll-bar-mode -1)
       (tool-bar-mode -1)

       (setq default-frame-alist
	     `((vertical-scroll-bars)
	       (background-color . "DarkSlateGrey")
	       (foreground-color . "Wheat")
	       (cursor-color . "gold1")
	       (mouse-color . "gold1")))

       (cond ((eq window-system 'w32) ;; MS windows system
	      (defun net-message (recipient text)
		"Send a net message with Emacs.\nThis needs Windows/NT, I think."
		(interactive "s机器名(或IP): \ns消息内容: ")
		(shell-command (format "net send %s %s" recipient text))))

	     ((eq window-system 'x) ;; X-Window system
	      (setq visible-bell t)
	      (setq ring-bell-function t)
	      (setq default-frame-alist
		    (append '((top . 0) (left . 0)
			      (width . 111) (height . 46)
			      (font . "9x15"))
			    default-frame-alist))))))

(autoload 'big5togb-region "big5togb" "Big5 to GB2312" t)
(autoload 'css-mode "css-mode" "CSS editing mode" t)
(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'flex-mode "flex-mode.el" "Flex mode" t)
(autoload 'py-shell "python-mode" "Python shell" t)
(autoload 'folding-mode          "folding" "Folding mode" t)
(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
(autoload 'turn-on-folding-mode  "folding" "Folding mode" t)
(autoload 'htmlize-buffer "htmlize.el" "HTMLize mode" t)
(autoload 'browse-kill-ring "browse-kill-ring.el" "Browse kill ring" t)
;; (autoload 'folding-mode          "folding" "Folding mode" t)
;; (autoload 'turn-off-folding-mode "folding" "Folding mode" t)
;; (autoload 'turn-on-folding-mode  "folding" "Folding mode" t)

(setq auto-mode-alist
      (append '(("\\.py\\'" . python-mode)
		("\\.s?html?\\'" . html-helper-mode)
		("\\.asp\\'" . html-helper-mode)
(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))

(require 'gnus-load)
(require 'tex-site)
		("\\.css\\'" . css-mode))
(require 'compile)
	      auto-mode-alist))
(require 'uniquify)
(require 'generic-x)
;; (require 'flyspell)

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'tex-site)
(require 'boxquote)
(require 'dired-tar)
(require 'browse-kill-ring)

;; (setq exec-path (cons "/usr/local/share/xref" exec-path))
;; (setq load-path (cons "/usr/local/share/xref/emacs" load-path))
;; (load "xrefactory")

;; (setq semantic-load-turn-everything-on t)
;; (load-file "~/.emacs.d/.emacs_smtp.el")
;; (load-file "~/.emacs.d/.emacs_erc.el")

(load "~/.emacs.d/.emacs-records")
(setq records-init-file"~/.emacs.d/.emacs-records")

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)

;; Chunyu's .emacs.el ends here.
