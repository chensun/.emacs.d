;;; init-ace-window.el
(require-package 'ace-window)
(require 'ace-window)

(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(global-set-key (kbd "M-o") 'ace-window)

(provide 'init-ace-window)
;;; init-ace-window ends here
