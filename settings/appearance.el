;;; settings/appearance.el -*- lexical-binding: t; -*-

(use-package! cycle-theme
  :config
  (setq doom-font (font-spec :family "Iosevka SS04" :size 18 :weight 'regular)
        doom-big-font (font-spec :family "Iosevka SS04" :size 36 :weight 'semibold)
        doom-theme (car jsvm/active-themes)
        display-line-numbers-type nil)
  (map! :leader
        :desc "Cycle theme" "tt" #'jsvm/cycle-theme))

(map! :leader :desc "Modeline" "tm" #'hide-mode-line-mode)

(provide 'appearance)
