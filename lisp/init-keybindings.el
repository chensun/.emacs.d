;;; init-keybindings.el

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "M-s e") 'iedit-mode)

(windmove-default-keybindings)

(provide 'init-keybindings)
;;; init-keybindings.el ends here
