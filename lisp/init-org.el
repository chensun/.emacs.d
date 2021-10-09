;;; init-org.el

(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)
         ("C-c r" . org-capture))
  :custom
  (org-log-done 'time)
  (org-support-shift-select 'always)
  (org-catch-invisible-edits 'show-and-error)
  (org-src-fontify-natively t)
  (org-agenda-files '("~/DriveFS/My Drive/org/"))
  (org-capture-templates
   '(("t" "Todo" entry (file+headline "~/DriveFS/My Drive/org/tasks.org" "Tasks")
      "* TODO %?\n  %i\n"
      :empty-lines 1)))
  (org-todo-keywords
   '((sequence "TODO" "IN PROGRESS" "BLOCKED" "|" "DONE")))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)
     (python . t)
     (ipython . t)
     (sql . t)))
  :config
  (progn
    (add-hook 'org-shiftup-final-hook    'windmove-up)
    (add-hook 'org-shiftleft-final-hook  'windmove-left)
    (add-hook 'org-shiftdown-final-hook  'windmove-down)
    (add-hook 'org-shiftright-final-hook 'windmove-right)))

(use-package org-tempo
  :ensure nil
  :after org
  :config
  (add-to-list 'org-structure-template-alist
               '("py" . "src python :results output :session")))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "►" "✸" "✜" "★")))

(use-package org-tempo
  :ensure nil)

(use-package ob-shell
  :ensure nil)

;; (use-package ob-ipython
;;   :ensure t)

(use-package htmlize
  :ensure t)

(provide 'init-org)
;;; init-org.el ends here
