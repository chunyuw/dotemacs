;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .gnus.el is created on 2003/02/24 on db.hit.edu.cn.
;; Chunyu <chunyu@hit.edu.cn> 

(setq gnus-select-method '(nntp "news.yaako.com")
      gnus-secondary-select-methods '((nnml "private") (nntp "localhost")))

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
      )

(setq gnus-default-charset 'cn-gb-2312
      gnus-group-name-charset-group-alist '((".*" . gb2312))
      gnus-summary-show-article-charset-alist '((1 . cn-gb-2312) (2 . big5))
      gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1)
      gnus-group-posting-charset-alist
      '(("^\\(cn\\)\\.[^,]*\\(,[ 	\n]*\\(cn\\)\\.[^,]*\\)*$" gb2312 (gb2312))
	(message-this-is-mail nil nil)
	(message-this-is-news nil t)))

(define-coding-system-alias 'gb18030 'gb2312)

(setq gnus-message-archive-group
      '((if (message-news-p)
	    (concat "news." (format-time-string "%Y-%m"))
	  (concat "mail." (format-time-string "%Y-%m")))))

(setq gnus-posting-styles
      '((".*" 
	 (signature-file "~/.sig/default")
	 (name "Wang Chunyu")
	 (address "dddkk@sina.com"))
	("^nntp\\+localhost.*"  
	 (signature-file "~/.sig/localnews")
	 (name "王春宇")
	 (address "chunyu@hit.edu.cn"))
	("^cn\\..*\\|^nntp.*"
	 (signature-file "~/.sig/cnnews")
	 (name "进化的鱼")
	 (address "dddkk@sina.com")) ;; o.oO@Oo.o
	("^nnml\\+private.*\\|mail"
	 (signature-file "~/.sig/mail")
	 (name "王春宇")
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

(setq nnmail-crosspost nil
      nnmail-split-methods
      '(("emacs-devel" "^\\(To:\\|[Cc]c:\\).*emacs-devel@gnu.org.*")
	("emacs-bidi" "^\\(To:\\|[Cc]c:\\).*emacs-bidi@gnu.org.*")
	("guile-user" "^\\(To:\\|[Cc]c:\\).*guile-user@gnu.org")
	("guile-sources" "^\\(To:\\|[Cc]c:\\).*guile-sources@gnu.org")
	("zope" "^\\(To:\\|[Cc]c:\\).*zope@zope.org")
	("bbs" "^From:.*\\(@bbs\\|@smth\\)")
	("wife" "^From:.*\\(pacz\\|tccz\\)")
	("985101-admin" "^\\(To:\\|[Cc]c:\\).*985101-\\(admin\\|owner\\|request\\)")
	("985101" "^\\(To:\\|[Cc]c:\\).*985101")
	("classmate" "^From:.*\\(moomooo\\|beautifulbamboo\\|kexin\\|zjj259900\\)")
	("classmate" "^From:.*\\(jellycart\\|limoo\\|xiaonan\\)")
	("friends" "^From:.*\\(m_pupil@yahoo.com.cn\\)")
	("lab" "^From:.*db.cs.hit.edu.cn")
	("misc" "^From:.*hit.edu.cn")
	("misc" "^\\([Cc]c\\|To\\):.*\\(chunyu\\|spr\\|dddkk@sina.com\\)")
	("junk" "^From:.*sinamx.sina.com.cn")
	("junk" "")))

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
