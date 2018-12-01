;; global add word common
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8cz" "const fn = ()=>{}")
					    ))

(setq enable-recursive-minibuffers t)

;; rm backup file : for example ./init.el~l
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq recentf-max-menu-items 20)

;; delete when selected word
(delete-selection-mode t)

;; auto revert
(global-auto-revert-mode t)

;; band file mode by file name
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.hs\\'" . haskell-c2hs-mode))
       auto-mode-alist))

;; open-init-file open config file for emacs
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(provide 'init-config-default)

