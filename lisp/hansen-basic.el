(message "Inside hansen-basic")

;; Make sure that we display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Use text mode and set auto-fill in text-mode
(setq default-major-mode 'text-mode)
(setq text-mode-hook 'turn-on-visual-line-mode)

;; Only a visible bell, not audio
(setq visible-bell t)

;; No blinking cursor
(blink-cursor-mode 0)

;; We want font-lock in all buffers
(require 'font-lock)
(global-font-lock-mode 1)

;; No menu-bar or tool-bar
(if window-system
    (progn
      (tool-bar-mode 0)
))
(setq inhibit-splash-screen t)
(menu-bar-mode 0)

(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

;; No dialog boxes
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;; Only ask y/n questions, not yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; fill-column
(setq-default fill-column 100)

;; Make scripts executables
(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)

;; Keep custom settings separate
(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

;; Aspell
(setq-default ispell-program-name "aspell")

;; Ido; iswitchb on steriods
(require 'ido)
(require 'flx-ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-max-prospects 0)
(setq ido-enable-flex-matching t)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
;;(setq ido-create-new-buffer 'always)
(setq ido-ignore-buffers '("\\` " "\\*Messages\\*" "\\*ESS\\*" "\\*Completions\\*" "\\*Buffer List\\*" "\\\[r\\\]$" "\\\[fundamental\\\]$"))


(require 'ibuffer)
;; using ibuffer-vc to sort based on vc project
(add-hook 'ibuffer-hook
	  (lambda ()
	    (ibuffer-vc-set-filter-groups-by-vc-root)
	    (unless (eq ibuffer-sorting-mode 'alphabetic)
	      (ibuffer-do-sort-by-alphabetic))))
;; include vc-status in ibuffer
(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))
;;(setq ibuffer-default-sorting-mode 'major-mode)
;;(setq ibuffer-always-show-last-buffer t)
;;(setq ibuffer-view-ibuffer t)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-saved-items 50)
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (let ((home (expand-file-name (getenv "HOME"))))
    (find-file (ido-completing-read "Find recent file: " 
				    (mapcar (lambda (path)
					      (replace-regexp-in-string home "~" path))
					    recentf-list)
				    nil t))))

;; Uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

