;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs_bbdb.el is created on 2003/07/26 on db.cs.hit.edu.cn. 
;; Chunyu <chunyu@hit.edu.cn>.

(require 'bbdb)
(bbdb-initialize)
;;(bbdb-initialize 'gnus 'message 'sc)

(setq bbdb/gnus-summary-known-poster-mark "B")
(setq gnus-summary-line-format "%ub %U%R%z%I%(%[%4L: %-20,20n%]%) %s\n")
;; gnus-summary-line-format's default value is "%U%R%z%I%(%[%4L: %-23,23f%]%) %s\n"

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

      bbdb-user-mail-names
      (regexp-opt '("dddkk@sina.com" "chunyu@hit.edu.cn" "spr@db.cs.hit.edu.cn" "spr@db.hit.edu.cn"))
)
