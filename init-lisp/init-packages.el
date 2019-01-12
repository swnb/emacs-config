
;; init package emacs lisp

(require 'cl)

(when (>= emacs-major-version 25)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

;; add package by func under
(defvar swnb/packages '(
			company
			rainbow-delimiters
			popwin
			;; themes
			material-theme
			helm-themes
			hungry-delete
			smex
			;; auto complete
			swiper
			counsel
			smartparens
			;; nodejs env config plugin
			js2-mode
			nodejs-repl
			exec-path-from-shell
			;; haskell mode
			haskell-mode
			;; common-lisp
			slime
			;; racket
			racket-mode
			) "Default packages")

;; set var for package list
(setq package-selected-packages swnb/packages)

(defun swnb/packages-installed-p ()
  (loop for pkg in swnb/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (swnb/packages-installed-p)
  (message "%s" "reinstall package")
  (package-refresh-contents)
  (dolist (pkg swnb/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; use shell with emacs with mac
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; global-mode

;; auto complete for repl
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; hungry-delete-mode
(global-hungry-delete-mode)

;; auto complete
(global-company-mode t)

;; popwin
(require 'popwin)
(popwin-mode t)

;; common-lisp
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; set theme
(require 'helm-themes)

;; nodejs repl
(require 'nodejs-repl)

;; smartparens config
(require 'smartparens-config)
(smartparens-global-mode t)

;; config for smex
(require 'smex)
(smex-initialize) ;; no need if you don't use package.el
;; (global-set-key (kbd "M-x") 'smex)

;; recentf mode c-x c-r
(require 'recentf)
(recentf-mode t)

(provide 'init-packages)

(add-hook 'racket-mode-hook      #'racket-unicode-input-method-enable)
(add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable)

