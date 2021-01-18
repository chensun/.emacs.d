;;; init-company.el
(use-package company
  :ensure t
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay .3
        company-echo-delay 0
        company-tooltip-limit 20))

(provide 'init-company)
;;; init-company.el ends here
