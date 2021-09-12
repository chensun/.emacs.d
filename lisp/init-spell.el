;;; init-spell.el
(use-package flyspell
  :defer t
  :diminish flyspell-mode
  :if (executable-find "aspell")
  :hook ((text-mode . flyspell-mode)
         (prog-mode . flyspell-prog-mode))
  :custom
  (flyspell-issue-message-flag nil)
  (ispell-program-name "aspell")
  (ispell-extra-args
   '("--sug-mode=ultra" "--lang=en_US" "--run-together")))

(use-package flyspell-correct-ivy
  :ensure t
  :init
  (setq flyspell-correct-interface #'flyspell-correct-ivy))

(provide 'init-spell)
;;; init-spell.el ends here
