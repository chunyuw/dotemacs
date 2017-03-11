;; Chunyu <cymacs@gmail.com>'s ~/.emacs.d/gnus.el
;; Created on 2003/02/24 on db.hit.edu.cn

(setq gnus-select-method '(nnimap "imap.gmail.com"))

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

(setq canlock-password "c3a42c5a00ad79b5b1e8dbbc4fd73a2cb597ddfa")

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8
;; End:

;; Chunyu's .emacs.d/gnus.el ends here.
