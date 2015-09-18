
(defun kdh-kill-line-or-region ()
  "If the mark is active, kill the region. Otherwise, kill the line"
  (interactive)
  (if mark-active
      (kill-region (region-beginning) (region-end))
    (kill-line)))

(defun kdh-kill-word-or-region ()
  "If the mark is active, kill the region. Otherwise, kill the word"
  (interactive)
  (if mark-active
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))

(defun kdh-kill-current-buff()
  "Kill current buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(defun kdh-smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))
  
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1)))
)

(defvar visual-wrap-column nil)

(defun set-visual-wrap-column (new-wrap-column &optional buffer)
  "Force visual line wrap at NEW-WRAP-COLUMN in BUFFER (defaults
    to current buffer) by setting the right-hand margin on every
    window that displays BUFFER.  A value of NIL or 0 for
    NEW-WRAP-COLUMN disables this behavior."
  (interactive (list (read-number "New visual wrap column, 0 to disable: " (or visual-wrap-column fill-column 0))))
  (if (and (numberp new-wrap-column)
	   (zerop new-wrap-column))
      (setq new-wrap-column nil))
  (with-current-buffer (or buffer (current-buffer))
    (visual-line-mode t)
    (set (make-local-variable 'visual-wrap-column) new-wrap-column)
    (add-hook 'window-configuration-change-hook 'update-visual-wrap-column nil t)
    (let ((windows (get-buffer-window-list)))
      (while windows
	(when (window-live-p (car windows))
	  (with-selected-window (car windows)
	    (update-visual-wrap-column)))
	(setq windows (cdr windows))))))

(defun update-visual-wrap-column ()
  (if (not visual-wrap-column)
      (set-window-margins nil nil)
    (let* ((current-margins (window-margins))
	   (right-margin (or (cdr current-margins) 0))
	   (current-width (window-width))
	   (current-available (+ current-width right-margin)))
      (if (<= current-available visual-wrap-column)
	  (set-window-margins nil (car current-margins))
	(set-window-margins nil (car current-margins)
			    (- current-available visual-wrap-column))))))
