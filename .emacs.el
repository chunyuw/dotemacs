;; $Id$  -*- mode: Emacs-Lisp; coding: gb2312-unix; -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs.el, created on 2001/12/11 on db.hit.edu.cn.

(global-set-key [f11] 'compile)
(global-set-key [f12] 'gdb)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-unset-key [(insert)])

(global-set-key "\C-x\C-b" 'bs-show)
;;(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-x\C-p" 'pop-global-mark)
(global-set-key "\C-x\C-v" 'view-file)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xk" 'chunyu-kill-this-buffer)
(global-set-key "\C-xB" 'bury-buffer)
(global-set-key "\C-xE" 'apply-macro-to-region-lines)
(global-set-key "\C-xI" 'insert-buffer)
(global-set-key "\C-xve" 'cvs-examine)
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\C-c\C-v" 'view-mode)
(global-set-key "\C-\\" 'toggle-truncate-lines)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-n" 'gnus)
(global-set-key "\M-`" 'next-error)
(global-set-key "\C-\M-[" 'keyboard-escape-quit)
(setq outline-minor-mode-prefix "\C-c\C-o")

(require 'gnus-load)
(require 'bs)
(require 'ido)
(require 'view)
(require 'info)
(require 'dired)
(require 'dired-x)
(require 'uniquify)
(require 'help-mode)
(require 'generic-x)
;; (require 'compile)
;; (require 'flyspell)
;; (require 're-builder)

(define-key help-mode-map "l" 'help-go-back)
(define-key view-mode-map "j" 'chunyu-view-scroll-forward)
(define-key view-mode-map "k" 'chunyu-view-scroll-backward)
(define-key Info-mode-map "w" 'Info-scroll-down)
(define-key Info-mode-map "j" 'chunyu-view-scroll-forward)
(define-key Info-mode-map "k" 'chunyu-view-scroll-backward)
(define-key Info-mode-map "\M-n" 'gnus)
(define-key dired-mode-map "b" 'dired-mark-extension)
(define-key dired-mode-map "T" 'dired-tar-pack-unpack)
(define-key dired-mode-map "c" 'dired-up-directory)
(define-key dired-mode-map "e" 'dired-mark-files-containing-regexp)
(define-key dired-mode-map "o" 'chunyu-dired-open-explorer)
(define-key dired-mode-map "j" 'dired-mark-files-regexp)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
(define-key dired-mode-map "/" 'dired-mark-directories)
(define-key dired-mode-map "K" 'dired-kill-subdir)
(define-key dired-mode-map [(control ?/)] 'dired-undo)
(define-key dired-mode-map [mouse-2] 'dired-mouse-execute-file)
(define-key bs-mode-map "\d" 'chunyu-bs-backup-unmark)

(eval-after-load "apropos"
  '(progn
     (require 'view)
     (define-key apropos-mode-map "n" 'forward-button)
     (define-key apropos-mode-map "p" 'backward-button)
     (define-key apropos-mode-map "j" 'chunyu-view-scroll-forward)
     (define-key apropos-mode-map "k" 'chunyu-view-scroll-backward)))

(define-prefix-command 'meta-m-map)
(global-set-key "\M-m" 'meta-m-map)
(define-key meta-m-map "\M-m" 'back-to-indentation)
(define-key meta-m-map "\M-o" 'other-window)
(define-key meta-m-map "\M-n" 'gnus)
(define-key meta-m-map "\M-i" 'imenu)
(define-key meta-m-map "\M-k" 'bbdb)
(define-key meta-m-map "\M-p" 'calendar)
(define-key meta-m-map "\M-l" 'dictionary-search)
(define-key meta-m-map "\M-e" 're-builder)
(define-key meta-m-map "c" 'compile)
(define-key meta-m-map "i" 'ibuffer)
(define-key meta-m-map "b" 'browse-kill-ring)
(define-key meta-m-map "a" 'chunyu-maxize-emacs)
(define-key meta-m-map "f" 'chunyu-insert-file-variable)
(define-key meta-m-map "\M-j" 'webjump)

(setq inhibit-startup-message t
      default-major-mode 'text-mode
      require-final-newline t
      resize-mini-windows t
      track-eol t
      kill-whole-line t
      Man-notify-method 'pushy
      woman-cache-level 2
      woman-cache-filename nil
      uniquify-buffer-name-style 'forward
      confirm-kill-emacs nil
      kill-ring-max 100
      vc-follow-symlinks t
      vc-suppress-confirm t
      enable-recursive-minibuffers t
      line-move-ignore-invisible t
      default-fill-column 78
      tooltip-gud-tips-p t)


;; (setq redisplay-dont-pause t)

(setq makefile-electric-keys t
      ;; truncate-partial-width-windows t
      ;; apropos-do-all t
      sentence-end-double-space nil
      compilation-window-height nil
      scroll-preserve-screen-position t
      font-lock-maximum-decoration t)

(setq bookmark-save-flag 1
      bookmark-default-file
      (substitute-in-file-name "~/.emacs.d/emacs_$HOSTNAME.bmk"))

(setq dired-listing-switches "-avl"
      dired-recursive-copies 'top
      dired-recursive-deletes 'top
      cvs-dired-use-hook 'always)

(setq abbrev-file-name "~/.emacs.d/.abbrev_defs"
      custom-file "~/.emacs.d/.emacs_custom.el"
      custom-buffer-done-function 'kill-buffer)

(setq display-time-24hr-format t
      display-time-day-and-date t)

(setq gnus-inhibit-startup-message t
      gnus-init-file "~/.emacs.d/.gnus.el"
      canlock-password "a6763075ef97955033c40069155a4ef7b1d67fee")

(setq mail-signature-file "~/.sig/default"
      mail-user-agent 'gnus-user-agent
      mail-alias-file "~/.mailrc"
      user-full-name "Chunyu Wang"
      user-mail-address "chunyu@hit.edu.cn")

(setq time-stamp-active t
      time-stamp-warn-inactive t
      time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chunyu")

(setq todo-file-do "~/.emacs.d/todo-do"
      todo-file-done "~/.emacs.d/todo-done"
      todo-file-top "~/.emacs.d/todo-top")

(setq version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t
      backup-directory-alist
      `(("." . "~/var/tmp")
	,(cons tramp-file-name-regexp nil))
      backup-by-copying t
      backup-by-copying-when-linked t
      backup-by-copying-when-mismatch t)

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

(setq ido-max-prospects 8
      ido-show-dot-for-dired nil
      ido-use-filename-at-point t
      ido-enable-tramp-completion t
      ;; ido-enable-flex-matching t
      ido-save-directory-list-file nil)

(setq tramp-unified-filenames t
      tramp-auto-save-directory "~/var/tramp"
      ange-ftp-smart-gateway nil
      ange-ftp-generate-anonymous-password "user@cyber.net")

(setq c-cleanup-list
      '(brace-else-brace brace-elseif-brace
			 scope-operator empty-defun-braces
			 defun-close-semi list-close-comma)
      c-electric-pound-behavior
      '(alignleft)
      c-report-syntactic-errors t)
(setq-default c-block-comment-prefix "* ")

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq quack-default-program "guile"
      quack-fontify-style nil)

(setq dictionary-server "192.168.1.194"
      dictionary-coding-systems-for-dictionaries
      '(("cdict" . gb2312) ("stardic" . gb2312) ("xdict" . gb2312)))

(set-register ?e '(file . "~/.emacs.d/.emacs.el"))
(set-register ?g '(file . "~/.emacs.d/.gnus.el"))
(set-register ?q '(file . "/ftp:chunyu@itrc#8021:/"))
(cond ((eq window-system 'w32)
       (set-register ?j '(file . "d:/usr/work/books/mybook/"))
       (set-register ?u '(file . "m:/"))
       (set-register ?M '(file . "e:/My Music/"))
       (setenv "SHELL" "sh.exe")))
(setenv "DISPLAY" "chunyu:0")

;; (set-locale-environment "en")
;; (set-locale-environment "zh_CN")
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
(mouse-avoidance-mode 'exile)
(partial-completion-mode 1)
(global-font-lock-mode 1)
(auto-compression-mode 1)
(column-number-mode 1)
(blink-cursor-mode -1)
(global-cwarn-mode 1)
(display-time-mode 1)
(show-paren-mode 1)
(menu-bar-mode -1)
(icomplete-mode 1)
(ido-everywhere 1)
(ido-mode 1)

;; (desktop-save-mode 1)
;; (autoarg-mode 1)
;; (hi-lock-mode 1)
;; (allout-init t)

(add-hook 'diary-hook 'appt-make-list)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
;; (add-hook 'write-file-hooks 'time-stamp)
(add-hook 'bs-mode-hook 'hl-line-mode)
(add-hook 'ido-define-mode-map-hook
	  (lambda ()
	    (define-key ido-mode-map "\M-\d" 'ido-delete-backward-updir)))
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (which-function-mode 1)))
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-toggle-auto-hungry-state 1)
	    (which-function-mode 1)))

(eval-after-load "webjump"
  '(progn
     (require 'webjump-plus)
     (setq webjump-sites webjump-plus-sites)))

(eval-after-load "meta-mode"
  '(progn
     (define-key meta-mode-map "\C-c\C-c" 'chunyu-metapost-build-mp)))

;; auto-insert
;; (add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/insert/")
;; (setq auto-insert-query nil)
;; (setq auto-insert-alist
;;       '(("\\.cpp$"      . ["cpp" auto-update-source-file])
;;         ("\\.cc$"       . ["cc" auto-update-source-file])
;;         ("\\.hpp$"      . ["hpp" auto-update-header-file])
;;         ("\\.hh$"       . ["hh" auto-update-header-file])
;;         ("\\.h$"        . ["h" auto-update-header-file])
;;         ("\\.pro$"      . ["pro" auto-update-project-file])))

(setq dired-view-command-alist
      '(("[.]\\(ps\\|ps_pages\\|eps\\)\\'" . "gv -spartan -color -watch %s")
	("[.]pdf\\'" . "xpdf %s")
	("[.]dvi\\'" . "xdvi -sidemargin 0.5 -topmargin 1 %s")
	("[.]\\(jpe?g\\|gif\\|png\\)\\'" . "ee %s")))

(add-to-list 'load-path "~/.emacs.d")

(cond ((not window-system)
       ;; Text-Only console
       (setq frame-background-mode 'dark)
       (setq Info-use-header-line nil))

      (window-system
       ;; BOTH X-Window and MS-Windows
       (auto-image-file-mode 1)
       (scroll-bar-mode -1)
       ;; (tool-bar-mode -1)

       (create-fontset-from-fontset-spec
	(concat
	 "-*-Courier New-normal-r-*-*-13-*-*-*-c-*-fontset-chinese,"
	 "chinese-gb2312:-*-MS Song-normal-r-*-*-14-*-*-*-c-*-gb2312*-*"))
       (create-fontset-from-fontset-spec
	(concat
	 "-*-Courier New-bold-r-*-*-13-*-*-*-c-*-fontset-chinesebold,"
	 "chinese-gb2312:-*-MS Song-bold-r-*-*-14-*-*-*-c-*-gb2312*-*"))
       (set-face-font 'bold "fontset-chinesebold")

       (setq default-frame-alist
	     `((background-mode . dark)
	       ;; (top . 0) (left . 0) (width . 80) (height . 44)
	       (vertical-scroll-bars)
	       (background-color . "DarkSlateGrey")
	       (foreground-color . "Wheat")
	       (cursor-color . "gold3")
	       (font . "fontset-chinese")
	       . ,(if (eq window-system 'x) '((font . "9x15")))))

       (cond ((eq window-system 'w32)
	      ;; MS-Windows
	      (set-message-beep 'silent)
	      (setq dired-view-command-alist
		    '(("[.]\\(ps\\|ps_pages\\|eps\\)\\'" . "gsview32.exe %s")
		      ("[.]pdf\\'" . "gsview32.exe %s")
		      ("[.]dvi\\'" . "windvi %s")))

	      (setq dired-guess-shell-alist-user
		    (list (list "\\.dvi\\'" "dvipdfmx")
			  (list "\\.rar\\'" "rar l")
			  (list "\\.mp\\'" "mptopdf")
			  (list "\\.[0-9]+\\'" "epstopdf")
			  (list "\\.pdf\\'" "explorer")))

	      (setq Man-header-file-path '("d:/free_ware/MinGW/include"))
	      (setq Info-default-directory-list '("d:/free_ware/TeXLive/info")
		    Info-additional-directory-list '("d:/usr/emacs-21.3.50/info/"))

	      (load ".emacs_w32_tex")

	      ;;-- ECB --;;
	      ;; ;; (setq ecb-options-version "2.23")
	      ;; (require 'ecb-autoloads)
	      ;; (setq ecb-tip-of-the-day nil)

	      ;;-- ISPELL --;;
	      (setenv "ISPELLDICTDIR" (substitute-in-file-name "$emacs_dir/others/EnglishDic"))
	      (setq ispell-dictionary-alist
		    '((nil        "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil iso-8859-1)
		      ("english"  "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil iso-8859-1)
		      ("american" "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "american") nil iso-8859-1)
		      ("UK-xlg"   "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "UK-xlg") nil iso-8859-1)
		      ("US-xlg"   "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "US-xlg") nil iso-8859-1))))

	     ((eq window-system 'x)
	      ;; X-Window
	      (setq visible-bell t)
	      (setq ring-bell-function t)))))

;; (load ".emacs_erc")
;; (load ".emacs_wiki")
;; (load ".emacs_bhl")
;; (load custom-file)
(load ".emacs_cal")
(load ".emacs_func")
(load ".emacs_faces")
(load ".emacs_bbdb")
(load ".emacs_smtp")

;;-- SEMANTIC --;;
;; (setq semantic-load-turn-everything-on t)
;; (require 'semantic-load)

;;-- XREF --;;
;; (add-to-list 'load-path "/usr/local/share/xref/emacs")
;; (add-to-list 'exec-path "/usr/local/share/xref")
;; (defvar xref-current-project nil) ;; can be also "my_project_name"
;; (defvar xref-key-binding 'global) ;; can be also 'local or 'none
;; (load "xrefactory")

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'overwrite-mode 'disabled t)
(put 'rmail 'disabled t)
(put 'LaTeX-hide-environment 'disabled nil)

;; Chunyu's .emacs.el ends here.
