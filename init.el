;; Chunyu <cymacs@gmail.com>'s ~/.emacs.d/init.el for GNU Emacs
;; Created on 2001-12-11 on db.hit.edu.cn

(global-unset-key [(insert)])
(global-unset-key [(insertchar)])
(global-set-key "\C-x\C-b" 'bs-show)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xk" 'kill-this-buffer)
(global-set-key "\C-xE" 'apply-macro-to-region-lines)
(global-set-key "\C-\\" 'toggle-truncate-lines)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\M-k" 'kill-this-buffer)


(setq inhibit-startup-message t
      default-major-mode 'text-mode
      require-final-newline t
      resize-mini-windows t
      track-eol t
      kill-whole-line t
      Man-notify-method 'pushy
      vc-follow-symlinks t
      vc-suppress-confirm t
      enable-recursive-minibuffers t
      default-fill-column 78
      disabled-command-function nil
      history-delete-duplicates t
      mark-even-if-inactive t
      parens-require-spaces nil
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

(setq user-full-name "Chunyu Wang"
      user-mail-address "cymacs@gmail.com")

(setq version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t
      backup-directory-alist '(("." . "~/.tmp"))
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

(setq ange-ftp-smart-gateway nil
      ange-ftp-generate-anonymous-password "user@cyber.net")

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq reb-blink-delay 1
      reb-re-syntax 'string)

(set-register ?e '(file . "~/.emacs.d/init.el"))

(set-language-environment    'UTF-8)
(set-default-coding-systems  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-terminal-coding-system  'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

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

(setq savehist-ignored-variables '(ido-file-history ido-buffer-history))

(setq auto-mode-alist
      (append '(("\\.cs\\'" . csharp-mode) ("\\.bat\\'" . cmd-mode)
		("\\.php\\'" . php-mode) ("\\.cmd\\'" . cmd-mode))
	      auto-mode-alist))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'bs-mode-hook 'hl-line-mode)

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

(eval-after-load 'apropos
  '(progn
     (define-key apropos-mode-map "n" 'forward-button)
     (define-key apropos-mode-map "p" 'backward-button)
     (define-key apropos-mode-map "j" 'chunyu/view-scroll-forward)
     (define-key apropos-mode-map "k" 'chunyu/view-scroll-backward)))


;; Org-mode ;;
(setq org-special-ctrl-a/e t
      org-special-ctrl-k t
      org-export-author-info nil
      org-export-email-info nil
      org-export-creator-info nil
      org-export-time-stamp-file nil
      org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"default.css\">"
      org-log-done t)
;; Org-mode ends here ;;

;; SavePlace ;;
(setq save-place-file "~/.emacs.d/places"
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
	    (abbrev-mode 1) (cwarn-mode 1) (c-toggle-auto-hungry-state -1)))
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
	 (let ((f (subst-char-in-string ?\\ ?/ (dired-get-filename)))
	       (c (substitute-in-file-name "$COMMANDER_PATH\\totalcmd.exe")))
	   (if (file-exists-p f)
	       (w32-shell-execute nil c (format "/O \"%s\"" (subst-char-in-string ?/ ?\\ f)) 1))))
       
       (defun acrobat-close-doc (&optional f)
	 "Close documents in Acrobat."
	 (interactive)
	 (let* ((o "[DocOpen(\"%s\")]") (c "[DocClose(\"%s\")]") 
		(dde (if f (format (concat o o c) f f f) (format c "NULL"))))
	   (save-excursion
	     (set-buffer (get-buffer-create " *ddeclient*"))
	     (erase-buffer) (message (concat "DDE:" dde)) (insert dde)
	     (call-process-region (point-min) (point-max) "ddeclient" 
				  nil t nil "acroview" "control")))))))
;; Dired ends here ;;

;; Ido ;;
(setq ido-max-prospects 8
      ido-save-directory-list-file nil
      ido-auto-merge-delay-time 2
      ido-enable-flex-matching t
      ido-enable-prefix nil
      ido-enable-regexp t
      ido-create-new-buffer 'always
      completion-ignored-extensions
      (append '(".tmp" ".tuo" ".tui" ".tup" ".snm" ".nav" ".out" ".vrb") 
	      completion-ignored-extensions))
(require 'ido)
(ido-everywhere 1)
(ido-mode 1)
(define-key ido-buffer-completion-map " " 'ido-exit-minibuffer)
;; Ido ends here ;;

;; Calendar ;;
(setq calendar-latitude 45.73213
      calendar-longitude 126.63621
      calendar-location-name "Harbin"
      calendar-week-start-day 1)
;; Calendar ends here ;;

;; AUCTeX, RefTeX, CDLaTeX etc. ;;
(setq TeX-engine 'xetex)

(load "preview-latex.el" t t t)
(load "auctex.el" t t t)

(setq TeX-auto-save t
      TeX-parse-self t
      TeX-auto-untabify t
      TeX-region "z_region"
      TeX-fold-type-list '(env math))

(setq preview-scale-function 2
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
      font-latex-fontify-sectioning 1.01
      font-latex-match-slide-title-keywords '("frametitle"))

(setq cdlatex-math-modify-prefix [(super ?')]
      ;; cdlatex-math-symbol-prefix [(super ?`)]
      cdlatex-paired-parens "$[{(<|"
      ;; cdlatex-math-symbol-alist
      ;; '((?< ("\\leftarrow" "\\Leftarrow" "\\longleftarrow" "\\Longleftarrow"))
      ;;   (?> ("\\rightarrow" "\\Rightarrow" "\\longrightarrow" "\\Longrightarrow")))
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
	  (lambda () ;; (outline-minor-mode 1) (flyspell-mode 1) (beamer-setup)
	    (TeX-fold-mode 1) (turn-on-cdlatex) (TeX-fold-buffer) ))

;; (eval-after-load 'cdlatex
;;   '(progn
;;      (define-key cdlatex-mode-map "^" 'self-insert-command)
;;      (define-key cdlatex-mode-map "_" 'self-insert-command)
;;      ))

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
     ;;(define-key TeX-mode-map [(super ?o)] 'TeX-fold-clearout-buffer)
     (define-key TeX-mode-map [(super ?k)] 'TeX-kill-job)
     (define-key TeX-mode-map "\M-m\M-," 'TeX-view)
     (define-key TeX-mode-map "\M-n" 'next-line)
     (define-key TeX-mode-map "\M-p" 'previous-line)
     (when (eq window-system 'w32) 
       (setq TeX-output-view-style
	     (cons '("^pdf$" "." "start \"title\" %o") TeX-output-view-style)))
     ;;(TeX-add-style-hook "beamer" 'beamer-setup)
     (TeX-global-PDF-mode t)))

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
(require 'misc)
(global-set-key "\M-Z" 'zap-up-to-char)

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
		     haskell-mode-hook))

(setq msf-abbrev-root "~/.emacs.d/msf")
(if (require 'msf-abbrev nil t)
    (progn (define-key fld-choose-keymap "\M-m" 'fld-choose)
	   (msf-abbrev-load)))
;; MISC Packages end here ;;


(cond ;; Different Platform
 ;; Text-Only console
 ((not window-system)
  (setq frame-background-mode 'dark)
  (setq Info-use-header-line nil))

 ;; BOTH X-Window and MS-Windows
 (window-system
  (setq-default mouse-yank-at-point t)
  (setq default-indicate-empty-lines 'left
	default-indicate-buffer-boundaries 'left)

  (setq default-frame-alist
	'((background-mode . dark)
	  (font . "Consolas")
	  (background-color . "DarkSlateGrey")
	  (foreground-color . "Wheat")
	  (cursor-color . "Coral")))

  (set-frame-font "Consolas" t)

  (set-face-attribute 'default nil :height 140)
  (set-face-attribute 'modeline nil :height 120)
  (set-face-attribute 'font-lock-comment-face nil :italic t)
  (set-fontset-font (frame-parameter nil 'font) 'han "Microsoft YaHei")
  (set-fontset-font (frame-parameter nil 'font) 'symbol "Microsoft YaHei")
  (set-fontset-font (frame-parameter nil 'font) 'cjk-misc "Microsoft YaHei")

  (modify-coding-system-alist 'process "gftp" '(gbk . gbk))

  (cond
   ;; MS-Windows
   ((eq window-system 'w32)
    (global-unset-key "\C-x\C-z")
    (global-set-key [(control return)] [(return)])

    (setq w32-lwindow-modifier 'hyper
	  w32-apps-modifier 'super
	  w32-pass-lwindow-to-system t
	  w32-charset-info-alist
	  (cons '("gbk" w32-charset-gb2312 . 936) w32-charset-info-alist))

    (setq ange-ftp-ftp-program-name "gftp")
    (setq dired-guess-shell-alist-user
	  '(("\\.ps\\'"  "gsview32") ("\\.\\(7z\\|bz2\\|tar\\)\\'" "7z x -y")
	    ("\\.rar\\'" "rar x"   ) ("\\.mp\\'"  "mptopdf")
	    ("\\.dvi\\'" "dvipdfm" ) ("\\.[0-9]+\\'" "epstopdf")))

    ;; ISpell on Win32 ;;
    (setenv "ISPELLDICTDIR" (substitute-in-file-name "$emacs_dir/var/ispell"))
    (setq ispell-dictionary-alist
	  '((nil	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil iso-8859-1)
	    ("english"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil iso-8859-1)
	    ("american" "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "american") nil iso-8859-1)
	    ("UK-xlg"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "UK-xlg") nil iso-8859-1)
	    ("US-xlg"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "US-xlg") nil iso-8859-1)))
    ;; ISpell on Win32 ends here ;;

    (setq find-program "gfind")))))


(defalias 'toggle-input-method 'toggle-truncate-lines) ;; C-\

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
  (set-face-attribute 'trailing-whitespace nil :background "SeaGreen1")))


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

;; Load local settings ;;
(load "~/.emacs.d/mypass" t t t)
;; Loaded ;;

;; Local Variables:
;; mode: emacs-lisp
;; coding: gbk-unix
;; End:

;; Chunyu's .emacs.d/init.el ends here.
