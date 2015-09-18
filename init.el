(message "Inside init")

(require 'cl)
(defvar *emacs-load-start* (current-time))

;;Exec-path
(setq exec-path (append exec-path '("~/Bin" "/usr/local/bin" "/usr/texbin" "/sbin")))

;;PATH
(setenv "PATH" (concat (getenv "PATH")
		       ":/usr/texbin:~/Bin:/usr/local/bin"))

;; default path
(setq default-directory (expand-file-name "~"))

;; loadpath
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;; other config files

(load "hansen-packages")
(load "hansen-hooks")
(load "hansen-basic")
(load "hansen-functions")
(load "hansen-keys_common")

(if (not (null window-system))
    (load "hansen-keys_hyper")
  )
(if  (null window-system)
    (load "hansen-keys_meta")
  )
(add-to-list 'default-frame-alist '(font . "Monaco-14"))

(message "My .emacs loaded in %ds" 
	 (destructuring-bind (hi lo usec psec) (current-time)
	   (- (+ hi lo) (+ (first *emacs-load-start*) 
			   (second *emacs-load-start*)))))
