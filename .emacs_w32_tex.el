;; $Id$  -*- mode: Emacs-Lisp; coding: gb2312-unix; -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_tex.el, created on 2004/04/15 on db.cs.hit.edu.cn.

(require 'tex-site)

(add-hook 'TeX-mode-hook 
	  (lambda () 
	    (setq reftex-plug-into-AUCTeX t)
	    (turn-on-reftex)
	    ;; (flyspell-mode)
	    (auto-fill-mode)))

;; (add-hook 'LaTeX-mode-hook
;; 	  (lambda ()
;; 	    (setq fill-paragraph-function nil)))

;; (cond ((eq window-system 'w32) 
;;        (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
;;        (setq preview-scale-function 1.5)
;;        ))

(setq TeX-command-list 
      '(("TeX" "tex %S \\nonstopmode\\input %t" TeX-run-TeX nil (plain-tex-mode))
	("LaTeX" "%l \\nonstopmode\\input{%t}" TeX-run-TeX nil (latex-mode))
	("PDFLaTeX" "pdflatex %S \\nonstopmode\\input{%t}" TeX-run-TeX nil (latex-mode))
	("ConTeXt" "texexec --once --nonstop --texutil %t" TeX-run-TeX nil (context-mode))
	("ConTeXt PDF" "texexec --pdf %t" TeX-run-TeX nil (context-mode))
	("ConTeXt Interactive" "texexec --once --texutil %t" TeX-run-interactive t (context-mode))
	("ConTeXt Full" "texexec %t" TeX-run-interactive nil (context-mode))
	("ConTeXt Clean" "texutil --purgeall" TeX-run-interactive nil (context-mode))
	("View" "%v" TeX-run-discard nil t)
	("Print" "gsview32 %f" TeX-run-command t t)
	("File" "dvips %d -o %f " TeX-run-command t t)
	("BibTeX" "bibtex %s" TeX-run-BibTeX nil t)
	("Index" "makeindex %s" TeX-run-command nil t)
	("Check" "lacheck %s" TeX-run-compile nil t)))

;; Chunyu's .emacs_tex.el ends here.
