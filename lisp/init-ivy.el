;;; init-ivy.el
(use-package ivy
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq-default ivy-count-format "[%d/%d] "))
  :bind (("C-c C-r" . ivy-resume)
         :map ivy-minibuffer-map
         ("C-j" . ivy-immediate-done)
         :map ivy-switch-buffer-map
         ("C-j" . ivy-immediate-done)))

(use-package swiper
  :ensure t
  :after ivy
  :bind ("C-s" . swiper))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-r" . counsel-recentf)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-c k" . counsel-ag)
         ("C-x l" . counsel-locate)
         ("C-M-j" . counsel-switch-buffer)))


(provide 'init-ivy)
;;; init-ivy.el ends here
