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

(use-package py-isort
  :ensure t
  :after elpy
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package yapfify
  :ensure t
  :hook (python-mode . yapf-mode)
  :commands yapfify-buffer
  :diminish yapf-mode)

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

(use-package pyvenv
  :ensure t
  :init
  (setq pyvenv-default-virtual-env-name ".venv")
  (setenv "WORKON_HOME" "~/.local/share/virtualenvs/") ;; same as pipenv default
  :config
  (pyvenv-mode 1))

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
