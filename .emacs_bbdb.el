;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs_bbdb.el is created on 2003/07/26 on db.cs.hit.edu.cn.
;; Chunyu <chunyu@hit.edu.cn>.

(require 'supercite)
(require 'message)
(require 'bbdb)
;;(require 'bbdb-gui)
;;(bbdb-initialize)
(bbdb-initialize 'gnus 'message 'sc)

(setq bbdb/gnus-score-default +20)
(setq gnus-score-find-score-files-function
      '(gnus-score-find-bnews bbdb/gnus-score))

;;(bbdb-define-all-aliases)

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

(setq bbdb-north-american-phone-numbers-p nil
      bbdb-check-zip-codes-p nil
      bbdb-electric-p t
      bbdb-use-pop-up nil		; 'horiz
      bbdb-pop-up-target-lines 1
      bbdb-elided-display-fields '(net)
      bbdb-elided-display t
      bbdb-offer-save nil
      bbdb-complete-name-allow-cycling t
      bbdb-user-mail-names
      (regexp-opt '("dddkk@sina.com"
		    "dddkk@163.net"
		    "chunyu@hit.edu.cn"
		    "chunyu@db.hit.edu.cn"
		    "chunyu@db.cs.hit.edu.cn"
		    "spr@db.hit.edu.cn"
		    "spr@db.cs.hit.edu.cn"
		    "emacs.bbs@bbs.hit.edu.cn" ; bbs.hit.edu.cn
		    "emacs.bbs@bbs.nju.edu.cn" ; bbs.nju.edu.cn
		    "dddkk@smth.edu.cn"	       ; bbs smth.edu.cn
		    "python@bbs.ustc.edu.cn"   ; bbs.ustc.edu.cn
		    )))

;; (cond ((not window-system)
;;        (set-face-attribute 'bbdb-name nil  :foreground "yellow" :underline nil)
;;        ;;(set-face-attribute 'bbdb-company nil :foreground "blue" :weight 'bold)
;;        (set-face-attribute 'bbdb-field-name nil :foreground "cyan")
;;        ;;(set-face-attribute 'bbdb-field-value nil :foreground "red" :weight 'normal)
;;        ))

;; Chunyu's .emacs_bbdb.el ends here.
