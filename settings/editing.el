;;; settings/editing.el -*- lexical-binding: t; -*-

(setq doom-scratch-initial-major-mode 'lisp-interaction-mode
      confirm-kill-emacs nil
      avy-all-windows 'all-frames
      tab-always-indent 'complete)

(electric-pair-mode 1)

;; Enable certain commands in evil-mc (multi-cursor) contexts
(after! evil-mc
  (dolist (cmd '(just-one-space))       ; TODO add more commands to this list
    (add-to-list 'evil-mc-known-commands
                 `(,cmd . ((:default . evil-mc-execute-default-call))))))

(use-package! fill-line
  :config
  (map! :leader :prefix "i"
        :desc "Fill line" "-" #'jsvm/fill-line
        :desc "Insert line" "_" #'jsvm/insert-filled-line))

(use-package! gitmoji
  :config
  (map! :leader :desc "Gitmoji" "ig" #'gitmoji-insert-emoji))

(map! :leader
      :desc "Version control" "pv" #'projectile-vc)

(provide 'editing)
