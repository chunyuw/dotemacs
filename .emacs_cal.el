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
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"]
      chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"]
      general-holidays
      '((holiday-fixed 1 1 "元旦") (holiday-fixed 2 14 "情人节")
	(holiday-fixed 4 1 "愚人节") (holiday-float 5 0 2 "母亲节")
	(holiday-float 6 0 3 "父亲节") (holiday-fixed 12 25 "圣诞节"))
      local-holidays
      '((holiday-chinese 1 15 "元宵节 (正月十五)") (holiday-chinese 5 5 "端午节 (五月初五)")
	(holiday-chinese 9 9 "重阳节 (九月九)") (holiday-chinese 8 15 "中秋节 (八月十五)"))
      christian-holidays nil
      hebrew-holidays nil
      islamic-holidays nil
      ;; solar-holidays nil
      bahai-holidays nil
      solar-n-hemi-seasons '("春分" "夏至" "秋分" "冬至"))

(setq mark-diary-entries-in-calendar t
      appt-issue-message nil
      mark-holidays-in-calendar t
      view-calendar-holidays-initially nil)

(setq diary-date-forms '((year "/" month "/" day "[^/0-9]"))
      calendar-date-display-form '(year "/" month "/" day)
      calendar-time-display-form
      '(24-hours ":" minutes (if time-zone " (") time-zone (if time-zone ")")))

(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

(add-hook 'calendar-load-hook
	  '(lambda ()
	     (define-key calendar-mode-map "n" 'records-calendar-to-record)
	     (define-key calendar-mode-map "<" 'scroll-calendar-left)
	     (define-key calendar-mode-map ">" 'scroll-calendar-right)
	     (define-key calendar-mode-map "N" 'scroll-calendar-left-three-months)
	     (define-key calendar-mode-map "P" 'scroll-calendar-right-three-months)
	     (define-key calendar-mode-map "\M-n" 'scroll-calendar-left-three-months)
	     (define-key calendar-mode-map "\M-p" 'scroll-calendar-right-three-months)))


(autoload 'chinese-year "cal-china" "Chinese year data" t)

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
(add-hook 'records-mode-hooks
	  '(lambda ()
	     (turn-on-auto-fill)))

;; Chunyu's .emacs_cal.el ends here.
