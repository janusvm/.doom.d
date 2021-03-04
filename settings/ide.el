;;; settings/ide.el -*- lexical-binding: t; -*-

;; LSP settings
(after! lsp-mode
  (map! :leader
        :desc "Diagnostics" "c-" #'lsp-ui-flycheck-list
        :desc "Imenu" "c," #'lsp-ui-imenu)
  (setq lsp-headerline-breadcrumb-enable-diagnostics nil
        lsp-headerline-breadcrumb-enable t
        lsp-lens-enable t
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-imenu--custom-mode-line-format ""
        +lsp-company-backends '(company-capf company-yasnippet)))

;; Completion settings
(after! company
  (map! :i "<tab>" #'company-indent-or-complete-common)
  (map! :map company-active-map "<tab>" #'company-complete-common)
  (setq company-idle-delay 0.0
        company-minimum-prefix-length 1))

;; .NET development
(use-package! dotnet
  :hook ((csharp-mode csproj-mode) . dotnet-mode)
  :config
  (map! :map dotnet-mode-map :leader :prefix ("c ." . ".NET")
        (:prefix ("a" . "add")
         :desc "Add package" "p" #'dotnet-add-package
         :desc "Add reference" "r" #'dotnet-add-reference)
        :desc "Build" "b" #'dotnet-build
        :desc "Clean" "c" #'dotnet-clean
        (:prefix ("g" . "goto")
         :desc "Go to csproj" "c" #'dotnet-goto-csproj
         :desc "Go to fsproj" "f" #'dotnet-goto-fsproj
         :desc "Go to solution" "s" #'dotnet-goto-sln)
        :desc "New" "n" #'dotnet-new
        :desc "Publish" "p" #'dotnet-publish
        :desc "Restore" "r" #'dotnet-restore
        :desc "Run" "e" #'dotnet-run
        :desc "Run with args" "C-e" #'dotnet-run-with-args
        (:prefix ("s" . "solution")
         :desc "Add project to solution" "a" #'dotnet-sln-add
         :desc "List projects in solution" "l" #'dotnet-sln-list
         :desc "New solution" "n" #'dotnet-sln-new
         :desc "Remove project from solution" "r" #'dotnet-sln-remove)
        :desc "Test" "t" #'dotnet-test)
  (set-popup-rule! "^\\*dotnet" :select t :quit t :side 'bottom :size 0.3))

(provide 'ide)
