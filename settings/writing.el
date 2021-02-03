;;; settings/writing.el -*- lexical-binding: t; -*-

;; TODO LaTeX

;; Markdowns
(use-package! poly-markdown
  :mode (("\\.md$" . poly-markdown-mode)
         ("\\.[jJ]md$" . poly-markdown-mode)))

(use-package! poly-R
  :mode ("\\.[rR]md" . poly-markdown+r-mode))

;; Org mode
(after! org-tree-slide
  (setq +org-present-text-scale 4))

(provide 'writing)
