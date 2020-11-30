;;; init-python.el
(require-package 'elpy)
(require-package 'jedi)
(require-package 'ein)

(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-virtualenv-path 'current)

(elpy-enable)

(defun chesu-python-mode-hook ()
  (display-fill-column-indicator-mode)
  (setq fill-column 80)
  (setq python-indent-offset 2))

(add-hook 'python-mode-hook
          'chesu-python-mode-hook)

(provide 'init-python)
;;; init-python.el ends here
