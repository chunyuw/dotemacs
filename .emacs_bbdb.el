;; $Id$  -*- mode: Emacs-Lisp; coding: gb2312-unix; -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_bbdb.el, created on 2003/07/26 on db.cs.hit.edu.cn.

(require 'supercite)
(require 'message)
(require 'bbdb)
(require 'bbdb-snarf)

(bbdb-initialize 'gnus 'message 'sc)

;; (bbdb-define-all-aliases)

(autoload 'bbdb-insinuate-sc "bbdb-sc" "bbdb sc init" nil)

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-sc)

(setq bbdb-file "~/.emacs.d/.bbdb")

(setq bbdb-north-american-phone-numbers-p nil
      bbdb-check-zip-codes-p nil
      bbdb-electric-p t
      bbdb-use-pop-up nil
      bbdb-pop-up-target-lines 1
      bbdb-elided-display '(creation-date timestamp)
      bbdb-offer-save nil
      bbdb-complete-name-allow-cycling t
      bbdb-time-display-format "%Y-%m-%d")

(setq bbdb-user-mail-names
      (regexp-opt '("dddkk@sina.com" "chunyu@hit.edu.cn"
		    "emacs@bbs.hit.edu.cn" "dddkk@smth.edu.cn"
		    "cymacs@gmail.com")))

(setq bbdb/gnus-score-default +20)
(setq gnus-score-find-score-files-function
      '(gnus-score-find-bnews bbdb/gnus-score))

(setq bbdb-display-layout-alist
      '((one-line (order phones net)
		  (name-end . 24)
		  (toggle . t))
	(multi-line (indention . 14)
		    (toggle . t)
		    (omit creation-date timestamp notes))
	(pop-up-multi-line  (indention . 14))))

(cond (window-system
       (eval-after-load "bbdb-gui"
	 '(progn
	    (set-face-attribute 'bbdb-name nil  :foreground "gold" :underline nil)
	    (set-face-attribute 'bbdb-company nil :foreground "sandy brown")
	    (set-face-attribute 'bbdb-field-name nil :foreground "slate blue")
	    (set-face-attribute 'bbdb-field-value nil :foreground "deep sky blue" :weight 'normal)))))

;; Chunyu's .emacs_bbdb.el ends here.
