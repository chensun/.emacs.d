;;; init-web.el

(use-package web-mode
  :ensure t
  :config
  (progn
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-markup-indent-offset 2)))


(use-package rjsx-mode
  :ensure t
  :mode ("\\.jsx?$" . rjsx-mode)
  :hook (rjsx-mode . tide-setup)
  :config
  (progn
    (setq js-indent-level 2)
    (setq js2-strict-missing-semi-warning nil)))

(use-package typescript-mode
  :ensure t
  :mode  ("\\.ts\\'" "\\.tsx\\'")
  :config
  (setq typescript-indent-level 2))


(use-package tide
  :ensure t
  :after (company flycheck)
  :init
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))
  :hook
  ((js-mode . setup-tide-mode)
   (rjsx-mode . setup-tide-mode)
   (typescript-mode . setup-tide-mode)
   (web-mode . setup-tide-mode)))


(use-package prettier-js
  :ensure t
  :defer t
  :config
  (setq prettier-js-args
        '("--print-width" "100"
          "--single-quote" "true"
          "--jsx-single-quote" "true"
          "--bracket-spacing" "true"
          ;; "--no-semi"
          "--arrow-parens" "avoid"
          "--trailing-comma" "all"))
  :hook ((js-mode . prettier-js-mode)
         (js2-mode . prettier-js-mode)
         (rjsx-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode)
         (web-mode . prettier-js-mode)))

(provide 'init-web)
;;; init-web.el ends here
