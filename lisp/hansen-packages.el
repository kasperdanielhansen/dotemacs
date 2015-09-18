;; based on Emacs Prelude

(require 'cl)
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defvar hansen-packages
  '(auctex
    ess
    flx-ido
    flycheck
    helm
    magit
    markdown-mode
    paradox
    paredit
    polymode
    projectile
    solarized-theme
    )
  "A list of packages to ensure are installed at launch.")

(defun hansen-packages-installed-p ()
  "Check if all packages in `hansen-packages' are installed."
  (every #'package-installed-p hansen-packages))

(defun hansen-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package hansen-packages)
    (add-to-list 'hansen-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun hansen-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'hansen-require-package packages))

(defun hansen-install-packages ()
  "Install all packages listed in `hansen-packages'."
  (unless (prelude-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (prelude-require-packages hansen-packages)))

(when (package-installed-p `ess)
  (load "ess-site")
  (setq ess-eval-visibly-p nil)
  (setq inferior-R-args "--no-save --no-restore")
  )

(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  )

(when (package-installed-p 'polymode)
  (require `poly-R)
  (require `poly-markdown)
  (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
  )

(when (package-installed-p 'solarized-theme)  
  (load-theme 'solarized-dark t)
  )

(when (package-installed-p `auctex)
  (setq-default TeX-master nil)
  (setq TeX-parse-self t)
  (setq TeX-auto-save t)
  (setq TeX-file-extensions
	'("tex" "ltx" "sty" "cls" "ltx" "texi" "texinfo"))
  (setq font-latex-user-keyword-classes
	'(("kdh-highlight"
	   (("rephrase" "{")
	    ("fixme" "{"))
	   'font-latex-warning-face command)
	  ))
  (setq reftex-plug-into-AUCTeX t)
  (setq reftex-file-extensions  '(("tex" . (".tex" ".ltx"))
				  ("bib" . (".bib"))))
  (setq reftex-try-all-extensions t)
  )

(when (package-installed-p `projectile)
  (projectile-global-mode)
  )

(provide 'hansen-packages)
;;; hansen-packages.el ends here
