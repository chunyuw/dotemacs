;; -*- Emacs-lisp -*-

(setq gnus-select-method '(nntp "news.cn99.com"))
(setq gnus-secondary-select-methods '((nnml "private")))
(add-to-list 'gnus-secondary-select-methods '(nntp "localhost"))
;;(add-to-list 'gnus-secondary-select-methods '(nntp "news.bentium.com"))
;;(add-to-list 'gnus-secondary-select-methods '(nntp "freenews.netfront.net"))
;;(add-to-list 'gnus-secondary-select-methods '(nntp "news.so-net.com.hk"))
;;(add-to-list 'gnus-secondary-select-methods '(nntp "news.zixia.com"))
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq nnmail-split-methods
      '(("emacs-devel" "^\\(To:\\|[Cc]c:\\).*emacs-devel@gnu.org.*")
	("zope" "^\\(To:\\|[Cc][Cc]:\\).*zope@zope.org.*")
	("bbs" "^From: .*\\.bbs@bbs.hit.edu.cn")
	("lab" "^From:.*db.hit.edu.cn")
	("default" "")))
;;(setq mail-sources
;;      '( 
;;	(file :path "/var/spool/mail/spr")
;;	(pop :server "pop3.sina.com.cn" :user "dddkk" :password "sssss")
;;	))
