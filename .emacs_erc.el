;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_erc.el, created on 2003/07/26 on db.cs.hit.edu.cn.

;; irc.sunnet.org, irc.linuxfire.com
;; irc.linuxfans.org, irc.pchome.net
(require 'erc)
(require 'erc-fill)
(require 'erc-match)
(require 'erc-notify)
(require 'erc-track)
(setq erc-auto-query t)
(setq erc-timestamp-format "[%H:%M] ")
(setq erc-fill-prefix "      + ")
(setq erc-current-nick-highlight-type 'nick)
(setq erc-default-coding-system 'cn-gb-2312)

(add-hook 'erc-insert-modify-hook 'erc-fill)
(add-hook 'erc-send-modify-hook 'erc-fill)
(add-hook 'erc-mode-hook
	  '(lambda () (require 'erc-pcomplete)
	     (pcomplete-erc-setup) (erc-completion-mode 1)))
(erc-match-mode 1)
(erc-track-mode 1)

;; Chunyu's .emacs_erc.el ends here.
