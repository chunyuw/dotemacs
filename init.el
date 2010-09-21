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
(global-set-key "\M-K" 'kill-buffer-and-window)
(global-set-key "\M-sv" 'view-mode)

(setq inhibit-startup-message t
      require-final-newline t
      resize-mini-windows t
      track-eol t
      kill-whole-line t
      vc-follow-symlinks t
      vc-suppress-confirm t
      enable-recursive-minibuffers t
      disabled-command-function nil
      history-delete-duplicates t
      mark-even-if-inactive t
      set-mark-command-repeat-pop t
      parens-require-spaces nil
      max-mini-window-height 1
      isearch-allow-scroll t)

(setq-default major-mode 'text-mode
	      fill-column 78)

(setq kmacro-call-repeat-with-arg t)

(setq makefile-electric-keys t
      apropos-do-all t
      sentence-end-double-space nil
      scroll-preserve-screen-position 'keep
      Man-notify-method 'pushy
      comment-auto-fill-only-comments t
      comment-style 'extra-line)

(setq bookmark-save-flag 1
      bookmark-default-file (concat "~/.emacs.d/bookmark/" system-name)
      save-abbrevs 'silently)

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
	yas/expand-1
	try-complete-file-name
	try-complete-file-name-partially
	try-complete-lisp-symbol
	try-complete-lisp-symbol-partially
	try-expand-whole-kill))

(setq ange-ftp-smart-gateway nil
      ange-ftp-generate-anonymous-password "user@cyber.net")

(setq tramp-backup-directory-alist backup-directory-alist)

(setq view-inhibit-help-message t)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq reb-blink-delay 1
      reb-re-syntax 'string)

;; (setq vcursor-key-bindings t)

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
(column-number-mode 1)
(blink-cursor-mode -1)
(display-time-mode 1)
(show-paren-mode 1)
(icomplete-mode 1)
(menu-bar-mode -1)
(savehist-mode 1)

(windmove-default-keybindings 'super)

(setq completion-styles '(partial-completion initials))
(setq completion-pcm-complete-word-inserts-delimiters t)

(setq savehist-ignored-variables
      '(ido-file-history ido-buffer-history file-name-history))

(setq auto-mode-alist
      (append '(("\\.\\(cmd\\|bat\\)\\'" . dos-mode)
		("\\.cs\\'" . csharp-mode) ("\\.php\\'" . php-mode))
	      auto-mode-alist))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'bs-mode-hook 'hl-line-mode)

(eval-after-load 'man
  '(progn
     (define-key Man-mode-map "j"  'scroll-up-line)
     (define-key Man-mode-map "k"  'scroll-down-line)))

(eval-after-load 'help-mode
  '(progn
     (define-key help-mode-map "b" 'help-go-back)
     (define-key help-mode-map "f" 'help-go-forward)
     (define-key help-mode-map "h" 'backward-char)))

(eval-after-load 'view
  '(progn
     (define-key view-mode-map "j" 'scroll-up-line)
     (define-key view-mode-map "k" 'scroll-down-line)
     (define-key view-mode-map " " 'scroll-up)
     (define-key view-mode-map "h" 'backward-char)
     (define-key view-mode-map "l" 'forward-char)))

(eval-after-load 'info
  '(progn
     (define-key Info-mode-map "w" 'Info-scroll-down)
     (define-key Info-mode-map "j" 'scroll-up-line)
     (define-key Info-mode-map "k" 'scroll-down-line)))

(eval-after-load 'apropos
  '(progn
     (define-key apropos-mode-map "n" 'forward-button)
     (define-key apropos-mode-map "p" 'backward-button)
     (define-key apropos-mode-map "j" 'scroll-up-line)
     (define-key apropos-mode-map "k" 'scroll-down-line)))

(eval-after-load 'diff-mode
  '(progn
     (define-key diff-mode-map "\M-k" 'kill-this-buffer)
     (define-key diff-mode-map "\M-K" 'kill-buffer-and-window)
     (define-key diff-mode-map "\C-k" 'diff-hunk-kill)
     (define-key diff-mode-map "\C-K" 'diff-file-kill)
     (define-key diff-mode-map "\C-\M-k" 'kill-line)))

;; package ;;
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("tromey" . "http://tromey.com/elpa/")))
;; package ends here ;;

;; Org-mode ;;
(setq org-goto-auto-isearch nil)

(setq org-special-ctrl-a/e t
      org-special-ctrl-k t
      org-export-author-info nil
      org-export-email-info nil
      org-export-creator-info nil
      org-export-time-stamp-file nil
      org-export-html-style
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"default.css\">"
      org-log-done t)
(eval-after-load 'org
  '(eval-after-load 'anything-config
      '(define-key org-mode-map "\M-a" 'anything-for-files)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(setq googlecl-blogname "Chunyu"
      googlecl-username user-mail-address)
;; Org-mode ends here ;;

;; SavePlace ;;
(setq save-place-file "~/.emacs.d/places"
      save-place-limit 20)
(setq-default save-place t)
(require 'saveplace)
;; SavePlace ends here ;;

;; Recentf ;;
(setq recentf-save-file "~/.emacs.d/recentf"
      recentf-max-saved-items 60
      recentf-exclude
      '(".emacs.d/bookmark/" "\\.tmp/" "z_region" "drive_[cCdDeEfF]"))
(require 'recentf)
;; Recentf ends here ;;

;; Dired ;;
(eval-after-load 'dired
  '(progn
     (setq dired-listing-switches "-avl"
	   dired-dwim-target t
	   directory-free-space-args "-Ph"
	   dired-bind-man nil
	   dired-bind-vm nil
	   wdired-use-dired-vertical-movement 'sometime)

     (require 'dired-x)
     (define-key dired-mode-map "b" 'dired-mark-extension)
     (define-key dired-mode-map "c" 'dired-up-directory)
     (define-key dired-mode-map "e" 'dired-mark-files-containing-regexp)
     (define-key dired-mode-map "J" 'dired-mark-files-regexp)
     (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
     (define-key dired-mode-map "/" 'dired-mark-directories)
     (define-key dired-mode-map "K" 'dired-kill-subdir)
     (define-key dired-mode-map "h" 'dired-mark-files-regexp)

     (when window-system
       (define-key dired-mode-map "O" 'chunyu/dired-open-explorer)
       (define-key dired-mode-map "o" 'chunyu/totalcmd-open)
       (define-key dired-mode-map "Y" 'chunyu/dired-win7-mklink)
       (define-key dired-mode-map "W"
	 (lambda () (interactive)
	   (browse-url-generic (concat "file:///" (dired-get-filename)))))

       (setq browse-url-generic-program
	     (substitute-in-file-name
	      "$LOCALAPPDATA/Google/Chrome/Application/chrome.exe"))

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
	 (let* ((f (subst-char-in-string ?\\ ?/ (dired-get-filename)))
		(c (substitute-in-file-name "$COMMANDER_PATH\\totalcmd.exe"))
		(g (subst-char-in-string ?/ ?\\ f)))
	   (if (file-exists-p f)
	       (w32-shell-execute nil c (format "/O \"%s\"" g) 1))))

       (defun chunyu/dired-win7-mklink ()
	 "Win7 mklink wrapper"
	 (interactive)
	 (let* ((file-name (dired-get-file-for-visit))
		(target-dir (dired-dwim-target-directory))
		(target (read-file-name "MkLink to:" target-dir))
		(option (if (file-directory-p file-name) "/J" "/H"))
		(filenm (replace-regexp-in-string
			 "/" "\\\\" (format "%s %s" target file-name))))
	   (w32-shell-execute nil "cmd" (format "/c mklink %s %s" option filenm) 0)))

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
      ido-use-virtual-buffers t
      completion-ignored-extensions
      (append '(".tmp" ".tuo" ".tui" ".tup" ".snm" ".nav" ".out" ".vrb")
	      completion-ignored-extensions))
(require 'ido)
(ido-everywhere 1)
(ido-mode 1)
(define-key ido-buffer-completion-map " " 'ido-exit-minibuffer)
;; Ido ends here ;;

;; Anything ;;
(setq anything-su-or-sudo "sudo"
      anything-for-files-prefered-list
      '(anything-c-source-ffap-line
	anything-c-source-ffap-guesser
	anything-c-source-buffers+
	anything-c-source-recentf
	anything-c-source-files-in-current-dir+
	anything-c-source-bookmarks
	anything-c-source-file-cache
	anything-c-source-occur
	anything-c-source-locate
	anything-c-source-files-in-all-dired))

(when (require 'anything-config nil t)
  (global-set-key [(super a)] 'anything-for-files)
  (global-set-key "\M-a" 'anything-for-files)
  (global-set-key "\M-A" 'anything-call-source)
  (define-key anything-map " " 'anything-exit-minibuffer)
  (define-key anything-map "\C-k" 'anything-execute-persistent-action)
  (define-key anything-map "\M-a" 'anything-next-line)
  (define-key anything-map "\C-z" 'anything-toggle-visible-mark)
  (remove-hook 'kill-emacs-hook 'anything-c-adaptive-save-history))
;; Anything ends here ;;

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
	    (turn-on-reftex) (auto-fill-mode 1)))

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
     (define-key TeX-mode-map [(C-tab)] 'yas/expand)
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

(defun kpsewhich-open (filename)
  "Open TeXLive file in kpathsea."
  (interactive "skpsewhich: ")
  (let* ((comm (format "kpsewhich \"%s\"" filename))
	 (fpath (replace-regexp-in-string
		 "\015\\|\012" "" (shell-command-to-string comm))))
    (if (> (length fpath) 0) (find-file fpath)
      (message "Kpsewhich not found: %s" filename))))
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
(when (require 'template nil t) (template-initialize))

(when (require 'twitter nil t)
  (global-set-key "\M-st" (lambda () (interactive)
			    (let ((url-proxy-services '(("http" . "127.0.0.1:8580"))))
			      (twitter-get-friends-timeline))))
  (add-hook 'twitter-status-edit-mode-hook
	    (lambda () (make-local-variable 'url-proxy-services)
	      (setq url-proxy-services '(("http" . "127.0.0.1:8580")))))
  (setq twitter-username "cymacss" twitter-password "*******"))

(eval-after-load 'yasnippet
  '(progn (global-set-key [(C-tab)] 'yas/expand)
	  (yas/load-directory "~/.emacs.d/snippets")
	  (setq yas/prompt-functions '(yas/ido-prompt yas/completing-prompt yas/no-prompt))))
(when (fboundp 'yas/minor-mode-on)
  (mapc (lambda (hook) (add-hook hook 'yas/minor-mode-on))
	'(c-mode-hook c++-mode-hook java-mode-hook python-mode-hook 
		      html-mode-hook css-mode-hook perl-mode-hook 
		      cperl-mode-hook csharp-mode-hook)))
;; MISC Packages end here ;;

(cond
 ((not window-system) ;; Text-Only console
  (global-set-key "\C-x5k" 'kill-emacs)
  (setq frame-background-mode 'dark)
  (setq Info-use-header-line nil))

 (window-system	;; BOTH X-Window and MS-Windows
  (setq-default mouse-yank-at-point t
		indicate-empty-lines 'left
		indicate-buffer-boundaries 'left)

  (setq default-frame-alist
	'((background-mode . dark)
	  (background-color . "DarkSlateGrey")
	  (foreground-color . "Wheat")
	  (screen-gamma . 1.7)
	  (cursor-color . "Coral")))

  (modify-coding-system-alist 'process "gftp" '(gbk . gbk))

  (when (eq window-system 'w32) ;; MS-Windows
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
	    ("US-xlg"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "US-xlg") nil iso-8859-1)))
    ;; ISpell on Win32 ends here ;;

    (setq find-program "gfind"))))

(defalias 'toggle-input-method 'toggle-truncate-lines) ;; C-\

(defun chunyu/other-window (&optional size)
  (interactive "P")
  (if (< (count-windows) 2) (split-window-vertically))
  (other-window 1))

(mapc (lambda (func) (put func 'disabled t))
      '(overwrite-mode rmail iconify-or-deiconify-frame))

(mapc (lambda (var) (put var 'safe-local-variable 'string-or-null-p))
      '(dired-omit-files
	org-export-html-style org-export-publishing-directory
	TeX-header-end TeX-trailer-start))

(setq safe-local-variable-values '((dired-omit-mode . t)))

;; Frame configuration ;;
(defun frame-face-x-setup () ;; Both X-window and MS-Windows
  (set-frame-font "Consolas-14" t)

  (set-face-attribute 'default nil :height 140)
  (set-face-attribute 'mode-line nil :height 120)

  (let ((name (frame-parameter nil 'font)))
    (set-fontset-font name 'han "Microsoft YaHei")
    (set-fontset-font name 'symbol "DejaVu Sans")
    (set-fontset-font name 'cjk-misc "Microsoft YaHei")
    (set-fontset-font name '(#x2018 . #x201D) "Microsoft YaHei")
    (set-fontset-font name '(#x0B01 . #x0B70) "Kalinga"))

  (set-face-attribute 'fringe nil :foreground "limegreen" :background "gray30")
  (set-face-attribute 'minibuffer-prompt nil :foreground "chocolate1")
  (set-face-attribute 'mode-line nil :foreground "black" :background "wheat" :box nil)
  (set-face-attribute 'mode-line-inactive nil :foreground "grey90" :background "grey30" :box '(:color "grey50"))
  (set-face-attribute 'mode-line-highlight nil :box '(:line-width 1 :color "grey40"))
  (set-face-attribute 'region nil :background "grey38")
  (set-face-attribute 'trailing-whitespace nil :background "SeaGreen1")
  (set-face-attribute 'font-lock-comment-face nil :italic t)

  (eval-after-load 'org-faces
    '(progn (set-face-attribute 'org-document-title nil :height 1.2)))

  (eval-after-load 'twitter
    '(set-face-attribute 'twitter-header-face nil :foreground "SkyBlue" :background "grey20"))

  (eval-after-load 'font-latex
    '(progn (set-face-attribute 'font-latex-italic-face nil :foreground "RosyBrown1")
	    (set-face-attribute 'font-latex-bold-face nil :foreground "RosyBrown1")))
  
  (eval-after-load 'anything-config
    '(progn
       (set-face-attribute 'anything-file-name nil :foreground "gold")
       (set-face-attribute 'anything-dir-priv nil :foreground "SkyBlue" :background "gray20")
       (set-face-attribute 'anything-visible-mark nil :foreground "firebrick" :background "DarkSlateGray3"))))

(defun frame-face-nox-setup () ;; Text only console frame
  (set-face-attribute 'highlight nil :foreground "white" :background "grey35" :underline nil :weight 'normal)
  (set-face-attribute 'region nil :background "blue")
  (set-face-attribute 'font-lock-comment-face nil :foreground "red"))

(defun frame-face-nox256-setup () ;; Text only 256color console frame
  (set-face-attribute 'region nil :background "color-24")
  (set-face-attribute 'mode-line nil :background "color-180")
  (set-face-attribute 'header-line nil :background "color-23" :foreground "white" :underline nil)
  (set-face-attribute 'minibuffer-prompt nil :foreground "chocolate1")
  (set-face-attribute 'font-lock-comment-face nil :foreground "chocolate")
  (set-face-attribute 'dired-directory nil :foreground "brightblue")
  (set-face-attribute 'font-lock-keyword-face nil :foreground "Cyan1")
  (set-face-attribute 'font-lock-string-face nil :foreground "peru")
  (set-face-attribute 'font-lock-function-name-face nil :foreground "DeepSkyBlue")
  (set-face-attribute 'font-lock-doc-face nil :foreground "color-174")

  (eval-after-load 'anything-config
    '(progn (set-face-attribute 'anything-header nil :underline nil :background "black" :foreground "color-75")
	    (set-face-attribute 'anything-dir-heading nil  :foreground "color-183" :background "color-236")
	    (set-face-attribute 'anything-dir-priv    nil  :foreground "color-136" :background "color-236")
	    (set-face-attribute 'anything-file-name   nil  :foreground "color-48"  :background "black")
	    (set-face-attribute 'anything-visible-mark nil :foreground "red" :background "color-18")))

  (eval-after-load 'diff-mode
    '(progn (set-face-attribute 'diff-changed nil :foreground "salmon")
	    (set-face-attribute 'diff-header nil :background "grey20")
	    (set-face-attribute 'diff-file-header nil :background "grey30")))
  (eval-after-load 'font-latex
    '(progn (set-face-attribute 'font-latex-italic-face nil :foreground "RosyBrown1")
	    (set-face-attribute 'font-latex-bold-face nil :foreground "RosyBrown1")))
  (eval-after-load 'table
    '(set-face-attribute 'table-cell nil :background "aquamarine4")))

(if window-system (frame-face-x-setup) (frame-face-nox-setup))
(when (string-match "256color" (getenv "TERM")) (frame-face-nox256-setup))
;; Frame configuration ends here ;;

;; Load local settings ;;
(load "~/.emacs.d/mypass" t t t)
;; Loaded ;;

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8
;; End:

;; Chunyu's .emacs.d/init.el ends here.
