;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .gnus.el is created on db.hit.edu.cn.    Chunyu.<dddkk@sina.com> 

;; Time-stamp: <2003-07-28 Mon 13:06:10 root on db.cs.hit.edu.cn>.

;; NNTP Hosts: 
;;  freenews.netfront.net, news.ind.mh.se
;;  news.gmane.org, news.gnus.org, news.cis.dfn.de
;;  news.freshmeat.net, news.uni-duisburg.de
;;  news.webking.cn, news.newsfan.net, new.cnnb.net

(setq gnus-select-method '(nntp "news.cn99.com")
      gnus-secondary-select-methods '((nnml "private") (nntp "localhost"))
      gnus-auto-select-first nil
      gnus-auto-select-subject 'first
      gnus-read-newsrc-file nil
      gnus-save-newsrc-file nil
      gnus-asynchronous t     ; *No* delay when I hop betwixt articles
      gnus-summary-display-while-building 50 ; Show us what you're doing, every fifty articles

      gnus-group-name-charset-group-alist '((".*" . gb2312))

      gnus-message-archive-group
      '((if (message-news-p) "misc-news"
	  (concat "mail." (format-time-string "%Y-%m"))))

      gnus-posting-styles
      '((".*" 
	 (signature-file "~/.sig/default")
	 (name "Wang Chunyu")
	 (address "o.oO@Oo.o"))
	("^nntp\\+localhost.*"  
	 (signature-file "~/.sig/localnews")
	 (name "王春宇")
	 (address "spr@db.hit.edu.cn"))
	("^cn\\..*\\|^nntp.*\\(webking\\|newsfan\\)"
	 (signature-file "~/.sig/cnnews")
	 (name "进化的鱼")
	 (address "o.oO@Oo.o"))
	("^nnml\\+private.*\\|mail"
	 (signature-file "~/.sig/mail")
	 (name "王春宇")
	 (address "dddkk@sina.com"))))

(setq sc-attrib-selection-list nil
      sc-auto-fill-region-p nil
      sc-blank-lines-after-headers 1
      sc-cite-blank-lines-p nil
      sc-electric-references-p nil
      sc-fixup-whitespace-p t
      sc-preferred-header-style 5
      sc-use-only-preference-p nil
      sc-preferred-attribution-list
      '("sc-lastchoice" "x-attribution" "initials" "firstname" "sc-consult" "lastname"))

(setq mail-self-blind t
      message-from-style 'angles
      message-kill-buffer-on-exit t
      ;;message-make-forward-subject-function 'message-forward-subject-fwd
      message-sendmail-envelope-from nil
      message-signature t
      message-signature-file "~/.sig/default"
      message-forward-as-mime nil
      message-forward-ignored-headers
      "^Content-Transfer-Encoding:\\|^X-\\|^Path\\|^Organization\\|^Message-ID\\|^References\\|^User-Agent\\|^Cancel\\|^NNTP\\|^Lines\\|^Received\\|^Reply-To\\|^Precedence\\|^Return-Path")


(setq nnmail-crosspost nil
      nnmail-split-methods
      '(("emacs-devel" "^\\(To:\\|[Cc]c:\\).*emacs-devel@gnu.org.*")
	("guile-user" "^\\(To:\\|[Cc]c:\\).*guile-user@gnu.org")
	("guile-sources" "^\\(To:\\|[Cc]c:\\).*guile-sources@gnu.org")
	("zope" "^\\(To:\\|[Cc]c:\\).*zope@zope.org")
	("bbs" "^From:.*\\(@bbs\\|@smth\\)")
	("wife" "^From:.*\\(pacz\\|tccz\\)")
	("classmate" "^From:.*\\(moomooo\\|beautifulbamboo\\|dangtx\\|kexin\\|zjj259900\\)")
	("classmate" "^From:.*\\(jellycart\\|limoo\\)")
	("classmate" "^Form:.*hit.edu.cn")
	("lab" "^From:.*db.hit.edu.cn")
	("misc" "^\\([Cc]c\\|To\\):.*\\(chunyu\\|spr\\|dddkk@sina.com\\)")
	("junk" "^From:.*sinamx.sina.com.cn")
	("junk" "")))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'mail-citation-hook 'sc-cite-original)
(add-hook 'message-mode-hook (lambda () (setq fill-column 72) (turn-on-auto-fill)))

(eval-after-load "mm-decode"
  '(progn
     (add-to-list 'mm-discouraged-alternatives "text/html")
     (add-to-list 'mm-discouraged-alternatives "text/richtext")))

(defun my-sc-header-fn ()
  "<bbdbname/aliasname/sc-author> (attrib) wrote (on <date>):"
  (condition-case nil
      (let* ((sc-mumble nil)   ; returned by sc-mail-field if no match
	     (sc-name (or (sc-mail-field "sc-author")
			  sc-default-author-name))
	     (email (or (sc-mail-field "sc-from-address") "noaddress"))
	     ;; Gnus does not have first two functions.
	     (name (or (if (fboundp 'bbdb/vm-alternate-full-name)
			   (bbdb/vm-alternate-full-name email))
		       (if (fboundp 'my-mail-lookup-in-aliases)
			   (my-mail-lookup-in-aliases email))
		       sc-name))
	     (date (sc-mail-field "date"))
	     (string "")
	     (attrib (sc-mail-field "sc-attribution"))
	     (attrib (if (string= attrib "") "" (format " (%s)" attrib)))
	     datelist zonesecs zonesign zonehrs zonemins dateint)
	;; Don't bother with dates for Gnus posts.
	(if (eq major-mode 'message-mode)
	    (setq date nil
		  ;; Decided no point quoting e-mail address.
		  ;; string (format " <%s> wrote" email)
		  string " wrote"))
	(if date
	    (setq datelist (parse-time-string date)
		  string   (format-time-string ; UT
			    "%a, %d %b %Y at %R %z"
			    (apply 'encode-time datelist) t)
		  zonesecs (car (last datelist))))
	;; Stop here (eg set zonesecs nil) if happy with times in UT.
	;; `parse-time-string' gives offset from UT in seconds.
	;; Convert to (sign)(hours)(mins).
	(if zonesecs			; nil if could not be parsed
	    (setq zonesign (if (< zonesecs 0) "-" "+")
		  zonesecs (abs zonesecs)
		  zonehrs  (floor (/ zonesecs 3600))
		  zonemins (/ (- zonesecs (* zonehrs 3600)) 60)
		  datelist (butlast datelist) ; remove TZ info
		  dateint  (apply 'encode-time datelist)
		  string   (format-time-string "%a, %d %b %Y at %R" dateint)
		  string   (format " wrote (on %s %s%.2d%.2d)"
				   string zonesign zonehrs zonemins)))
	(insert "\n" sc-reference-tag-string name attrib string ":\n"))
    (error (insert "\nNONAME wrote:\n" )
	   (message "Error in my-sc-header-fn"))))

(add-hook 'sc-load-hook
	  '(lambda () (if (boundp 'sc-rewrite-header-list)
			  (add-to-list 'sc-rewrite-header-list '(my-sc-header-fn)))))

