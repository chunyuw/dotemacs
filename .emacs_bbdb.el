;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs_bbdb.el is created on 2003/07/26 on db.cs.hit.edu.cn. 
;; Chunyu <chunyu@hit.edu.cn>.

(require 'bbdb)
(bbdb-initialize)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

(setq bbdb-north-american-phone-numbers-p nil
      bbdb-check-zip-codes-p nil
      bbdb-electric-p t
      bbdb-use-pop-up nil		; 'horiz
      bbdb-pop-up-target-lines 1
      bbdb-elided-display-fields '(net)
      bbdb-elided-display t
      bbdb-offer-save nil
)

