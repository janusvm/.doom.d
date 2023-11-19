;;; settings/appearance.el -*- lexical-binding: t; -*-

;; FONT SETTINGS ---------------------------------------------------------------
(setq doom-font (font-spec :family "Iosevka Nova" :size 18)
      doom-themes-treemacs-enable-variable-pitch nil
      display-line-numbers-type nil)

;; Ligatures
(defconst jetbrains-mono-ligatures
  '("-->" "//" "/**" "/*" "*/" "<!--" ":=" "->>" "<<-" "->" "<-" "<=>" "=="
    "!=" "<=" ">=" "=:=" "!==" "&&" "||" "..." ".." "|||" "///" "&&&" "==="
    "++" "--" "=>" "|>" "<|" "||>" "<||" "|||>" "<|||" ">>" "<<" "::=" "|]"
    "[|" "{|" "|}" "[<" ">]" ":?>" ":?" "/=" "[||]" "!!" "?:" "?." "::" "+++"
    "??" "###" "##" ":::" "####" ".?" "?=" "=!=" "<|>" "<:" ":<" ":>" ">:"
    "<>" "***" ";;" "/==" ".=" ".-" "__" "=/=" "<-<" "<<<" ">>>" "<=<" "<<="
    "<==" "<==>" "==>" "=>>" ">=>" ">>=" ">>-" ">-" "<~>" "-<" "-<<" "=<<"
    "---" "<-|" "<=|" "/\\" "\\/" "|=>" "|~>" "<~~" "<~" "~~" "~~>" "~>" "<$>"
    "<$" "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</>" "</" "/>" "<->" "..<" "~="
    "~-" "-~" "~@" "^=" "-|" "_|_" "|-" "||-" "|=" "||=" "#{" "#[" "]#" "#("
    "#?" "#_" "#_(" "#:" "#!" "#=" "&="))

(use-package! ligature
  :config
  (ligature-set-ligatures 'prog-mode jetbrains-mono-ligatures)
  (global-ligature-mode t))

;; MODELINE SETTINGS -----------------------------------------------------------
(after! doom-modeline
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode)
  (setq doom-modeline-buffer-encoding nil
        doom-modeline-vcs-max-length 24
        doom-modeline-major-mode-icon t)
  (map! :leader :desc "Modeline" "tm" #'hide-mode-line-mode))

;; THEME SETTINGS --------------------------------------------------------------
(use-package! catppuccin-theme
  :config
  (setq doom-theme 'catppuccin
        catppuccin-italic-comments t)
  (catppuccin-reload))

;; (use-package! modus-themes
;;   :ensure t
;;   :config
;;   (setq modus-themes-bold-constructs t
;;         modus-themes-italic-constructs t
;;         modus-themes-common-palette-overrides '((border-mode-line-active unspecified)
;;                                                 (border-mode-line-inactive unspecified)
;;                                                 (bg-paren-match bg-magenta-intense))
;;         modus-themes-paren-match '(bold intense)
;;         modus-themes-completions '((matches . (extrabold italic intense))
;;                                    (selection . (semibold accented intense))
;;                                    (popup . (accented background)))
;;         modus-themes-region '(accented)
;;         modus-themes-subtle-line-numbers t
;;         modus-themes-to-toggle '(modus-vivendi modus-operandi))
;;   (modus-themes-load-theme 'modus-vivendi)
;;   (map! :leader
;;         :desc "Cycle theme" "tt" #'modus-themes-toggle))

(provide 'appearance)
