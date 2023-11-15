;;; settings/cc.el -*- lexical-binding: t; -*-

;; Common, basic settings
(setq c-default-style "k&r"
      c-basic-offset 4)

;; C# AND .NET SETTINGS ---------------------------------------------------------
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

(provide 'cc)
