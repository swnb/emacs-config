(require 'cl)
(when (>= emacs-major-version 25)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)
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
