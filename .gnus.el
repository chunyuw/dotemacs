;; $Id$  -*- mode: Emacs-Lisp; coding: gb2312; -*-
;; Chunyu <chunyu@hit.edu.cn>'s .gnus.el, created on 2003/02/24 on db.hit.edu.cn.

(setq gnus-select-method '(nntp "news.yaako.com")
      gnus-secondary-select-methods
      '((nnml "")
	;; (nntp "bbs.52098.com")
	;; (nntp "news.gmane.org")
	(nntp "localhost")
	(nntp "news.newsfan.net")))

(setq gnus-asynchronous t
      gnus-read-newsrc-file nil
      gnus-save-newsrc-file nil
      gnus-save-killed-list nil
      gnus-summary-display-arrow nil
      gnus-always-read-dribble-file t
      gnus-confirm-mail-reply-to-news t
      gnus-gcc-mark-as-read t
      gnus-gcc-externalize-attachments 'all
      gnus-treat-strip-trailing-blank-lines 'last
      gnus-treat-strip-leading-blank-lines 'last
      gnus-treat-strip-multiple-blank-lines 'last
      gnus-treat-display-smileys t
      gnus-auto-select-next 'quietly
      gnus-activate-foreign-newsgroups 4
      gnus-interactive-exit nil)

;; (setq gnus-group-line-format "%M%S%p%P%5y:%B%(%g%)%l %O\n")

(setq gnus-agent-mark-unread-after-downloaded nil)

(setq gnus-parameters
      '((".*" (agent-disable-undownloaded-faces t))
	("list\\..*" (subscribed . t) (total-expire . t))
	("misc\\..*" (total-expire . t))
	("Itr\\..*\\|db\\..*" (gnus-use-scoring nil))
	("nnfolder\\+archive:.*" (gnus-use-scoring nil))
	("mail\\..*\\|classmate\\..*" (gnus-use-scoring nil))))

(setq gnus-header-face-alist
      '(("From" nil gnus-header-from-face)
	("Subject" nil gnus-header-subject-face)
	("Newsgroups" nil gnus-header-newsgroups-face)
	("User-Agent\\|X-Mailer\\|X-Newsreader" nil gnus-header-subject-face)
	("" gnus-header-name-face gnus-header-content-face)))

(setq gnus-visible-headers 
      (concat "^From:\\|^Newsgroups:\\|^Subject:\\|^Date:\\|^Followup-To:"
	      "\\|^Reply-To:\\|^Summary:\\|^Keywords:\\|^To:\\|^[BGF]?Cc:"
	      "\\|^Posted-To:\\|^Mail-Copies-To:\\|^Mail-Followup-To:"
	      "\\|^Apparently-To:\\|^Gnus-Warning:\\|^Resent-From:\\|^X-Sent:"
	      "\\|^User-Agent:\\|^X-Mailer:\\|^X-Newsreader:"))


(setq gnus-default-charset 'cn-gb-2312
      gnus-group-name-charset-group-alist '((".*" . cn-gb-2312))
      gnus-summary-show-article-charset-alist '((1 . cn-gb-2312) (2 . big5))
      gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1))

(setq gnus-ignored-from-addresses
      (regexp-opt '("dddkk@sina.com" "spr@db.hit.edu.cn"
		    "spr@db.cs.hit.edu.cn" "chunyu@hit.edu.cn")))

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
	 (signature-file "~/.sig/default")
	 (name "Wang Chunyu")
	 (address "dddkk@sina.com"))
	("^nntp\\+aqua:.*"
	 (signature-file "~/.sig/localnews")
	 (name "王春宇")
	 (address "chunyu@hit.edu.cn"))
	("^cn\\..*\\|^nntp\\+news.*"
	 (signature-file "~/.sig/cnnews")
	 (name "进化的鱼")
	 (address "user@cyber.net")
	 ("X-Face" 'chunyu-gnus-x-face))
	("^nnml:list\\..*\\|^nnml:mail\\.foreigner\\|^nntp\\+news\\.gmane\\.org:.*\\|^nntp\\+news\\.gnus\\.org:.*"
	 (signature-file "~/.sig/pubmail")
	 (name "Chunyu Wang")
	 (address "spr@db.cs.hit.edu.cn")
	 ("X-Face" 'chunyu-gnus-x-face))
	("^nnml:\\(mail\\.\\(wife\\|classmate\\|lab\\|friends\\).*\\|classmate\\)"
	 (signature-file "~/.sig/mail")
	 (name "王春宇")
	 (address "chunyu@hit.edu.cn"))
	("cn.test"
	 (name "abc")
	 (address "xiaoludeche1980@eyou.com"))))
;; xiaoludeche1980@eyou.com
;; li_9888@hotmail.com
;; xuery@126.com
;; fj35@vip.sina.com


(setq sc-attrib-selection-list nil
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
      sc-use-only-preference-p nil)

(setq mail-self-blind t
      message-from-style 'angles
      message-kill-buffer-on-exit t
      message-cite-function 'sc-cite-original
      message-elide-ellipsis "\n  [...]\n"
      message-sendmail-envelope-from nil
      message-signature t
      message-signature-file "~/.sig/default"
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
      message-forward-as-mime nil)


(setq nnml-use-compressed-files t)

(setq nnmail-treat-duplicates 'delete
      nnmail-crosspost nil
      nnmail-split-methods 'nnmail-split-fancy
      nnmail-split-fancy-match-partial-words t
      nnmail-split-fancy
      '(|
	;; (to "Dddkk <dddkk@sina\\.com>" junk)
	(from "\\(root\\|news\\)@db\\.cs\\.hit\\.edu\\.cn" "misc.system")
	(any "scm@list.cn99.com" "list.cn99.scm")
	(any "emacs-devel@gnu.org" "list.emacs.emacs-devel")
	(any "ding@\\(gnus.org\\|hpc.uh.edu\\|lists.math.uh.edu\\)" "list.gnus.ding")
	(any "985101@db.cs.hit.edu.cn" "classmate.985101")
	(any "help-emacs-windows@gnu.org" "list.emacs.help-emacs-windows")
	(any "gnuwin32-users@lists.sourceforge.net" "list.gnuwin32-users")
	(any "tramp-devel@nongnu.org\\|tramp-devel@mail.freesoftware.fsf.org" "list.emacs.tramp-devel")
	(any "zhdotemacs@yahoogroups.com" "list.emacs.zhdotemacs")
	(from ".*-\\(request\\|owner\\|bounces\\)@.*" "list.misc-request")
	(to "chunyu@\\(db.\\|db.cs.\\)?hit.edu.cn\\|spr@db.\\(cs.\\)?hit.edu.cn\\|dddkk@\\(sina.com\\|163.net\\)"
	    (| (from "bbs@bbs\\|dddkk@smth" "mail.bbs")
	       (from "moomooo\\|beautifulbamboo\\|kexin\\|zjj259900\\|limoo" "classmate.misc")
	       (from "xiaonan\\|however\\|jellycart\\|iris_leilei\\|wangyang" "classmate.misc")
	       (from "huahua1027000\\|sunhaiyang\\|xingbaolin" "classmate.misc")
	       (from "pacz@sohu\\|pacz@pa18\\|tccz@sina" "mail.wife")
	       (from "m_pupil\\|zhoufei\\|liuqionline" "mail.friends")
	       (from "chunyu@hit.edu.cn\\|\\(spr\\|chunyu\\)@db.\\(cs.\\)?hit.edu.cn\\|dddkk@sina.com" "mail.myself")
	       (from "boldyrev" "mail.foreigner")
	       (from "applejelly326@yahoo.com.cn" "mail.lab")
	       ("X-Contactme" "chunyu-homepage" "mail.homepage")
	       "mail.misc"))
	(from "ccert\\.edu\\.cn" "mail.misc")
	;; (any "Microsoft\\|Corporation\\|Security\\|MS Customer" junk)
	"misc.junk"))

;; (defun message-make-message-id()
;;    (concat "<"(message-unique-id)"@cyber.net>"))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'mail-citation-hook 'sc-cite-original)
(add-hook 'message-mode-hook 
	  (lambda ()
	    (setq fill-column 72)
	    (turn-on-auto-fill)
	    (footnote-mode)))

;; (require 'message-x)

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

;; Chunyu's .gnus.el ends here.
