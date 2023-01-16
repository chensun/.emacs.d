;;; init-solidity.el

(use-package solidity-mode
  :ensure t
  :defer t
  :init
  (progn
    (setq solidity-solc-path "/usr/bin/solc")
    (setq solidity-solium-path "/home/chen/.nvm/versions/node/v18.13.0/bin/solium")
    (setq solidity-solhint-path "/home/chen/.nvm/versions/node/v18.13.0/bin/solhint"))
  :config
  (setq solidity-comment-style 'slash))

(use-package solidity-flycheck
  :ensure t
  :after solidity-mode
  :config
  (progn
    (setq solidity-flycheck-chaining-error-level t)
    (setq solidity-flycheck-use-project t)))

(use-package company-solidity
  :ensure t
  :after solidity-mode
  :init
  (eval-after-load "company"
    '(add-to-list 'company-backends '(company-solidity :with company-capf))))

(provide 'init-solidity)

;;; init-solidity.el ends here
