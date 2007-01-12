;; Chunyu <chunyu@hit.edu.cn>'s ~/.emacs.d/gnus.el, created on 2003/02/24 on db.hit.edu.cn.

(setq gnus-select-method '(nntp "news.yaako.com")
      gnus-secondary-select-methods '((nnml ""))) ; (nntp "news.happynet.org")

(setq gnus-default-charset 'cn-gb-2312
      gnus-group-name-charset-group-alist '((".*" . cn-gb-2312))
      gnus-summary-show-article-charset-alist '((1 . cn-gb-2312) (2 . big5) (3 . utf-8))
      gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1 gbk gb18030 x-gbk))

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
      gnus-gcc-externalize-attachments 'all
      gnus-treat-strip-trailing-blank-lines 'last
      gnus-treat-strip-leading-blank-lines 'last
      gnus-treat-strip-multiple-blank-lines 'last
      gnus-treat-display-smileys t
      gnus-treat-display-x-face 'head
      gnus-auto-select-next 'quietly
      gnus-ignored-from-addresses "chunyu\\|cymacs"
      gnus-subscribe-newsgroup-method 'gnus-subscribe-killed
      gnus-interactive-exit nil)

(setq mm-inline-large-images nil
      mm-text-html-renderer 'w3m)

(defalias 'mail-header-encode-parameter 'rfc2047-encode-parameter)

(setq gnus-parameters
      '((".*" (agent-disable-undownloaded-faces t))
	("list\\..*" (subscribed . t) (total-expire . t))
	("mail\\..*" (total-expire . nil) (gnus-use-scoring nil))
	("misc\\.ta" (total-expire . nil))
	("misc\\..*" (total-expire . nil))
	("nnfolder\\+archive:.*" (gnus-use-scoring nil))
	("classmate\\..*" (gnus-use-scoring nil))))

(setq gnus-visible-headers 
      (concat "^From:\\|^Newsgroups:\\|^Subject:\\|^Date:\\|^Followup-To:"
	      "\\|^Reply-To:\\|^Summary:\\|^Keywords:\\|^To:\\|^[BGF]?Cc:"
	      "\\|^Posted-To:\\|^Mail-Copies-To:\\|^Mail-Followup-To:"
	      "\\|^Apparently-To:\\|^Gnus-Warning:\\|^Resent-From:\\|^X-Sent:"
	      "\\|^User-Agent:\\|^X-Mailer:\\|^X-Newsreader:"))

(setq gnus-message-archive-group
      '((if (message-news-p)
	    (concat "news." (format-time-string "%Y-%m"))
	  (concat "mail." (format-time-string "%Y-%m")))))

(setq chunyu-gnus-x-face
      (concat "$,MrC{\".#Of\"+5o4f&\"Y%BEXbu::2[3u0PK.G\\]'&Irj>a%BRPq%aA\"6f<Ywarj_/A\n"
	      " R5<o9'<!\"9.\\ZqzkDv-OK0&Vx&D(0'5O(jx,]LgQk/J@P<F$X\\br>y\"[Eo8lEBloB*tfsz~]\\\n"
	      " Ll\\}&C{}ar^R\\Ic9shnEW?'8o-9%MQ03+izFFbQV&CUKVd>%V1sog)m1$L=Z(K!I5ID8nucdF\n"
	      " }Bb(/r>b]7*t@GP%=VS_~:&~:F$?7,i1Wqj\\C(q)|@71421c2ynlCQ<u%\"'6|28Oww\":7N6=F\n"
	      " s/?mUj&_^u&\\^yrrY{O"))

(setq gnus-posting-styles
      '((".*"
	 (signature-file "~/.emacs.d/sig/default")
	 (name "������")
	 (address "chunyu@hit.edu.cn"))
	("^cn\\..*\\|^nntp\\+news.*"
	 (signature-file "~/.emacs.d/sig/cnnews")
	 (name "��������")
	 (address "chunyu@myrealbox.com")
	 ("X-Face" 'chunyu-gnus-x-face))
	("^nnml:mail.*"
	 (signature-file "~/.emacs.d/sig/mail")
	 (name "������")
	 (address "chunyu@hit.edu.cn"))	
	("^nnml:list.*"
	 (signature-file "~/.emacs.d/sig/lists")
	 (name "Chunyu Wang")
	 (address "cymacs@gmail.com"))
	("^nnml:list.sfsearch"
	 (signature-file "~/.emacs.d/sig/lists")
	 (name "Chunyu Wang")
	 (address "chunyu@hit.edu.cn"))))

(setq sc-attrib-selection-list
      '(("sc-from-address"
	 ((".*" . (bbdb/sc-consult-attr (sc-mail-field "sc-from-address"))))))
      sc-auto-fill-region-p nil
      sc-blank-lines-after-headers 1
      sc-citation-leader "  "
      sc-citation-delimiter-regexp "[>]+\\|\\(: \\)+"
      sc-cite-blank-lines-p nil
      sc-confirm-always-p nil
      sc-electric-references-p nil
      sc-fixup-whitespace-p t
      sc-nested-citation-p nil
      sc-preferred-header-style 4
      sc-preferred-attribution-list
      '("sc-lastchoice" "x-attribution" "sc-consult" "initials" "firstname" "lastname")
      sc-use-only-preference-p nil)

(setq message-from-style 'angles
      message-kill-buffer-on-exit t
      message-cite-function 'sc-cite-original
      message-elide-ellipsis "\n  [...]\n"
      message-sendmail-envelope-from 'header
      message-signature t
      message-signature-file "~/.emacs.d/sig/default"
      message-mail-alias-type nil
      message-forward-ignored-headers
      (concat "^X-\\|^Old-\\|^Xref:\\|^Path:\\|^[Cc]c:\\|^Lines:\\|^Sender:"
	      "\\|^Thread-\\|^[GB]cc:\\|^Reply-To:\\|^Received:\\|^User-Agent:"
	      "\\|^Message-ID:\\|^Precedence:\\|^References:\\|^Return-Path:"
	      "\\|^Cancel-Lock:\\|^Delivered-To:\\|^Organization:\\|^content-class:"
	      "\\|^Mail-Copies-To:\\|^Return-Receipt-To:\\|^NNTP-Posting-Date:"
	      "\\|^NNTP-Posting-Host:\\|^Content-Transfer-Encoding:"
	      "\\|^Disposition-Notification-To:\\|^In-Reply-To:\\|^List-"
	      "\\|^Status:\\|^Errors-To:\\|FL-Build:")
      message-make-forward-subject-function 'message-forward-subject-fwd
      message-forward-as-mime t
      message-alternative-emails
      (regexp-opt '("dddkk@sina.com" "chunyu@hit.edu.cn" "chunyu@db.cs.hit.edu.cn"
		    "cymacs@gmail.com" "chunyu@emacs.cn"))
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
	  ;;(: spam-stat-split-fancy)
	  (any "emacs-devel" "list.emacs-devel")
	  (any "pgf-users" "list.pgf-users")
	  (any "emacs-cn" "list.emacs-cn")
	  (any "@.*gf\\.cs\\.hit\\.edu\\.cn" "mail.gfcs")
	  (any "otwg\\|footoo\\|sf-search" "list.otwg")
	  (any "sfdev" "list.sfsearch")
	  ("Subject" "siteadmin-discuss" "mail.gfcs")
	  (to "@202.118.224.153" "mail.misc")
	  (any "chunyu@\\|cymacs@gmail\\|@\\(cy.\\)?emacs\\.cn"
	      (| (from "pacz@\\(sohu\\|pa18\\)\\|tccz@sina" "mail.wife")
		 (from "semengmeng@eyou.com\\|nancycm712@yahoo.com.cn\\|zysy33@163.com" "mail.remote")
		 (from "@ssmail\\.hit\\.edu\\.cn" "misc.ta")
		 (any "cmbchina\\.com" "mail.cmbchina")
		 (from "\\(metafun\\|chunyu\\)@bbs.hit.edu.cn" "mail.myself")
		 (from "cymacs@newsmth.net" "mail.myself")
		 "mail.misc"))
	  "misc.junk")
      nnmail-mail-splitting-decodes t)

(require 'message-x)
(setq gnus-registry-max-entries 2500
      gnus-registry-use-long-group-names t)
(gnus-registry-initialize)

;; (require 'spam-stat)
;; (setq spam-stat-file "~/.emacs.d/spam-stat.el")
;; (setq spam-use-bogofilter t)
;; (setq spam-use-stat t)
;; (spam-stat-load)
;; (spam-initialize)
;; (setq spam-log-to-registry t
;;       spam-use-BBDB t
;;       spam-use-regex-headers t
;;       spam-stat-split-fancy-spam-group "misc.junk"
;;       gnus-spam-autodetect-methods 
;;       '((".*" . (spam-use-blacklist
;; 		 ;;spam-use-BBDB
;; 		 spam-use-bogofilter
;; 		 spam-use-gmane-xref))))

;;(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'mail-citation-hook 'sc-cite-original)
(add-hook 'message-mode-hook 
	  (lambda ()
	    (setq fill-column 72)
	    ;;(turn-on-orgtbl)
	    (turn-on-auto-fill)))

(setq message-x-completion-alist
      '(("\\([rR]esent-\\|[rR]eply-\\)?[tT]o:\\|[bB]?[cC][cC]:\\|[fF]rom:" . message-x-complete-name)
	((if (boundp 'message-newgroups-header-regexp)
	     message-newgroups-header-regexp message-newsgroups-header-regexp)
	 . message-expand-group)))

(gnus-compile)

(when window-system
  (eval-after-load "gnus-art"
    '(progn 
       (copy-face 'gnus-header-from-face 'gnus-x-face)
       (set-face-attribute 'gnus-x-face nil :foreground "blue")))
  (set-face-attribute 'gnus-summary-high-unread-face nil :foreground "LightGoldenrod3"))

(unless window-system
  (require 'gnus-sum)
  (defface chunyu-gnus-own-related-posting-face nil "Postings by myself.")
  (set-face-attribute 'chunyu-gnus-own-related-posting-face nil :foreground "red" :weight 'bold)
  (add-to-list 'gnus-summary-highlight
	       '((and (> score 6500) (eq mark gnus-unread-mark)) . chunyu-gnus-own-related-posting-face))

  (eval-after-load "gnus-cite"
    '(progn
       (set-face-attribute 'gnus-cite-face-2 nil :foreground "magenta")
       (set-face-attribute 'gnus-cite-face-3 nil :foreground "yellow")
       (set-face-attribute 'gnus-cite-face-4 nil :foreground "cyan")))
  (eval-after-load "gnus-art"
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
  (set-face-attribute 'gnus-group-news-3-face nil :foreground "green" :weight 'bold))

;; Chunyu's .emacs.d/gnus.el ends here.