(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (setq fill-paragraph-function nil)))

(add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)

(setq TeX-command-default "LaTeX PDF")

(require 'tex-site)
