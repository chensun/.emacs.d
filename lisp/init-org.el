;;; init-org.el
(require 'org)
(require 'ob-shell)
(require 'org-tempo)

(use-package htmlize
  :ensure t)

(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(setq org-support-shift-select 'always)

(setq org-catch-invisible-edits 'show-and-error)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/DriveFS/My Drive/org/"))
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/DriveFS/My Drive/org/gtd.org" "Work schedule")
         "* TODO %?\n  %i\n"
         :empty-lines 1)))

(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "BLOCKED" "|" "DONE")))

(org-babel-do-load-languages
  'org-babel-load-languages
  '((shell . t)
    (java . t)
    (python . t)
    (sql . t)))

(provide 'init-org)
;;; init-org.el ends here
