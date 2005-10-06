;; $Id$  -*- mode: Emacs-Lisp; coding: gb2312-unix; -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs.el, created on 2001/12/11 on db.hit.edu.cn.

(global-set-key [f11] 'compile)
(global-set-key [f12] 'gdb)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-unset-key [(insert)])

(global-set-key "\C-x\C-b" 'bs-show)
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
(global-set-key "\M-n" 'gnus)		; gnus-no-server
(global-set-key "\M-`" 'next-error)
(setq outline-minor-mode-prefix "\C-c\C-o")

(require 'ido)
(require 'uniquify)
;(require 'icicles)

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
(define-key meta-m-map "p" 'chunyu-plink)
(define-key meta-m-map "\M-j" 'webjump)

(setq inhibit-startup-message t
      report-emacs-bug-no-explanations t
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
      isearch-allow-scroll t
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
      `(("." . "~/.var/tmp")
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
      tramp-auto-save-directory "~/.var/tramp"
      ange-ftp-smart-gateway nil
      ange-ftp-generate-anonymous-password "user@cyber.net")

(setq c-cleanup-list
      '(brace-else-brace brace-elseif-brace
			 scope-operator empty-defun-braces
			 defun-close-semi list-close-comma)
      c-electric-pound-behavior '(alignleft)
      c-report-syntactic-errors t)

(setq-default c-block-comment-prefix "* ")

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq quack-default-program "guile"
      quack-fontify-style nil)

(setq dictionary-server "db.hit.edu.cn"
      dictionary-coding-systems-for-dictionaries
      '(("cdict" . gb2312) ("stardic" . gb2312) ("xdict" . gb2312)))

(set-register ?e '(file . "~/.emacs.d/.emacs.el"))
(set-register ?g '(file . "~/.emacs.d/.gnus.el"))
(cond ((eq window-system 'w32)
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

;(eldoc-mode 1)
;(require 'thingatpt)

;; (desktop-save-mode 1)
;; (autoarg-mode 1)
;; (hi-lock-mode 1)
;; (allout-init t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'bs-mode-hook 'hl-line-mode)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-toggle-auto-hungry-state 1)
	    (which-function-mode 1)))

(eval-after-load "man"
'(progn
   (define-key Man-mode-map "j"  'chunyu-view-scroll-forward)
   (define-key Man-mode-map "k"  'chunyu-view-scroll-backward)))

(eval-after-load "help-mode"
'(progn
   (define-key help-mode-map "l" 'help-go-back)))

(eval-after-load "view"
  '(progn
     (define-key view-mode-map "j" 'chunyu-view-scroll-forward)
     (define-key view-mode-map "k" 'chunyu-view-scroll-backward)))

(eval-after-load "info"
  '(progn 
     (define-key Info-mode-map "w" 'Info-scroll-down)
     (define-key Info-mode-map "j" 'chunyu-view-scroll-forward)
     (define-key Info-mode-map "k" 'chunyu-view-scroll-backward)
     (define-key Info-mode-map "\M-n" 'gnus)))

(eval-after-load "dired"
  `(progn
     (require 'dired-x)
     (define-key dired-mode-map "b" 'dired-mark-extension)
     (define-key dired-mode-map "T" 'dired-tar-pack-unpack)
     (define-key dired-mode-map "c" 'dired-up-directory)
     (define-key dired-mode-map "e" 'dired-mark-files-containing-regexp)
     (define-key dired-mode-map "j" 'dired-mark-files-regexp)
     (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
     (define-key dired-mode-map "/" 'dired-mark-directories)
     (define-key dired-mode-map "K" 'dired-kill-subdir)
     (define-key dired-mode-map [(control ?/)] 'dired-undo)
     (cond ((not window-system)
	    (define-key dired-mode-map "o" 'dired-find-file)
	    (define-key dired-mode-map "h" 'dired-show-file-type))
	   (window-system
	    (define-key dired-mode-map [mouse-2] 'dired-mouse-execute-file)
	    (define-key dired-mode-map "o" 'chunyu-dired-open-explorer)
	    (define-key dired-mode-map "h" 'chunyu-dired-foobar2000-play)))))

(eval-after-load "bs"
  '(progn
     (define-key bs-mode-map "\d" 'chunyu-bs-backup-unmark)))

(eval-after-load "apropos"
  '(progn
     (require 'view)
     (define-key apropos-mode-map "n" 'forward-button)
     (define-key apropos-mode-map "p" 'backward-button)
     (define-key apropos-mode-map "j" 'chunyu-view-scroll-forward)
     (define-key apropos-mode-map "k" 'chunyu-view-scroll-backward)))

(eval-after-load "meta-mode"
  '(progn
     (define-key meta-mode-map "\C-c\C-c" 'chunyu-metapost-build-mp)))

;; (add-hook 'find-file-hooks 'auto-insert)
;; (setq auto-insert-directory "~/.emacs.d/insert/")
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
       (setq Info-use-header-line nil)
       (copy-face 'font-lock-comment-delimiter-face 'font-lock-comment-face))

      (window-system
       ;; BOTH X-Window and MS-Windows
       (auto-image-file-mode 1)
       (scroll-bar-mode -1)
       ;; (tool-bar-mode -1)

       (create-fontset-from-fontset-spec
	(concat
	 "-*-Courier New-normal-r-*-*-13-*-*-*-c-*-fontset-chinese,"
	 "chinese-gb2312:-*-新宋体-normal-r-*-*-14-*-*-*-c-*-gb2312*-*"))
       (create-fontset-from-fontset-spec
	(concat
	 "-*-Courier New-bold-r-*-*-13-*-*-*-c-*-fontset-chinesebold,"
	 "chinese-gb2312:-*-新宋体-normal-r-*-*-14-*-*-*-c-*-gb2312*-*"))
       (set-face-font 'bold "fontset-chinesebold")

       (setq default-frame-alist
	     '((background-mode . dark)
	       ;; (top . 0) (left . 0) (width . 80) (height . 44)
	       (vertical-scroll-bars)
	       (background-color . "DarkSlateGrey")
	       (foreground-color . "Wheat")
	       (cursor-color . "gold3")
	       (font . "fontset-chinese")))

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


(autoload 'mixvm "mixvm" "mixvm/gud interaction" t)
(autoload 'fetchmail-mode "fetchmail-mode" "Mode for editing .fetchmailrc files" t)
(autoload 'dictionary-search "dictionary" "Ask for a word and search it in all dictionaries" t)
(autoload 'dictionary-match-words "dictionary" "Ask for a word and search all matching words in the dictionaries" t)
(autoload 'dictionary "dictionary" "Create a new dictionary buffer" t)
(autoload 'dired-tar-pack-unpack "dired-tar" "Dired tar" t)
(autoload 'php-mode  "php-mode" "PHP mode" t)
(setq auto-mode-alist
      (append '(("\\.php\\'" . php-mode)
                ("\\.inc\\'" . php-mode)) auto-mode-alist))

;;;;;;;; bbdb ;;;;;;;;;;;;;;;;;;
(require 'bbdb)
;; (require 'supercite)
;; (require 'message)
;; (require 'bbdb-snarf)

(bbdb-initialize 'gnus 'message 'sc)
;; (bbdb-define-all-aliases)

(autoload 'bbdb-insinuate-sc "bbdb-sc" "bbdb sc init" nil)

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-sc)

(setq bbdb-file "~/.emacs.d/.bbdb")

(setq bbdb-north-american-phone-numbers-p nil
      bbdb-check-zip-codes-p nil
      bbdb-electric-p t
      bbdb-use-pop-up nil
      bbdb-pop-up-target-lines 1
      bbdb-elided-display '(creation-date timestamp)
      bbdb-offer-save nil
      bbdb-complete-name-allow-cycling t
      bbdb-time-display-format "%Y-%m-%d")

(setq bbdb-user-mail-names
      (regexp-opt '("dddkk@sina.com" "chunyu@hit.edu.cn" "chunyu@db.hit.edu.cn" 
		    "emacs@bbs.hit.edu.cn" "dddkk@smth.edu.cn"
		    "cymacs@gmail.com" "cyemacs@gmail.com" "chunyu@myrealbox.com")))

(setq bbdb/gnus-score-default +20
      gnus-score-find-score-files-function
      '(gnus-score-find-bnews bbdb/gnus-score))

(setq bbdb-display-layout-alist
      '((one-line (order phones net)
		  (name-end . 24)
		  (toggle . t))
	(multi-line (indention . 14)
		    (toggle . t)
		    (omit creation-date timestamp))
	(pop-up-multi-line  (indention . 14))))

(cond (window-system
       (eval-after-load "bbdb-gui"
	 '(progn
	    (set-face-attribute 'bbdb-name nil  :foreground "gold" :underline nil)
	    (set-face-attribute 'bbdb-company nil :foreground "sandy brown")
	    (set-face-attribute 'bbdb-field-name nil :foreground "slate blue")
	    (set-face-attribute 'bbdb-field-value nil :foreground "deep sky blue" :weight 'normal)))))
;;;; bbdb ends here ;;;;;;;;;;;;;;;;;;

;;;; smtp ;;;;
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-default-smtp-server "202.118.224.153")
(setq smtpmail-smtp-server "202.118.224.153")
(setq smtpmail-auth-credentials
      '(("202.118.224.153" 25 "chunyu" "asdasdf")))
;;;; smtp ends ;;;;

;;;; calendar ;;;;
(setq diary-file "~/.emacs.d/.diary"
      view-diary-entries-initially t
      calendar-latitude +45.75
      calendar-longitude +126.63
      calendar-location-name "Harbin"
      calendar-remove-frame-by-deleting t
      calendar-week-start-day 1
      chinese-calendar-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"]
      chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"]
      general-holidays
      '((holiday-fixed 1 1 "元旦") (holiday-fixed 2 14 "情人节")
	(holiday-fixed 4 1 "愚人节") (holiday-float 5 0 2 "母亲节")
	(holiday-float 6 0 3 "父亲节") (holiday-fixed 12 25 "圣诞节"))
      local-holidays
      '((holiday-chinese 1 15 "元宵节 (正月十五)") (holiday-chinese 5 5 "端午节 (五月初五)")
	(holiday-chinese 9 9 "重阳节 (九月初九)") (holiday-chinese 8 15 "中秋节 (八月十五)"))
      christian-holidays nil
      hebrew-holidays nil
      islamic-holidays nil
      ;; solar-holidays nil
      bahai-holidays nil
      solar-n-hemi-seasons '("春分" "夏至" "秋分" "冬至"))

(setq mark-diary-entries-in-calendar t
      ;; appt-issue-message nil ; obsolete variable
      appt-message-warning-time 30
      mark-holidays-in-calendar t
      view-calendar-holidays-initially nil)

(setq diary-date-forms '((year "/" month "/" day "[^/0-9]"))
      calendar-date-display-form '(year "/" month "/" day)
      calendar-time-display-form
      '(24-hours ":" minutes (if time-zone " (") time-zone (if time-zone ")")))

(setq cal-tex-diary t
      cal-tex-24 t
      cal-tex-daily-start 8
      cal-tex-daily-end 22)

;;(add-hook 'list-diary-entries-hook 'sort-diary-entries t)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(add-hook 'diary-hook 'appt-make-list)
(add-hook 'diary-display-hook 'fancy-diary-display)

(add-hook 'calendar-load-hook
	  '(lambda ()
	     (define-key calendar-mode-map ">" 'scroll-calendar-left)
	     (define-key calendar-mode-map "<" 'scroll-calendar-right)
	     (define-key calendar-mode-map "N" 'scroll-calendar-left-three-months)
	     (define-key calendar-mode-map "P" 'scroll-calendar-right-three-months)
	     (define-key calendar-mode-map "\M-n" 'scroll-calendar-left-three-months)
	     (define-key calendar-mode-map "\M-p" 'scroll-calendar-right-three-months)
	     (define-key calendar-mode-map "f" 'calendar-forward-day)
	     (define-key calendar-mode-map "b" 'calendar-backward-day)
	     (define-key calendar-mode-map "j" 'calendar-forward-week)
	     (define-key calendar-mode-map "k" 'calendar-backward-week)
	     (define-key calendar-mode-map "\C-z" 'calendar-set-mark)
	     ))

(autoload 'chinese-year "cal-china" "Chinese year data" t)

(defun holiday-chinese (cmonth cday string)
  "Chinese calendar holiday, month and day in Chinese calendar (CMONTH, CDAY).

If corresponding MONTH and DAY in gregorian calendar is visible,
the value returned is the list \(((MONTH DAY year) STRING)).
Returns nil if it is not visible in the current calendar window."
  (let* ((m displayed-month)
	 (y displayed-year)
	 (gdate (calendar-gregorian-from-absolute
		 (+ (cadr (assoc cmonth (chinese-year y))) (1- cday)))))
    (increment-calendar-month m y (- 11 (car gdate)))
    (if (> m 9) (list (list gdate string)))))

;; (defun diary-anniversary-chinese (cmonth cday year &optional mark)
;;   ())

;;;; calendar ends here ;;;;

(cond ((not window-system)
       ;; Text-Only console
       (set-face-attribute 'highlight nil :foreground "white" :background "blue" :underline nil :weight 'normal)
       (set-face-attribute 'region nil :background "blue")

       (eval-after-load "log-view"
	 '(progn
	    (set-face-attribute 'log-view-file-face nil :foreground "blue" :weight 'bold)
	    (set-face-attribute 'log-view-message-face nil :foreground "yellow" :weight 'bold)))
       (eval-after-load "calendar"
	 '(progn
	    (set-face-attribute 'holiday-face nil :foreground "red" :background "black" :weight 'bold)))

       (eval-after-load "ediff-init"
	 '(progn
	    (set-face-attribute 'ediff-current-diff-A nil :background "blue" :foreground "red" :weight 'bold)
	    (set-face-attribute 'ediff-current-diff-B nil :background "blue" :foreground "yellow" :weight 'bold)
	    (set-face-attribute 'ediff-current-diff-C nil :background "blue" :foreground "magenta" :weight 'bold)
	    (set-face-attribute 'ediff-even-diff-A nil :background "black" :foreground "red")
	    (set-face-attribute 'ediff-even-diff-B nil :background "black" :foreground "blue")
	    (set-face-attribute 'ediff-even-diff-C nil :background "black" :foreground "magenta")
	    (set-face-attribute 'ediff-fine-diff-A nil :background "cyan" :foreground "red")
	    (set-face-attribute 'ediff-fine-diff-B nil :background "cyan" :foreground "yellow" :weight 'bold)
	    (set-face-attribute 'ediff-fine-diff-C nil :background "cyan" :foreground "magenta" :weight 'bold)
	    (set-face-attribute 'ediff-odd-diff-A nil :background "black" :foreground "red3" :weight 'bold)
	    (set-face-attribute 'ediff-odd-diff-B nil :background "black" :foreground "yellow" :weight 'bold)
	    (set-face-attribute 'ediff-odd-diff-C nil :background "black" :foreground "magenta" :weight 'bold)
	    (set-face-attribute 'ediff-current-diff-Ancestor nil :background "magenta" :foreground "black")
	    (set-face-attribute 'ediff-even-diff-Ancestor nil :background "cyan" :foreground "black")
	    (set-face-attribute 'ediff-fine-diff-Ancestor nil :background "cyan" :foreground "black")
	    (set-face-attribute 'ediff-odd-diff-Ancestor nil :background "black" :foreground "green" :weight 'bold))))

      (window-system
       ;; BOTH X-Window and MS-Windows
       (set-face-attribute 'fringe nil :foreground "limegreen" :background "gray30")
       (set-face-attribute 'menu nil :foreground "Wheat" :background "DarkSlateGrey")
       (set-face-attribute 'minibuffer-prompt nil :foreground "chocolate1")
       (set-face-attribute 'mode-line nil :foreground "black" :background "wheat" :box nil)
       (set-face-attribute 'mode-line-inactive nil :foreground "grey90" :background "grey30" :box '(:color "grey50"))
       (set-face-attribute 'region nil :background "grey21")
       (set-face-attribute 'tool-bar nil :background "DarkSlateGrey")
       (set-face-attribute 'trailing-whitespace nil :background "SeaGreen1")
       (copy-face 'default 'font-lock-warning-face)
       (set-face-attribute 'font-lock-warning-face nil :foreground "deep pink")
       (eval-after-load "font-latex"
	 '(progn 
	    (set-face-attribute 'font-latex-title-1-face nil :height 1.0 :inherit nil :foreground "yellow2")
	    (set-face-attribute 'font-latex-title-2-face nil :height 1.0 :inherit nil :foreground "goldenrod")
	    (set-face-attribute 'font-latex-title-3-face nil :height 1.0 :inherit nil :foreground "goldenrod3")
	    (set-face-attribute 'font-latex-title-4-face nil :height 1.0 :inherit nil :foreground "dark goldenrod")))
       (eval-after-load "which-func"
	 '(progn
	    (set-face-attribute 'which-func-face nil :foreground "blue")))))

(load ".emacs_func")

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
