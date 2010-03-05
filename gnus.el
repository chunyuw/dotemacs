;; Chunyu <cymacs@gmail.com>'s ~/.emacs.d/gnus.el
;; Created on 2003/02/24 on db.hit.edu.cn

(setq gnus-select-method '(nntp "news.yaako.com")
      gnus-secondary-select-methods '((nnml "")))

(setq gnus-default-charset 'gbk
      gnus-group-name-charset-group-alist '((".*" . gbk))
      gnus-summary-show-article-charset-alist '((1 . gbk) (2 . big5) (3 . utf-8))
      gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1))

(setq gnus-novice-user nil
      gnus-expert-user t)

(setq gnus-read-newsrc-file nil
      gnus-save-newsrc-file nil
      gnus-save-killed-list nil
      gnus-backup-startup-file nil
      gnus-registry-install t
      gnus-summary-display-arrow nil
      gnus-always-read-dribble-file t
      gnus-confirm-mail-reply-to-news t
      gnus-gcc-mark-as-read t
      gnus-gcc-externalize-attachments t
      gnus-treat-strip-trailing-blank-lines 'last
      gnus-treat-strip-leading-blank-lines 'last
      gnus-treat-strip-multiple-blank-lines 'last
      gnus-treat-display-smileys t
      gnus-treat-display-x-face 'head
      gnus-auto-select-next 'quietly
      gnus-ignored-from-addresses "chunyu\\|cymacs"
      gnus-subscribe-newsgroup-method 'gnus-subscribe-killed
      gnus-interactive-exit nil)

(defalias 'mail-header-encode-parameter 'rfc2047-encode-parameter)

(setq gnus-parameters
      '((".*" (agent-disable-undownloaded-faces t))
	("list\\..*" (subscribed . t) (total-expire . t))
	("mail\\..*" (total-expire . nil) (gnus-use-scoring nil))
	("misc\\..*" (total-expire . nil))))

(setq gnus-message-archive-group
      '((if (message-news-p)
	    (concat "news." (format-time-string "%Y-%m"))
	  (concat "mail." (format-time-string "%Y-%m")))))

(setq gnus-posting-styles
      '((".*"
	 ;; (signature-file "~/.emacs.d/signature")
	 (name "Õı¥∫”Ó")
	 (address "chunyu@hit.edu.cn"))
	("^nnml:mail.*"
	 (name "Õı¥∫”Ó")
	 (address "cymacs@gmail.com"))
	("^nnml:list.*"
	 (name "Chunyu Wang")
	 (address "cymacs@gmail.com"))))

(setq message-from-style 'angles
      message-kill-buffer-on-exit t
      message-elide-ellipsis "\n  [...]\n"
      message-sendmail-envelope-from 'header
      message-signature t
      message-mail-alias-type nil
      message-make-forward-subject-function 'message-forward-subject-fwd
      message-forward-as-mime t
      message-alternative-emails
      (regexp-opt '("chunyu@hit.edu.cn" "cymacs@gmail.com"))
      message-dont-reply-to-names message-alternative-emails
      message-subscribed-address-functions '(gnus-find-subscribed-addresses)
      message-send-mail-partially-limit nil
      message-forward-show-mml nil)

(setq nnml-use-compressed-files t)

(setq nnmail-treat-duplicates 'delete
      nnmail-crosspost nil
      nnmail-split-methods 'nnmail-split-fancy
      nnmail-split-fancy-match-partial-words t
      nnmail-split-fancy
      '(| (to "@202.118.224.153" "mail.misc")
	  (to "chunyu@hit.edu.cn\\|cymacs@gmail.com" "mail.misc")
	  "misc.junk")
      nnmail-mail-splitting-decodes t)

(require 'message-x)
(setq gnus-registry-max-entries 2500
      gnus-registry-use-long-group-names t)
(gnus-registry-initialize)

(add-hook 'message-mode-hook
	  (lambda ()
	    (setq fill-column 72)
	    (turn-on-auto-fill)))

(setq message-x-completion-alist
      '(("\\([rR]esent-\\|[rR]eply-\\)?[tT]o:\\|[bB]?[cC][cC]:\\|[fF]rom:" . message-x-complete-name)
	((if (boundp 'message-newgroups-header-regexp)
	     message-newgroups-header-regexp message-newsgroups-header-regexp)
	 . message-expand-group)))

(gnus-compile)

;; Local Variables:
;; mode: emacs-lisp
;; coding: gbk-unix
;; End:

;; Chunyu's .emacs.d/gnus.el ends here.
