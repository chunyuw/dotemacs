(global-set-key [f1] 'cvs-examine) 
(global-set-key [f2] 'browse-url-lynx-emacs) 
(global-set-key [f3] 'eshell) 
(global-set-key [f4] 'kill-buffer)
(global-set-key [f5] 'undo)
(global-set-key [f6] 'ansi-term)
(global-set-key [f7] 'calendar)
(global-set-key [f8] 'other-window) 
(global-set-key [f9] 'indent-region)
(global-set-key [f10] 'man-follow)
(global-set-key [f11] 'compile)
(global-set-key [f12] 'gdb)

(global-set-key "\C-co" 'occur)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-c\C-b" 'login-bbs-by-name)
(global-set-key [(control z)]  'set-mark-command)
(global-set-key [(home)] 'beginning-of-buffer)
(global-set-key [(end)]        'end-of-buffer)
(global-set-key [kp-delete] 'delete-char)
(global-set-key [delete]    'delete-char)

(setq-default transient-mark-mode nil)
(setq-default truncate-lines nil)
(setq-default save-place t)

(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)
(setq display-time-day-and-date t)
(setq next-line-add-newlines nil)
(setq display-time-24hr-format t)
(setq require-final-newline t)
(setq gdb-command-name "gdb ")
(setq compile-command "make ")

(setq scroll-step 0)
;; (prefer-coding-system 'chinese-iso-8bit)
(auto-compression-mode t)
(column-number-mode    t)
(line-number-mode      t)
(menu-bar-mode       nil)
(show-paren-mode       t)
(display-time-mode     t)
(auto-revert-mode)

(load-file "/home/spr/.emacs.kbd")

(cond ((fboundp 'global-font-lock-mode)
       (global-font-lock-mode t)
       (setq font-lock-maximum-decoration t)))

(cond ((if window-system  t nil)
       (set-background-color "DarkSlateGrey")
       (set-foreground-color  "Wheat")
       (set-cursor-color      "gold1")
       (tool-bar-mode nil)))

;;(add-hook 'c-mode-common-hook
;;	  '(lambda () (c-toggle-auto-state t)))
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
	    (setq dired-omit-files-p t)
            ))

(require 'python-mode)
(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode) interpreter-mode-alist))

(defun dos-unix ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

(require 'tramp)
(require 'jka-compr)
(require 'dired-tar)
(require 'cubeconf-mode)

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
;;;;  (set-w32-system-coding-system 'cn-gb-2312-dos) ; for Chinese Windows users
;;  )
;;(load-gb); or substitute big5 for gb in load-gb and call (load-big5)


(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(Info-enable-edit nil)
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "Chinese-GB")
 '(default-input-method "chinese-py-punct")
 '(diary-file "~/.diary" t)
 '(dired-listing-switches "-alv")
 '(global-font-lock-mode t nil (font-lock))
 '(mail-host-address "192.168.1.178")
 '(rmail-pop-password "asasdasd")
 '(rmail-pop-password-required t)
 '(rmail-primary-inbox-list (quote ("po:dddkk@sina.com#pop3.sina.com.cn" "po:dddkk@263.net#263.net")) t)
 '(rmail-user-mail-address-regexp nil t)
 '(show-paren-mode t nil (paren))
 '(smtpmail-default-smtp-server "192.168.1.178")
 '(smtpmail-smtp-service 2501)
 '(user-full-name "Chunyu W.")
 '(user-mail-address "dddkk@sina.com"))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

(setenv "MAILHOST" "192.168.1.178")

(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)

;; Chunyu's .emacs.el ends here.
