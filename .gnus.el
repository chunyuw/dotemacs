;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .gnus.el is created on db.hit.edu.cn.    Chunyu.<dddkk@sina.com> 

;; nntp hosts: news.bentium.com, freenews.netfront.net,
;;  news.zixia.com, news.webking.cn, news.newsfan.net
;;国内: news.cnnb.net 国外: news.ind.mh.se


(setq gnus-select-method '(nntp "news.cn99.com"))
(setq gnus-secondary-select-methods '((nnml "private")))
(add-to-list 'gnus-secondary-select-methods '(nntp "localhost"))

(setq gnus-message-archive-group
      '((if (message-news-p) "misc-news"
          (concat "mail." (format-time-string "%Y-%m")))))
(setq gnus-group-name-charset-group-alist
      '((".*" . gb2312)))


(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'mail-citation-hook 'sc-cite-original)
(add-hook 'message-mode-hook
	  (lambda () (setq fill-column 72) (turn-on-auto-fill)))

(setq nnmail-crosspost nil)
(setq nnmail-split-methods
      '(("emacs-devel" "^\\(To:\\|[Cc]c:\\).*emacs-devel@gnu.org.*")
	("zope" "^\\(To:\\|[Cc]c:\\).*zope@zope.org")
	("bbs" "^From:.*\\(@bbs\\|@smth\\)")
	("wife" "^From:.*\\(pacz\\|tccz\\)")
	("classmate" "^From:.*\\(moomooo\\|beautifulbamboo\\)")
	("classmate" "^Form:.*hit.edu.cn")
	("lab" "^From:.*db.hit.edu.cn")
	("misc" "^\\([Cc]c\\|To\\):.*\\(chunyu\\|spr\\|dddkk@sina.com\\)")
	;;("junk" "^From:.*sinamx.sina.com.cn")
	("junk" "")))

(setq gnus-posting-styles
      '((".*" 
	 (signature-file "~/.signature/default")
	 (name "Wang Chunyu")
	 (address "o.oO@Oo.o"))
	("^nntp\\+localhost.*"  
	 (signature-file "~/.signature/localnews")
	 (name "王春宇")
	 (address "spr@db.hit.edu.cn"))
	("^cn\\..*\\|^nntp.*\\(webking\\|newsfan\\)"
	 (signature-file "~/.signature/cnnews")
	 (name "进化的鱼")
	 (address "o.oO@Oo.o"))
	("^nnml\\+private.*\\|mail"
	 (signature-file "~/.signature/mail")
	 (name "王春宇")
	 (address "dddkk@sina.com"))))


(eval-after-load "mm-decode"
  '(progn
     (add-to-list 'mm-discouraged-alternatives "text/html")
     (add-to-list 'mm-discouraged-alternatives "text/richtext")))
