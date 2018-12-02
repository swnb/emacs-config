
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; emacs lisp script
(add-to-list 'load-path "~/.emacs.d/init-lisp/")

(require 'init-packages)
(require 'init-ui)
(require 'init-config-default)
(require 'init-keybind)
(require 'init-org)

(setq custom-file (expand-file-name "init-lisp/custom.el" user-emacs-directory))

(load-file custom-file)

