;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .gnus.el is created on 2003/02/24 on db.hit.edu.cn.
;; Chunyu <chunyu@hit.edu.cn>

(setq gnus-select-method '(nntp "news.yaako.com")
      gnus-secondary-select-methods
      '((nnml "private") 
	(nntp "localhost") 
	(nntp "news.newsfan.net")))

(setq gnus-auto-select-subject 'first
      gnus-auto-select-first nil
      gnus-read-active-file nil
      gnus-read-newsrc-file nil
      gnus-save-newsrc-file nil
      gnus-save-killed-list nil
      gnus-asynchronous t
      gnus-summary-display-while-building 50

      gnus-always-read-dribble-file t

      gnus-treat-strip-trailing-blank-lines 'last
      gnus-treat-strip-leading-blank-lines 'last
      gnus-treat-strip-multiple-blank-lines 'last

      gnus-header-face-alist
      '(("From" nil gnus-header-from-face)
	("Subject" nil gnus-header-subject-face)
	("Newsgroups" nil gnus-header-newsgroups-face)
	("User-Agent\\|X-Mailer\\|X-Newsreader" nil gnus-header-subject-face)
	("" gnus-header-name-face gnus-header-content-face))
      )

(setq gnus-default-charset 'cn-gb-2312
      gnus-group-name-charset-group-alist '((".*" . gb2312))
      gnus-summary-show-article-charset-alist '((1 . cn-gb-2312) (2 . big5))
      gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1)
      gnus-group-posting-charset-alist
      '(("^\\(cn\\)\\.[^,]*\\(,[ 	\n]*\\(cn\\)\\.[^,]*\\)*$" gb2312 (gb2312))
	("^\\(�����\\|��������\\).*" gb2312 (gb2312))
	("^\\(Itr\\|db\\).*" gb2312 (gb2312))
	(message-this-is-mail nil nil)
	(message-this-is-news nil t)))

(define-coding-system-alias 'gb18030 'gb2312)

(setq gnus-message-archive-group
      '((if (message-news-p)
	    (concat "news." (format-time-string "%Y-%m"))
	  (concat "mail." (format-time-string "%Y-%m")))))

(setq chunyu-gnus-x-face 
      (concat "$,MrC{\".#Of\"+5o4f&\"Y%BEXbu::2[3u0PK.G\\]'&Irj>a"
	      "%BRPq%aA\"6f<Ywarj_/AR5<o9'<!\"9.\\ZqzkDv-OK0&Vx&D"
	      "(0'5O(jx,]LgQk/J@P<F$X\\br>y\"[Eo8lEBloB*tfsz~]\\L"
	      "l\\}&C{}ar^R\\Ic9shnEW?'8o-9%MQ03+izFFbQV&CUKVd>%V"
	      "1sog)m1$L=Z(K!I5ID8nucdF}Bb(/r>b]7*t@GP%=VS_~:&~:F"
	      "$?7,i1Wqj\\C(q)|@71421c2ynlCQ<u%\"'6|28Oww\":7N6=F"
	      "s/?mUj&_^u&\\^yrrY{O"))

(setq gnus-posting-styles
      '((".*"
	 (signature-file "~/.sig/default")
	 (name "Wang Chunyu")
	 (address "dddkk@sina.com"))
	("^nntp\\+localhost:.*"
	 (signature-file "~/.sig/localnews")
	 (name "������")
	 (address "chunyu@hit.edu.cn"))
	("^cn\\..*\\|^nntp\\+news.*"
	 (signature-file "~/.sig/cnnews")
	 (name "��������")
	 (address "dddkk@sina.com")	; o.oO@Oo.o
	 ("X-Face" 'chunyu-gnus-x-face))
	("^nnml\\+private:\\(emacs\\|guile\\|ding\\).*"
	 (signature-file "~/.sig/pubmail")
	 (name "Chunyu Wang")
	 (address "spr@db.cs.hit.edu.cn"))
	("^nnml\\+private:\\(985101\\|classmate\\|lab\\|wife\\).*"
	 (signature-file "~/.sig/mail")
	 (name "������")
	 (address "chunyu@hit.edu.cn"))))

(setq sc-attrib-selection-list nil
      sc-auto-fill-region-p nil
      sc-blank-lines-after-headers 1
      sc-citation-delimiter-regexp "[>]+\\|\\(: \\)+"
      sc-cite-blank-lines-p nil
      sc-confirm-always-p nil
      sc-electric-references-p nil
      sc-fixup-whitespace-p t
      sc-nested-citation-p nil
      sc-preferred-header-style 5
      sc-use-only-preference-p nil
      )

(setq mail-self-blind t
      message-from-style 'angles
      message-kill-buffer-on-exit t
      message-cite-function 'sc-cite-original
      message-elide-ellipsis "    [...]\n"
      message-sendmail-envelope-from nil
      message-signature t
      message-signature-file "~/.sig/default"
      message-forward-as-mime nil
      message-forward-ignored-headers
      (concat
       "^X-\\|^Old-\\|^Xref:\\|^Path:\\|^[Cc]c:\\|^Lines:\\|^Sender:"
       "\\|^Thread-\\|^[GB]cc:\\|^Reply-To:\\|^Received:\\|^User-Agent:"
       "\\|^Message-ID:\\|^Precedence:\\|^References:\\|^Return-Path:"
       "\\|^Cancel-Lock:\\|^Delivered-To:\\|^Organization:\\|^content-class:"
       "\\|^Mail-Copies-To:\\|^Return-Receipt-To:\\|^NNTP-Posting-Date:"
       "\\|^NNTP-Posting-Host:\\|^Content-Transfer-Encoding:"
       "\\|^Disposition-Notification-To:\\|^In-Reply-To:\\|^List-"
       "\\|^Status:\\|^Errors-To:\\|FL-Build:"))

(setq nnmail-treat-duplicates 'delete
      nnmail-crosspost nil
      nnmail-split-methods 'nnmail-split-fancy
      nnmail-split-fancy
      '(| 
	(from "sinamx.sina.com.cn" "misc.junk")
	(any "emacs-devel@gnu.org" "list.emacs-devel")
	(any "guile-user@gnu.org" "list.guile-user")
	(any "guile-sources@gnu.org" "list.guile-sources")
	(any "ding@gnus.org" "list.ding")
	(any "zope@zope.org" "list.zope")
	(any "985101.*@db.cs.hit.edu.cn" "classmate.985101")
	(to  "chunyu@hit.edu.cn" - 
	     "dddkk@sina.com" - 
	     "spr@db.cs.hit.edu.cn" - 
	     "spr@db.hit.edu.cn" 
	     (| (from "moomooo" - 
		      "beautifulbamboo" - 
		      "kexin" - 
		      "zjj259900" - 
		      "jellycart" - 
		      "limoo" - 
		      "xiaonan" - 
		      "however"
		      "classmate.misc")
		(from "pacz@sohu.com" -
		      "pacz@pa18.com" -
		      "tccz@sina.com"
		      "mail.wife")
		(from "m_pupil@yahoo.com.cn""mail.friends")
		(from "@bbd" - "@smth" "mail.bbs")
		"mail.misc"))
	"misc.misc")
      )

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'mail-citation-hook 'sc-cite-original)
(add-hook 'message-mode-hook (lambda () (setq fill-column 72) (turn-on-auto-fill)))

(eval-after-load "mm-decode"
  '(progn (add-to-list 'mm-discouraged-alternatives "text/html")
	  (add-to-list 'mm-discouraged-alternatives "text/richtext")))

;; (gnus-demon-init)
;; (gnus-demon-add-rescan)
;; (gnus-demon-add-disconnection)
;; (gnus-demon-add-scanmail)

(require 'gnus-sum)
(defface chunyu-gnus-own-posting-face nil
  "Use this face to display own postings in Summary Buffer")
(copy-face 'gnus-summary-high-unread-face 'chunyu-gnus-own-posting-face)
(set-face-foreground 'chunyu-gnus-own-posting-face "red")

(defface chunyu-gnus-direct-fup-face nil
  "Use this face to display direct fups to my postings.")
(copy-face 'gnus-summary-high-unread-face 'chunyu-gnus-direct-fup-face)
(set-face-foreground 'chunyu-gnus-direct-fup-face "blue")

(defface chunyu-gnus-indirect-fup-face nil
  "Use this face to display indirect fups to my postings")
(copy-face 'gnus-summary-high-unread-face 'chunyu-gnus-indirect-fup-face)
(set-face-foreground 'chunyu-gnus-indirect-fup-face "blue")

(add-to-list 'gnus-summary-highlight
             '((and (> score 8500) (eq mark gnus-unread-mark)) . chunyu-gnus-own-posting-face))
(add-to-list 'gnus-summary-highlight
             '((and (and (>= 8500 score) (>= score 7500)) (eq mark gnus-unread-mark)) . chunyu-gnus-direct-fup-face))
(add-to-list 'gnus-summary-highlight
             '((and (and (>= 7499 score) (>= score 6500)) (eq mark gnus-unread-mark)) . chunyu-gnus-indirect-fup-face))


;; .gnus.el ends here.
