;;; bug-fixes.el -*- lexical-binding: t; -*-

;; Fix a compatibility error with Emacs 29
(when (version<= "29" emacs-version)
  (after! elisp-refs
    (defvar read-symbol-positions-list ())))

(provide 'bug-fixes)
