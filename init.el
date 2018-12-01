
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

;; auto revert
(global-auto-revert-mode t)

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

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; config for smex
(require 'smex)
(smex-initialize) ;; no need if you don't use package.el
;; (global-set-key (kbd "M-x") 'smex)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8cz" "const fn = ()=>{}")
					    ))

;; popwin
(require 'popwin)
(popwin-mode t)

;; auto complete for repl
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

;; helm theme with solarized-dark
;; (helm-themes--load-theme "solarized-dark")
(load-theme 'material t)

;; color paren
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-linum-mode 1)

(setq inhibit-splash-screen t)

;; open-init-file open config file for emacs
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; auto complete
(global-company-mode t)

;; make cursor point type sigel bar
(setq-default cursor-type 'bar)

;; rm backup file : for example ./init.el~l
(setq make-backup-files nil)
(setq auto-save-default nil)

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

;; global set key to open help more easy
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; delete when selected word
(delete-selection-mode t)

;; band file mode by file name
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.hs\\'" . haskell-c2hs-mode))
       auto-mode-alist))

;; fullscreen when start
(setq initial-frame-alist (quote ((fullscreen .  maximized))))

;; paren-mode
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; org-mode
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; custom config set 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.05)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "e03d2f414fb109f3920752b10b92323697174f49d577da9e69979edbb147a921" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(fci-rule-color "#ECEFF1")
 '(hl-sexp-background-color "#efebe9")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
