;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs.el is created on 2001/12/11 on db.hit.edu.cn. 
;; Chunyu <chunyu@hit.edu.cn>.

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
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\C-c\C-v" 'view-mode)
(global-set-key "\C-c\C-z" 'pop-global-mark)
(global-set-key "\C-\\" 'toggle-truncate-lines)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-n" 'gnus)
(global-set-key [(home)] 'beginning-of-buffer)
(global-set-key [(end)] 'end-of-buffer)

(define-prefix-command 'ctl-xm-map)
(global-set-key "\C-xm" 'ctl-xm-map)
(define-key ctl-xm-map "s" 'dictionary-search)
(define-key ctl-xm-map "c" 'boxquote-shell-command)
(define-key ctl-xm-map "f" 'boxquote-describe-function)
(define-key ctl-xm-map "i" 'boxquote-insert-file)
(define-key ctl-xm-map "k" 'boxquote-describe-key)
(define-key ctl-xm-map "p" 'boxquote-paragraph)
(define-key ctl-xm-map "r" 'boxquote-region)
(define-key ctl-xm-map "t" 'boxquote-title)
(define-key ctl-xm-map "u" 'boxquote-unbox)
(define-key ctl-xm-map "v" 'boxquote-describe-variable)
(define-key ctl-xm-map "y" 'boxquote-yank)
(define-key ctl-xm-map "e" 'cvs-examine)
(define-key ctl-xm-map "m" 'man-follow)
(define-key ctl-xm-map "g" 'run-scheme)

(setq inhibit-startup-message t
      default-major-mode 'text-mode
      next-line-add-newlines nil
      require-final-newline t
      resize-mini-windows nil
      bookmark-save-flag 1
      track-eol t
      Man-notify-method 'pushy
      uniquify-buffer-name-style 'forward
      confirm-kill-emacs nil		; 'y-or-n-p
      gnus-inhibit-startup-message t

      apropos-do-all nil
      x-stretch-cursor t

      compilation-scroll-output t
      compile-command "make "

      dired-listing-switches "-avl"	;`C-u s'
      dired-recursive-copies t
      dired-recursive-deletes t
      dired-guess-shell-gnutar t
      cvs-dired-use-hook 'always

      display-time-24hr-format t
      display-time-day-and-date t
      display-time-use-mail-icon t
      display-time-interval 10

      mail-signature-file "~/.sig/default"
      mail-user-agent 'gnus-user-agent
      mail-alias-file "~/.mailrc"
      user-full-name "Chunyu Wang"
      user-mail-address "chunyu@hit.edu.cn"

      time-stamp-active t
      time-stamp-warn-inactive t
      time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S %u on %s"

      diary-file "~/.diary"
      calendar-latitude +45.75
      calendar-longitude +126.63
      calendar-location-name "Harbin"
      calendar-remove-frame-by-deleting t
      calendar-week-start-day 1
      mark-diary-entries-in-calendar t
      appt-issue-message nil
      mark-holidays-in-calendar nil
      view-calendar-holidays-initially nil

      version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t
      backup-directory-alist '(("" . "~/var/tmp"))
      backup-by-copying-when-linked t
      backup-by-copying-when-mismatch t
      
      font-lock-maximum-decoration t
      font-lock-global-modes '(not shell-mode text-mode)
      font-lock-verbose t
      font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000))

      hippie-expand-try-functions-list
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
	try-expand-whole-kill)

      ido-enable-tramp-completion t
      ido-save-directory-list-file nil
      ido-save-directory-list-file nil)
      quack-default-program "guile"
      quack-fontify-style nil
      quack-fontify-style nil)
      dictionary-server "192.168.1.191"
      canlock-password "a6763075ef97955033c40069155a4ef7b1d67fee"
      )


(setq help-at-pt-display-when-idle 
(set-register ?e '(file . "~/.emacs.el"))
(set-register ?g '(file . "~/.gnus.el"))
(setq-default kill-whole-line t)

(set-register ?v '(file . "/usr/local/cvsroot/sprcvs"))
(set-register ?w '(file . "~/work"))
(set-register ?q '(file . "/ftp:chunyu@itrb#8021:/"))
(set-register ?z '(file . "/usr/local/share/zope/var/Z2.log"))
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'chinese-iso-8bit)
(set-terminal-coding-system 'chinese-iso-8bit)


(set-selection-coding-system 'chinese-iso-8bit)
;; (prefer-coding-system 'chinese-iso-8bit)


(find-function-setup-keys)
(file-name-shadow-mode 1)
(minibuffer-electric-default-mode 1)
(partial-completion-mode 1)
(utf-translate-cjk-mode 1)
(global-font-lock-mode 1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(display-time-mode 1)
(ido-mode 1)
(add-hook 'dired-load-hook
	  (lambda () 
	    (load "dired-x")
	    (setq dired-view-command-alist
		  (append '(("[.]\\(jpg\\|gif\\|png\\)\\'" . "ee"))
			  dired-view-command-alist))))

(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1)

  (set-background-color "DarkSlateGrey")
  (set-foreground-color "Wheat")
  (set-cursor-color "gold1")

  (if (facep 'mode-line)
      (set-face-attribute 'mode-line nil :foreground "DarkSlateGrey" :background "Wheat"))
  (if (facep 'fringe)
      (set-face-attribute 'fringe nil :foreground "lawngreen" :background "SteelBlue4"))
  (if (facep 'tool-bar)
      (set-face-background 'tool-bar "DarkSlateGrey"))
  (if (facep 'menu)
      (face-spec-set 'menu '((t (:foreground "Wheat" :background "DarkSlateGrey")))))
  (if (facep 'trailing-whitespace)
      (set-face-background 'trailing-whitespace "SeaGreen1"))
  (if (facep 'minibuffer-prompt)
      (face-spec-set 'minibuffer-prompt '((t (:foreground "cyan"))))))
	      (setq default-frame-alist
		    (append '((top . 0) (left . 0)
			      (width . 111) (height . 46)
			      (font . "9x15"))

(autoload 'big5togb-region "big5togb" "Big5 to GB2312" t)
(autoload 'todo-insert-item "todo-mode" "Add TODO item." t)
(autoload 'todo-mode "todo-mode" "Major mode for editing TODO lists." t)
(autoload 'todo-show "todo-mode" "Show TODO items." t)
(autoload 'htmlize-buffer "htmlize.el" "HTMLize mode" t)
(setq auto-mode-alist 
;; (autoload 'folding-mode          "folding" "Folding mode" t)
                ("\\.css\\'" . css-mode)) auto-mode-alist))

(defun dos-unix () (interactive) (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos () (interactive) (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))
(defun kill-buffer-directly () (interactive) (kill-buffer nil))
		("\\.s?html?\\'" . html-helper-mode)
		("\\.css\\'" . css-mode))
(require 'compile)
	      auto-mode-alist))
(require 'jka-compr)
(require 'uniquify)
(require 'tramp)

(add-to-list 'backup-directory-alist
	     (cons tramp-file-name-regexp nil))

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'rmail 'disabled t)
(add-to-list 'load-path "~/.emacs.d/elisp")
;;(load-file "~/.emacs_smtp.el")
;;(load-file "~/.emacs_erc.el")
;;(load-file "~/.emacs_bbdb.el")

;; .emacs.el ends here.
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)

;; Chunyu's .emacs.el ends here.
