(global-set-key (kbd "M-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x o") 'win-switch-dispatch)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-m") 'imenu)
;; (global-set-key (kbd "C-,", 'execute-extended-command))

(define-key dired-mode-map "i" 'dired-subtree-insert)
(define-key dired-mode-map ";" 'dired-subtree-remove)

(setq mac-command-modifier 'control)
(setq mac-option-modifier 'meta)
