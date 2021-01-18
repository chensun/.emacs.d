;;; .emacs --- Emacs initialization file -*- lexical-binding: t; -*-

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-elpa)
(require 'init-org)
(require 'init-recentf)
(require 'init-company)
(require 'init-magit)
(require 'init-ace-window)
(require 'init-projectile)
(require 'init-treemacs)
(require 'init-ivy)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-multiple-cursors)
(require 'init-misc)
(require 'init-golang)
(require 'init-python)
;; (require 'init-google)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(server-start)

;;; init.el ends here
