;; ;; My Emacs configuration

;; (require 'init-loader)
;; (require 'use-package)
;; (init-loader-load)

;; ;; move to js2-mode

;; (add-hook 'js2-mode-hook 'my-disable-indent-tabs-mode)
;; (defun my-disable-indent-tabs-mode ()
;;   (set-variable 'indent-tabs-mode nil))

;; (setq mac-command-modifier 'control)

;; ;; move to linum mode
;; (global-linum-mode t)
;; (setq linum-format
;;   (lambda (line)
;;     (propertize
;;       (format
;;         (let (
;;           (w (length
;;                (number-to-string
;;                  (count-lines (point-min)
;;                  (point-max))))))
;;           (concat "%" (number-to-string w) "d "))
;;         line)
;;       'face
;;       'linum)))

;; ;; move to projectile

;; (projectile-global-mode)
;; (setq projectile-completion-system 'grizzl)
;; (setq projectile-switch-project-action 'projectile-find-dir)

;; ;; move to clojure

;; (define-clojure-indent
;;   (defroutes 'defun)
;;   (routes 2)
;;   (GET 2)
;;   (POST 2)
;;   (PUT 2)
;;   (DELETE 2)
;;   (HEAD 2)
;;   (ANY 2)
;;   (context 2))


;; ;; bindings

;; (define-key global-map (kbd "C-=") 'er/expand-region)

;; ;; Multiple cursors
;; (define-key global-map (kbd "C-L") 'mc/edit-lines)
;; (define-key global-map (kbd "C->") 'mc/mark-next-like-this)
;; (define-key global-map (kbd "C-<") 'mc/mark-previous-like-this)
;; (define-key global-map (kbd "C-c C-<") 'mc/mark-all-like-this)
