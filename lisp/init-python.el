;;; init-python.el
(require-package 'elpy)
(require-package 'jedi)
(require-package 'ein)
(require-package 'flycheck)

(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-virtualenv-path 'current)

;; ~/.config/yapf/style
;; [style]
;; based_on_style = google
;; indent_width = 2
(elpy-enable)

(use-package flycheck
  :custom
  (flycheck-python-mypy-executable "~/venv/py3/bin/mypy")
  (flycheck-python-pylint-executable "~/venv/py3/bin/pylint")
  (flycheck-pylintrc "setup.cfg"))

(add-to-list 'flycheck-checkers 'python-pylint 'python-mypy)


(defun chesu-python-mode-hook ()
  (display-fill-column-indicator-mode)
  (setq fill-column 80)
  (setq python-indent-offset 2))

(add-hook 'python-mode-hook
          'flycheck-mode)

(add-hook 'python-mode-hook
          'chesu-python-mode-hook)

(provide 'init-python)
;;; init-python.el ends here
