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



(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key [(control z)]  'set-mark-command)
(global-set-key [(home)] 'beginning-of-buffer)
(global-set-key [(end)]        'end-of-buffer)
(global-set-key [kp-delete] 'delete-char)
(global-set-key [delete]    'delete-char)

(setq-default transient-mark-mode nil)
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
(column-number-mode  nil)
(line-number-mode      t)
(menu-bar-mode       nil)
(show-paren-mode       t)
(display-time-mode     t)

(cond ((fboundp 'global-font-lock-mode)
       (global-font-lock-mode t)
       (setq font-lock-maximum-decoration t)))

(cond ((if window-system  t nil)
       (set-background-color "gray29")
       (set-foreground-color "Wheat")
       (set-cursor-color "gold1")
       (tool-bar-mode nil)))

;;(add-hook 'c-mode-common-hook
;;	  '(lambda () (c-toggle-auto-state t)))

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

(require 'jka-compr)
(require 'dired-tar)


(custom-set-variables
 ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
 ;; Your init file should contain only one such instance.
 '(Info-enable-edit nil)
 '(diary-file "~/.diary")
 '(dired-listing-switches "-alhv")
 '(mail-host-address "192.168.1.178")
 '(rmail-pop-password "mypasswd")
 '(rmail-pop-password-required t)
 '(rmail-primary-inbox-list (quote ("po:dddkk@sina.com#pop3.sina.com.cn" "po:dddkk@263.net#263.net")) t)
 '(rmail-user-mail-address-regexp nil t)
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
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'rmail 'disabled t)

;; Chunyu's .emacs.el ends here.
