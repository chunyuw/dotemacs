;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Chunyu.W's .emacs.el file
;;  $Id$ 
(global-set-key [f1]  'cvs-examine) 
(global-set-key [f2]  'py-shell)
(global-set-key [f3]  'eshell) 
(global-set-key [f4]  'kill-buffer)
(global-set-key [f5]  'undo)
(global-set-key [f6]  'man-follow)
(global-set-key [f7]  'calendar)
(global-set-key [f8]  'other-window) 
(global-set-key [f9]  'indent-region)
(global-set-key [f10] 'man-follow)
(global-set-key [f11] 'compile)
(global-set-key [f12] 'gdb)
(global-set-key [f19] 'gud-step)	; (shift f1)
(global-set-key [f20] 'gud-next)
;;(global-set-key [(control f1)] ')
;;(global-set-key [(control prior)] 'scroll-other-window) 
;;(global-set-key [(control next)] 'scroll-other-window-down) 
;;(global-set-key [(control TAB)] ') ;forward reference
(global-set-key [(control z)] 'set-mark-command)
(global-set-key [(control z)] 'set-mark-command)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
;;(global-set-key "" ')
(global-set-key [(home)] 'beginning-of-buffer)
(global-set-key [(end)] 'end-of-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq ring-bell-function nil)
(setq visible-bell 1)
(tool-bar-mode nil)
(menu-bar-mode nil)
;;(setq scroll-step t)
;;(setq case-fold-search nil) ; make searches case sensitive(nil)/insensitive(t)
(setq column-number-mode t)
(setq line-number-mode t)
(setq next-line-add-newlines nil)
(setq default-major-mode 'text-mode)
(setq compile-command "make ")
;;(show-paren-mode 1)
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)
(setq frame-title-format (list "%b - GNU Emacs " emacs-version))
;;(setq sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*")
;;(setq sentence-end-double-space nil)
(setq inhibit-startup-message t)     ; Dont show the GNU splash screen
(auto-compression-mode 1)
(setq bookmark-save-flag 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Font-lock 
(cond ((fboundp 'global-font-lock-mode)
       (global-font-lock-mode t)
       (setq font-lock-maximum-decoration t)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hook
;;(add-hook 'c-mode-common-hook
;;          '(lambda () 
;;	     (c-toggle-auto-state 1)))
;;(add-hook 'write-file-hooks 'time-stamp)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; major mode
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;(add-to-list 'auto-mode-alist '("\\.xml\\'" . xml-mode))
;;(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
;;(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;设置颜色及大小
;;(set-background-color "")
;;(set-foreground-color "")
;;(set-cursor-color "green")
;;(set-frame-position (selected-frame) 100 0)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual C++
;;(require 'gnuserv)
;;(setq gnuserv-frame (selected-frame))
;;(gnuserv-start)
;;
;;(global-auto-revert-mode 1) ;; auto revert in Visual C++
;;
;;(setq compile-command 
;;      '("nmake -f .mak " . 10)) ;; Set up for Visual C++ compiling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(setq kill-emacs-query-functions
;;    (cons (lambda () (yes-or-no-p "Really kill Emacs? "))
;;            kill-emacs-query-functions))
;;
;;;; Set the text for titlebar and icons
;;(setq frame-title-format (list invocation-name "@" system-name))
;;(setq icon-title-format frame-title-format)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;显示中文与输入
(set-keyboard-coding-system 'cn-gb-2312)
(set-language-environment 'Chinese-GB)
;;(create-fontset-from-fontset-spec
;; "-*-courier new-normal-r-*-*-13-*-*-*-c-*-fontset-chinese,
;;      chinese-gb2312:-*-MS Song-normal-r-*-*-16-*-*-*-c-*-gb2312*-*,
;;      chinese-big5-1:-*-MingLiU-normal-r-*-*-16-*-*-*-c-*-big5*-*,
;;      chinese-big5-2:-*-MingLiU-normal-r-*-*-16-*-*-*-c-*-big5*-*" t)
;;(setq default-frame-alist
;;      (append
;;       '((font . "fontset-chinese"))
;;       default-frame-alist))
;;(defun load-gb () 
;;  (set-language-environment 'chinese-gb) ; or 'chinese-big5
;;  (set-selection-coding-system 'cn-gb-2312-dos)
;;  (set-terminal-coding-system 'cn-gb-2312-dos)
;;  (set-w32-system-coding-system 'cn-gb-2312-dos) ; for Chinese Windows users
;;  )
;;(load-gb); or substitute big5 for gb in load-gb and call (load-big5)
;;(defun load-b5 () 
;;  (set-language-environment 'chinese-big5) ; or 'chinese-gb
;;  (set-selection-coding-system 'cn-big5-dos)
;;  (set-terminal-coding-system 'cn-big5-dos)
;;  (set-w32-system-coding-system 'cn-big5-dos) ; for Chinese Windows users
;;)
;;
;;
;;(load-b5) ; or substitute gb for big5 in load-b5 and call (load-gb)
;;;;;;;;;;;;;;;
;;(register-input-method
;; "chinese-wubi" "Chinese-GB" 'quail-use-package
;; "五笔" "汉字输入::五笔字型::"
;; "quail/WuBi")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Send Mail to smtp host from smtpmail temp buffer.
;;
;; Please add these lines in your .emacs(_emacs) or use customize.
;;
;;(setq send-mail-function 'smtpmail-send-it) ; if you use `mail'
;;(setq message-send-mail-function 'smtpmail-send-it) ; if you use `message'
;;(setq smtpmail-default-smtp-server "smtp.china.com")
;;(setq smtpmail-local-domain "YOUR DOMAIN NAME")
;;(setq smtpmail-debug-info t) ; only to debug problems
;;
;; To queue mail, set smtpmail-queue-mail to t and use 
;; smtpmail-send-queued-mail to send.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; my functions
;;(defun signature (name)
;;  (interactive "cSignature (E)macs, (N)ewsgroup, (M)ail, (S)tandard")
;;  (goto-char (point-max))
;;  (insert "----------\n")
;;  (insert-date-or-time ?s)
;;  (insert-file (cond ((equal name ?e) "~/signatures/emacs.sig")
;;		     ((equal name ?n) "~/signatures/newsgroup.sig")
;;		     ((equal name ?m) "~/signatures/mail.sig")
;;		     (t "~/signatures/standard.sig"))))
;;(defun insert-date ()
;;  "Insert date at point."
;;  (interactive)
;;  (insert (format-time-string "%A, %B %e, %Y %k:%M:%S %z")))
;;(defun insert-date-or-time (name)
;;  "Insert date and time at point."
;;  (interactive "cInsert date or time: (T)ime, (Y)ear, (W)eek, (M)onth, (D)iary, (S)ignature")
;;  (insert (format-time-string 
;;	   (cond ((equal name ?y) "%Y ")
;;		 ((equal name ?t) "%R ")
;;		 ((equal name ?w) "%A ")
;;		 ((equal name ?m) "%B ")
;;		 ((equal name ?d) "%a, %b %d, %Y: ")
;;		 ((equal name ?s) "\t%F\n\t%R\n")
;;		 (t "%a %b %e, %Y %R ")))))
;;(defun match-paren (arg)
;;  "Go to the matching symbol"
;;  (interactive "p")
;;  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;;  ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;  (t (self-insert-command (or arg 1)))))
;;(defun kill-all-newlines-from-buffer ()
;;  (interactive)
;;  (goto-char (point-min))
;;  (while (re-search-forward "^[ \t]*$")
;;    (beginning-of-line)
;;    (kill-line)))
(defun dos-unix ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))
;;(defun ascii-table ()
;;  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
;;  (interactive)
;;  (switch-to-buffer "*ASCII*")
;;  (erase-buffer)
;;  (insert (format "ASCII characters up to number %d.\n" 254))
;;  (let ((i 0))
;;    (while (< i 254)
;;      (setq i (+ i 1))
;;      (insert (format "%4d %c\n" i i))))
;;  (beginning-of-buffer))
 
;;(require 'diary-lib)
(require 'dired-tar)
(require 'mpg123)
;;(require 'jtemplate)
;;(require 'htmlize)
;;(require 'flash-paren)
;;(flash-paren-mode 1)
;;(require 'buffer-fns)
;;(require 'server)
;;(server-start)
;;(setq gnus-select-method '(nntp "news.sinica.edu.tw"))

(custom-set-variables
 ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
 ;; Your init file should contain only one such instance.
 '(diary-file "~/.diary" t)
 '(dired-listing-switches "-alv" t)
 '(global-font-lock-mode t nil (font-lock))
 '(user-full-name "Chunyu W.")
 '(user-mail-address "dddkk@sina.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
 ;; Your init file should contain only one such instance.
 ;; '(font-lock-comment-face ((((type tty pc) (class color) (background dark)) (:foreground "red"))))
 )

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)

;; Chunyu's .emacs.el ends here.
