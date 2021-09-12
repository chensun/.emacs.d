;;; init-ace-window.el
(use-package ace-window
  :ensure t
  :bind
  ("M-o" . 'ace-window)
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(provide 'init-ace-window)
;;; init-ace-window ends here
