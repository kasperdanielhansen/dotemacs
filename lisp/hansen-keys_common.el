(message "Inside hansen-keys_common")

(defvar kdh-keys-minor-mode-map (make-keymap) "kdh-keys-minor-mode keymap")
(define-minor-mode kdh-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t 
  :lighter " keys"
  :global t
  :keymap 'kdh-keys-minor-mode-map
  ;; body
)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)
(setq mac-pass-command-to-system nil)

;; normally bound to M-$ but that conflicts with MacOSX key for picture grab
(global-set-key (kbd "C-$") 'ispell-word) 
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)
(global-set-key (kbd "C-a") 'kdh-smarter-move-beginning-of-line)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open) 
(global-set-key "\M-\\" 'just-one-space)

(add-hook 'ess-mode-hook
	  (lambda ()
	    (local-unset-key "\C-c\C-b")
	    ))

(add-hook 'ess-help-mode-hook
	  (lambda ()
	    (define-key ess-help-mode-map [?\S- ] 'scroll-down)
	    ))

(add-hook 'inferior-ess-mode-hook
	  (lambda ()
	    (define-key inferior-ess-mode-map "\C-a" 
	      (lambda () 
		(interactive) 
		(comint-show-maximum-output)
		(goto-char (comint-line-beginning-position))))
	    ))

(add-hook 'Info-mode-hook
	  (lambda ()
	    (define-key Info-mode-map [?\S- ] 'Info-scroll-down)
	    ))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (define-key LaTeX-mode-map "\r" 'newline-and-indent)
	    ))

(add-hook 'help-mode-hook
	  (lambda ()
	    (define-key help-mode-map [?\S- ] 'View-scroll-page-backward)
	    (define-key help-mode-map [(k)]
	      (lambda () (interactive) (kill-buffer (current-buffer))))
	    ))

;; For Terminal usage
(define-key key-translation-map (kbd "\e [ a") [(up)])
(define-key key-translation-map (kbd "\e [ A") [(up)])
(define-key key-translation-map (kbd "\e [ b") [(down)])
(define-key key-translation-map (kbd "\e [ B") [(down)])
(define-key key-translation-map (kbd "\e [ c") [(right)])
(define-key key-translation-map (kbd "\e [ C") [(right)])
(define-key key-translation-map (kbd "\e [ d") [(left)])
(define-key key-translation-map (kbd "\e [ D") [(left)])

(define-key key-translation-map (kbd "\e [ 6 a") [(shift up)])
(define-key key-translation-map (kbd "\e [ 5 a") [(meta up)])
(define-key key-translation-map (kbd "\e [ 4 a") [(control up)])
(define-key key-translation-map (kbd "\e [ 6 b") [(shift down)])
(define-key key-translation-map (kbd "\e [ 5 b") [(meta down)])
(define-key key-translation-map (kbd "\e [ 4 b") [(control down)])
(define-key key-translation-map (kbd "\e [ 6 c") [(shift right)])
(define-key key-translation-map (kbd "\e [ 5 c") [(meta right)])
(define-key key-translation-map (kbd "\e [ 4 c") [(control right)])
(define-key key-translation-map (kbd "\e [ 6 d") [(shift left)])
(define-key key-translation-map (kbd "\e [ 5 d") [(meta left)])
(define-key key-translation-map (kbd "\e [ 4 d") [(control left)])
(define-key key-translation-map (kbd "\e [ 5 e") [(meta backspace)])
(define-key key-translation-map (kbd "\e [ 4 e") [(control backspace)])
(define-key key-translation-map (kbd "\e [ 5 f") [(meta delete)])
(define-key key-translation-map (kbd "\e [ 4 f") [(control delete)])
(define-key key-translation-map (kbd "\e [ 5 g") [(meta next)])
(define-key key-translation-map (kbd "\e [ 4 g") [(control next)])
(define-key key-translation-map (kbd "\e [ 5 h") [(meta prior)])
(define-key key-translation-map (kbd "\e [ 4 h") [(control prior)])
(define-key key-translation-map (kbd "\e [ 5 i") [(meta home)])
(define-key key-translation-map (kbd "\e [ 4 i") [(control home)])
(define-key key-translation-map (kbd "\e [ 5 j") [(meta end)])
(define-key key-translation-map (kbd "\e [ 4 j") [(control end)])
