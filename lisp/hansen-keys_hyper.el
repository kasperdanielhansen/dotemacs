(message "Inside keys_hyper")

(define-key kdh-keys-minor-mode-map [(hyper f)] 'isearch-forward)
(define-key isearch-mode-map [(hyper f)] 'isearch-repeat-forward)
(define-key kdh-keys-minor-mode-map [(hyper x)] 'execute-extended-command) ;; M-x
(define-key kdh-keys-minor-mode-map [(hyper o)] 'other-window) ;; C-x o
(define-key kdh-keys-minor-mode-map [(hyper \])] 'ido-switch-buffer) ;; C-x b
(define-key kdh-keys-minor-mode-map [(hyper down)] 'forward-paragraph)
(define-key kdh-keys-minor-mode-map [(hyper up)] 'backward-paragraph)
(define-key kdh-keys-minor-mode-map [(hyper left)] 'backward-word)
(define-key kdh-keys-minor-mode-map [(hyper right)] 'forward-word)
(define-key kdh-keys-minor-mode-map [(hyper s)] 'save-buffer) 
(define-key kdh-keys-minor-mode-map [(hyper q)] 'fill-paragraph)
(define-key kdh-keys-minor-mode-map [(hyper \;)] 'comment-dwim)
(define-key kdh-keys-minor-mode-map [(hyper \1)] 'delete-other-windows)
(define-key kdh-keys-minor-mode-map [(hyper \2)] 'split-window-vertically)
(define-key kdh-keys-minor-mode-map [(hyper k)] 'kdh-kill-line-or-region)
(define-key kdh-keys-minor-mode-map [(hyper backspace)] 'kdh-kill-word-or-region)
(define-key kdh-keys-minor-mode-map [(hyper t)]
  (lambda () (interactive) (kill-buffer (current-buffer))))
(define-key kdh-keys-minor-mode-map [(hyper y)] 'yank-pop) ;; C-y
(define-key kdh-keys-minor-mode-map [(hyper w)] 'kill-ring-save);; M-w
(define-key kdh-keys-minor-mode-map [(hyper h)] 'keyboard-quit);; M-w
(define-key kdh-keys-minor-mode-map [(hyper r)] 'query-replace);; M-w

(add-hook 'ess-mode-hook
	  (lambda ()
 	    (define-key ess-mode-map [(hyper n)] 'ess-eval-line-and-step)
 	    (define-key ess-mode-map [(hyper p)] 'ess-eval-function-or-paragraph-and-step)
	    ))

(add-hook 'inferior-ess-mode-hook
	  (lambda ()
 	    (define-key inferior-ess-mode-map [(hyper n)] 'comint-next-input)
 	    (define-key inferior-ess-mode-map [(hyper p)] 'comint-previous-input)
	    ))

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (define-key emacs-lisp-mode-map [(hyper n)] 'eval-last-sexp)
	    ))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (define-key LaTeX-mode-map [(hyper n)] 'TeX-command-buffer)
	    ))

(add-hook 'noweb-mode-hook
	  (lambda ()
	    (define-key noweb-minor-mode-map [(hyper q)] 'noweb-fill-paragraph-chunk)
	    (define-key kdh-keys-minor-mode-map [(hyper q)] 'noweb-fill-paragraph-chunk)
	    ))

;; Left half of keyboard

;; (define-key kdh-keys-minor-mode-map [(hyper \\)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper ')] ')
;; (define-key kdh-keys-minor-mode-map [(hyper -)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper =)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper ,)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper .)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper /)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper 7)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper 8)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper 9)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper 0)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper y)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper u)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper i)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper p)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper h)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper j)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper k)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper l)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper n)] ')
;; (define-key kdh-keys-minor-mode-map [(hyper m)] ')

;; (define-key kdh-keys-minor-mode-map [] 'electric-buffer-list); C-x c-b
;; (define-key kdh-keys-minor-mode-map [] 'yank) ;; C-y
;; (define-key kdh-keys-minor-mode-map [] 'kill-region);; C-q
;; (define-key kdh-keys-minor-mode-map [] 'kill-ring-save);; M-w
;; (define-key kdh-keys-minor-mode-map [] 'recenter) ;; C-l
;; (define-key kdh-keys-minor-mode-map [] ') ;; 
;; (define-key kdh-keys-minor-mode-map [] ') ;; 
;; (define-key kdh-keys-minor-mode-map [] ') ;; 

;; (define-key kdh-keys-minor-mode-map [(hyper a)] 'mark-whole-buffer)
;; (define-key kdh-keys-minor-mode-map [(hyper v)] 'yank)
;; (define-key kdh-keys-minor-mode-map [(hyper c)] 'kill-ring-save)
;; (define-key kdh-keys-minor-mode-map [(hyper x)] 'kill-region)
;; (define-key kdh-keys-minor-mode-map [(hyper s)] 'save-buffer)
;; (define-key kdh-keys-minor-mode-map [(hyper l)] 'goto-line)

;; 
;; (define-key kdh-keys-minor-mode-map [(hyper g)] 'isearch-repeat-forward)
;; (define-key kdh-keys-minor-mode-map [(hyper .)] 'keyboard-quit)

