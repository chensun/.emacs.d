;;; init-ui.el
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; (show-paren-mode 1)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens"
  (cond ((looking-at-p "\\s(") (funcall fn))
         (t (save-excursion
              (ignore-errors (backward-up-list))
              (funcall fn)))))


(setq inhibit-splash-screen t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq-default cursor-type 'bar)

;; font size
;; (set-face-attribute 'default nil :height 100)
(set-face-attribute 'default nil :font "DejaVu Sans Mono 10")

(use-package spacemacs-theme
  :ensure spacemacs-theme
  :config (load-theme 'spacemacs-dark t))

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-spacemacs-theme))

(use-package diminish
  :ensure t)

(provide 'init-ui)
;;; init-ui.el ends here
