;; $Id$  -*- Emacs-Lisp -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_faces.el, created on 2003/11/20 on db.cs.hit.edu.cn.

(cond ((not window-system)
       ;; Text-Only console
       (set-face-attribute 'highlight nil
			   :foreground "white"
			   :background "blue"
			   :underline nil
			   :weight 'normal)
       (set-face-attribute 'region nil :background "blue")

       (eval-after-load "log-view"
	 '(progn
	    (set-face-attribute 'log-view-file-face nil
				:foreground "blue"
				:weight 'bold)
	    (set-face-attribute 'log-view-message-face nil
				:foreground "yellow"
				:weight 'bold)))

       (eval-after-load "ediff-init"
	 '(progn
	    (set-face-attribute 'ediff-current-diff-face-A nil
				:background "blue"
				:foreground "red"
				:weight 'bold)
	    (set-face-attribute 'ediff-current-diff-face-B nil
				:background "blue"
				:foreground "yellow"
				:weight 'bold)
	    (set-face-attribute 'ediff-current-diff-face-C nil
				:background "blue"
				:foreground "magenta"
				:weight 'bold)
	    (set-face-attribute 'ediff-even-diff-face-A nil
				:background "black"
				:foreground "red")
	    (set-face-attribute 'ediff-even-diff-face-B nil
				:background "black"
				:foreground "blue")
	    (set-face-attribute 'ediff-even-diff-face-C nil
				:background "black"
				:foreground "magenta")
	    (set-face-attribute 'ediff-fine-diff-face-A nil
				:background "cyan"
				:foreground "red")
	    (set-face-attribute 'ediff-fine-diff-face-B nil
				:background "cyan"
				:foreground "yellow"
				:weight 'bold)
	    (set-face-attribute 'ediff-fine-diff-face-C nil
				:background "cyan"
				:foreground "magenta"
				:weight 'bold)
	    (set-face-attribute 'ediff-odd-diff-face-A nil
				:background "black"
				:foreground "red3"
				:weight 'bold)
	    (set-face-attribute 'ediff-odd-diff-face-B nil
				:background "black"
				:foreground "yellow"
				:weight 'bold)
	    (set-face-attribute 'ediff-odd-diff-face-C nil
				:background "black"
				:foreground "magenta"
				:weight 'bold)
	    (set-face-attribute 'ediff-current-diff-face-Ancestor nil
				:background "magenta"
				:foreground "black")
	    (set-face-attribute 'ediff-even-diff-face-Ancestor nil
				:background "cyan"
				:foreground "black")
	    (set-face-attribute 'ediff-fine-diff-face-Ancestor nil
				:background "cyan"
				:foreground "black")
	    (set-face-attribute 'ediff-odd-diff-face-Ancestor nil
				:background "black"
				:foreground "green"
				:weight 'bold))))

      (window-system
       ;; BOTH X-Window and MS-Windows
       (set-face-attribute 'fringe nil
			   :foreground "limegreen"
			   :background "gray30")
       (set-face-attribute 'menu nil
			   :foreground "Wheat"
			   :background "DarkSlateGrey")
       (set-face-attribute 'minibuffer-prompt nil
			   :foreground "chocolate1")
       (set-face-attribute 'mode-line nil
			   :foreground "black"
			   :background "wheat"
			   :box nil)
       (set-face-attribute 'mode-line-inactive nil
			   :foreground "grey90"
			   :background "grey30"
			   :box '(:color "grey50"))
       (set-face-attribute 'region nil
			   :background "grey21")
       (set-face-attribute 'tool-bar nil
			   :background "DarkSlateGrey")
       (set-face-attribute 'trailing-whitespace nil
			   :background "SeaGreen1")))

;; Chunyu's .emacs_faces.el ends here.
