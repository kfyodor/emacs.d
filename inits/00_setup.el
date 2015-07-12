(eval-after-load "sql"
  '(progn
     (sql-set-product 'postgres)))

(defun require-dir (dir-name)
  (add-to-list 'load-path
               (expand-file-name dir-name user-emacs-directory)))

(setq make-backup-files nil)
(setq auto-save-default nil)

(defvar ignore-whitespace-modes '(markdown-mode))
(defun cleanup-whitespace ()
  (if (not (member major-mode ignore-whitespace-modes))
      (let ((whitespace-style '(trailing empty)) )
        (whitespace-cleanup))))

(add-hook 'before-save-hook 'cleanup-whitespace)

;; More required packages
(require-dir "lib")

(require 'mic-paren)
(paren-activate)

(require 'volatile-highlights)
(volatile-highlights-mode t)

(require 'highlight)

(put 'dired-find-alternate-file 'disabled nil)