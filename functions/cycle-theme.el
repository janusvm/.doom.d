;;; functions/cycle-theme.el -*- lexical-binding: t; -*-

(defvar jsvm/active-themes nil
  "Active themes to cycle through with jsvm/cycle-theme")

;;;###autoload
(defun jsvm/cycle-theme ()
  "Cycle list of active themes, loading the next in line"
  (interactive)
  (let ((new-theme (car (last jsvm/active-themes)))
        (old-themes (butlast jsvm/active-themes)))
    (setq jsvm/active-themes (cons new-theme old-themes))
    (load-theme new-theme)
    (message "Loaded theme: %s" new-theme)))

(provide 'cycle-theme)
