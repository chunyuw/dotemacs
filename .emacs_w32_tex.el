;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_tex.el, created on 2004/04/15 on db.cs.hit.edu.cn.

(setq TeX-command-default "LaTeX PDF")

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (setq fill-paragraph-function nil)))

(cond ((eq window-system 'w32) 
       (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)))

(require 'tex-site)

;; Chunyu's .emacs_tex.el ends here.
