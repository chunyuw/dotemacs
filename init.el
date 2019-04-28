;; Chunyu <cymacs@gmail.com>'s ~/.emacs.d/init.el for GNU Emacs, since 2001-12-11

(package-initialize)

(global-unset-key [(insert)])
(global-unset-key [(insertchar)])
(global-unset-key [(meta tab)])
(global-set-key [(control return)] [(return)])
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
(global-set-key "\M-s\M-f" 'magit-file-popup)
(global-set-key "\M-s\M-g" 'magit-dispatch-popup)
(global-set-key "\M-a" 'helm-multi-files)
(global-set-key "\M-A" 'helm-find-files)
(global-set-key "\C-x\C-f" 'ido-find-file)
(global-set-key "\C-xb" 'ido-switch-buffer)
(global-set-key "\C-xd" 'ido-dired)

(defalias 'toggle-input-method 'toggle-truncate-lines) ;; C-\

(setq w32-lwindow-modifier 'super
      w32-apps-modifier 'hyper
      w32-pass-lwindow-to-system nil)

(setq mac-option-modifier 'meta
      mac-command-modifier 'meta
      mac-right-command-modifier 'super
      mac-right-option-modifier 'control)

(setq inhibit-startup-message t
      require-final-newline t
      track-eol t
      kill-whole-line t
      vc-follow-symlinks t
      vc-suppress-confirm t
      enable-recursive-minibuffers t
      disabled-command-function nil
      history-delete-duplicates t
      history-length 1000
      set-mark-command-repeat-pop t
      parens-require-spaces nil
      kmacro-call-repeat-with-arg t
      ring-bell-function 'ignore
      Info-use-header-line nil
      max-mini-window-height 3
      isearch-allow-scroll t)

(setq-default major-mode 'text-mode
	      fill-column 78
	      mouse-yank-at-point t
	      indicate-empty-lines 'left
	      indicate-buffer-boundaries 'left)

(setq makefile-electric-keys t
      apropos-do-all t
      sentence-end-double-space nil
      scroll-preserve-screen-position 'keep
      Man-notify-method 'pushy
      comment-auto-fill-only-comments t
      comment-style 'extra-line
      view-inhibit-help-message t
      save-abbrevs 'silently)

(setq calendar-latitude 45.74027
      calendar-longitude 126.62766
      calendar-location-name "Harbin"
      calendar-week-start-day 1)

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

(setq safe-local-variable-values '((dired-omit-mode . t))
      completion-styles '(partial-completion initials)
      completion-pcm-complete-word-inserts-delimiters t
      savehist-ignored-variables '(file-name-history))

(set-register ?e '(file . "~/.emacs.d/init.el"))

(fset 'yes-or-no-p 'y-or-n-p)

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
(add-hook 'bs-mode-hook 'hl-line-mode)

(minibuffer-electric-default-mode 1)
(minibuffer-depth-indicate-mode 1)
(mouse-avoidance-mode 'jump)
(column-number-mode 1)
(blink-cursor-mode -1)
(show-paren-mode 1)
(icomplete-mode 1)
(savehist-mode 1)

(eval-after-load 'man
  '(progn
     (define-key Man-mode-map "j" 'scroll-up-line)
     (define-key Man-mode-map "k" 'scroll-down-line)))

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
     (define-key diff-mode-map "j" 'scroll-up-line)
     (define-key diff-mode-map "k" 'scroll-down-line)
     (define-key diff-mode-shared-map "k" 'scroll-down-line)
     (define-key diff-mode-map "\M-K" 'kill-this-buffer)
     (define-key diff-mode-map "\M-k" 'kill-buffer-and-window)))

;; ;; package ;;
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	;; ("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.org/packages/")))
;; ;; package ends here ;;

;; Python ;;
(setq python-indent-guess-indent-offset-verbose nil)
;; Python ends here ;;

;; SavePlace ;;
(if (fboundp 'save-place-mode)
    (save-place-mode 1)
  (setq-default save-place t)
  (require 'saveplace)
  (add-hook 'find-file-hook 'save-place-find-file-hook t)
  (add-hook 'kill-emacs-hook 'save-place-kill-emacs-hook)
  (add-hook 'kill-buffer-hook 'save-place-to-alist))
;; SavePlace ends here ;;

;; Dired ;;
(eval-after-load 'dired
  '(progn
     (setq dired-listing-switches "-avl"
	   dired-dwim-target t
	   directory-free-space-args "-Ph"
	   dired-bind-man nil
	   dired-bind-vm nil
           dired-isearch-filenames 'dwim
	   wdired-use-dired-vertical-movement 'sometime)

     (require 'dired-x)
     (define-key dired-mode-map "." 'dired-omit-mode)
     (define-key dired-mode-map "b" 'dired-mark-extension)
     (define-key dired-mode-map "c" 'dired-up-directory)
     (define-key dired-mode-map "e" 'dired-mark-files-containing-regexp)
     (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
     (define-key dired-mode-map "/" 'dired-mark-directories)
     (define-key dired-mode-map "K" 'dired-kill-subdir)

     (setq dired-omit-files
	   (concat dired-omit-files "\\|^__init__.py$\\|^__pycache__$\\|\\.localized\\|.DS_Store"))

     (setq dired-guess-shell-alist-user
	   '(("\\.ps\\'"  "gsview32") ("\\.mp\\'"  "mptopdf")))

     (when (eq system-type 'darwin)
       (define-key dired-mode-map "O"
	 (lambda () (interactive) ;; (shell-command "open .")
	   (shell-command (concat "open \"" (dired-get-filename) "\""))))
       (define-key dired-mode-map "o"
	 (lambda () (interactive)
	   (shell-command (concat "open \"" (dired-get-filename) "\"")))))

     (when (eq system-type 'windows-nt)
       (define-key dired-mode-map "O" 'my-dired-open-explorer)
       (define-key dired-mode-map "o" 'my-totalcmd-open)
       (define-key dired-mode-map "W"
	 (lambda () (interactive)
	   (browse-url-generic (concat "file:///" (dired-get-filename)))))

       (defun my-dired-open-explorer ()
	 (interactive)
	 (let ((file-name (dired-get-file-for-visit)))
	   (if (file-exists-p file-name)
	       (w32-shell-execute "open" file-name nil 1))))

       (defun my-totalcmd-open ()
	 "Open dir in Total Commander."
	 (interactive)
	 (let* ((f (subst-char-in-string ?\\ ?/ (dired-get-filename)))
		(c (substitute-in-file-name "$COMMANDER_PATH\\totalcmd64.exe"))
		(g (subst-char-in-string ?/ ?\\ f)))
	   (if (file-exists-p f)
	       (w32-shell-execute nil c (format "/O %S" g) 1)))))))
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

(eval-after-load 'ido
  '(progn
     (ido-everywhere 1)
     (ido-mode 1)
     (define-key ido-common-completion-map "\M-j" 'ido-enter-magit-status)
     (define-key ido-buffer-completion-map " " 'ido-exit-minibuffer)))
;; Ido ends here ;;

;; magit ;;
(setq magit-repository-directories
      '("~/automata" "~/rnotes" "~/.emacs.d" "~/ccsite")
      magit-auto-revert-immediately nil
      auto-revert-interval 2
      magit-process-popup-time 10)
;; magit ends here ;;

;; helm ;;
(setq helm-split-window-default-side 'same
      helm-ff-guess-ffap-filenames t)

(eval-after-load 'helm-buffers
'(progn
   (define-key helm-buffer-map "\M-A" 'helm-mark-all)
   (define-key helm-buffer-map "\M-a" 'helm-display-all-sources)
   (define-key helm-buffer-map "\M-e" 'helm-show-all-in-this-source-only)))

(eval-after-load 'helm
  '(progn (global-set-key "\M-sb" 'helm-buffers-list)
	  (global-set-key "\M-sl" 'helm-locate)
	  (define-key helm-map "\M-A" 'helm-mark-all)
	  (define-key helm-map "\M-a" 'helm-display-all-sources)
	  (define-key helm-map "\M-e" 'helm-show-all-in-this-source-only)
	  (define-key helm-map " " 'helm-maybe-exit-minibuffer)))
;; helm ends here ;;

;; org ;;
(eval-after-load 'org
  '(progn (define-key org-mode-map "\M-a" 'helm-for-files)))
(setq org-html-postamble nil)
;; org ends here ;;

;; AUCTeX, RefTeX, CDLaTeX etc. ;;
(setq TeX-engine 'xetex)

(setq TeX-auto-save t
      TeX-parse-self t
      TeX-save-query nil
      TeX-auto-untabify t
      TeX-command-force "LaTeX"
      TeX-region "z_region"
      TeX-brace-indent-level 0
      TeX-fold-type-list '(env)
      TeX-fold-env-spec-list
      '(("[algo]" ("algorithmic"))
	("[comm]" ("comment"))
	("[tab]" ("tabular"))
	("[align*]" ("align*"))
	("[tikz]" ("tikzpicture")))
      TeX-source-correlate-mode t
      TeX-source-correlate-start-server t
      TeX-view-program-list
      '(("SumatraPDF" ;; -set-color-range #f5deb3 #001414
	 ("SumatraPDF.exe -reuse-instance" " -forward-search %b %n" " %o"))
	("Skim"
	 ("/Applications/Skim.app/Contents/SharedSupport/displayline" " %n %o %b")))
      TeX-view-program-selection
      (cond ((eq system-type 'windows-nt) '((output-pdf "SumatraPDF")))
	    ((eq system-type 'darwin) '((output-pdf "Skim")))))

(setq preview-scale-function 1.5
      preview-image-type 'dvipng
      preview-auto-cache-preamble nil)

(setq tool-bar-mode nil
      LaTeX-syntactic-comments t
      LaTeX-indent-level 0
      LaTeX-item-indent 0
      LaTeX-math-list
      '((nil "derive" "Arrows" 8658)
	(nil "derives" "Arrows" 8658))
      LaTeX-indent-environment-list nil
      LaTeX-enable-toolbar nil)

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

(setq font-latex-fontify-script 'invisible
      font-latex-fontify-sectioning 'color)

(setq cdlatex-math-modify-prefix [(super ?')]
      ;; cdlatex-math-symbol-prefix [(super ?`)]
      cdlatex-math-symbol-alist
      '((?e ("\\varepsilon" "\\epsilon" "\\exp"))
	(?b ("\\beta" "\\boldsymbol" ""))
	(?d ("\\delta" "\\hat\\delta" "\\partial"))
	(?\; ("\\derive" "\\derives" "\\derivesg"))
	(?{ ("\\subset" "\\{?\\}")))
      cdlatex-paired-parens "$[{(<|"
      cdlatex-env-alist
      '(;("frame" "\\begin{frame}\n\\frametitle{?}\n\n\\end{frame}\n" nil)
	("block" "\\begin{block}{}\n?\n\\end{block}" nil)
	("frame" "\\begin{frame}\n?\n\\end{frame}" nil)
	("columns" "\\begin{columns}[onlytextwidth]\n\\column{.8\\textwidth}\n?\\column{.2\\textwidth}\n\\end{columns}" nil))
      cdlatex-command-alist
      '(("fr" "frame" "" cdlatex-environment ("frame") t nil)
	("blk" "block" "" cdlatex-environment ("block") t nil)
	("col" "columns" "" cdlatex-environment ("columns") t nil)
	("tikz" "block" "" cdlatex-environment ("tikzpicture") t nil)))

(add-hook 'TeX-mode-hook
	  (lambda ()
	    (turn-on-reftex) (cdlatex-mode 1) (prettify-symbols-mode 1)))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (TeX-fold-mode 1) (cdlatex-mode 1) (TeX-fold-buffer)))

(eval-after-load 'latex
  '(progn
     (setq LaTeX-font-list
	   (append '((?\C-p "\\mode<presentation>{" "}")
		     (?\C-a "\\alert{" "}" "\\mathcal{" "}")
		     (?\C-o "\\only<.>{" "}" "" "")) LaTeX-font-list))))

(eval-after-load 'tex
  '(progn
     (define-key TeX-mode-map [(backtab)] 'indent-for-tab-command)
     ;; (define-key TeX-mode-map [(f7)] 'TeX-command-run-all-region)
     (define-key TeX-mode-map [(f7)] 'LaTeX-mark-build-frame)
     ;; (define-key TeX-mode-map [(f8)] 'TeX-command-region)
     (define-key TeX-mode-map [(f8)] 'LaTeX-mark-build-run-all-frame)
     (define-key TeX-mode-map [(f9)] 'TeX-command-run-all)
     (define-key TeX-mode-map "\M-n" 'next-line)
     (define-key TeX-mode-map "\M-p" 'previous-line)
     (TeX-add-style-hook "beamer" 'beamer-setup)
     (TeX-global-PDF-mode t)))

(defun beamer-setup ()
  (reftex-reset-mode)
  (define-key TeX-mode-map [(f7)] 'LaTeX-mark-build-frame)
  (define-key TeX-mode-map [(f8)] 'LaTeX-mark-build-run-all-frame))

(defun LaTeX-mark-build-run-all-frame (arg)
  "mark frame enviroment."
  (interactive "P")
  (if (and arg (stringp TeX-master) (not (file-exists-p TeX-master)))
      (shell-command (concat "make " TeX-master)))
  (let ((cur (point)) begin end)
    (save-excursion
      (re-search-forward "^[^%]*?end.frame" nil t)
      (beginning-of-line 2) (setq end (point))
      (goto-char cur)
      (re-search-backward "^[^%]*?begin.frame" nil t)
      (beginning-of-line 1) (setq begin (point))
      (TeX-pin-region begin end))
    (TeX-command-run-all-region)))

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

;; recentf ;;
(setq recentf-max-saved-items 60
      recentf-save-file "~/.emacs.d/recentf"
      recentf-exclude '(".emacs.d/" "\\.tmp/" "z_region" "drive_[cCdDeEfF]"))
(recentf-mode 1)
(require 'recentf-ext nil t)
;; recentf ends here ;;

;; misc packages ;;
(eval-after-load 'calc
  '(progn (define-key calc-mode-map "\M-k" 'kill-buffer-and-window)))
(eval-after-load 'calc-ext
  '(progn
     (define-key calc-mode-map "\M-k" 'kill-buffer-and-window)
     (define-key calc-mode-map "\C-\M-k" 'calc-copy-as-kill)))
;; misc packages end here ;;

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; autoloads ;;
(autoload 'helm-fild-files "helm-files" nil t)
(autoload 'magit-status "magit" nil t)
(autoload 'zap-up-to-char "misc" nil t)
(autoload 'dired-jump "dired-x" nil t)
(autoload 'markdown-mode "markdown-mode" nil t)
;; autoloads end here ;;

(mapc (lambda (func) (put func 'disabled t))
      '(overwrite-mode rmail iconify-or-deiconify-frame))

(mapc (lambda (var) (put var 'safe-local-variable 'string-or-null-p))
      '(TeX-master TeX-header-end TeX-trailer-start dired-omit-files
		   org-export-html-style org-export-publishing-directory))

;; Frame configuration ;;
(setq default-frame-alist '((background-mode . dark) (cursor-color . "Coral") (auto-raise . t) (top . 0)))

(setq window-system-default-frame-alist
      '((t . ((background-color . "black") (foreground-color . "white")))
	(ns . ((background-color . "#002020") (foreground-color . "wheat") (fullscreen . maximized)))
	(w32 . ((background-color . "#001414") (foreground-color . "wheat") (width . 166) (height . 64)))))

(when (eq system-type 'darwin) ;; macOS
  (add-to-list 'default-frame-alist '(left . 5))

  (scroll-bar-mode -1) (tool-bar-mode -1)
  (setq default-directory "~/" ns-use-thin-smoothing t)
  (setenv "PATH" (concat "/usr/local/bin:/Library/TeX/texbin:" (getenv "PATH")))
  (setq exec-path (split-string (getenv "PATH") ":"))

  (setq face-font-rescale-alist
	'(("Noto Sans CJK SC Thin" . 1.2) ("PingFang SC" . 1.2)))

  (set-face-attribute 'default nil :family "Monaco" :height 160)

  (set-fontset-font "fontset-default" 'han "PingFang SC")
  (set-fontset-font "fontset-default" 'symbol "Noto Sans Symbols")
  (set-fontset-font "fontset-default" 'cjk-misc "PingFang SC"))

(when (eq system-type 'windows-nt) ;; Windows
  (add-to-list 'default-frame-alist '(left . (- 0)))

  (setq face-font-rescale-alist	'(("微软雅黑" . 1.1) ("宋体" . 1.1)))

  (set-face-attribute 'default nil :family "Consolas" :height 140)

  (set-fontset-font "fontset-default" 'han "Microsoft YaHei")
  (set-fontset-font "fontset-default" 'symbol "Noto Sans Symbols")
  (set-fontset-font "fontset-default" 'cjk-misc "SimHei"))
;; Frame configuration ends here ;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-eldoc-mode nil)
 '(package-selected-packages
   (quote
    (magit auctex cdlatex helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-quoted ((t (:family "courier new"))))
 '(cursor ((t (:background "coral"))))
 '(diff-added ((t (:inherit diff-changed :background "#005f00"))))
 '(diff-file-header ((t (:background "#303030" :weight bold))))
 '(diff-header ((t (:background "#585858"))))
 '(diff-refine-added ((t (:inherit diff-refine-change :background "#00af00"))))
 '(diff-refine-changed ((t (:background "#af8700"))))
 '(diff-refine-removed ((t (:inherit diff-refine-change :background "#af0000"))))
 '(diff-removed ((t (:inherit diff-changed :background "#5f0000"))))
 '(font-lock-comment-face ((t (:foreground "chocolate1"))))
 '(helm-buffer-directory ((t (:inherit font-lock-function-name-face))))
 '(helm-buffer-file ((t (:inherit default))))
 '(helm-ff-directory ((t (:inherit font-lock-function-name-face))))
 '(helm-ff-file ((t (:inherit default))))
 '(helm-ff-symlink ((t (:foreground "Cyan"))))
 '(helm-selection ((t (:background "#af8700"))))
 '(helm-visible-mark ((t (:background "dark green"))))
 '(lazy-highlight ((t (:background "cyan"))))
 '(magit-blame-heading ((t (:background "#121212"))))
 '(magit-diff-added ((t (:background "#005f00"))))
 '(magit-diff-added-highlight ((t (:background "#00af00"))))
 '(magit-diff-base ((t (:background "#5f5f00"))))
 '(magit-diff-base-highlight ((t (:background "#878700"))))
 '(magit-diff-context-highlight ((t (:background "#303030"))))
 '(magit-diff-removed ((t (:background "#5f0000"))))
 '(magit-diff-removed-highlight ((t (:background "#af0000"))))
 '(magit-section-highlight ((t (:background "#262626"))))
 '(match ((t (:background "color-178"))))
 '(mode-line ((t (:background "wheat" :foreground "black"))))
 '(preview-reference-face ((t (:background "#001414" :foreground "wheat"))))
 '(region ((t (:background "gray15")))))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8
;; End:

;; Chunyu's .emacs.d/init.el ends here.
