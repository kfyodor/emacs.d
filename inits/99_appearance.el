(toggle-scroll-bar -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq echo-keystrokes 0.1)
(add-to-list 'default-frame-alist '(width . 174))
(add-to-list 'default-frame-alist '(height . 48))

(defvar parameters)

(add-hook 'before-make-frame-hook
  (lambda ()
    (let ((left (cdr (assq 'left (frame-parameters))))
      (top (cdr (assq 'top (frame-parameters)))))
      (setq parameters (cons (cons 'left (+ left 0))
                     (cons (cons 'top (+ top 0))
                       parameters))))))

(setq c-basic-offset 2)
(setq css-indent-offset 2)

(setq color-theme-is-global t)
(setq ring-bell-function 'ignore)
(setq init-loader-show-log-after-init nil)

(load-theme 'cyberpunk t)
(setq default-frame-alist '((font . "Source Code Pro 13")))

(global-hl-line-mode 1)

(require 'ansi-color)
(setq font-lock-maximum-decoration t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(set-fringe-mode '(4 . 0))
(setq-default truncate-lines 1)
