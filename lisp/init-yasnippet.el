;;; init-yasnippet.el

(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs
`(,(concat user-emacs-directory (file-name-as-directory "snippets"))))
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :straight (:host github :repo "AndreaCrotti/yasnippet-snippets")
  :after yasnippet)

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
