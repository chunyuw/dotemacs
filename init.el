;; Chunyu <chunyu@hit.edu.cn>'s ~/.emacs.d/init.el for GNU Emacs, created on 2001/12/11 on db.hit.edu.cn.
;; -*- mode: Emacs-Lisp; coding: gb2312-unix; -*-

(global-unset-key [(insert)])
(global-unset-key [(insertchar)])
(global-set-key "\C-x\C-b" 'bs-show)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\M-k" 'chunyu/kill-this-buffer)
(global-set-key "\C-xk" 'chunyu/kill-this-buffer)
(global-set-key "\C-xB" 'bury-buffer)
(global-set-key "\C-xE" 'apply-macro-to-region-lines)
(global-set-key "\C-xI" 'insert-buffer)
(global-set-key "\C-xve" 'cvs-examine)
(global-set-key "\C-c\C-v" 'view-mode)
(global-set-key "\C-\\" 'toggle-truncate-lines)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-#" 'calc-dispatch)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\M-`" 'next-error)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cL" 'org-insert-link-global)
(global-set-key "\C-co" 'org-open-at-point-global)
(global-set-key "\C-ca" 'org-agenda)

(define-prefix-command 'meta-m-map)
(global-set-key "\M-m" 'meta-m-map)
(define-key meta-m-map "\M-m\M-m" 'back-to-indentation)
(define-key meta-m-map "\M-o" 'occur)
(define-key meta-m-map "\M-i" 'imenu)
(define-key meta-m-map "\M-k" 'bbdb)
(define-key meta-m-map "\M-p" 'calendar)
(define-key meta-m-map "\M-l" 'dictionary-search)
(define-key meta-m-map "\M-u" 'chunyu/update-src)
(define-key meta-m-map "c" 'compile)
(define-key meta-m-map "i" 'ibuffer)
(define-key meta-m-map "f" 'chunyu/insert-file-variable)
(define-key meta-m-map "v" 'newsticker-show-news)
(define-key meta-m-map "n" 'toggle-save-place)
(define-key meta-m-map "\M-n" 'toggle-save-place)

(setq inhibit-startup-message t
      default-major-mode 'text-mode
      require-final-newline t
      resize-mini-windows t
      track-eol t
      kill-whole-line t
      Man-notify-method 'pushy
      kill-ring-max 100
      vc-follow-symlinks t
      vc-suppress-confirm t
      enable-recursive-minibuffers t
      default-fill-column 78
      isearch-allow-scroll t)

(setq makefile-electric-keys t
      apropos-do-all t
      sentence-end-double-space nil
      scroll-preserve-screen-position 'keep
      comment-style 'extra-line
      outline-minor-mode-prefix "\C-c\C-o")

(setq bookmark-save-flag 1
      bookmark-default-file "~/.emacs.d/bookmark"
      abbrev-file-name "~/.emacs.d/abbrev_defs")

(setq display-time-24hr-format t
      display-time-day-and-date t)

(setq gnus-inhibit-startup-message t
      gnus-init-file "~/.emacs.d/gnus.el"
      canlock-password "a6763075ef97955033c40069155a4ef7b1d67fee")

(setq mail-signature-file "~/.sig/default"
      mail-user-agent 'gnus-user-agent
      mail-alias-file "~/.mailrc"
      user-full-name "Chunyu Wang"
      user-mail-address "cymacs@gmail.com")

(setq version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t
      backup-directory-alist '(("." . "~/.tmp"))
      backup-by-copying t
      backup-by-copying-when-linked t
      backup-by-copying-when-mismatch t)

(setq org-startup-folded 'nofold
      org-log-done t)

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

(setq ange-ftp-smart-gateway nil
      ange-ftp-generate-anonymous-password "user@cyber.net")

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq dictionary-server "202.118.228.177"
      dictionary-coding-systems-for-dictionaries
      '(("cdict" . gb2312) ("stardic" . gb2312) ("xdict" . gb2312)))

(setq reb-blink-delay 1
      reb-re-syntax 'string
      wdired-use-dired-vertical-movement t)

;; SavePlace ;; 
(setq save-place-file "~/.emacs.d/places"
      save-place-limit 50)
(setq-default save-place t)
(require 'saveplace)
;; SavePlace ends here ;;

(set-register ?e '(file . "~/.emacs.d/init.el"))
;; (set-register ?g '(file . "~/.emacs.d/gnus.el"))

(set-language-environment    'Chinese-GBK)
(set-keyboard-coding-system  'chinese-gbk)
(set-terminal-coding-system  'chinese-gbk)
(set-clipboard-coding-system 'chinese-gbk)
(set-selection-coding-system 'chinese-gbk)

(fset 'yes-or-no-p 'y-or-n-p)
(find-function-setup-keys)

(minibuffer-indicate-depth-mode 1)
(minibuffer-electric-default-mode 1)
(mouse-avoidance-mode 'exile)
(partial-completion-mode 1)
(global-font-lock-mode 1)
(column-number-mode 1)
(blink-cursor-mode -1)
(global-cwarn-mode 1)
(display-time-mode 1)
(show-paren-mode 1)
(icomplete-mode 1)
(menu-bar-mode -1)
(savehist-mode 1)

(setq auto-mode-alist
      (append '(("\\.cs\\'" . csharp-mode) ("\\.mix\\'" . mixal-mode)
		("\\.php\\'" . php-mode) ("\\.cmd\\'" . cmd-mode)
		("\\.bat\\'" . cmd-mode) ("\\.7z\\'" . archive-mode)
		("\\.csproj\\'" . xml-mode) ("\\.org\\'" . org-mode)
		("\\.asy\\'" . asy-mode))
	      auto-mode-alist))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'bs-mode-hook 'hl-line-mode)
(add-hook 'savehist-save-hook
	  (lambda ()
	    (setq savehist-minibuffer-history-variables
		  '(regexp-history
		    search-ring file-name-history shell-command-history
		    minibuffer-history extended-command-history compile-history
		    LaTeX-environment-history
		    query-replace-history))))
(add-hook 'icomplete-minibuffer-setup-hook
	  (lambda ()
	    (make-local-variable 'max-mini-window-height)
	    (setq max-mini-window-height 1)))

;; CC-Mode ;;
(setq-default c-block-comment-prefix "* ")
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-subword-mode 1)
	    (c-toggle-auto-hungry-state 1)))
;; CC-Mode ends here ;;

(eval-after-load 'dictionary
  '(progn
     (define-key dictionary-mode-map "j"  'chunyu/view-scroll-forward)
     (define-key dictionary-mode-map "k"  'chunyu/view-scroll-backward)))

(eval-after-load 'man
  '(progn
     (define-key Man-mode-map "j"  'chunyu/view-scroll-forward)
     (define-key Man-mode-map "k"  'chunyu/view-scroll-backward)))

(eval-after-load 'help-mode
  '(progn
     (define-key help-mode-map "b" 'help-go-back)
     (define-key help-mode-map "h" 'backward-char)))

(eval-after-load 'view
  '(progn
     (define-key view-mode-map "j" 'chunyu/view-scroll-forward)
     (define-key view-mode-map "k" 'chunyu/view-scroll-backward)
     (define-key view-mode-map " " 'scroll-up)
     (define-key view-mode-map "h" 'backward-char)
     (define-key view-mode-map "l" 'forward-char)))

(eval-after-load 'info
  '(progn
     (define-key Info-mode-map "w" 'Info-scroll-down)
     (define-key Info-mode-map "j" 'chunyu/view-scroll-forward)
     (define-key Info-mode-map "k" 'chunyu/view-scroll-backward)
     (define-key Info-mode-map "\M-n" 'gnus)))

(eval-after-load 'diff-mode
  '(progn
     (define-key diff-mode-map "\M-q" 'delete-window)))

;; Dired ;;
(eval-after-load 'dired
  '(progn
     (require 'dired-x)
     (setq dired-listing-switches "-avl"
	   cvs-dired-use-hook 'always)

     (define-key dired-mode-map "b" 'dired-mark-extension)
     (define-key dired-mode-map "c" 'dired-up-directory)
     (define-key dired-mode-map "e" 'dired-mark-files-containing-regexp)
     (define-key dired-mode-map "j" 'dired-mark-files-regexp)
     (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
     (define-key dired-mode-map "/" 'dired-mark-directories)
     (define-key dired-mode-map "K" 'dired-kill-subdir)
     (define-key dired-mode-map [(control ?/)] 'dired-undo)

     (when window-system
       (define-key dired-mode-map [mouse-2] 'dired-mouse-execute-file)
       (define-key dired-mode-map "o" 'chunyu/dired-open-explorer)
       (define-key dired-mode-map "h" 'chunyu/dired-foobar2000-play)

       (defun dired-mouse-execute-file (event)
	 "In dired, execute the file or goto directory name you click on."
	 (interactive "e")
	 (set-buffer (window-buffer (posn-window (event-end event))))
	 (goto-char (posn-point (event-end event)))
	 (dired-execute-file))

       (defun chunyu/dired-open-explorer ()
	 (interactive)
	 (let ((file-name (dired-get-file-for-visit)))
	   (if (file-exists-p file-name)
	       (w32-shell-execute "open" file-name nil 1))))

       (defun dired-execute-file (&optional arg)
	 (interactive "P")
	 (mapcar (lambda (file) (w32-shell-execute "open" file))
		 (dired-get-marked-files nil arg)))

       (defun chunyu/dired-foobar2000-play ()
	 "Open dir of .mp3 files with foobar2000."
	 (interactive)
	 (let ((file-name (dired-get-filename 'no-dir))
	       (fb2k "C:/Program Files/foobar2000/foobar2000.exe"))
	   (if (file-exists-p file-name)
	       (w32-shell-execute nil fb2k (format "\"%s\"" file-name) 1)))))))

(eval-after-load 'apropos
  '(progn
     (require 'view)
     (define-key apropos-mode-map "n" 'forward-button)
     (define-key apropos-mode-map "p" 'backward-button)
     (define-key apropos-mode-map "j" 'chunyu/view-scroll-forward)
     (define-key apropos-mode-map "k" 'chunyu/view-scroll-backward)))

(eval-after-load 'meta-mode
  '(progn
     (define-key meta-mode-map "\C-c\C-c" 'chunyu/metapost-build-mp)

     (defun chunyu/metapost-build-mp ()
       "build mp files"
       (interactive)
       (shell-command (format "mptopdf %s" (buffer-name))))))
;; Dired ends here ;;

;; Uniquify ;;
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;; Uniquify ends here ;;

;; Ido ;;
(setq ido-max-prospects 8
      ido-save-directory-list-file "~/.emacs.d/ido.last"
      ido-auto-merge-delay-time 2
      ido-use-filename-at-point t)
(require 'ido)
(ido-everywhere 1)
(ido-mode 1)
;; Ido ends here ;;

;; BBDB ;;
(cond
 ((load "bbdb-autoloads.el" t t t)
  (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
  (add-hook 'gnus-startup-hook 'bbdb-insinuate-sc)
  (setq bbdb-file "~/.emacs.d/bbdb"
	bbdb-north-american-phone-numbers-p nil
	bbdb-check-zip-codes-p nil
	bbdb-electric-p t
	bbdb-use-pop-up nil
	bbdb-pop-up-target-lines 1
	bbdb-display-layout 'multi-line
	bbdb-offer-save nil
	bbdb-complete-name-allow-cycling t
	bbdb-time-display-format "%Y-%m-%d"
	bbdb-user-mail-names "chunyu\\|cymacs\\|dddkk"
	bbdb/gnus-score-default +20
	gnus-score-find-score-files-function '(gnus-score-find-bnews bbdb/gnus-score)
	bbdb-display-layout-alist
	'((one-line (order phones net) (name-end . 24) (toggle . t))
	  (multi-line (indention . 14) (toggle . t) (omit creation-date timestamp))
	  (pop-up-multi-line (indention . 14))))
  (eval-after-load "gnus"
    '(progn (bbdb-initialize 'gnus 'message 'sc)))))
;; BBDB ends here ;;

;; Calendar ;;
(setq diary-file "~/.emacs.d/diary"
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
      '((holiday-chinese 1 15 "元宵节 (正月十五)")
	(holiday-chinese 5 5 "端午节 (五月初五)")
	(holiday-chinese 7 7 "七月七 (七月初七)")
	(holiday-chinese 9 9 "重阳节 (九月初九)")
	(holiday-chinese 8 15 "中秋节 (八月十五)")
	(holiday-chinese 12 -1 "除夕")
	(holiday-chinese 12 7 "老婆生日"))
      christian-holidays nil
      hebrew-holidays nil
      islamic-holidays nil
      ;; solar-holidays nil
      bahai-holidays nil
      solar-n-hemi-seasons '("春分" "夏至" "秋分" "冬至"))

(setq mark-diary-entries-in-calendar t
      appt-message-warning-time 30
      mark-holidays-in-calendar t)

(setq diary-date-forms '((year "-" month "-" day "[^/0-9]"))
      calendar-date-display-form '(year "-" month "-" day)
      calendar-time-display-form
      '(24-hours ":" minutes (if time-zone " (") time-zone (if time-zone ")")))

(eval-after-load 'calendar
  '(progn
     ;; (add-hook 'list-diary-entries-hook 'sort-diary-entries t)
     (add-hook 'today-visible-calendar-hook 'calendar-mark-today)
     (add-hook 'diary-hook 'appt-make-list)
     (add-hook 'diary-display-hook 'fancy-diary-display)

     (add-hook 'calendar-load-hook
	       (lambda ()
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
		 (define-key calendar-mode-map "\C-z" 'calendar-set-mark)))

     (autoload 'chinese-year "cal-china" "Chinese year data" t)
     (defun holiday-chinese (cmonth cday string)
       "Chinese calendar holiday, month and day in Chinese calendar (CMONTH, CDAY).
If corresponding MONTH and DAY in gregorian calendar is visible,
the value returned is the list \(((MONTH DAY year) STRING)).
Returns nil if it is not visible in the current calendar window."
       (let* ((m displayed-month)
	      (y displayed-year)
	      (gdate (calendar-gregorian-from-absolute
		      (+ (cadr (assoc cmonth (chinese-year (+ y (/ cmonth 12))))) (1- cday)))))
	 (increment-calendar-month m y (- 11 (car gdate)))
	 (if (> m 9) (list (list gdate string)))))))
;; Calendar ends here ;;

;; Load credentials ;;
(set (make-local-variable 'my-smtp-pass) "")
(load "~/.emacs.d/mypass" t t t)
;; Loaded ;;

;; SMTP ;;
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "mx.hit.edu.cn")
(setq smtpmail-auth-credentials
      `(("mx.hit.edu.cn" 25 "chunyu" ,my-smtp-pass)))
;; SMTP ends here ;;

;; AUCTeX, RefTeX, CDLaTeX etc. ;;
(load "auctex.el" t t t)
(load "preview-latex.el" t t t)

(setq TeX-auto-save t
      TeX-parse-self t
      TeX-auto-untabify t
      TeX-region "z_region")

(setq preview-scale-function 1.44
      preview-image-type 'dvipng
      preview-auto-cache-preamble nil)

(setq tool-bar-mode nil
      LaTeX-enable-toolbar nil
      LaTeX-document-regexp "document\\|CJK\\*?\\|frame")

(setq bibtex-autokey-names 1
      bibtex-autokey-names-stretch 1
      bibtex-autokey-name-separator "-"
      bibtex-autokey-additional-names "-et.al."
      bibtex-autokey-name-case-convert 'identity
      bibtex-autokey-name-year-separator "-"
      bibtex-autokey-titlewords-stretch 0
      bibtex-autokey-titlewords 0
      bibtex-maintain-sorted-entries 'plain
      bibtex-entry-format '(opts-or-alts numerical-fields))

(setq reftex-revisit-to-follow t
      reftex-enable-partial-scans t
      reftex-save-parse-info nil
      reftex-use-multiple-selection-buffers t
      reftex-auto-recenter-toc t
      reftex-plug-into-AUCTeX t
      reftex-section-levels 
      '(("part" . 0) ("chapter" . 1) ("section" . 2) ("subsection" . 3)
	("frametitle" . 3) ("subsubsection" . 4) ("paragraph" . 5)
	("subparagraph" . 6) ("addchap" . -1) ("addsec" . -2)))

(setq font-latex-fontify-script nil
      font-latex-fontify-sectioning 1
      font-latex-match-slide-title-keywords '("frametitle"))

(setq cdlatex-math-modify-prefix [(super ?')]
      ;; cdlatex-math-symbol-prefix [(super ?`)]
      cdlatex-env-alist
      '(("frame" "\\begin{frame}\n\\frametitle{?}\n\n\\end{frame}\n" nil)
	("block" "\\begin{block}{?}\n\n\\end{block}\n" nil)
	("lstlisting" "\\begin{lstlisting}\n?\n\\end{lstlisting}" nil)
	("alertblock" "\\begin{alertblock}{?}\n\n\\end{alertblock}\n" nil)
	("exampleblock" "\\begin{exampleblock}{?}\n\n\\end{exampleblock}\n" nil))
      cdlatex-command-alist
      '(("fr"  "frame" "" cdlatex-environment ("frame") t nil)
	("frm" "frame" "" cdlatex-environment ("frame") t nil)
	("tik" "block" "" cdlatex-environment ("tikzpicture") t nil)
	("lst" "lstlisting" "" cdlatex-environment ("lstlisting") t nil)
	("lsti" "lstinline" "\\lstinline|?|" cdlatex-position-cursor nil t nil)
	("blk" "block" "" cdlatex-environment ("block") t nil)
	("exb" "exampleblock" "" cdlatex-environment ("exampleblock") t nil)
	("alb" "alertblock" "" cdlatex-environment ("alertblock") t nil)))

(add-hook 'TeX-mode-hook
	  (lambda () ;; (flyspell-mode) (abbrev-mode 1)
	    (turn-on-reftex) (auto-fill-mode 1)))

(add-hook 'LaTeX-mode-hook 
	  (lambda () ;; (outline-minor-mode 1) (flyspell-mode) (TeX-fold-mode 1)
	    (turn-on-cdlatex)))

(eval-after-load "tex"
  '(progn
     (setq TeX-output-view-style 
     	   (cons '("^pdf$" "." "start \"title\" %o") TeX-output-view-style))
     (TeX-global-PDF-mode t)))

;; AUCTeX, RefTeX, CDLaTeX etc. end here ;;

;; Template ;;
(if (and (file-exists-p "~/.emacs.d/tmpls") (load "template" t)) 
    (progn (define-key meta-m-map "t" 'template-expand-template)
	   (template-initialize)))
;; Template ends here ;;

;; MISC Packages ;;
(require 'doc-view)
;; MISC Packages end here ;;

(cond ;; Different Platform
 ;; Text-Only console
 ((not window-system)
  (setq frame-background-mode 'dark)
  (setq Info-use-header-line nil))

 ;; BOTH X-Window and MS-Windows
 (window-system
  (tool-bar-mode -1)

  (setq-default mouse-yank-at-point t)

  (setq default-indicate-empty-lines 'left
	default-indicate-buffer-boundaries 'left)

  (setq default-frame-alist
	'((background-mode . dark)
	  ;; (top . 0) (left . 0) (width . 80) (height . 44)
	  (vertical-scroll-bars)
	  (background-color . "DarkSlateGrey")
	  (foreground-color . "Wheat")
	  (cursor-color . "coral")
	  (font . "fontset-chinese")))

  (create-fontset-from-fontset-spec 
   "-*-Courier New-normal-r-*-*-13-*-*-*-c-*-fontset-chinese")

  (setq w32-charset-info-alist
	(cons '("gbk" w32-charset-gb2312 . 936) w32-charset-info-alist))

  (let ((fstr "-*-新宋体-normal-r-*-*-14-*-*-*-*-*-iso10646-1"))
    (set-fontset-font "fontset-chinese" nil       fstr)
    (set-fontset-font "fontset-chinese" 'kana     fstr)
    (set-fontset-font "fontset-chinese" 'han      fstr)
    (set-fontset-font "fontset-chinese" 'cjk-misc fstr)
    (set-fontset-font "fontset-chinese" 'symbol   fstr))
  
  (set-default-font "fontset-chinese")

  (modify-coding-system-alist 'file "\\.nfo\\'" 'cp437)

  (cond
   ;; MS-Windows
   ((eq window-system 'w32)
    (global-unset-key "\C-x\C-z")
    (global-set-key [(control return)] [(return)])
    (define-key meta-m-map "\M-m\M-o" 'chunyu/title-bar-w32)

    (setq w32-lwindow-modifier 'super
	  w32-pass-lwindow-to-system nil)

    (set-message-beep 'silent)
    (setq ange-ftp-ftp-program-name "gftp")
    (setq dired-guess-shell-alist-user
	  '(("\\.ps\\'"  "gsview32") ("\\.\\(7z\\|bz2\\|tar\\)\\'" "7z x -y")
	    ("\\.rar\\'" "rar x"   ) ("\\.mp\\'"  "mptopdf")
	    ("\\.dvi\\'" "dvipdfm" ) ("\\.[0-9]+\\'" "epstopdf")))

    (setq find-program "gfind")
    ;; (setq grep-find-command (cons "gfind . -type f -exec grep -nH -e  {} NUL ;" 35))

    ;; ISpell on win32 ;;
    (setenv "ISPELLDICTDIR" (substitute-in-file-name "$emacs_dir/var/ispell"))
    (setq ispell-dictionary-alist
	  '((nil	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil iso-8859-1)
	    ("english"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil iso-8859-1)
	    ("american" "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "american") nil iso-8859-1)
	    ("UK-xlg"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "UK-xlg") nil iso-8859-1)
	    ("US-xlg"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "US-xlg") nil iso-8859-1)))
    ;; ISpell on win32 end here ;;

    (eval-after-load 'browse-url
      '(progn
	 (defun browse-url-default-windows-browser (url &optional new-window)
	   (interactive (browse-url-interactive-arg "URL: "))
	   (if (eq system-type 'ms-dos)
	       (if dos-windows-version
		   (shell-command (concat "start " (shell-quote-argument url)))
		 (error "Browsing URLs is not supported on this system"))
	     (w32-shell-execute nil "C:/Program Files/Mozilla Firefox/firefox.exe" url 1)))))))))

(defun chunyu/view-scroll-forward (&optional lines)
  "Move forward one line or LINES lines."
  (interactive "p")
  (scroll-up lines)
  (if (not (eq scroll-preserve-screen-position 'keep)) 
      (next-line lines)))

(defun chunyu/view-scroll-backward (&optional lines)
  "Move backward one line or LINES lines."
  (interactive "p")
  (scroll-down lines)
  (if (not (eq scroll-preserve-screen-position 'keep)) 
      (previous-line lines)))

(defun chunyu/kill-this-buffer ()
  (interactive)
  (if (equal (buffer-name) "*scratch*")
      (progn (erase-buffer)
	     (set-buffer-modified-p nil)
	     (bury-buffer))
    (kill-buffer (current-buffer))))

(defun chunyu/update-src ()
  (interactive)
  (cond ((file-exists-p ".svn")
	 (message "svn update current dir")
	 (shell-command "svn update ."))
	((file-exists-p "CVS")
	 (message "cvs update current dir")
	 (shell-command "cvs update ."))
	(t (message "Update What?"))))

(defun chunyu/title-bar-w32 (arg)
  (interactive "p")
  (let ((pp (if (< arg 0) "+" "-"))
	(tt (frame-parameter nil 'name)))
    (w32-shell-execute 
     "open" "nircmd"
     (format "win %sstyle title \"%s\" 0x00C00000" pp tt) 1)))

(defun chunyu/insert-file-variable ()
  "Insert file variable string \"-*- Major-Mode-Name -*-\" with
comment char"
  (interactive)
  (insert
   (concat comment-start " -*- "
	   (substring
	    (symbol-name (symbol-value 'major-mode)) 0 -5)
	   " -*- " comment-end)))

(cond ;; only faces
 ((not (or window-system (equal (getenv "TERM") "xterm-256color")))
  ;; Text-Only console
  (set-face-attribute 'highlight nil :foreground "white" :background "blue" :underline nil :weight 'normal)
  (set-face-attribute 'region nil :background "blue")
  (set-face-attribute 'font-lock-comment-face nil :foreground "red")

  (eval-after-load 'log-view
    '(progn
       (set-face-attribute 'log-view-file-face nil :foreground "blue" :weight 'bold)
       (set-face-attribute 'log-view-message-face nil :foreground "yellow" :weight 'bold)))
  (eval-after-load 'calendar
    '(progn
       (set-face-attribute 'holiday-face nil :foreground "red" :background "black" :weight 'bold)))

  (eval-after-load 'ediff-init
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
  (set-face-attribute 'minibuffer-prompt nil :foreground "chocolate1")
  (set-face-attribute 'mode-line nil :foreground "black" :background "wheat" :box nil)
  (set-face-attribute 'mode-line-inactive nil :foreground "grey90" :background "grey30" :box '(:color "grey50"))
  (set-face-attribute 'mode-line-highlight nil :box '(:line-width 1 :color "grey40"))
  (set-face-attribute 'region nil :background "grey21")
  (set-face-attribute 'trailing-whitespace nil :background "SeaGreen1")
  (copy-face 'default 'font-lock-warning-face)
  (set-face-attribute 'font-lock-warning-face nil :foreground "deep pink")))

(when (eq window-system 'w32) (w32-send-sys-command #xf030))

(mapc (lambda (func) (put func 'disabled t))
      '(overwrite-mode rmail iconify-or-deiconify-frame))

(mapc (lambda (func) (put func 'disabled nil))
      '(dired-find-alternate-file
	downcase-region narrow-to-page narrow-to-region set-goal-column
	scroll-left 
	upcase-region erase-buffer LaTeX-hide-environment))

(mapc (lambda (vrb) (put vrb 'safe-local-variable 'string-or-null-p))
      '(dired-omit-files
	org-export-html-style org-export-publishing-directory
	TeX-header-end TeX-trailer-start))

(server-start)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-cleanup-list (quote (brace-else-brace brace-elseif-brace empty-defun-braces defun-close-semi list-close-comma scope-operator space-before-funcall compact-empty-funcall comment-close-slash)))
 '(c-offsets-alist (quote ((substatement-open . 0))))
 '(safe-local-variable-values (quote ((dired-omit-mode . t)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Chunyu's .emacs.d/init.el ends here.
