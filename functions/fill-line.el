;;; functions/fill-line.el -*- lexical-binding: t; -*-

(defun jsvm/fill-line-with-char (char)
  "Append `char' to the current line until it is `fill-column' columns wide."
  (end-of-line)
  (while (< (current-column) fill-column)
    (insert-char char)))

;;;###autoload
(defun jsvm/insert-filled-line (char)
  "Prompt for `char' to insert on a commented line below point"
  (interactive "cFill character: ")
  (save-excursion
    (end-of-line)
    (newline)
    (comment-dwim nil)
    (jsvm/fill-line-with-char char)))

;;;###autoload
(defun jsvm/fill-line (char)
  "Prompt for `char' to insert until the current line is filled."
  (interactive "cFill character: ")
  (jsvm/fill-line-with-char char))

(provide 'fill-line)
