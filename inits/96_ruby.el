;; (setq ruby-deep-arglist nil)
;; (setq ruby-deep-indent-paren nil)
;; (setq ruby-insert-encoding-magic-comment nil)
;; (setq ruby-align-to-stmt-keywords t)



;; (defadvice enh-ruby-indent-line (after unindent-closing-paren activate)
;;   (let ((column (current-column))
;;         indent offset)
;;     (save-excursion
;;       (back-to-indentation)
;;       (let ((state (syntax-ppss)))
;;         (setq offset (- column (current-column)))
;;         (when (and (eq (char-after) ?\))
;;                    (not (zerop (car state))))
;;           (goto-char (cadr state))
;;           (setq indent (current-indentation)))))
;;     (when indent
;;       (indent-line-to indent)
;;       (when (> offset 0) (forward-char offset)))))
