;;; init-recentf.el
(require 'recentf)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(setq recentf-max-menu-item 50)
(recentf-mode 1)

;; use counsel-recentf instead
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

(provide 'init-recentf)
;;; init-recentf.el ends here
