;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Basic settings
(setq user-full-name "Janus S. Valberg-Madsen"
      user-mail-address "janusvm@gmail.com")

;; Include subdirectories
(add-load-path! "functions" "settings")

;; Load settings from files in subdirectory
(use-package! appearance)
(use-package! window-mgmt)
(use-package! editing)
(use-package! lisps)
(use-package! writing)
(use-package! ide)
