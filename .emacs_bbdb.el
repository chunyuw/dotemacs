;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs_bbdb.el is created on 2003/07/26 on db.cs.hit.edu.cn. 
;; Chunyu <chunyu@hit.edu.cn>.

(require 'bbdb)
(bbdb-initialize)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(bbdb-insinuate-message)

