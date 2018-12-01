;; helm theme with solarized-dark
;; (helm-themes--load-theme "solarized-dark")
(load-theme 'material t)

(setq inhibit-splash-screen t)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-linum-mode 1)

;; color paren
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; make cursor point type sigel bar
(setq-default cursor-type 'bar)

;; fullscreen when start
(setq initial-frame-alist (quote ((fullscreen .  maximized))))

;; paren-mode
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-ui)

