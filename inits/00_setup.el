(eval-after-load "sql"
  '(progn
     (sql-set-product 'postgres)))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq x-select-enable-clipboard t)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Force splitting windows horizontally
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)

(delete-selection-mode 1)

(defvar ignore-whitespace-modes '(markdown-mode))
(defun cleanup-whitespace ()
  (if (not (member major-mode ignore-whitespace-modes))
      (let ((whitespace-style '(trailing empty)) )
        (whitespace-cleanup))))

(add-hook 'before-save-hook 'cleanup-whitespace)

(volatile-highlights-mode t)

(put 'dired-find-alternate-file 'disabled nil)

(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(custom-set-variables '(coffee-tab-width 2))

(global-linum-mode t)
(setq linum-format
  (lambda (line)
    (propertize
      (format
        (let (
          (w (length
               (number-to-string
                 (count-lines (point-min)
                 (point-max))))))
          (concat "%" (number-to-string w) "d "))
        line)
      'face
      'linum)))
