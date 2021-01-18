;;; init-python.el

(use-package anaconda-mode
  :ensure t
  :defer t
  :hook ((python-mode . anaconda-mode)
	 (python-mode . anaconda-eldoc-mode)))

(use-package company-anaconda
  :ensure t
  :init
  (eval-after-load "company"
    '(add-to-list 'company-backends '(company-anaconda :with company-capf))))

;; (use-package jedi
;;   :ensure t
;;   :defer t
;;   :config
;;   (add-hook 'python-mode-hook 'jedi:setup))

;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable)
;;   :config
;;   (setq elpy-rpc-python-command "python3")
;;   (setq elpy-rpc-virtualenv-path 'current)
;;   (setq elpy-rpc-backend "jedi"))

(use-package py-isort
  :ensure t
  :after elpy
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package flycheck
  :ensure t
  :hook (python-mode . flycheck-mode)
  :custom
  (flycheck-python-mypy-executable "mypy")
  (flycheck-python-pylint-executable "pylint")
  (flycheck-pylintrc "setup.cfg")
  :config
  (progn
    (add-to-list 'flycheck-checkers 'python-pylint)
    (add-to-list 'flycheck-checkers 'python-mypy)))

(use-package pipenv
  :ensure t
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

(use-package ein
  :ensure t)

(defun chesu-python-mode-hook ()
  (display-fill-column-indicator-mode)
  (setq fill-column 80)
  (setq python-indent-offset 2))

(add-hook 'python-mode-hook
          'chesu-python-mode-hook)

(provide 'init-python)
;;; init-python.el ends here
