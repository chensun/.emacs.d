;;; init-golang.el
(require-package 'go-mode)
(require-package 'go-eldoc)
(require-package 'go-guru)
(require-package 'go-dlv)
(require-package 'company-go)

(require-package 'exec-path-from-shell)
(require-package 'flymake-go)

(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "GOPATH")

(defun chesu-go-mode-hook ()
  (unless (string-match-p "go" compile-command)    ; set compile command default
     (set (make-local-variable 'compile-command)
          "go build -v && go test -v && go vet"))  ; May need to be customized for your project

  ;; eldoc settings
  (go-eldoc-setup)

  ;; guru settings
  (go-guru-hl-identifier-mode)                    ; highlight identifiers

  (setq gofmt-command "goimports")

  ;; Key bindings specific to go-mode
  (local-set-key (kbd "M-.") #'godef-jump)         ; Go to definition
  (local-set-key (kbd "M-*") #'pop-tag-mark)       ; Return from whence you came
  (local-set-key (kbd "M-p") #'compile)            ; Invoke compiler
  (local-set-key (kbd "M-P") #'recompile)          ; Redo most recent compile cmd
  (local-set-key (kbd "M-]") #'next-error)         ; Go to next error (or msg)
  (local-set-key (kbd "M-[") #'previous-error)     ; Go to previous error or msg

  ;; Misc go stuff
  (add-hook 'before-save-hook 'gofmt-before-save)
  (company-mode)
  (set (make-local-variable 'company-backends) '(company-go))
  (setq tab-width 4))

;; (add-to-list 'load-path (concat (getenv "GOPATH")  "/src/golang.org/x/lint/misc/emacs"))

(add-hook 'go-mode-hook 'chesu-go-mode-hook)

(provide 'init-golang)
;;; init-golang.el ends here
