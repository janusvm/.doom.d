;;; settings/window-mgmt.el -*- lexical-binding: t; -*-

(use-package! transpose-frame
  :config
  (map! :leader
        :prefix ("r" . "rotate")
        :desc "Transpose frames" "t" #'transpose-frame
        :desc "Flop frames horizontally" "f" #'flop-frame
        :desc "Flip frames vertically" "v" #'flip-frame
        :desc "Rotate frames 180 degrees" "r" #'rotate-frame
        :desc "Rotate frames clockwise" "c" #'rotate-frame-clockwise
        :desc "Rotate frames anticlockwise" "a" #'rotate-frame-anticlockwise))

(map! :leader :desc "Find file in other window" "fo" #'find-file-other-window)

;; Easy opening of terminal windows
(use-package! terminal-here
  :config
  (map! (:when IS-LINUX "<C-s-return>" #'terminal-here-launch)
        (:when IS-WINDOWS "<C-M-return>" #'terminal-here-launch))
  (setq terminal-here-linux-terminal-command 'alacritty
        terminal-here-windows-terminal-command (lambda (dir) (list "cmd.exe" "/C" "start" "wt.exe" "-d" dir))))

;; Make better use of avy
(after! avy
  (map! :nvm "s" #'avy-goto-char-timer))

(provide 'window-mgmt)
