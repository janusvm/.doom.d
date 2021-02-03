;;; settings/lisps.el -*- lexical-binding: t; -*-

;; Lispy keybindings
(after! lispyville
  (lispyville-set-key-theme
   '((operators normal)
     c-w
     (prettify insert)
     (atom-movement t)
     slurp/barf-lispy
     additional
     additional-insert
     commentary
     additional-movement
     (additional-wrap normal insert)
     text-objects
     prettify)))

;; Scheme settings
(after! geiser
  (setq geiser-active-implementations '(guile)
        geiser-default-implementation 'guile))

(provide 'lisps)
