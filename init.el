;; Chunyu <cymacs@gmail.com>'s ~/.emacs.d/init.el for GNU Emacs
;; Created on 2001-12-11 on db.hit.edu.cn

(global-unset-key [(insert)])
(global-unset-key [(insertchar)])
(global-set-key "\C-x\C-b" 'bs-show)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-x5k" 'kill-emacs)
(global-set-key "\C-xk" 'kill-this-buffer)
(global-set-key "\C-xE" 'apply-macro-to-region-lines)
(global-set-key "\C-\\" 'toggle-truncate-lines)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\M-k" 'kill-this-buffer)
(global-set-key "\M-K" 'kill-buffer-and-window)
(global-set-key "\M-Z" 'zap-to-char)
(global-set-key "\M-z" 'zap-up-to-char)
(global-set-key "\M-sv" 'view-mode)
(global-set-key "\M-sg" 'magit-status)

(setq inhibit-startup-message t
      require-final-newline t
      track-eol t
      kill-whole-line t
      vc-follow-symlinks t
      vc-suppress-confirm t
      enable-recursive-minibuffers t
      disabled-command-function nil
      history-delete-duplicates t
      set-mark-command-repeat-pop t
      parens-require-spaces nil
      kmacro-call-repeat-with-arg t
      isearch-allow-scroll t)

(setq-default major-mode 'text-mode
	      fill-column 78)

(setq makefile-electric-keys t
      apropos-do-all t
      sentence-end-double-space nil
      scroll-preserve-screen-position 'keep
      Man-notify-method 'pushy
      comment-auto-fill-only-comments t
      comment-style 'extra-line
      save-abbrevs 'silently)

(setq display-time-24hr-format t
      display-time-day-and-date nil)

(setq calendar-latitude 45.74027
      calendar-longitude 126.62766
      calendar-location-name "Harbin"
      calendar-week-start-day 1)

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      user-full-name "Chunyu Wang"
      user-mail-address "cymacs@gmail.com")

(setq auth-sources '("~/.emacs.d/authinfo.gpg" "~/.netrc")
      gnus-init-file "~/.emacs.d/gnus.el")

(setq version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t
      backup-directory-alist '(("." . "~/.tmp"))
      backup-by-copying t
      backup-by-copying-when-linked t
      backup-by-copying-when-mismatch t)

(setq ange-ftp-smart-gateway nil
      ange-ftp-generate-anonymous-password "user@cyber.net"
      tramp-backup-directory-alist backup-directory-alist)

(setq ffap-machine-p-known 'accept
      view-inhibit-help-message t
      ediff-window-setup-function 'ediff-setup-windows-plain
      reb-blink-delay 1
      reb-re-syntax 'string)

(setq recentf-max-saved-items 60
      recentf-exclude
      '(".emacs.d/" "\\.tmp/" "z_region" "drive_[cCdDeEfF]"))

(set-register ?e '(file . "~/.emacs.d/init.el"))

(when (fboundp 'set-message-beep) (set-message-beep 'silent))
(fset 'yes-or-no-p 'y-or-n-p)
(find-function-setup-keys)

(minibuffer-electric-default-mode 1)
(minibuffer-depth-indicate-mode 1)
(mouse-avoidance-mode 'jump)
(column-number-mode 1)
(blink-cursor-mode -1)
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
      (append '(("\\.\\(cmd\\|bat\\)\\'" . dos-mode) ("\\.php\\'" . php-mode)
		("\\.\\(vbs\\|bas\\)\\'" . visual-basic-mode))
	      auto-mode-alist))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'bs-mode-hook 'hl-line-mode)

(eval-after-load 'man
  '(progn
     (define-key Man-mode-map "j"  'scroll-up-line)
     (define-key Man-mode-map "k"  'scroll-down-line)))

(eval-after-load 'help-mode
  '(progn
     (define-key help-mode-map "w" 'scroll-down-command)
     (define-key help-mode-map "j" 'scroll-up-line)
     (define-key help-mode-map "k" 'scroll-down-line)
     (define-key help-mode-map "b" 'help-go-back)
     (define-key help-mode-map "f" 'help-go-forward)
     (define-key help-mode-map "l" 'forward-char)
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
			 ("tromey" . "http://tromey.com/elpa/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
;; package ends here ;;

;; Org-mode ;;
(global-set-key "\M-sc" 'org-capture)

(setq org-directory "~/rnotes"
      system-time-locale "C"
      org-use-speed-commands t
      org-goto-auto-isearch nil)

(setq org-special-ctrl-a/e t
      org-special-ctrl-k t
      org-export-author-info nil
      org-export-email-info nil
      org-export-creator-info nil
      org-export-time-stamp-file nil
      org-log-done t)

(setq org-capture-templates
      '(("r" "Research" entry (file+headline "~/rnotes/misc/research.org" "Research") "* %?\n  %i")
	("c" "Misc"     entry (file+headline "~/rnotes/misc/misc.org" "Notes") "* %?\n  %i")
        ("j" "Journal"  entry (file+datetree "~/rnotes/misc/misc.org") "* %?\nEntered on %U\n  %i")
	("i" "Personal" entry (file+headline "~/rnotes/misc/personal.org" "Personal") "* %?\n  %i")))

(setq org-latex-to-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f")
      org-export-latex-default-packages-alist
      '(("" "fontspec" t) ("" "xunicode" t) ("" "url" t) ("" "rotating" t)
	("american" "babel" t) ("babel" "csquotes" t) ("" "soul" t) ("xetex" "hyperref" nil))
      org-export-latex-packages-alist
      '(("" "graphicx" t) ("" "longtable" nil) ("" "float" nil)))

(add-hook 'org-mode-hook 'turn-on-auto-fill)
;; Org-mode ends here ;;

;; SavePlace ;;
(setq-default save-place t)
(require 'saveplace)
(add-hook 'find-file-hook 'save-place-find-file-hook t)
(add-hook 'kill-emacs-hook 'save-place-kill-emacs-hook)
(add-hook 'kill-buffer-hook 'save-place-to-alist)
;; SavePlace ends here ;;

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
	      "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"))

       (add-hook 'dired-mode-hook 'chunyu/customize-dired-face)

       (defun chunyu/customize-dired-face ()
	 (font-lock-add-keywords
	  nil `(("^  .*\\.\\(pdf\\|djvu\\)$"
		 (".+" (dired-move-to-filename) nil
		  (0 'font-lock-string-face))))))

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
	       (w32-shell-execute nil c (format "/O %S" g) 1))))

       (defun chunyu/dired-win7-mklink ()
	 "Win7 mklink wrapper"
	 (interactive)
	 (let* ((file-name (dired-get-file-for-visit))
		(target-dir (dired-dwim-target-directory))
		(target (read-file-name "MkLink to:" target-dir))
		(option (if (file-directory-p file-name) "/J" "/H"))
		(filenm (replace-regexp-in-string
			 "/" "\\\\" (format "%s %s" target file-name))))
	   (w32-shell-execute nil "cmd" (format "/c mklink %s %s" option filenm) 0))))))
;; Dired ends here ;;

;; Ido ;;
(global-set-key "\C-x\C-f" 'ido-find-file)
(global-set-key "\C-xb" 'ido-switch-buffer)
(global-set-key "\C-xd" 'ido-dired)

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

(eval-after-load 'ido
  '(progn
     (ido-everywhere 1)
     (ido-mode 1)
     (define-key ido-buffer-completion-map " " 'ido-exit-minibuffer)))
;; Ido ends here ;;

;; magit ;;
(setq magit-repo-dirs '("~/rnotes" "~/.emacs.d" "~/public_html/baby" "~/csharp")
      magit-process-popup-time 10)
;; magit ends here ;;

;; Anything ;;
(setq anything-su-or-sudo "sudo"
      anything-c-locate-command "locate -i %s"
      anything-command-map-prefix-key "M-s M-a"
      anything-samewindow t
      anything-enable-shortcuts t
      anything-for-files-prefered-list
      '(anything-c-source-ffap-line
	anything-c-source-ffap-guesser
	anything-c-source-org-headline
	anything-c-source-buffers+
	anything-c-source-recentf
	anything-c-source-files-in-current-dir+
	anything-c-source-files-in-all-dired
	anything-c-source-bookmarks
	anything-c-source-file-cache
	anything-c-source-locate))

(eval-after-load 'anything
  '(progn
     (define-key anything-map " " 'anything-exit-minibuffer)
     (define-key anything-map "\C-k" 'anything-execute-persistent-action)
     (define-key anything-map "\M-a" 'anything-next-line)
     (define-key anything-map "\M-o" 'anything-next-source)
     (define-key anything-map "\C-z" 'anything-toggle-visible-mark)))

(defun anything-for-files-chunyu ()
  (interactive)
  (anything-other-buffer anything-for-files-prefered-list  " *anything*"))

(when (require 'anything-config nil t)
  (global-set-key "\M-a" 'anything-for-files-chunyu)
  (global-set-key "\M-A" 'anything-call-source)
  
  (eval-after-load 'org
    '(define-key org-mode-map "\M-a" 'anything-for-files-chunyu))
  
  (remove-hook 'kill-emacs-hook 'anything-c-adaptive-save-history))
;; Anything ends here ;;

;; AUCTeX, RefTeX, CDLaTeX etc. ;;
(setq TeX-engine 'xetex)

(setq TeX-auto-save t
      TeX-parse-self t
      TeX-auto-untabify t
      TeX-region "z_region"
      TeX-fold-type-list '(env macro math)
      TeX-fold-env-spec-list
      '(("[comment]" ("comment"))
	("[tikzpicture]" ("tikzpicture"))))

(setq preview-scale-function 2
      preview-image-type 'dvipng
      preview-auto-cache-preamble nil)

(setq tool-bar-mode nil
      LaTeX-math-list
      '((nil "derive" "Arrows" 8658)
	(nil "derives" "Arrows" 8658))
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
      cdlatex-math-symbol-alist
      '((?e ("\\varepsilon" "\\epsilon" "\\exp"))
	(?d ("\\delta" "\\hat\\delta" "\\partial"))
	(?\; ("\\derive" "\\derives" "\\derivesg"))
	(?{ ("\\subset" "\\{?\\}")))
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
	("ctl" "ctlgraph" "\\centerline{\\includegraphics[width=8cm]{?}}\n%\\centerline{}\n"
	 cdlatex-position-cursor nil t nil)
	("cfg" "grammar" "\\begin{enumerate}[label={},leftmargin=6em,noitemsep]\n\\item ?\n\\end{enumerate}"
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
     (define-key TeX-mode-map "\M-n" 'next-line)
     (define-key TeX-mode-map "\M-p" 'previous-line)
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

(defun kpsewhich-open (filename)
  "Open TeXLive file in kpathsea."
  (interactive "skpsewhich: ")
  (let* ((comm (format "kpsewhich %S" filename))
	 (fpath (replace-regexp-in-string
		 "\015\\|\012" "" (shell-command-to-string comm))))
    (if (> (length fpath) 0) (find-file fpath)
      (message "Kpsewhich not found: %s" filename))))

(load "preview-latex.el" t t t)
(load "auctex.el" t t t)
;; AUCTeX, RefTeX, CDLaTeX etc. end here ;;

;; misc packages ;;
(require 'recentf-ext nil t)
(eval-after-load 'calc
  '(progn (define-key calc-mode-map "\M-k" 'kill-buffer-and-window)))
(eval-after-load 'calc-ext
  '(progn 
     (define-key calc-mode-map "\M-k" 'kill-buffer-and-window)
     (define-key calc-mode-map "\C-\M-k" 'calc-copy-as-kill)))
;; misc packages end here ;;

;; autoloads ;;
(autoload 'zap-up-to-char "misc" nil t)
;; autoloads end here ;;

(cond
 ((not window-system) ;; Text-Only console
  (setq frame-background-mode 'dark)
  (setq Info-use-header-line nil))

 (window-system	;; BOTH X-Window and MS-Windows
  (setq-default mouse-yank-at-point t
		indicate-empty-lines 'left
		indicate-buffer-boundaries 'left)

  (modify-coding-system-alist 'process "gftp" '(gbk . gbk))

  (when (eq window-system 'w32) ;; MS-Windows
    (global-unset-key "\C-x\C-z")
    (global-set-key [(control return)] [(return)])

    (setq w32-lwindow-modifier 'super
	  w32-apps-modifier 'hyper
	  w32-pass-lwindow-to-system nil
	  w32-charset-info-alist
	  (cons '("gbk" w32-charset-gb2312 . 936) w32-charset-info-alist))

    (setq ;;shell-file-name "bash"
	  ange-ftp-ftp-program-name "gftp"
	  find-program "gfind")

    (setq dired-guess-shell-alist-user
	  '(("\\.ps\\'"  "gsview32") ("\\.\\(7z\\|bz2\\|tar\\)\\'" "7z x -y")
	    ("\\.rar\\'" "rar x"   ) ("\\.mp\\'"  "mptopdf")
	    ("\\.dvi\\'" "dvipdfm" ) ("\\.[0-9]+\\'" "epstopdf")))

    ;; ISpell on Win32 ;;
    (setenv "ISPELLDICTDIR" (substitute-in-file-name "$emacs_dir/var/ispell"))
    (setq ispell-personal-dictionary "~/.emacs.d/ispelldic"
	  ispell-dictionary-alist
	  '((nil	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil iso-8859-1)
	    ("english"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil iso-8859-1)
	    ("american" "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "american") nil iso-8859-1)
	    ("US-xlg"	"[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B" "-d" "US-xlg") nil iso-8859-1))))))
    ;; ISpell on Win32 ends here ;;

(defalias 'toggle-input-method 'toggle-truncate-lines) ;; C-\

(defun chunyu/other-window (&optional size)
  (interactive "P")
  (if (< (count-windows) 2) (split-window-vertically))
  (other-window 1))

(mapc (lambda (func) (put func 'disabled t))
      '(overwrite-mode rmail iconify-or-deiconify-frame))

(mapc (lambda (var) (put var 'safe-local-variable 'string-or-null-p))
      '(dired-omit-files TeX-master
	org-export-html-style org-export-publishing-directory
	TeX-header-end TeX-trailer-start))

(setq safe-local-variable-values '((dired-omit-mode . t)))

;; Frame configuration ;;
(defun frame-font-x-setup ()
  (set-frame-font "Consolas-14" t)

  (set-face-attribute 'default nil :height 140)
  (set-face-attribute 'mode-line nil :height 120)

  (let ((name (frame-parameter nil 'font)))
    (set-fontset-font name 'han "Microsoft YaHei")
    (set-fontset-font name 'symbol "Symbola")
    (set-fontset-font name 'cjk-misc "Microsoft YaHei")
    (set-fontset-font name '(#x2018 . #x201D) "SimSun")
    (set-fontset-font name 'burmese "Myanmar2")
    (set-fontset-font name 'oriya "Kalinga")
    (set-fontset-font name 'katakana-jisx0201 "MS PMincho")
    (set-fontset-font name 'unicode-smp "DejaVu Sans")))

(defun frame-face-x-setup ()
  (setq default-frame-alist
	'((background-mode . dark)
	  (background-color . "#001414")
	  (foreground-color . "Wheat")
	  (cursor-color . "Coral")))

  (set-face-attribute 'fringe nil :foreground "limegreen" :background "gray10")
  (set-face-attribute 'minibuffer-prompt nil :foreground "chocolate1")
  (set-face-attribute 'mode-line nil :foreground "black" :background "wheat" :box nil)
  (set-face-attribute 'mode-line-inactive nil :foreground "grey90" :background "grey10" :box '(:color "grey30"))
  (set-face-attribute 'mode-line-highlight nil :box '(:line-width 1 :color "grey20"))
  (set-face-attribute 'region nil :background "grey15")
  (set-face-attribute 'trailing-whitespace nil :background "SeaGreen1")
  (set-face-attribute 'font-lock-comment-face nil :italic t)

  (eval-after-load 'org-faces
    '(progn (set-face-attribute 'org-document-title nil :height 1.2)))

  (eval-after-load 'preview
    '(progn (set-face-attribute 'preview-reference-face nil :background "PeachPuff")))

  (eval-after-load 'font-latex
    '(progn (set-face-attribute 'font-latex-italic-face nil :foreground "RosyBrown1")
	    (set-face-attribute 'font-latex-bold-face nil :foreground "RosyBrown1")))

  (eval-after-load 'magit
    '(progn
       (set-face-attribute 'magit-item-highlight nil :background "dark slate grey"))))

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
  (set-face-attribute 'font-lock-keyword-face nil :foreground "Cyan1")
  (set-face-attribute 'font-lock-string-face nil :foreground "peru")
  (set-face-attribute 'font-lock-function-name-face nil :foreground "DeepSkyBlue")
  (set-face-attribute 'font-lock-doc-face nil :foreground "color-174")

  ;; (eval-after-load 'anything-config
  ;;   '(progn (set-face-attribute 'anything-header nil :underline nil :background "black" :foreground "color-75")
  ;; 	    (set-face-attribute 'anything-dir-heading nil  :foreground "color-183" :background "color-236")
  ;; 	    (set-face-attribute 'anything-dir-priv    nil  :foreground "color-136" :background "color-236")
  ;; 	    (set-face-attribute 'anything-file-name   nil  :foreground "color-48"  :background "black")
  ;; 	    (set-face-attribute 'anything-visible-mark nil :foreground "red" :background "color-18")))

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
(when window-system (frame-font-x-setup))
(when (string-match "256color" (getenv "TERM")) (frame-face-nox256-setup))
;; Frame configuration ends here ;;

;; Load local settings ;;
(load "~/.emacs.d/others/local.el" t t t)
;; Loaded ;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list
   (quote
    (("SumatraPDF"
      ("SumatraPDF.exe -reuse-instance" " -forward-search %b %n" " %o")))))
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and start")
     (output-dvi "Yap")
     (output-pdf "SumatraPDF")
     (output-html "start")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "coral")))))
;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8
;; End:

;; Chunyu's .emacs.d/init.el ends here.
