;; $Id$  -*- mode: Emacs-Lisp; coding: gb2312-unix; -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_bbdb.el, created on 2003/07/26 on db.cs.hit.edu.cn.

;;(global-set-key [(control tab)] 'bbdb-complete-name)

(require 'supercite)
(require 'message)
(require 'bbdb)
(require 'bbdb-snarf)
;;(require 'bbdb-gui)
;;(bbdb-initialize)
(bbdb-initialize 'gnus 'message 'sc)

(setq bbdb/gnus-score-default +20)
(setq gnus-score-find-score-files-function
      '(gnus-score-find-bnews bbdb/gnus-score))

;;(bbdb-define-all-aliases)

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(autoload 'bbdb-insinuate-sc "bbdb-sc" "bbdb sc init" nil)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-sc)

(setq bbdb-north-american-phone-numbers-p nil
      bbdb-check-zip-codes-p nil
      bbdb-electric-p t
      bbdb-use-pop-up nil		; 'horiz
      bbdb-pop-up-target-lines 1
      ;; bbdb-elided-display-fields '()
      bbdb-elided-display '(creation-date timestamp)
      bbdb-offer-save nil
      bbdb-complete-name-allow-cycling t
      bbdb-time-display-format "%Y-%m-%d"
      bbdb-user-mail-names
      (regexp-opt '("dddkk@sina.com"
		    "dddkk@163.net"
		    "chunyu@hit.edu.cn"
		    "emacs.bbs@bbs.hit.edu.cn" ; bbs.hit.edu.cn
		    "dddkk@smth.edu.cn"	       ; bbs smth.edu.cn
		    "python@bbs.ustc.edu.cn"   ; bbs.ustc.edu.cn
		    )))

;; (setq bbdb-print-full-alist
;;       '((columns . 4)
;; 	(separator . 2)
;; 	(include-files "bbdb-print" "bbdb-cols")))

(setq bbdb-display-layout-alist
      '((one-line (order phones net)
		  (name-end . 24)
		  (toggle . t))
	(multi-line (indention . 14)
		    (toggle . t)
		    (omit creation-date timestamp notes))
	(pop-up-multi-line  (indention . 14))))


(cond ((not window-system)
       (eval-after-load "bbdb-gui"
	 '(progn
	    (set-face-attribute 'bbdb-name nil  :foreground "gold" :underline nil)
	    (set-face-attribute 'bbdb-company nil :foreground "sandy brown")
	    (set-face-attribute 'bbdb-field-name nil :foreground "slate blue")
	    (set-face-attribute 'bbdb-field-value nil :foreground "deep sky blue" :weight 'normal))))

      (window-system
       (eval-after-load "bbdb-gui"
	 '(progn
	    (set-face-attribute 'bbdb-name nil  :foreground "gold" :underline nil)
	    (set-face-attribute 'bbdb-company nil :foreground "sandy brown")
	    (set-face-attribute 'bbdb-field-name nil :foreground "slate blue")
	    (set-face-attribute 'bbdb-field-value nil :foreground "deep sky blue" :weight 'normal)))))

;; Chunyu's .emacs_bbdb.el ends here.
