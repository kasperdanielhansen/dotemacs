(add-hook 'comint-mode-hook
          '(lambda () (setq comint-input-ignoredups t)))

(add-hook 'c-mode-hook
	  (lambda ()
	    (c-set-style "bsd")
	    (setq c-basic-offset 4)
	    ))

(add-hook 'perl-model-hook
	  (lambda ()
	    (setq perl-indent-level 4)))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)))

(add-hook 'inferior-ess-mode-hook
	  (lambda ()
	    (setq comint-scroll-to-bottom-on-output 'others)
	    (setq indent-tabs-mode nil)
	    ))

(add-hook 'ess-mode-hook
	  (lambda ()
	    (ess-set-style 'C++)
	    (setq indent-tabs-mode nil)
	    (setq comint-scroll-to-bottom-on-output 'others)
	    (add-hook 'local-write-file-hooks
		      (lambda ()
			(ess-nuke-trailing-whitespace)))
	    (turn-off-flyspell)
	    ))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (TeX-global-PDF-mode t)
	    (turn-on-auto-fill)
	    (turn-on-flyspell)
	    (turn-on-reftex)
	    (outline-minor-mode 1)
	    (TeX-fold-mode 1)
	    ))

(add-hook 'markdown-mode-hook
	  (lambda ()
	    (turn-on-flyspell)
	    ))
