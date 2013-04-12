;; -*- mode: emacs-lisp -*-

(display-time-mode 1)
(setq image-load-path nil)

(if (not (fboundp 'scroll-up-line))
    (progn
     (defun scroll-up-line (&optional arg)
       "Scroll text of selected window upward ARG lines; or one line if no ARG.
If ARG is omitted or nil, scroll upward by one line.
This is different from `scroll-up-command' that scrolls a full screen."
       (interactive "p")
       (scroll-up (or arg 1)))

     (put 'scroll-up-line 'scroll-command t)

     (defun scroll-down-line (&optional arg)
       "Scroll text of selected window down ARG lines; or one line if no ARG.
If ARG is omitted or nil, scroll down by one line.
This is different from `scroll-down-command' that scrolls a full screen."
       (interactive "p")
       (scroll-down (or arg 1)))

     (put 'scroll-down-line 'scroll-command t)))

;; (setq message-send-mail-function 'message-send-mail-with-sendmail
;;       sendmail-program "msmtp" mail-host-address "hit.edu.cn"
;;       user-full-name "Chunyu Wang" user-mail-address "chunyu@hit.edu.cn")

;; (set-language-environment    'UTF-8)
;; (set-default-coding-systems  'utf-8)
;; (set-keyboard-coding-system  'utf-8)
;; (set-terminal-coding-system  'utf-8)
;; (set-clipboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)

