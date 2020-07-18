;;; init-python.el
(require-package 'elpy)
(require-package 'jedi)

(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-virtualenv-path 'current)

(elpy-enable)

(provide 'init-python)
;;; init-python.el ends here
