;; $Id$  -*- mode: Emacs-Lisp; coding: gb2312-unix; -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_tex.el, created on 2004/04/15 on db.cs.hit.edu.cn.

(require 'tex-site)

(add-hook 'TeX-mode-hook 
	  (lambda () 
	    (setq reftex-plug-into-AUCTeX t)
	    (turn-on-reftex)
	    ;; (flyspell-mode)
	    (auto-fill-mode)))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (setq fill-paragraph-function nil)))

(setq TeX-command-list 
      '(("TeX" "tex %S \\nonstopmode\\input %t" TeX-run-TeX nil (plain-tex-mode))
	("LaTeX" "%l \\nonstopmode\\input{%t}" TeX-run-TeX nil (latex-mode))
	("PDFLaTeX" "pdflatex %S \\nonstopmode\\input{%t}" TeX-run-TeX nil (latex-mode))
	("ConTeXt" "texexec --once --nonstop --texutil %t" TeX-run-TeX nil (context-mode))
	("ConTeXt PDF" "texexec --pdf %t" TeX-run-TeX nil (context-mode))
	;; ("ConTeXt Interactive" "texexec --once --texutil %t" TeX-run-interactive t (context-mode))
	;; ("ConTeXt Full" "texexec %t" TeX-run-interactive nil (context-mode))
	("ConTeXt Clean" "texutil --purgeall" TeX-run-interactive nil (context-mode))
	("View" "%V" TeX-run-w32-explorer nil t) ;TeX-run-discard
	("PsView" "gsview32 %f" TeX-run-command t t)
	("Dvips" "dvips %d -o %f " TeX-run-command t t)
	("BibTeX" "bibtex %s" TeX-run-BibTeX nil t)
	("Index" "makeindex %s" TeX-run-command nil t)
	("Check" "lacheck %s" TeX-run-compile nil t)))

(setq TeX-output-view-style
      '(("^ps$" "." "%f")
	("^pdf$" "." "%o")
	("^html?$" "." "%o") 
	("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "dvips %d -o && gv %f")
	("^dvi$" ("^landscape$" "^pstricks$\\|^psfrag$") "dvips -t landscape %d -o && gv %f")
	;; ("^dvi$" "^a4\\(?:dutch\\|paper\\|wide\\)?\\|sem-a4$" "xdvi %d -paper a4")
	;; ("^dvi$" ("^a5\\(?:comb\\|paper\\)?$" "^landscape$") "xdvi %d -paper a5r -s 0")
	;; ("^dvi$" "^a5\\(?:comb\\|paper\\)?$" "xdvi %d -paper a5")
	;; ("^dvi$" "^b5paper$" "xdvi %d -paper b5")
	;; ("^dvi$" "^letterpaper$" "xdvi %d -paper us")
	;; ("^dvi$" "^legalpaper$" "xdvi %d -paper legal")
	;; ("^dvi$" "^executivepaper$" "xdvi %d -paper 7.25x10.5in")
	;; ("^dvi$" "^landscape$" "xdvi %d -paper a4r -s 0")
	("^dvi$" "." "%d")))

(defun TeX-run-w32-explorer (name command file)
  "TeX-command-list function."
  (let ((default-directory (TeX-master-directory)))
    (w32-shell-execute "open" command nil 3)))

;;-- LaTeX-Preview --;;
;; (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
;; (setq preview-scale-function 1.5)

;; Chunyu's .emacs_tex.el ends here.
