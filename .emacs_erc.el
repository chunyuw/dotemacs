;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu's .emacs_erc.el is created on 2003/07/26 on db.cs.hit.edu.cn. 
;; Chunyu <chunyu@hit.edu.cn>.

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
(add-hook 'erc-insert-modify-hook 'erc-fill)
(add-hook 'erc-send-modify-hook 'erc-fill)
(add-hook 'erc-mode-hook
	  '(lambda () (require 'erc-pcomplete)
	     (pcomplete-erc-setup) (erc-completion-mode 1)))
(erc-match-mode 1)
(erc-track-mode 1)

