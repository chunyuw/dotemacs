;; -*- mode: emacs-lisp -*-

;; (set-language-environment    'UTF-8)
;; (setq default-file-name-coding-system 'chinese-gbk)

(eval-after-load 'auto-install
  '(setq auto-install-directory (substitute-in-file-name "$emacs_dir/site-lisp/misc/")))

(set-language-environment    'Chinese-GB18030)
(set-default-coding-systems  'chinese-gb18030)
(set-keyboard-coding-system  'chinese-gb18030)
(set-terminal-coding-system  'chinese-gb18030)
(set-clipboard-coding-system 'chinese-gb18030)
(set-selection-coding-system 'chinese-gb18030)

(server-mode 1)
