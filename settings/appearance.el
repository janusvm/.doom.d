;;; settings/appearance.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "JetBrains Mono" :size 17)
      doom-big-font (font-spec :family "Iosevka SS04" :size 36 :weight 'semibold)
      doom-themes-treemacs-enable-variable-pitch nil
      display-line-numbers-type nil)

;; Ligatures support for JetBrains Mono
;; * https://github.com/microsoft/cascadia-code/issues/153
;; * https://gitlab.com/noaccOS/dotfiles/-/blob/master/.config/doom/config.el#L74
(use-package! composite
  :defer t
  :init (defvar composition-ligature-table (make-char-table nil))
  :hook ((prog-mode conf-mode markdown-mode help-mode nxml-mode)
         . (lambda () (setq-local composition-function-table composition-ligature-table)))
  :config
  (when (version<= "27.0" emacs-version)
    (let ((alist '((?! . "\\(?:!\\(?:==\\|[!=]\\)\\)")
                   (?# . "\\(?:#\\(?:###?\\|_(\\|[!#(:=?[_{]\\)\\)")
                   (?$ . "\\(?:\\$>\\)")
                   (?& . "\\(?:&&&?\\)")
                   (?* . "\\(?:\\*\\(?:\\*\\*\\|[/>]\\)\\)")
                   (?+ . "\\(?:\\+\\(?:\\+\\+\\|[+>]\\)\\)")
                   (?- . "\\(?:-\\(?:-[>-]\\|<<\\|>>\\|[<>|~-]\\)\\)")
                   (?. . "\\(?:\\.\\(?:\\.[.<]\\|[.=?-]\\)\\)")

                   ;; This one causes trouble somehow (https://www.reddit.com/r/emacs/comments/icem4s/emacs_271_freezes_when_using_font_ligatures)
                   ;; (?/ . "\\(?:/\\(?:\\*\\*\\|//\\|==\\|[*/=>]\\)\\)")

                   (?0 . ".\\(?:\\(x[a-fA-F0-9]\\).?\\)")
                   (?: . "\\(?::\\(?:::\\|\\?>\\|[:<-?]\\)\\)")
                   (?\; . "\\(?:;;\\)")
                   (?< . "\\(?:<\\(?:!--\\|\\$>\\|\\*>\\|\\+>\\|-[<>|]\\|/>\\|<[<=-]\\|=\\(?:=>\\|[<=>|]\\)\\||\\(?:||::=\\|[>|]\\)\\|~[>~]\\|[$*+/:<=>|~-]\\)\\)")
                   (?= . "\\(?:=\\(?:!=\\|/=\\|:=\\|=[=>]\\|>>\\|[=>]\\)\\)")
                   (?> . "\\(?:>\\(?:=>\\|>[=>-]\\|[]:=-]\\)\\)")
                   (?? . "\\(?:\\?[.:=?]\\)")
                   (?\[ . "\\(?:\\[\\(?:||]\\|[<|]\\)\\)")
                   (?\ . "\\(?:\\\\/?\\)")
                   (?\] . "\\(?:]#\\)")
                   (?^ . "\\(?:\\^=\\)")
                   (?_ . "\\(?:_\\(?:|?_\\)\\)")
                   (?{ . "\\(?:{|\\)")
                   (?| . "\\(?:|\\(?:->\\|=>\\||\\(?:|>\\|[=>-]\\)\\|[]=>|}-]\\)\\)")
                   (?~ . "\\(?:~\\(?:~>\\|[=>@~-]\\)\\)"))))
      (dolist (char-regexp alist)
        (set-char-table-range composition-function-table (car char-regexp)
                              `([,(cdr char-regexp) 0 font-shape-gstring]))))
    (set-char-table-parent composition-ligature-table composition-function-table)))

;; Modeline settings
(after! doom-modeline
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode)
  (setq doom-modeline-buffer-encoding nil
        doom-modeline-vcs-max-length 24
        doom-modeline-major-mode-icon t)
  (map! :leader :desc "Modeline" "tm" #'hide-mode-line-mode))

;; Change theme on the fly
(use-package! cycle-theme
  :config
  (setq doom-theme (car jsvm/active-themes))
  (map! :leader
        :desc "Cycle theme" "tt" #'jsvm/cycle-theme))

(provide 'appearance)
