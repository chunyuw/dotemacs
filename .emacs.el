;; $Id$  -*- mode: emacs-lisp; coding: gb2312; -*-
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
(global-set-key [(insertchar)] 'overwrite-mode)

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

(setq inhibit-startup-message t
      default-major-mode 'text-mode
      next-line-add-newlines nil
      require-final-newline t
      resize-mini-windows nil
      track-eol t
      Man-notify-method 'pushy
      uniquify-buffer-name-style 'forward
      confirm-kill-emacs nil            ; 'y-or-n-p
      suggest-key-bindings 1
      line-number-display-limit 1000000
      kill-ring-max 200
      ring-bell-function 'ignore

      apropos-do-all nil

      bookmark-save-flag 1
      bookmark-default-file "~/.emacs.d/.emacs.bmk"

      ;; compilation-scroll-output t
      ;; compile-command "make -k "

      dired-listing-switches "-avl"     ; `C-u s'
      dired-recursive-copies t
      dired-recursive-deletes t
      cvs-dired-use-hook 'always

      abbrev-file-name "~/.emacs.d/.abbrev_defs"
      custom-file "~/.emacs.d/.emacs_custom.el"

      display-time-24hr-format t
      display-time-day-and-date t
      display-time-use-mail-icon t
      display-time-interval 10

      gnus-inhibit-startup-message t
      gnus-init-file "~/.emacs.d/.gnus.el"

      mail-signature-file "~/.sig/default"
      mail-user-agent 'gnus-user-agent
      mail-alias-file "~/.mailrc"
      user-full-name "Chunyu Wang"
      user-mail-address "chunyu@hit.edu.cn"

      time-stamp-active t
      time-stamp-warn-inactive t
      ;;time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S %u on %s"
      time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chunyu"

      diary-file "~/.emacs.d/.diary"
      calendar-latitude +45.75
      calendar-longitude +126.63
      calendar-location-name "Harbin"
      calendar-remove-frame-by-deleting t
      calendar-week-start-day 1
      christian-holidays nil
      hebrew-holidays nil
      islamic-holidays nil
      solar-holidays nil
      general-holidays '((holiday-fixed 1 1 "元旦")
			 (holiday-fixed 4 1 "愚人节")
			 (holiday-float 5 0 2 "母亲节")
			 (holiday-float 6 0 3 "父亲节"))

      mark-diary-entries-in-calendar t
      appt-issue-message nil
      mark-holidays-in-calendar nil
      view-calendar-holidays-initially nil

      todo-file-do "~/.emacs.d/todo-do"
      todo-file-done "~/.emacs.d/todo-done"
      todo-file-top "~/.emacs.d/todo-top"

      version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t
      backup-directory-alist '(("" . "~/var/tmp"))
      backup-by-copying t

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
      tramp-unified-filenames t
(setq tramp-unified-filenames t
      ;; ange-ftp-local-host-regexp ".*$"
      ange-ftp-default-user t
      ange-ftp-default-user t)
      quack-default-program "guile"
      quack-fontify-style nil
      quack-fontify-style nil)
      bbdb-file "~/.emacs.d/.bbdb"
(setq bbdb-file "~/.emacs.d/.bbdb")
      canlock-password "a6763075ef97955033c40069155a4ef7b1d67fee"
      dictionary-server "192.168.1.191"
      )


(setq help-at-pt-display-when-idle 
      '(keymap local-map button kbd-help))

(setq-default kill-whole-line t)

(set-register ?v '(file . "/usr/local/cvsroot/sprcvs"))
(set-register ?w '(file . "~/work/xmldb/loader"))
(set-register ?q '(file . "/ftp:chunyu@itrb#8021:/"))
(set-register ?z '(file . "/usr/local/share/zope/var/Z2.log"))
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'chinese-iso-8bit)
(set-terminal-coding-system 'chinese-iso-8bit)


;;(define-coding-system-alias 'gb18030 'gb2312)
(set-clipboard-coding-system 'chinese-iso-8bit)
(setq chinese-calendar-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

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
(show-paren-mode 1)
(menu-bar-mode (if window-system 1 -1))
(icomplete-mode 1)
(ido-mode 1)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
	    (setq dired-view-command-alist
		  '(("[.]\\(ps\\|ps_pages\\|eps\\)\\'" . "gv -spartan -color -watch %s")
		    ("[.]pdf\\'" . "xpdf %s")
		    ("[.]\\(jpe?g\\|gif\\|png\\)\\'" . "ee %s")
		    ("[.]dvi\\'" . "xdvi -sidemargin 0.5 -topmargin 1 %s")))))

(add-hook 'ido-define-mode-map-hook 'ido-my-keys)
(defun ido-my-keys () "Add my keybindings for ido."
  (define-key ido-mode-map "\M-\d" 'ido-delete-backward-updir))

(cond ((not window-system)
    (view-scroll-lines lines t 1 t)
       (eval-after-load "log-view"
	 '(progn
	    (set-face-attribute 'log-view-file-face nil :foreground "blue" :weight 'bold)
	    (set-face-attribute 'log-view-message-face nil :foreground "yellow" :weight 'bold)))
       (setq frame-background-mode 'dark)
       (eval-after-load "ediff-init"
	 '(progn
	    (set-face-attribute 'ediff-current-diff-face-A nil :background "blue" :foreground "red" :weight 'bold)
	    (set-face-attribute 'ediff-current-diff-face-Ancestor nil :background "magenta" :foreground "black")
	    (set-face-attribute 'ediff-current-diff-face-B nil :background "blue" :foreground "yellow" :weight 'bold)
	    (set-face-attribute 'ediff-current-diff-face-C nil :background "blue" :foreground "magenta" :weight 'bold)
	    (set-face-attribute 'ediff-even-diff-face-A nil :background "black" :foreground "red")
	    (set-face-attribute 'ediff-even-diff-face-Ancestor nil :background "cyan" :foreground "black")
	    (set-face-attribute 'ediff-even-diff-face-B nil :background "black" :foreground "blue")
	    (set-face-attribute 'ediff-even-diff-face-C nil :background "black" :foreground "magenta")
	    (set-face-attribute 'ediff-fine-diff-face-A nil :background "cyan" :foreground "red")
	    (set-face-attribute 'ediff-fine-diff-face-Ancestor nil :background "cyan" :foreground "black")
	    (set-face-attribute 'ediff-fine-diff-face-B nil :background "cyan" :foreground "yellow" :weight 'bold)
	    (set-face-attribute 'ediff-fine-diff-face-C nil :background "Turquoise" :foreground "magenta" :weight 'bold)
	    (set-face-attribute 'ediff-odd-diff-face-A nil :background "black" :foreground "red3" :weight 'bold)
	    (set-face-attribute 'ediff-odd-diff-face-Ancestor nil :background "black" :foreground "green" :weight 'bold)
	    (set-face-attribute 'ediff-odd-diff-face-B nil :background "black" :foreground "yellow" :weight 'bold)
	    (set-face-attribute 'ediff-odd-diff-face-C nil :background "black" :foreground "magenta" :weight 'bold))))

      ((eq window-system 'x)
       (global-set-key (kbd "C--") 'undo)
       (setq visible-bell t
	     x-stretch-cursor nil)
       (scroll-bar-mode -1)
       (tool-bar-mode -1)

       (setq default-frame-alist
	     `((vertical-scroll-bars)
	       (top . 0)
	       (left . 1)
	       (width . 111)
	       (height . 48)
	       (background-color . "DarkSlateGrey")
	       (foreground-color . "Wheat")
	       (cursor-color     . "gold1")
	       (mouse-color      . "gold1")
	       (font . "9x15")
	       ))

       (if (facep 'mode-line)
	   (set-face-attribute 'mode-line nil :foreground "DarkSlateGrey" :background "Wheat"))
       (if (facep 'fringe)
	   (set-face-attribute 'fringe nil :foreground "limegreen" :background "gray30"))
       (if (facep 'tool-bar)
 	   (set-face-background 'tool-bar "DarkSlateGrey"))
       (if (facep 'menu)
	   (face-spec-set 'menu '((t (:foreground "Wheat" :background "DarkSlateGrey")))))
       (if (facep 'trailing-whitespace)
	   (set-face-background 'trailing-whitespace "SeaGreen1"))
       (if (facep 'minibuffer-prompt)
	   (face-spec-set 'minibuffer-prompt '((t (:foreground "cyan")))))))
	      (setq default-frame-alist
		    (append '((top . 0) (left . 0)
			      (width . 111) (height . 46)
			      (font . "9x15"))
			    default-frame-alist))))))

(autoload 'big5togb-region "big5togb" "Big5 to GB2312" t)
(autoload 'todo-insert-item "todo-mode" "Add TODO item." t)
(autoload 'todo-mode "todo-mode" "Major mode for editing TODO lists." t)
(autoload 'todo-show "todo-mode" "Show TODO items." t)
(autoload 'css-mode "css-mode" "CSS editing mode" t)
(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'flex-mode "flex-mode.el" "Flex mode" t)
(autoload 'py-shell "python-mode" "Python shell" t)
;; (autoload 'folding-mode          "folding" "Folding mode" t)
;; (autoload 'turn-off-folding-mode "folding" "Folding mode" t)
;; (autoload 'turn-on-folding-mode  "folding" "Folding mode" t)
(autoload 'htmlize-buffer "htmlize.el" "HTMLize mode" t)
(autoload 'browse-kill-ring "browse-kill-ring.el" "Browse kill ring" t)
;; (autoload 'folding-mode          "folding" "Folding mode" t)
		("\\.css\\'" . css-mode)
		;; ("\\.s?html?\\'" . html-helper-mode)
		;; ("\\.asp\\'" . html-helper-mode)
		;; ("\\.phtml\\'" . html-helper-mode)
		) auto-mode-alist))

(defun kill-buffer-directly () (interactive) (kill-buffer nil))
		("\\.s?html?\\'" . html-helper-mode)
		("\\.asp\\'" . html-helper-mode)
(add-to-list 'load-path "~/.emacs.d/elisp/tramp")
(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))

(require 'gnus-load)
(require 'tex-site)
		("\\.css\\'" . css-mode))
(require 'compile)
	      auto-mode-alist))
(require 'uniquify)
;; (require 'flyspell)

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'rmail 'disabled t)
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'tex-site)
(require 'boxquote)
(require 'dired-tar)
(require 'browse-kill-ring)

;; (setq exec-path (cons "/usr/local/share/xref" exec-path))
;; (setq load-path (cons "/usr/local/share/xref/emacs" load-path))
;;(load-file "~/.emacs.d/.emacs_smtp.el")
;;(load-file "~/.emacs.d/.emacs_erc.el")
(load-file "~/.emacs.d/.emacs_bbdb.el")
;;(load-file custom-file)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)

;; Chunyu's .emacs.el ends here.
