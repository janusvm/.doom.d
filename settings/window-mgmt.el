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

;; Easy opening of terminal windows on my Linux machines
(use-package! terminal-here
  :config
  (map! "<C-s-return>" #'terminal-here-launch)
  (setq terminal-here-linux-terminal-command 'alacritty))

(provide 'window-mgmt)
