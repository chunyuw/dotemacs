;; $Id$

;; From: Katsumi Yamaoka <yamaoka@jpl.org>
;; Subject: Re: multiple message frames
;; To: ding@gnus.org
;; Newsgroups: gnus.ding
;; Date: Thu, 11 Sep 2003 16:06:37 +0900
;; 
;; Hi,
;; 
;; This is the revised version of the "multiple message frames" suit.
;; It makes it possible to open multiple message frames and delete
;; each frame automatically after sending or killing it.  You can use
;; it by simply putting it in your .gnus.el file.  Enjoy!
;;

(let* ((default
	 ;; Winodw layout for normal message frames.
	 '(vertical
	   ((user-position . t)
	    ;;(left . -1) (top . 1)
	    (width . 80) (height . 40))
	   (message 1.0 point)))
       (bug
	;; Window layout for message frames reporting bugs.
	;; Note that multiple gnus-bug frames are not supported.
	'(vertical
	  ((user-position . t)
	   ;;(left . -1) (top . 1)
	   (width . 80) (height . 40))
	  (if gnus-bug-create-help-buffer '("*Gnus Help Bug*" 0.5))
	  ("*Gnus Bug*" 1.0 point)))
       (config
	`(frame
	  1.0
	  (if (buffer-live-p gnus-summary-buffer)
	      (if (get-buffer gnus-article-buffer)
		  (car (cdr (assq 'article gnus-buffer-configuration)))
		(car (cdr (assq 'summary gnus-buffer-configuration))))
	    (car (cdr (assq 'group gnus-buffer-configuration))))
	  ,default))
       (settings '(compose-bounce forward mail-bounce message post
				  reply reply-yank)))
  (while settings
    (gnus-add-configuration (list (car settings) config))
    (setq settings (cdr settings)))
  (setcdr (nthcdr 2 (setq config (copy-sequence config))) (list bug))
  (gnus-add-configuration (list 'bug config)))

(add-hook
 'gnus-configure-windows-hook
 (lambda nil
   (if (eq major-mode 'message-mode)
       (let* ((message-frame (selected-frame))
	      (delete-frame-function
	       `(lambda nil
		  (if (and
		       ;; Uncomment the following line if other windows
		       ;; in message frames are supposed to be important.
		       ;;(eq (selected-window) (next-window))
		       (eq (selected-frame) ,message-frame))
		      (delete-frame ,message-frame)))))
	 (setq gnus-frame-list (delq message-frame gnus-frame-list)
	       message-exit-actions `((funcall ,delete-frame-function))
	       message-postpone-actions message-exit-actions)
	 (if (or (featurep 'xemacs)
		 (< emacs-major-version 21))
	     (make-local-hook 'kill-buffer-hook))
	 (add-hook 'kill-buffer-hook `,delete-frame-function t t)))))

;; Don't popup a message frame when sending a queued message.
(add-hook
 'gnus-message-setup-hook
 (lambda nil
   (if (or (memq this-command '(gnus-draft-send-message
				gnus-draft-send-all-messages
				gnus-group-send-queue))
	   (and (featurep 'gnus-delay)
		(save-excursion
		  (save-restriction
		    (widen)
		    (message-narrow-to-headers)
		    (re-search-forward
		     (concat "^" (regexp-quote gnus-delay-header)
			     ":\\s-+")
		     nil t)))))
       (let ((config (copy-sequence gnus-buffer-configuration)))
	 (set (make-local-variable 'gnus-buffer-configuration)
	      (cons '(forward (vertical 1.0 (message 1.0 point)))
		    (delq (assq 'forward config) config)))
	 (set (make-local-variable 'gnus-configure-windows-hook)
	      nil)))))
