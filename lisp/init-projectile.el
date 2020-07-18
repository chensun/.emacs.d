;;; init-projectile.el
(require-package 'projectile)
(require-package 'counsel-projectile)

(setq projectile-project-search-path '("~/git/"))
(setq projectile-completion-system 'ivy)

(projectile-mode)
(counsel-projectile-mode)

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


(provide 'init-projectile)
;;; init-projectile ends here
