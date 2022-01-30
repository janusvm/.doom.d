;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Basic settings
(setq user-full-name "Janus S. Valberg-Madsen"
      user-mail-address "janusvm@gmail.com")

;; Include subdirectories
(add-load-path! "functions" "settings")

;; Load settings from files in subdirectory
(use-package! bug-fixes)
(use-package! appearance)
(use-package! window-mgmt)
(use-package! editing)
(use-package! lisps)
(use-package! writing)
(use-package! ide)

;; Load machine local settings, if available
(load! "local-config.el" doom-private-dir t)

;; Start in $HOME directory
(cd (getenv "HOME"))
