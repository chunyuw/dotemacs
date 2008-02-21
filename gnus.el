;; Chunyu <chunyu@hit.edu.cn>'s ~/.emacs.d/gnus.el, created on 2003/02/24 on db.hit.edu.cn.

(setq gnus-select-method '(nntp "news.yaako.com")
      gnus-secondary-select-methods '((nnml ""))) ; (nntp "news.happynet.org") (nntp "news.delegate.org")

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
      gnus-summary-display-arrow nil
      gnus-always-read-dribble-file t
      gnus-confirm-mail-reply-to-news t
      gnus-gcc-mark-as-read t
      gnus-gcc-externalize-attachments nil
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
	("misc\\..*" (total-expire . nil))
	("nnfolder\\+archive:.*" (gnus-use-scoring nil))
	("classmate\\..*" (gnus-use-scoring nil))))

(setq gnus-message-archive-group
      '((if (message-news-p)
	    (concat "news." (format-time-string "%Y-%m"))
	  (concat "mail." (format-time-string "%Y-%m")))))

(setq gnus-posting-styles
      '((".*"
	 (signature-file "~/.emacs.d/sig/default")
	 (name "Õı¥∫”Ó")
	 (address "chunyu@hit.edu.cn"))
	("^cn\\..*\\|^nntp\\+news.*"
	 (signature-file "~/.emacs.d/sig/cnnews")
	 (name "Chunyu")
	 (address "chunyu@myrealbox.com"))
	("^nnml:mail.*"
	 (signature-file "~/.emacs.d/sig/mail")
	 (name "Õı¥∫”Ó")
	 (address "chunyu@hit.edu.cn"))	
	("^nnml:list.*"
	 (signature-file "~/.emacs.d/sig/lists")
	 (name "Chunyu Wang")
	 (address "cymacs@gmail.com"))))

(setq message-from-style 'angles
      message-kill-buffer-on-exit t
      message-elide-ellipsis "\n  [...]\n"
      message-sendmail-envelope-from 'header
      message-signature t
      message-signature-file "~/.emacs.d/sig/default"
      message-mail-alias-type nil
      message-make-forward-subject-function 'message-forward-subject-fwd
      message-forward-as-mime t
      message-alternative-emails
      (regexp-opt '("chunyu@hit.edu.cn" "cymacs@gmail.com"))
      message-dont-reply-to-names message-alternative-emails
      message-subscribed-address-functions '(gnus-find-subscribed-addresses)
      message-forward-show-mml nil)

(setq nnml-use-compressed-files t)

(setq nnmail-treat-duplicates 'delete
      nnmail-crosspost nil
      nnmail-split-methods 'nnmail-split-fancy
      nnmail-split-fancy-match-partial-words t
      nnmail-split-fancy
      '(| (any "985101" "classmate.985101")
	  (any "luatex\\|pgf" "list.tex")
	  (any "emacs-cn" "list.emacs-cn")
	  (to "@202.118.224.153" "mail.misc")
	  (to "chunyu@\\|cymacs@gmail\\|@\\(cy.\\)?emacs\\.cn"
	      (| (any "cmbchina\\.com" "mail.cmbchina")
		 "mail.misc"))
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

(when window-system
  (eval-after-load 'gnus-art
    '(progn 
       (copy-face 'gnus-header-from-face 'gnus-x-face)
       (set-face-attribute 'gnus-x-face nil :foreground "blue")))
  (set-face-attribute 'gnus-summary-high-unread-face nil :foreground "LightGoldenrod3"))

(unless window-system
  (when (= 8 (display-color-cells))
    (eval-after-load 'gnus-cite
      '(progn
	 (set-face-attribute 'gnus-cite-face-2 nil :foreground "magenta")
	 (set-face-attribute 'gnus-cite-face-3 nil :foreground "yellow")
	 (set-face-attribute 'gnus-cite-face-4 nil :foreground "cyan")))
    (eval-after-load 'gnus-art
      '(progn
	 (set-face-attribute 'gnus-header-subject-face nil :foreground "red" :weight 'bold)))

    (set-face-attribute 'gnus-splash-face nil :foreground "yellow")
    (set-face-attribute 'gnus-group-mail-1-empty-face nil :foreground "magenta")
    (set-face-attribute 'gnus-group-mail-1-face nil :foreground "magenta" :weight 'bold)
    (set-face-attribute 'gnus-group-mail-2-empty-face nil :foreground "cyan")
    (set-face-attribute 'gnus-group-mail-2-face nil :foreground "cyan" :weight 'bold)
    (set-face-attribute 'gnus-group-mail-3-empty-face nil :foreground "green")
    (set-face-attribute 'gnus-group-mail-3-face nil :foreground "green" :weight 'bold)
    (set-face-attribute 'gnus-group-news-1-empty-face nil :foreground "magenta")
    (set-face-attribute 'gnus-group-news-1-face nil :foreground "magenta" :weight 'bold)
    (set-face-attribute 'gnus-group-news-2-empty-face nil :foreground "cyan")
    (set-face-attribute 'gnus-group-news-2-face nil :foreground "cyan" :weight 'bold)
    (set-face-attribute 'gnus-group-news-3-empty-face nil :foreground "green")
    (set-face-attribute 'gnus-group-news-3-face nil :foreground "green" :weight 'bold)))

;; Chunyu's .emacs.d/gnus.el ends here.
