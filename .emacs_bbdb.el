;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs_bbdb.el is created on 2003/07/26 on db.cs.hit.edu.cn. 
;; Chunyu <chunyu@hit.edu.cn>.

(require 'supercite)
(require 'message)
(require 'bbdb)
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
      (regexp-opt '("dddkk@sina.com" "chunyu@hit.edu.cn" "spr@db.cs.hit.edu.cn" "spr@db.hit.edu.cn"))
      )

;; Chunyu's .emacs_bbdb.el ends here.
