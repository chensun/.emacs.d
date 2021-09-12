;;; init-projectile.el
(use-package projectile
  :ensure t
  :config
  (progn
    (setq projectile-project-search-path '("~/git/"))
    (setq projectile-completion-system 'ivy)
    (projectile-mode))
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package counsel-projectile
  :ensure t
  :config
  (progn
    (counsel-projectile-mode)))

(provide 'init-projectile)
;;; init-projectile ends here
