
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (>= emacs-major-version 25)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )
(require 'cl)

;; add package by func under
(defvar swnb/packages '(
			company
			helm-themes		      
			) "Default packages")

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
;; set theme
(require 'helm-themes)

(helm-themes--load-theme "solarized-dark")

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-linum-mode 1)

(setq inhibit-splash-screen t)

;; open-init-file open config file for emacs
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; auto complete
(global-company-mode 1)

;; make cursor point type sigel bar
(setq-default cursor-type 'bar)

;; rm backup file : for example ./init.el~l

(setq make-backup-files nil)

;; fontify
(require 'org)
(setq org-src-fontify-natively t)

;; recentf mode c-x c-r
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 20)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; global set key to open-helm-theme
(global-set-key "\C-x\ \C-y" 'helm-themes)

;; delete when selected word
(delete-selection-mode t)
;; delete selection when put char into init

;; fullscreen when start
(setq initial-frame-alist (quote ((fullscreen .  maximized))))

;; paren-mode
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
