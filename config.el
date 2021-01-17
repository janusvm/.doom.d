;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Basic settings
(setq user-full-name "Janus S. Valberg-Madsen"
      user-mail-address "janusvm@gmail.com"

      ;; Appearance
      doom-font (font-spec :family "Iosevka SS04" :size 18 :weight 'regular)
      doom-big-font (font-spec :family "Iosevka SS04" :size 36 :weight 'semibold)
      doom-theme 'doom-nord
      doom-scratch-initial-major-mode 'lisp-interaction-mode

      display-line-numbers-type nil)

(setq confirm-kill-emacs nil)

;; TODO figure out a good way to organise my settings
;; -----------------------------------------------------------------------------

(electric-pair-mode 1)                  ; Always insert matching parens etc.
(setq tab-always-indent 'complete)      ; I don't ever want to *insert* tabs

;; Enable certain commands in evil-mc (multi-cursor) contexts
(after! evil-mc
  (dolist (cmd '(just-one-space))       ; TODO add more commands to this list
    (add-to-list 'evil-mc-known-commands
                 `(,cmd . ((:default . evil-mc-execute-default-call))))))

(after! geiser
  (setq geiser-active-implementations '(guile)
        geiser-default-implementation 'guile))

(after! org-tree-slide
  (setq +org-present-text-scale 4))

;; Open terminal in the directory of currently open buffer
(map! "<C-s-return>" #'terminal-here-launch)
(setq terminal-here-command-command (list "alacritty"))

(setq avy-all-windows 'all-frames)      ; Jump anywhere that's visible on screen

(map! :leader
      :desc "Version control" "pv" #'projectile-vc)

(map! :leader
      :prefix ("r" . "rotate")
      :desc "Transpose frames" "t" #'transpose-frame
      :desc "Flop frames horizontally" "f" #'flop-frame
      :desc "Flip frames vertically" "v" #'flip-frame
      :desc "Rotate frames 180 degrees" "r" #'rotate-frame
      :desc "Rotate frames clockwise" "c" #'rotate-frame-clockwise
      :desc "Rotate frames anticlockwise" "a" #'rotate-frame-anticlockwise)

(map! :leader
      :desc "Modeline" "tm" #'hide-mode-line-mode
      :desc "Find file in other window" "fo" #'find-file-other-window)

;; Polymode
(use-package! poly-markdown
  :mode ("\\.md$" . poly-markdown-mode))

;; ------------------------------------------------------------------------------
(setq jsvm/active-themes '(doom-nord doom-nord-light))
(defun jsvm/cycle-theme ()
  "Cycle list of active themes, loading the next in line"
  (interactive)
  (let ((new-theme (car (last jsvm/active-themes)))
        (old-themes (butlast jsvm/active-themes)))
    (setq doom-theme new-theme)
    (setq jsvm/active-themes (cons new-theme old-themes))
    (doom/reload-theme)))
(map! :leader
      :desc "Cycle theme" "tt" #'jsvm/cycle-theme)

(map! :leader :desc "Gitmoji" "ig" #'gitmoji-insert-emoji)
