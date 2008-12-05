;; Chunyu <chunyu@hit.edu.cn>'s ~/.emacs.d/init.el for GNU Emacs
;; Created on 2001-12-11 on db.hit.edu.cn

(global-unset-key [(insert)])
(global-unset-key [(insertchar)])
(global-set-key "\C-x\C-b" 'bs-show)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xk" 'kill-this-buffer)
(global-set-key "\C-xB" 'bury-buffer)
(global-set-key "\C-xE" 'apply-macro-to-region-lines)
(global-set-key "\C-xI" 'insert-buffer)
(global-set-key "\C-\\" 'toggle-truncate-lines)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\M-`" 'next-error)
(global-set-key "\M-k" 'kill-this-buffer)
(global-set-key "\M-a" 'other-window)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cL" 'org-insert-link-global)
(global-set-key "\C-co" 'org-open-at-point-global)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\M-sc" 'compile)
(global-set-key "\M-sr" 'rgrep)
(global-set-key "\M-sg" 'calendar)

(setq inhibit-startup-message t
      default-major-mode 'text-mode
      require-final-newline t
      resize-mini-windows t
      track-eol t
      kill-whole-line t
      Man-notify-method 'pushy
      vcg-follow-symlinks t
      vc-suppress-confirm t
      enable-recursive-minibuffers t
      default-fill-column 78
      disabled-command-function nil
      history-delete-duplicates t
      mark-even-if-inactive t
      isearch-allow-scroll t)

(setq makefile-electric-keys t
      apropos-do-all t
      sentence-end-double-space nil
      scroll-preserve-screen-position 'keep
      comment-style 'extra-line)

(setq bookmark-save-flag 1
      bookmark-default-file (concat "~/.emacs.d/bookmark/" system-name)
      save-abbrevs 'silently
      abbrev-file-name "~/.emacs.d/abbrev_defs")

(setq display-time-24hr-format t
      display-time-day-and-date t)

(setq gnus-inhibit-startup-message t
      gnus-init-file "~/.emacs.d/gnus.el")

(setq mail-signature-file "~/.sig/default"
      mail-user-agent 'gnus-user-agent
      mail-alias-file "~/.mailrc"
      user-full-name "Chunyu Wang"
      user-mail-address "chunyu@hit.edu.cn")

(setq version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t
      backup-directory-alist '(("." . "~/.tmp"))
      backup-by-copying t
      backup-by-copying-when-linked t
      backup-by-copying-when-mismatch t)

(setq org-startup-folded 'nofold
      org-log-done t
      tramp-persistency-file-name "~/.emacs.d/ztramp.el"
      calc-settings-file "~/.emacs.d/calc.el")

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

(setq reb-blink-delay 1
      reb-re-syntax 'string)

(set-register ?e '(file . "~/.emacs.d/init.el"))

(set-language-environment    'Chinese-GBK)
(set-keyboard-coding-system  'chinese-gbk)
(set-terminal-coding-system  'chinese-gbk)
(set-clipboard-coding-system 'chinese-gbk)
(set-selection-coding-system 'chinese-gbk)

(when (fboundp 'set-message-beep) (set-message-beep 'silent))
(fset 'yes-or-no-p 'y-or-n-p)
(find-function-setup-keys)

(minibuffer-electric-default-mode 1)
(minibuffer-depth-indicate-mode 1)
(mouse-avoidance-mode 'jump)
(partial-completion-mode 1)
(global-font-lock-mode 1)
(transient-mark-mode -1)
(column-number-mode 1)
(blink-cursor-mode -1)
(display-time-mode 1)
(show-paren-mode 1)
(icomplete-mode 1)
(menu-bar-mode -1)
(savehist-mode 1)
(server-mode 1)

(setq auto-mode-alist
      (append '(("\\.cs\\'" . csharp-mode) ("\\.mix\\'" . mixal-mode)
		("\\.php\\'" . php-mode) ("\\.cmd\\'" . cmd-mode)
		("\\.bat\\'" . cmd-mode) ("\\.7z\\'" . archive-mode)
		("\\.csproj\\'" . xml-mode) ("\\.org\\'" . org-mode)
		("\\.asy\\'" . asy-mode) ("\\.rdlc\\'" . nxml-mode))
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

(eval-after-load 'apropos
  '(progn
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


;; SavePlace ;;
(setq savehist-file "~/.emacs.d/zhistory.el"
      save-place-file "~/.emacs.d/zplaces.el"
      save-place-limit 20)
(setq-default save-place t)
(require 'saveplace)
;; SavePlace ends here ;;

;; CC-Mode ;;
(setq c-offsets-alist '((substatement-open . 0))
      c-cleanup-list
      '(brace-else-brace compact-empty-funcall comment-close-slash
	brace-elseif-brace empty-defun-braces defun-close-semi
	list-close-comma scope-operator space-before-funcall))
(setq-default c-block-comment-prefix "* ")
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (abbrev-mode 1) (c-subword-mode 1) (cwarn-mode 1)
	    (c-toggle-auto-hungry-state -1)))
;; CC-Mode ends here ;;

;; Dired ;;
(eval-after-load 'dired
  '(progn
     (require 'dired-x)
     (setq dired-listing-switches "-avl"
	   wdired-use-dired-vertical-movement t)

     (define-key dired-mode-map "b" 'dired-mark-extension)
     (define-key dired-mode-map "c" 'dired-up-directory)
     (define-key dired-mode-map "e" 'dired-mark-files-containing-regexp)
     (define-key dired-mode-map "j" 'dired-mark-files-regexp)
     (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
     (define-key dired-mode-map "/" 'dired-mark-directories)
     (define-key dired-mode-map "K" 'dired-kill-subdir)
     (define-key dired-mode-map [(control ?/)] 'dired-undo)
     (define-key dired-mode-map "h" 'ignore)

     (when window-system
       (define-key dired-mode-map "O" 'chunyu/dired-open-explorer)
       (define-key dired-mode-map "o" 'chunyu/totalcmd-open)

       (defun chunyu/dired-open-explorer ()
	 (interactive)
	 (let ((file-name (dired-get-file-for-visit)))
	   (if (file-exists-p file-name)
	       (w32-shell-execute "open" file-name nil 1))))

       (defun dired-execute-file (&optional arg)
	 (interactive "P")
	 (mapcar (lambda (file) (w32-shell-execute "open" file))
		 (dired-get-marked-files nil arg)))

       (defun chunyu/totalcmd-open ()
	 "Open dir in Total Commander."
	 (interactive)
	 (let ((f (substitute ?\\ ?/ (dired-get-filename)))
	       (c (substitute-in-file-name "$COMMANDER_PATH/totalcmd.exe")))
	   (if (file-exists-p f)
	       (w32-shell-execute nil c (format "/O \"%s\"" f) 1))))

       (defun acrobat-close-doc (&optional f)
	 "Close documents in Acrobat."
	 (interactive)
	 (let* ((o "[DocOpen(\"%s\")]") (c "[DocClose(\"%s\")]") 
		(dde (if f (format (concat o o c) f f f) (format c "NULL"))))
	   (save-excursion
	     (set-buffer (get-buffer-create " *ddeclient*"))
	     (erase-buffer) (message (concat "DDE:" dde)) (insert dde)
	     (call-process-region (point-min) (point-max) "ddeclient" 
				  nil t nil "acroview" "control"))))

       (defun eshell/op (FILE)
	 "Invoke (w32-shell-execute \"Open\" FILE) and substitute slashes for backslashes"
	 (w32-shell-execute "Open" (substitute ?\\ ?/ (expand-file-name FILE))))

       (defun chunyu/dired-foobar2000-play ()
	 "Open dir of .mp3 files with foobar2000."
	 (interactive)
	 (let ((f (dired-get-filename 'no-dir))
	       (b "C:/Program Files/foobar2000/foobar2000.exe"))
	   (if (file-exists-p f)
	       (w32-shell-execute nil b (format "\"%s\"" f) 1)))))))
;; Dired ends here ;;

;; Ido ;;
(setq ido-max-prospects 8
      ido-save-directory-list-file "~/.emacs.d/zido.el"
      ido-auto-merge-delay-time 2
      ido-use-filename-at-point nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      completion-ignored-extensions
      (append '(".tmp" ".tuo" ".tui" ".tup" ".snm" ".nav" ".out" ".vrb") 
	      completion-ignored-extensions))
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
	bbdb-user-mail-names "chunyu\\|cymacs"
	bbdb/gnus-score-default +20
	gnus-score-find-score-files-function '(gnus-score-find-bnews bbdb/gnus-score)
	bbdb-display-layout-alist
	'((one-line (order phones net) (name-end . 24) (toggle . t))
	  (multi-line (indention . 14) (toggle . t) (omit creation-date timestamp))
	  (pop-up-multi-line (indention . 14))))
  (eval-after-load 'gnus
    '(progn (bbdb-initialize 'gnus 'message 'sc)))))
;; BBDB ends here ;;

;; Calendar ;;
(setq diary-file "~/.emacs.d/diary"
      view-diary-entries-initially t
      calendar-latitude 45.73213
      calendar-longitude 126.63621
      calendar-location-name "Harbin"
      calendar-remove-frame-by-deleting t
      calendar-week-start-day 1
      calendar-intermonth-header t
      calendar-intermonth-text 
      '(propertize (hit-week-number month day year)
	'font-lock-face 'font-lock-function-name-face)
      chinese-calendar-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"]
      chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"]
      holiday-other-holidays
      '((holiday-fixed 1 1 "元旦") (holiday-fixed 2 14 "情人节")
      	(holiday-fixed 4 1 "愚人节") (holiday-float 5 0 2 "母亲节")
      	(holiday-float 6 0 3 "父亲节") (holiday-fixed 12 25 "圣诞节"))
      holiday-oriental-holidays
      '((holiday-chinese-new-year)
	(holiday-chinese 1 15 "元宵节 (正月十五)")
	(holiday-chinese-qingming)
	(holiday-chinese 5  5 "端午节 (五月初五)")
      	(holiday-chinese 7  7 "七月七 (七月初七)")
      	(holiday-chinese 9  9 "重阳节 (九月初九)")
      	(holiday-chinese 8 15 "中秋节 (八月十五)")
      	(holiday-chinese 12 7 "老婆生日")))

(setq calendar-holidays
      (append holiday-oriental-holidays holiday-other-holidays holiday-solar-holidays))

(setq mark-diary-entries-in-calendar t
      appt-message-warning-time 30
      mark-holidays-in-calendar t)

(setq diary-date-forms '((year "-" month "-" day "[^/0-9]") (month "/" day "[^/0-9]")
			 (month "/" day "/" year "[^0-9]") (monthname " *" day "[^,0-9]")
			 (monthname " *" day ", *" year "[^0-9]") (dayname "\\W"))
      calendar-time-display-form
      '(24-hours ":" minutes (if time-zone " (") time-zone (if time-zone ")")))

(eval-after-load 'calendar
  '(progn
     (add-hook 'today-visible-calendar-hook 'calendar-mark-today)
     (add-hook 'diary-hook 'appt-make-list)
     (add-hook 'diary-display-hook 'diary-fancy-display)))

(defun hit-week-number (month day year)
  (let* ((week 
	  (car (calendar-iso-from-absolute
		(calendar-absolute-from-gregorian (list month day year)))))
	 (hit-week (% (+ week 18) 52))
	 (result (if (< hit-week 22) (format "%2d" hit-week) "  "))) result))
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
      TeX-region "z_region"
      TeX-fold-type-list '(env math))

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
      reftex-plug-into-AUCTeX t)

(setq font-latex-fontify-script nil
      font-latex-fontify-sectioning 1.01
      font-latex-match-slide-title-keywords '("frametitle"))

(setq cdlatex-math-modify-prefix [(super ?')]
      ;; cdlatex-math-symbol-prefix [(super ?`)]
      cdlatex-paired-parens "$[{(<|"
      ;; cdlatex-math-symbol-alist
      ;; '((?< ("\\leftarrow" "\\Leftarrow" "\\longleftarrow" "\\Longleftarrow"))
      ;; 	(?> ("\\rightarrow" "\\Rightarrow" "\\longrightarrow" "\\Longrightarrow")))
      cdlatex-env-alist
      '(("frame" "\\begin{frame}\n\\frametitle{?}\n\n\\end{frame}\n" nil)
	("columns" "\\begin{columns}\n\\column{.45\\textwidth}\n?\n\\column{.54\\textwidth}\n\n\\end{columns}\n" nil)
	("block" "\\begin{block}{?}\n\n\\end{block}\n" nil)
	("lstlisting" "\\begin{lstlisting}\n?\n\\end{lstlisting}" nil)
	("alertblock" "\\begin{alertblock}{?}\n\n\\end{alertblock}\n" nil)
	("exampleblock" "\\begin{exampleblock}{?}\n\n\\end{exampleblock}\n" nil))
      cdlatex-command-alist
      '(("fr"  "frame" "" cdlatex-environment ("frame") t nil)
	("frm" "frame" "" cdlatex-environment ("frame") t nil)
	("col" "columns" "" cdlatex-environment ("columns") t nil)
	("cjk" "CJKindent" "\\CJKindent ?" cdlatex-position-cursor nil t nil)
	("ctl" "ctlgraph" "\\centerline{\\includegraphics[width=8cm]{?}}\n%\\centerline{}\n" 
	 cdlatex-position-cursor nil t nil)
	("tik" "block" "" cdlatex-environment ("tikzpicture") t nil)
	("tikz" "block" "" cdlatex-environment ("tikzpicture") t nil)
	("lst" "lstlisting" "" cdlatex-environment ("lstlisting") t nil)
	("lsti" "lstinline" "\\lstinline|?|" cdlatex-position-cursor nil t nil)
	("blk" "block" "" cdlatex-environment ("block") t nil)
	("exb" "exampleblock" "" cdlatex-environment ("exampleblock") t nil)
	("alb" "alertblock" "" cdlatex-environment ("alertblock") t nil)))

(add-hook 'TeX-mode-hook
	  (lambda () ;; (flyspell-mode 1)
	    (abbrev-mode 1) (turn-on-reftex) (auto-fill-mode 1)))

(add-hook 'LaTeX-mode-hook
	  (lambda () ;; (outline-minor-mode 1) (flyspell-mode 1)
	    (TeX-fold-mode 1) (turn-on-cdlatex) (TeX-fold-buffer) (beamer-setup)))

(eval-after-load 'cdlatex
  '(progn
     ;; (define-key cdlatex-mode-map "^" 'self-insert-command)
     (define-key cdlatex-mode-map "_" 'self-insert-command)))

(eval-after-load 'latex
  '(progn 
     (setq LaTeX-font-list
	   (append '((?\C-a "\\alert<.>{" "}" "\\mathcal{" "}")
		     (?\C-o "\\only<.>{" "}" "" "")) LaTeX-font-list))))

(eval-after-load 'tex
  '(progn
     (define-key TeX-mode-map [(backtab)] 'indent-for-tab-command)
     (define-key TeX-mode-map [(super ?\[)] 'preview-buffer)
     (define-key TeX-mode-map [(super ?\])] 'preview-clearout-buffer)
     (define-key TeX-mode-map [(super ?p)] 'preview-at-point)
     (define-key TeX-mode-map [(super ?i)] 'TeX-fold-buffer)
     (define-key TeX-mode-map [(super ?o)] 'TeX-fold-clearout-buffer)
     (define-key TeX-mode-map [(super ?k)] 'TeX-kill-job)
     (define-key TeX-mode-map "\M-m\M-," 'TeX-view)
     (define-key TeX-mode-map "\M-n" 'next-line)
     (define-key TeX-mode-map "\M-p" 'previous-line)
     (when (eq window-system 'w32) 
       (setq TeX-output-view-style
	     (cons '("^pdf$" "." "start \"title\" %o") TeX-output-view-style)))
     ;;(TeX-add-style-hook "beamer" 'beamer-setup)
     (TeX-global-PDF-mode t)))

(eval-after-load 'font-latex
  '(progn
     (set-face-attribute 'font-latex-slide-title-face nil :height 1.01 :weight 'normal)))

(defun beamer-setup ()
  (set (make-local-variable 'reftex-section-levels)
       '(("part" . 0) ("section" . 1) ("frametitle" . 2)))
  (reftex-reset-mode)
  (define-key TeX-mode-map "\M-m\M-." 'LaTeX-mark-build-frame))

(defun LaTeX-mark-build-frame ()
  "mark frame enviroment."
  (interactive)
  (let ((cur (point)) begin end)
    (save-excursion
      (re-search-forward "^[^%]*?end.frame" nil t)
      (beginning-of-line 2) (setq end (point)) 
      (goto-char cur)
      (re-search-backward "^[^%]*?begin.frame" nil t)
      (beginning-of-line 1) (setq begin (point))
      (TeX-pin-region begin end))
    (TeX-command-region)))

(defun LaTeX-mark-build-frame2 ()
  "Run pdflatex on current frame.  
Frame must be declared as an environment."
  (interactive)
  (let (beg)
    (save-excursion
      (search-backward "\\begin{frame}")
      (setq beg (point))
      (forward-char 1)
      (LaTeX-find-matching-end)
      (TeX-pin-region beg (point))
      (letf (( (symbol-function 'TeX-command-query) (lambda (x) "LaTeX")))
        (TeX-command-region)))))
;; AUCTeX, RefTeX, CDLaTeX etc. end here ;;

;; MISC Packages ;;
(require 'doc-view nil t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq template-auto-update nil
      template-auto-insert nil
      template-initialize '(menus))
(if (require 'template nil t)
    (progn (template-initialize)))

(mapc (lambda (hook) (add-hook hook (lambda () (abbrev-mode 1))))
      '(sh-mode-hook text-mode-hook perl-mode-hook cperl-mode-hook csharp-mode-hook
		     c-mode-hook c++-mode-hook java-mode-hook shell-mode-hook 
		     python-mode-hook haskell-mode-hook))

(setq msf-abbrev-root "~/.emacs.d/msf")
(if (require 'msf-abbrev nil t)
    (progn (define-key fld-choose-keymap "\M-m" 'fld-choose)
	   (msf-abbrev-load)))

(setq swbuff-clear-delay 0.7
      swbuff-load-hook nil
      swbuff-separator " | "
      swbuff-exclude-buffer-regexps '("^ " "^\*.*\*")
      swbuff-include-buffer-regexps '("\*scratch\*" "\*info\*" "\*Calculator\*")
      swbuff-exclude-mode-regexp "Fundamental")
(if (require 'swbuff-x nil t)
    (progn (global-set-key "\M-e" 'swbuff-switch-to-next-buffer)
	   (global-set-key "\M-E" 'swbuff-switch-to-previous-buffer)
	   (set-face-attribute 'swbuff-current-buffer-face nil :foreground "OrangeRed" :underline nil)
	   (set-face-attribute 'swbuff-separator-face nil :foreground "azure" :bold nil)
	   (set-face-attribute 'swbuff-special-buffers-face nil :foreground "goldenrod2")))

(setq w3m-init-file "~/.emacs.d/w3m")
(require 'w3m-load nil t)
;; MISC Packages end here ;;


(cond ;; Different Platform
 ;; Text-Only console
 ((not window-system)
  (setq frame-background-mode 'dark)
  (setq Info-use-header-line nil))
 ;; Text-Only Windows console
 ((and (not window-system) (eq system-type 'windows-nt))
  (global-set-key [(control return)] [(return)]))
 ;; BOTH X-Window and MS-Windows
 (window-system
  (tool-bar-mode -1)

  (setq-default mouse-yank-at-point t)
  (setq default-indicate-empty-lines 'left
	default-indicate-buffer-boundaries 'left)

  (setq default-frame-alist
	'((background-mode . dark)
	  (vertical-scroll-bars)
	  (background-color . "DarkSlateGrey")
	  (foreground-color . "Wheat")
	  (cursor-color . "Coral")))

  (if (> (display-pixel-width) 1024)
    (progn
      (set-frame-font "Consolas")
      (set-face-attribute 'default nil :height 140)
      (set-face-attribute 'modeline nil :height 120))
    (progn
      (set-frame-font "Courier New")
      (set-face-attribute 'default nil :height 100)
      (set-face-attribute 'modeline nil :height 100)))

  (set-fontset-font (frame-parameter nil 'font) 'han "Microsoft YaHei")
  (set-fontset-font (frame-parameter nil 'font) 'symbol "Microsoft YaHei")
  (set-fontset-font (frame-parameter nil 'font) 'cjk-misc "Microsoft YaHei")

  ;; (modify-coding-system-alist 'file "\\.nfo\\'" '(cp437 . cp437))

  (cond
   ;; MS-Windows
   ((eq window-system 'w32)
    (global-unset-key "\C-x\C-z")
    ;; (global-set-key [mouse-2] 'ignore)
    ;; (global-set-key [mouse-3] 'ignore)
    ;; (global-set-key [mouse-3] 'mouse-popup-menubar-stuff)
    ;; (global-set-key [apps] 'keyboard-escape-quit)
    (global-set-key [(control return)] [(return)])

    (setq w32-lwindow-modifier 'super
	  w32-pass-lwindow-to-system t
	  w32-charset-info-alist
	  (cons '("gbk" w32-charset-gb2312 . 936) w32-charset-info-alist))

    (setq ange-ftp-ftp-program-name "gftp")
    (setq dired-guess-shell-alist-user
	  '(("\\.ps\\'"  "gsview32") ("\\.\\(7z\\|bz2\\|tar\\)\\'" "7z x -y")
	    ("\\.rar\\'" "rar x"   ) ("\\.mp\\'"  "mptopdf")
	    ("\\.dvi\\'" "dvipdfm" ) ("\\.[0-9]+\\'" "epstopdf")))

    (setq find-program "gfind")

    ;; ISpell on win32 ;;
    (setenv "ISPELLDICTDIR" (substitute-in-file-name "$emacs_dir/var/ispell"))
    (setq ispell-dictionary-alist
	  '((nil	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil iso-8859-1)
	    ("english"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil iso-8859-1)
	    ("american" "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "american") nil iso-8859-1)
	    ("UK-xlg"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "UK-xlg") nil iso-8859-1)
	    ("US-xlg"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "US-xlg") nil iso-8859-1)))
    ;; ISpell on win32 ends here ;;

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
  (or (eq scroll-preserve-screen-position 'keep)
      (next-line lines)))

(defun chunyu/view-scroll-backward (&optional lines)
  "Move backward one line or LINES lines."
  (interactive "p")
  (scroll-down lines)
  (or (eq scroll-preserve-screen-position 'keep)
      (previous-line lines)))

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
  "Insert file variable \"-*- major-mode -*-\" with comment"
  (interactive)
  (let ((s " -*- ") 
	(n (substring (symbol-name (symbol-value 'major-mode)) 0 -5)))
    (insert comment-start s n s comment-end)))

(defun kpsewhich-open (filename)
  "Open TeXLive file in kpathsea."
  (interactive "skpsewhich: ")
  (let* ((comm (format "kpsewhich \"%s\"" filename))
	 (fpath (replace-regexp-in-string
		 "\015\\|\012" "" (shell-command-to-string comm))))
    (if (> (length fpath) 0) (find-file fpath)
      (message "Kpsewhich not found: %s" filename))))


(cond ;; faces only
 ((not window-system)
  ;; Text only console
  (set-face-attribute 'highlight nil :foreground "white" :background "blue" :underline nil :weight 'normal)
  (set-face-attribute 'region nil :background "blue")
  (set-face-attribute 'font-lock-comment-face nil :foreground "red")
  (set-face-attribute 'font-lock-comment-face nil :italic t)

  (when (< 240 (display-color-cells))
    ;; 256 colors XTerm console
    (set-face-attribute 'region nil :background "color-24")
    (set-face-attribute 'mode-line nil :background "color-180")
    (set-face-attribute 'minibuffer-prompt nil :foreground "chocolate1")
    (set-face-attribute 'font-lock-comment-face nil :foreground "chocolate")
    (set-face-attribute 'dired-directory nil :foreground "brightblue")
    (set-face-attribute 'font-lock-keyword-face nil :foreground "Cyan1")
    (set-face-attribute 'font-lock-string-face nil :foreground "peru")
    (set-face-attribute 'font-lock-function-name-face nil :foreground "DeepSkyBlue")
    (set-face-attribute 'font-lock-doc-face nil :foreground "color-174")

    (eval-after-load 'mm-uu
      '(progn (set-face-attribute 'mm-uu-extract nil :foreground "DarkOliveGreen3" :background "grey15")))
    (eval-after-load 'diff-mode
      '(progn (set-face-attribute 'diff-changed nil :foreground "salmon")
	      (set-face-attribute 'diff-header nil :background "grey20")
	      (set-face-attribute 'diff-file-header nil :background "grey30")))
    (eval-after-load 'font-latex
      '(progn (set-face-attribute 'font-latex-italic-face nil :foreground "RosyBrown1")
	      (set-face-attribute 'font-latex-bold-face nil :foreground "RosyBrown1")))
    (eval-after-load 'table
      '(progn (set-face-attribute 'table-cell nil :background "aquamarine4")))))

 (window-system
  ;; Both X-window and MS-Windows
  (set-face-attribute 'fringe nil :foreground "limegreen" :background "gray30")
  (set-face-attribute 'minibuffer-prompt nil :foreground "chocolate1")
  (set-face-attribute 'mode-line nil :foreground "black" :background "wheat" :box nil)
  (set-face-attribute 'mode-line-inactive nil :foreground "grey90" :background "grey30" :box '(:color "grey50"))
  (set-face-attribute 'mode-line-highlight nil :box '(:line-width 1 :color "grey40"))
  (set-face-attribute 'region nil :background "grey21")
  (set-face-attribute 'trailing-whitespace nil :background "SeaGreen1")
  (copy-face 'default 'font-lock-warning-face)
  (set-face-attribute 'font-lock-warning-face nil :foreground "deep pink")
  (eval-after-load 'font-latex
    '(progn (set-face-attribute 'font-latex-italic-face nil :foreground "RosyBrown1")
	    (set-face-attribute 'font-latex-bold-face nil :foreground "RosyBrown1")))
  (eval-after-load 'table
    '(progn (set-face-attribute 'table-cell nil :background "aquamarine4")))))


(mapc (lambda (func) (put func 'disabled t))
      '(overwrite-mode rmail iconify-or-deiconify-frame))

(mapc (lambda (var) (put var 'safe-local-variable 'string-or-null-p))
      '(dired-omit-files
	org-export-html-style org-export-publishing-directory
	TeX-header-end TeX-trailer-start))

(setq safe-local-variable-values '((dired-omit-mode . t)))

;; Display page delimiter ^L as a horizontal line
(or standard-display-table (setq standard-display-table (make-display-table)))
(let ((s nil)) (dotimes (i 18) (setq s (append '(?\~ ?\  ?\ ) s)))
  (aset standard-display-table ?\f (vconcat '(?\~ ?\~) s '(?\~ ?\~ ?\~))))

;; Customizations ;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)

;; Local Variables:
;; mode: emacs-lisp
;; coding: gbk-unix
;; End:

;; Chunyu's .emacs.d/init.el ends here.
