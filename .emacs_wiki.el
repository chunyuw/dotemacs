;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_wiki.el, created on 2003/11/17 on db.cs.hit.edu.cn.

(require 'emacs-wiki)

(setq emacs-wiki-charset-default "gb2312")
(setq emacs-wiki-coding-default 'gb2312)

(setq emacs-wiki-index-page "WikiIndex")

(setq emacs-wiki-pretty-changelogs t)

(setq emacs-wiki-publishing-header 
      (concat "<!--#let title_or_id=\"'<lisp>(emacs-wiki-page-title)</lisp>'\"-->\n"
	      "<!--#var standard_html_header-->\n<!--#/let-->\n\n"))

(setq emacs-wiki-publishing-footer
      "\n<!--#var standard_html_footer-->\n")

(setq emacs-wiki-maintainer "&dtml.url-contact;?subject=[Lack of Item]")
;;(setq emacs-wiki-maintainer "mailto:spr@db.cs.hit.edu.cn?Subject=[Lack of Item]")

(add-hook 'emacs-wiki-mode-hook 'auto-fill-mode)

;;<!-- Update: <lisp>(format-time-string emacs-wiki-footer-date-format (nth 5 (file-attributes buffer-file-name)))</lisp> -->

;; Chunyu's .emacs_wiki.el ends here.
