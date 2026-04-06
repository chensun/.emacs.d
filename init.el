;;; init.el --- Emacs initialization file -*- lexical-binding: t; -*-

;; Disable package.el — straight.el manages all packages.
(setq package-enable-at-startup nil)

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
;; Every use-package form will call straight by default; use :straight nil for builtins.
(setq straight-use-package-by-default t)

;; Load the org-mode configuration file.
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

;;; init.el ends here
