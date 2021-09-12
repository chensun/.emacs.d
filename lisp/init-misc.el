;;; init-misc.el
(setenv "BASH_ENV" (expand-file-name "~/.bashrc"))

(setq-default indent-tabs-mode nil)

(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(delete-selection-mode t)

(setq auto-save-default nil)

(setq make-backup-files nil)

(setq enable-recursive-minibuffers t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq x-select-enable-clipboard t
      x-select-enable-primary t)

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode))

(use-package bash-completion
  :ensure t)

(bash-completion-setup)

(provide 'init-misc)
;;; init-misc.el ends here
