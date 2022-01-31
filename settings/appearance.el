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
(use-package! modus-themes
  :init
  (setq modus-themes-bold-constructs t
        modus-themes-italic-constructs t
        modus-themes-mode-line '(borderless)
        modus-themes-paren-match '(bold intense)
        modus-themes-completions 'opinionated
        modus-themes-region '(accented)
        modus-themes-subtle-line-numbers t)
  (modus-themes-load-themes))

;; Change theme on the fly
(use-package! cycle-theme
  :config
  (setq jsvm/active-themes '(modus-vivendi modus-operandi)
        doom-theme (car jsvm/active-themes))
  (map! :leader
        :desc "Cycle theme" "tt" #'jsvm/cycle-theme))

(provide 'appearance)
