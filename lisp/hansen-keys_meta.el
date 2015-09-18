(message "Inside keys_meta")

(define-key kdh-keys-minor-mode-map [(meta f)] 'isearch-forward)
(define-key isearch-mode-map [(meta f)] 'isearch-repeat-forward)
(define-key kdh-keys-minor-mode-map [(meta x)] 'execute-extended-command) ;; M-x
(define-key kdh-keys-minor-mode-map [(meta o)] 'other-window) ;; C-x o
(define-key kdh-keys-minor-mode-map [(meta \])] 'ido-switch-buffer) ;; C-x b
(define-key kdh-keys-minor-mode-map [(meta down)] 'forward-paragraph)
(define-key kdh-keys-minor-mode-map [(meta up)] 'backward-paragraph)
(define-key kdh-keys-minor-mode-map [(meta left)] 'backward-word)
(define-key kdh-keys-minor-mode-map [(meta right)] 'forward-word)
(define-key kdh-keys-minor-mode-map [(meta next)] 'scroll-up)
(define-key kdh-keys-minor-mode-map [(meta prior)] 'scroll-down)
(define-key kdh-keys-minor-mode-map [(meta s)] 'save-buffer) 
(define-key kdh-keys-minor-mode-map [(meta q)] 'fill-paragraph)
(define-key kdh-keys-minor-mode-map [(meta \;)] 'comment-dwim)
(define-key kdh-keys-minor-mode-map [(meta \1)] 'delete-other-windows)
(define-key kdh-keys-minor-mode-map [(meta \2)] 'split-window-vertically)
(define-key kdh-keys-minor-mode-map [(meta k)] 'kdh-kill-line-or-region)
(define-key kdh-keys-minor-mode-map [(meta backspace)] 'kdh-kill-word-or-region)
(define-key kdh-keys-minor-mode-map [(meta t)] 'kdh-kill-current-buffer)
(define-key kdh-keys-minor-mode-map [(meta y)] 'yank-pop) ;; C-y
(define-key kdh-keys-minor-mode-map [(meta w)] 'kill-ring-save);; M-w
(define-key kdh-keys-minor-mode-map [(meta h)] 'keyboard-quit);; M-w
(define-key kdh-keys-minor-mode-map [(meta r)] 'query-replace);; M-w

(add-hook 'ess-mode-hook
	  (lambda ()
 	    (define-key ess-mode-map [(meta n)] 'ess-eval-line-and-step)
 	    (define-key ess-mode-map [(meta p)] 'ess-eval-function-or-paragraph-and-step)
	    ))


(add-hook 'inferior-ess-mode-hook
	  (lambda ()
 	    (define-key inferior-ess-mode-map [(meta n)] 'comint-next-input)
 	    (define-key inferior-ess-mode-map [(meta p)] 'comint-previous-input)
	    ))

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (define-key emacs-lisp-mode-map [(meta n)] 'eval-last-sexp)
	    ))


(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (define-key LaTeX-mode-map [(meta n)] 'TeX-command-buffer)
	    ))

(add-hook 'noweb-mode-hook
	  (lambda ()
	    (define-key noweb-minor-mode-map [(meta q)] 'noweb-fill-paragraph-chunk)
	    (define-key kdh-keys-minor-mode-map [(meta q)] 'noweb-fill-paragraph-chunk)
	    ))

