; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs.el is created on db.hit.edu.cn.    Chunyu.<dddkk@sina.com> 

(global-set-key [f1] 'cvs-examine) 
(global-set-key [f2] 'browse-url-lynx-emacs) 
(global-set-key [f3] 'eshell) 
(global-set-key [f4]  'kill-buffer-directly)
(global-set-key [f5] 'undo)
(global-set-key [f6] 'ansi-term)
(global-set-key [f7] 'calendar)
(global-set-key [f8] 'other-window) 
(global-set-key [f9] 'py-shell)
(global-set-key [f10] 'man-follow)
(global-set-key [f11] 'compile)
(global-set-key [f12] 'gdb)

(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\C-x\C-v" 'view-file)
;;(global-set-key [mouse-3] 'mouse-buffer-menu)
(global-set-key [(control z)] 'set-mark-command)
(global-set-key [(home)]   'beginning-of-buffer)
(global-set-key [(end)]     'end-of-buffer)
(global-set-key [(select)]  'end-of-buffer)
(global-set-key [kp-delete] 'delete-char)
(global-set-key [delete]    'delete-char)

(setq-default transient-mark-mode nil)
(setq-default truncate-lines nil)
;;(setq text-mode-hook 'turn-on-auto-fill)
(setq eshell-ask-to-save-history 'always)
(setq default-major-mode 'text-mode)
(setq display-time-day-and-date t)
(setq next-line-add-newlines nil)
(setq display-time-24hr-format t)
(setq require-final-newline t)
(setq user-mail-address "dddkk@sina.com")
(setq dired-listing-switches "-avl")
(setq user-full-name "Chunyu")
(setq gdb-command-name "gdb ")
(setq compile-command "make ")
(setq diary-file "~/.diary")
(setq scroll-step 0)
;; (prefer-coding-system 'chinese-iso-8bit)
(auto-compression-mode t)
(column-number-mode t)
(display-time-mode t)
(line-number-mode t)
(show-paren-mode t)
(menu-bar-mode nil)

(cond ((fboundp 'global-font-lock-mode)
       (global-font-lock-mode t)
       (setq font-lock-maximum-decoration t)))

(cond ((if window-system  t nil)
       (set-background-color "DarkSlateGrey")
       (set-foreground-color "Wheat")
       (set-cursor-color "gold1")
       (tool-bar-mode nil)
       (set-language-environment 'Chinese-GB)
       ))

(add-hook 'c-mode-common-hook
	  '(lambda () (c-toggle-auto-state t)))
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ))
;;(add-hook 'dired-mode-hook
;;          (lambda ()
;;            ;; Set dired-x buffer-local variables here.  For example:
;;	    (setq dired-omit-files-p nil)
;;            ))

(require 'python-mode)
(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode) interpreter-mode-alist))
(setq auto-mode-alist
      (cons '("\\.ml[iylp]?$" . caml-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.xsd$" . sgml-mode) auto-mode-alist))

(autoload 'caml-mode "ocaml" 
  (interactive)  "Major mode for editing Caml code." t)
(autoload 'camldebug "camldebug" 
  (interactive) "Debug caml mode")
(autoload 'run-caml "inf-caml" 
  "Run an inferior Caml process." t)
(if window-system (require 'caml-font))

(defun dos-unix () (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos () (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))
(defun kill-buffer-directly () (interactive)
  (kill-buffer nil))
(defun eshell-clears-buffer ()
  "Deletes the contents of eshell buffer, except the last prompt"
  (interactive)
  (save-excursion
    (goto-char eshell-last-output-end)
    (let ((lines (count-lines 1 (point)))
	  (inhibit-read-only t))
      (beginning-of-line)
      (let ((pos (point)))
	(if (bobp)
	    (if (interactive-p)
		(error "Buffer too short to truncate"))
	  (delete-region (point-min) (point))
	  (if (interactive-p)
	      (message "Buffer cleared")))))))

(require 'jka-compr)
(require 'dired-tar)
(require 'cubeconf-mode)
(require 'iptables-save-mode)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

(setq completion-ignored-extensions (quote ("CVS/" ".o" "~" ".bin" ".lbin" ".fasl" ".ufsl" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".dvi" ".fmt" ".tfm" ".class" ".fas" ".lib" ".x86f" ".sparcf" ".lo" ".la" ".toc" ".log" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs")))

(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|\\.pyo\\|\\.pyc$")
;; (setq dired-omit-files (concat dired-omit-files "\\|\\.pyo\\|\\.pyc$"))


(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)

;; Chunyu's .emacs.el ends here.
