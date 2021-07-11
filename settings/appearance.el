;;; settings/appearance.el -*- lexical-binding: t; -*-

;; FONT SETTINGS ---------------------------------------------------------------
(setq doom-font (font-spec :family "JetBrains Mono" :size 17)
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
        modus-themes-slanted-constructs t
        modus-themes-mode-line '(borderless)
        modus-themes-paren-match 'intense-bold)
  (modus-themes-load-themes))

;; Change theme on the fly
(use-package! cycle-theme
  :config
  (setq jsvm/active-themes '(modus-vivendi modus-operandi)
        doom-theme (car jsvm/active-themes))
  (map! :leader
        :desc "Cycle theme" "tt" #'jsvm/cycle-theme))

(provide 'appearance)
