;; $Id$  -*- mode: Emacs-Lisp; coding: gb2312-unix; -*-
;; Chunyu <chunyu@hit.edu.cn>'s .emacs_cal.el, created on 2004/06/15 on chunyu.

(setq diary-file "~/.emacs.d/.diary"
      view-diary-entries-initially t
      calendar-latitude +45.75
      calendar-longitude +126.63
      calendar-location-name "Harbin"
      calendar-remove-frame-by-deleting t
      calendar-week-start-day 1
      chinese-calendar-celestial-stem
      ["¼×" "ÒÒ" "±û" "¶¡" "Îì" "¼º" "¸ý" "ÐÁ" "ÈÉ" "¹ï"]
      chinese-calendar-terrestrial-branch
      ["×Ó" "³ó" "Òú" "Ã®" "³½" "ËÈ" "Îç" "Î´" "Éê" "ÓÏ" "Ðç" "º¥"]
      general-holidays
      '((holiday-fixed 1 1 "Ôªµ©") (holiday-fixed 2 14 "ÇéÈË½Ú")
	(holiday-fixed 4 1 "ÓÞÈË½Ú")
	(holiday-float 5 0 2 "Ä¸Ç×½Ú") (holiday-float 6 0 3 "¸¸Ç×½Ú"))
      local-holidays
      '((holiday-chinese 1 15 "ÔªÏü½Ú")
	(holiday-chiense "")
	(holiday-chiense "")
	(holiday-chiense "")
	(holiday-chiense "")
	(holiday-chiense "")
	(holiday-chiense "")
	(holiday-chiense "")
	(holiday-chiense "")
	(holiday-chiense "")
	(holiday-chiense "")
	(holiday-chinese 5 5 "¶ËÎç½Ú"))
      christian-holidays nil
      hebrew-holidays nil
      islamic-holidays nil
      solar-holidays nil
      bahai-holidays nil)

(setq mark-diary-entries-in-calendar t
      appt-issue-message nil
      mark-holidays-in-calendar t
      view-calendar-holidays-initially nil)

(setq diary-date-forms '((year "/" month "/" day "[^/0-9]"))
      calendar-date-display-form '(year "/" month "/" day)
      calendar-time-display-form
      '(24-hours ":" minutes (if time-zone " (") time-zone (if time-zone ")")))

(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

(autoload 'chinese-year "cal-china" "Chinese year" t)

(defun holiday-chinese (cmonth cday string)
  "Chinese calendar holiday, month and day in Chinese calendar (CMONTH, CDAY).

If corresponding MONTH and DAY in gregorian calendar is visible,
the value returned is the list \(((MONTH DAY year) STRING)).
Returns nil if it is not visible in the current calendar window."
  (let* ((m displayed-month)
	 (y displayed-year)
	 (gdate (calendar-gregorian-from-absolute
		 (+ (cadr (assoc cmonth (chinese-year y))) (1- cday))))
	 (gm (car gdate))
	 (gd (cadr gdate))
	 (gy (caddr gdate)))
    (increment-calendar-month m y (- 11 gm))
    (if (> m 9)
      (list (list (list gm gd gy) string)))))

;;;; records mode ;;;;
(load ".emacs-records")
(setq records-init-file "~/.emacs.d/.emacs-records")
(add-hook 'calendar-load-hook
	  '(lambda ()
	     (define-key calendar-mode-map "n" 'records-calendar-to-record)))
(add-hook 'records-mode-hooks
	  '(lambda ()
	     (turn-on-auto-fill)))

;; Chunyu's .emacs_cal.el ends here.
