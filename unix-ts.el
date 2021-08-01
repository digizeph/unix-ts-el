;;; unix-ts.el --- Utility functions for handling Unix timestamps -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Mingwei Zhang
;;
;; Author: Mingwei Zhang <https://github.com/digizeph>
;; Maintainer: Mingwei Zhang <mingwei@mwzhang.com>
;; Created: August 01, 2021
;; Modified: August 01, 2021
;; Version: 0.0.1
;; Keywords: timestamp tools unix utility
;; Homepage: https://github.com/digizeph/unix-ts-el
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;; UnixTs package provides a number of utility functions for handling Unix timestamps in Emacs.
;;
;; Usage:
;;
;; (require 'unix-ts)
;; M-x unix-ts-now
;; M-x unix-ts-to-str
;;
;;; Code:


(defun unix-ts-to-str (&optional time timezone)
  "Convert unix timestamp TIME of TIMEZONE to human-readable string.

The string follows RFC3339 format.
Example: unix time 0 ===> 1970-01-01T00:00:00+0000

The function can be run interactively or directly over a number."
  (interactive "nTimestamp: ")
  (let* ((timezone (or timezone "UTC"))
         (ts-str (format "%s" (or time (current-word))))
         (ts-int (string-to-number ts-str))
         (rfc_str (format-time-string "%Y-%m-%dT%H:%M:%S%z" ts-int timezone)))
    (if (numberp (read ts-str))
        (progn
          ;; send message to Message buffer
          ;; copy to kill-ring (clipboard)
          (message (format "%d %s ==> %s" ts-int timezone rfc_str))
          (kill-new rfc_str)))
    (message "not a number")))

(defun unix-ts-now()
  "Get current unix timestamp as integer and copy it to clipboard."
  (interactive)
  (message "current time is '%s'" (format-time-string "%s"))
  (kill-new (format-time-string "%s")))

(provide 'unix-ts)
;;; unix-ts.el ends here
