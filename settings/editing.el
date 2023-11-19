;;; settings/editing.el -*- lexical-binding: t; -*-

;; COMPLETION SETTINGS ---------------------------------------------------------
(after! company
  ;; Adjust completion behavior and keymapping
  (map! :i "<tab>" #'company-indent-or-complete-common)
  (map! :map company-active-map "<tab>" #'company-complete-common)
  (setq company-idle-delay 0.0
        company-minimum-prefix-length 1)

  ;; Get rid of the ispell backend
  (setq +company-backend-alist (assq-delete-all 'text-mode +company-backend-alist))
  (add-to-list '+company-backend-alist '(text-mode (:separate company-yasnippet))))

;; LSP SETTINGS ----------------------------------------------------------------
(after! lsp-mode
  (map! :leader
        :desc "Diagnostics" "c-" #'lsp-ui-flycheck-list
        :desc "Imenu" "c," #'lsp-ui-imenu
        :desc "Glance symbol doc" "ch" #'lsp-ui-doc-glance)
  (setq lsp-headerline-breadcrumb-enable-diagnostics nil
        lsp-headerline-breadcrumb-enable t
        lsp-lens-enable t
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-imenu--custom-mode-line-format ""
        +lsp-company-backends '(company-capf company-yasnippet)))

;; INSERTING CHARACTERS --------------------------------------------------------
(use-package! fill-line
  :config
  (map! :leader :prefix "i"
        :desc "Fill line" "-" #'jsvm/fill-line
        :desc "Insert line" "_" #'jsvm/insert-filled-line))

(use-package! gitmoji
  :config
  (map! :leader :desc "Gitmoji" "ig" #'gitmoji-insert-emoji))

;; MISC SETTINGS ---------------------------------------------------------------
(setq doom-scratch-initial-major-mode 'lisp-interaction-mode
      confirm-kill-emacs nil
      avy-all-windows 'all-frames
      tab-always-indent 'complete)

;; My preference for parens matching and flycheck
(remove-hook!
  'doom-first-buffer-hook #'smartparens-global-mode
  'doom-first-buffer-hook #'global-flycheck-mode)
(electric-pair-mode 1)

(map! :leader
      :desc "Version control" "pv" #'projectile-vc)

;; Enable certain commands in evil-mc (multi-cursor) contexts
(after! evil-mc
  (dolist (cmd '(just-one-space         ; TODO add more commands to this list
                 evil-surround-edit
                 evil-surround-delete
                 evil-surround-change))
    (add-to-list 'evil-mc-known-commands
                 `(,cmd . ((:default . evil-mc-execute-default-call))))))

(provide 'editing)
