;; $Id$  -*- mode: Emacs-Lisp; coding: gb2312-unix; -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_smtp.el, created on 2003/06/15 on db.cs.hit.edu.cn.

(setq send-mail-function 'feedmail-send-it)
(setq message-send-mail-function 'feedmail-send-it)
;;(autoload 'feedmail-send-it "feedmail")

;;(setq message-send-mail-function 'smtpmail-send-it)
;; (setq smtpmail-default-smtp-server "202.118.224.153")
;; (setq smtpmail-smtp-server "202.118.224.153")
;; (setq smtpmail-local-domain "db.hit.edu.cn")
;; (setq smtpmail-sendto-domain "db.hit.edu.cn")
;;       '(("202.118.224.153" 25 "chunyu" "my passd")))

;;(setq smtpmail-default-smtp-server "smtp.sina.com.cn")
;;(setq smtpmail-smtp-server "smtp.sina.com.cn")
;;(setq smtpmail-starttls-credentials
;;      '(("smtp.sina.com.cn" 25 "dddkk" "Lbh ner Cvt.")))
;;(setq smtpmail-debug-info t)

;; Chunyu's .emacs_smtp.el ends here.
