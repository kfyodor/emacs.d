(toggle-scroll-bar -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)

; (add-to-list 'default-frame-alist '(width . 174))
; (add-to-list 'default-frame-alist '(height . 48))

(setq c-basic-offset 2)
(setq css-indent-offset 2)

(setq color-theme-is-global t)
(setq ring-bell-function 'ignore)
(setq init-loader-show-log-after-init nil)

(load-theme 'monokai t)
(setq default-frame-alist '((font . "Source Code Pro 13")))

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

(setq-default truncate-lines 1)

(define-clojure-indent
  (defroutes 'defun)
  (routes 2)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))