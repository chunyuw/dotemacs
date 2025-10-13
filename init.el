;; Chunyu <cymacs@gmail.com>'s ~/.emacs.d/init.el for GNU Emacs, since 2001-12-11

(package-initialize)

(global-unset-key [(insert)])
(global-unset-key [(insertchar)])
(global-unset-key [(meta tab)])
(global-unset-key [(meta ?`)])
(global-set-key [(control return)] [(return)])
(global-set-key "\C-x\C-b" 'bs-show)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-x5k" 'kill-emacs)
(global-set-key "\C-xk" 'kill-current-buffer)
(global-set-key "\C-xE" 'apply-macro-to-region-lines)
(global-set-key "\C-\\" 'toggle-truncate-lines)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\M-k" 'kill-current-buffer)
(global-set-key "\M-K" 'kill-buffer-and-window)
(global-set-key "\M-Z" 'zap-to-char)
(global-set-key "\M-z" 'zap-up-to-char)
(global-set-key "\M-sv" 'view-mode)
(global-set-key "\M-sg" 'magit-status)
(global-set-key "\M-r" 'ffap)
(global-set-key "\M-a" 'helm-multi-files)
(global-set-key "\M-A" 'helm-find-files)
(global-set-key "\C-x\C-f" 'ido-find-file)
(global-set-key "\C-xb" 'ido-switch-buffer)
(global-set-key "\C-xd" 'ido-dired)

(defalias 'toggle-input-method 'toggle-truncate-lines) ;; C-\

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
      initial-scratch-message nil
      initial-major-mode 'text-mode
      isearch-allow-scroll t)

(setq-default major-mode 'text-mode
	      fill-column 78
	      mouse-yank-at-point t
	      indent-tabs-mode nil
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
      prettify-symbols-unprettify-at-point 'right-edge
      save-abbrevs 'silently)

(setq calendar-latitude 45.74027
      calendar-longitude 126.62766
      calendar-location-name "Harbin"
      calendar-week-start-day 1)

(setq user-full-name "Chunyu Wang"
      user-mail-address "chunyu@hit.edu.cn")

(setq version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t
      backup-directory-alist '(("." . "~/.tmp"))
      backup-by-copying t
      backup-by-copying-when-linked t
      backup-by-copying-when-mismatch t)

;; (setq url-proxy-services
;;     '(("no_proxy" . "^\\(localhost\\|10.*\\|*.edu.cn\\)")
;;       ("http" . "192.168.6.5:3000")
;;       ("https" . "192.168.6.5:3000")))

(setq completion-styles '(partial-completion initials)
      completion-pcm-complete-word-inserts-delimiters t
      savehist-ignored-variables '(file-name-history))

(set-register ?e '(file . "~/.emacs.d/init.el"))
(set-register ?i '(file . "/sshx:xx:/var/www/iilab/programming"))

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
     (define-key diff-mode-map "\M-K" 'kill-current-buffer)
     (define-key diff-mode-map "\M-k" 'kill-buffer-and-window)))


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
(setq dired-listing-switches "-avl"
      dired-dwim-target t
      directory-free-space-args "-Ph"
      dired-bind-man nil
      dired-bind-vm nil
      dired-isearch-filenames 'dwim
      wdired-use-dired-vertical-movement 'sometime)


(add-hook 'dired-mode-hook 'dired-omit-mode)

(eval-after-load 'dired-gitignore
  '(progn
     (dired-gitignore-global-mode t)
     (define-key dired-mode-map "," 'dired-gitignore-global-mode)))
(require 'dired-gitignore nil t)

(eval-after-load 'dired
  '(progn
     (require 'dired-x)
     (define-key dired-mode-map "." 'dired-omit-mode)
     (define-key dired-mode-map "b" 'dired-mark-extension)
     (define-key dired-mode-map "c" 'dired-up-directory)
     (define-key dired-mode-map "e" 'dired-mark-files-containing-regexp)
     (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
     (define-key dired-mode-map "/" 'dired-mark-directories)
     (define-key dired-mode-map "K" 'dired-kill-subdir)

     (setq dired-omit-files
	   (concat dired-omit-files
		   "\\|^\\.\\|^__init__.py$\\|^__pycache__$\\|comment.cut\\|\\(slides\\|notes\\)-ch..\\.tex"))

     (setq dired-guess-shell-alist-user
	   '(("\\.mp\\'"  "mptopdf") ("\\.rar\\'" "unar") ("\\.zip\\'" "unar")))

     (when (eq system-type 'darwin)
       (global-unset-key [(control x) (control z)])
       (define-key dired-mode-map "O"
	 (lambda () (interactive)
	   (shell-command (concat "open \"" (dired-get-filename) "\""))))
       (define-key dired-mode-map "o"
	 (lambda () (interactive)
	   (shell-command (concat "open \"" (dired-get-filename) "\"")))))

     (when (eq system-type 'windows-nt)
       (define-key dired-mode-map "o" 'my-dired-open-explorer)
       (define-key dired-mode-map "O" 'my-totalcmd-open)
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
	       (w32-shell-execute nil c (format "/O %S" g) 3)))))))
;; Dired ends here ;;

;; Ido ;;
(setq ido-max-prospects 8
      ido-save-directory-list-file nil
      ido-auto-merge-delay-time 2
      ido-enable-flex-matching t
      ido-enable-prefix nil
      ido-enable-regexp t
      ido-create-new-buffer 'always
      ido-use-virtual-buffers t)

(eval-after-load 'ido
  '(progn
     (ido-everywhere 1)
     (ido-mode 1)
     (define-key ido-common-completion-map "\M-j" 'ido-enter-magit-status)
     (define-key ido-buffer-completion-map " " 'ido-exit-minibuffer)))
;; Ido ends here ;;

;; magit ;;
(setq magit-auto-revert-immediately nil
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
	("[comment]" ("comment"))
	("[tabular]" ("tabular"))
	("[fig]" ("figure" "figexe"))
	("[lstlisting]" ("lstlisting"))
	("[aligned]" ("aligned"))
	("[soln]" ("soln"))
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
      LaTeX-indent-environment-list nil
      LaTeX-enable-toolbar nil)

(setq reftex-revisit-to-follow t
      reftex-enable-partial-scans t
      reftex-save-parse-info nil
      reftex-use-multiple-selection-buffers t
      reftex-auto-recenter-toc t
      reftex-plug-into-AUCTeX t)

(setq font-latex-fontify-script 'invisible
      font-latex-fontify-sectioning 'color)

(setq cdlatex-math-modify-prefix [(meta ?m)]
      ;; cdlatex-math-symbol-prefix [(super ?`)]
      cdlatex-math-symbol-alist
      '((?e ("\\varepsilon" "\\epsilon" "\\exp"))
	(?f ("\\frac" "\\frac?{}" "\\phi"))
	(?b ("\\beta" "\\boldsymbol" ""))
	(?d ("\\delta" "\\delta^{*}(?)" "\\partial"))
	(?0 ("\\varnothing" "\\emptyset" ""))
	(?o ("\\omega" "\\overline{?}" ""))
	(?\, ("\\widehat{?}" "\\widehat{M}"))
	(?\; ("\\derive" "\\derives" "\\derivesg"))
	(?\. ("\\cdot" "\\cdots"))
	(?\: ("\\ldots"))
	(?\B ("\\square"))
	(?= ( "\\equiv" "\\Leftrightarrow" "\\Longleftrightarrow"))
	(?{ ("\\subset" "\\{?\\}")))
      cdlatex-paired-parens "$[{(|"
      cdlatex-env-alist
      '(("columns" "\\begin{columns}[onlytextwidth]\n\\column{.8\\textwidth}\n?\\column{.2\\textwidth}\n\\end{columns}" nil)
	("enumerate" "\\begin{enumerate}\n\\item ?\n\\end{enumerate}" nil)
	("pedagogy" "\\begin{pedagogy}\n?\n\\end{pedagogy}" nil))
      cdlatex-command-alist
      '(("fr" nil "" cdlatex-environment ("frame") t nil)
	("ex" nil "\\begin{example} % ex:?\n\n\\end{example}" cdlatex-position-cursor nil t nil)
	("fig" nil "\\begin{figure} % fig:?\n\\end{figure}" cdlatex-position-cursor nil t nil)
	("def" nil "\\begin{definition} % def:?\n\n\\end{definition}" cdlatex-position-cursor nil t nil)
	("thm" nil "\\begin{theorem} % thm:?\n\n\\end{theorem}" cdlatex-position-cursor nil t nil)
	("blk" nil "\\begin{block}{}\n?\n\\end{block}" cdlatex-position-cursor nil t nil)
	("col" nil "" cdlatex-environment ("columns") t nil)
	("sol" nil "" cdlatex-environment ("soln") t nil)
	("soln" nil "" cdlatex-environment ("soln") t nil)
	("ped" nil "" cdlatex-environment ("pedagogy") t nil)
	("peda" nil "" cdlatex-environment ("pedagogy") t nil)
	("tikz" nil "" cdlatex-environment ("tikzpicture") t nil)))

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
		     (?\C-o "\\only<article>{" "}" "" "")) LaTeX-font-list))))

(eval-after-load 'tex-mode
  '(progn
     (add-to-list 'tex--prettify-symbols-alist '("\\varnothing" . ?∅))
     (add-to-list 'tex--prettify-symbols-alist '("\\derive" . ?⇒))
     (add-to-list 'tex--prettify-symbols-alist '("\\derives" . ?⇛))
     (add-to-list 'tex--prettify-symbols-alist '("\\bigcdot" . ?•))
     (add-to-list 'tex--prettify-symbols-alist '("\\dotC" . ?•))))

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

;; markdown ;;
(setq markdown-open-command 'markdown-marp-open-command)
(defun markdown-marp-open-command ()
  "marp preview current .md file."
  (start-process "marp-preview" "*Marp Preview Output*"
                 "marp" "-p" "--no-stdin" (buffer-file-name)))
;; markdown ends here ;;

;; tempel ;;
;;(add-hook 'after-init-hook 'global-company-mode)
(autoload 'tempel-complete "tempel" nil t)
(autoload 'tempel-insert "tempel" nil t)
(global-set-key "\M-+" 'tempel-insert)
(global-set-key "\M-*" 'tempel-complete)
;; tempel ends here ;;

;; misc packages ;;
(eval-after-load 'calc
  '(progn (define-key calc-mode-map "\M-k" 'kill-buffer-and-window)))
(eval-after-load 'calc-ext
  '(progn
     (define-key calc-mode-map "\M-k" 'kill-buffer-and-window)
     (define-key calc-mode-map "\C-\M-k" 'calc-copy-as-kill)))
;; misc packages end here ;;

;; packages ;;
(autoload 'dired-gitignore-global-mode "dired-gitignore" nil t)
(autoload 'helm-fild-files "helm-files" nil t)
(autoload 'magit-status "magit" nil t)
(autoload 'zap-up-to-char "misc" nil t)
(autoload 'dired-jump "dired-x" nil t)
(autoload 'markdown-mode "markdown-mode" nil t)
(autoload 'pdf-view-mode "pdf-view" nil t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (use-package markdown-mode)
;; (use-package dired-gitignore)
;; (use-package helm)
;; (use-package magit)
;; packages end here ;;

;; Frame configuration ;;
(setq default-frame-alist '((background-mode . dark) (cursor-color . "Coral") (auto-raise . t) (top . 0)))

(setq window-system-default-frame-alist
      '((t . ((background-color . "black") (foreground-color . "white")))
	(ns . ((background-color . "#002020") (foreground-color . "wheat") (left . 650) (height . 42))) ;(fullscreen . maximized)
	(w32 . ((background-color . "#001414") (foreground-color . "wheat") (width . 110) (height . 43)))))

(when (eq system-type 'darwin) ;; macOS
  (add-to-list 'default-frame-alist '(left . 5))

  (scroll-bar-mode -1) (tool-bar-mode -1)
  (setq exec-path (split-string (getenv "PATH") ":"))

  (setq face-font-rescale-alist
	'(("Noto Sans CJK SC Thin" . 1.2) ("PingFang SC" . 1.2)))

  (exec-path-from-shell-initialize)

  (set-face-attribute 'default nil :family "Monaco" :height 160)

  (set-fontset-font "fontset-default" 'han "PingFang SC")
  (set-fontset-font "fontset-default" 'symbol "Noto Sans Symbols")
  (set-fontset-font "fontset-default" 'cjk-misc "PingFang SC"))

(when (eq system-type 'windows-nt) ;; Windows
  (setq package-gnupghome-dir "~/.emacs.d/elpa/gnupg")

  ;; (add-to-list 'default-frame-alist '(left . 1665)) ; '(left . (- 0))
  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  (setq face-font-rescale-alist	'(("微软雅黑" . 1.1) ("宋体" . 1.1)))

  (set-face-attribute 'default nil :family "Consolas" :height 136)

  (set-fontset-font "fontset-default" 'han "Microsoft YaHei")
  (set-fontset-font "fontset-default" 'symbol "Noto Sans Symbols")
  (set-fontset-font "fontset-default" 'cjk-misc "SimHei"))
;; Frame configuration ends here ;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-always-kill t)
 '(compilation-auto-jump-to-first-error t)
 '(compilation-mode-hook nil)
 '(compilation-scroll-output t)
 '(compilation-window-height 4)
 '(global-eldoc-mode nil)
 '(package-selected-packages
   '(auctex cdlatex dired-gitignore helm magit markdown-mode tempel))
 '(safe-local-variable-values '((TeX-command-extra-options . "-shell-escape")))
 '(tramp-auto-save-directory "~/.tmp"))
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
 '(match ((t (:background "dark green"))))
 '(mode-line ((t (:background "wheat" :foreground "black"))))
 '(preview-reference-face ((t (:background "#001414" :foreground "wheat"))))
 '(region ((t (:background "gray25")))))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8
;; End:

;; Chunyu's .emacs.d/init.el ends here.
