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

(defalias 'yes-or-no-p 'y-or-n-p)

(setq x-select-enable-clipboard t)
(global-hl-line-mode 1)

;; Picked from https://github.com/overtone/emacs-live/blob/master/packs/stable/foundation-pack/config/built-in.el#L73

(require 'ansi-color)
(ansi-color-for-comint-mode-on)
(setq font-lock-maximum-decoration t)

; (require 'win-switch)
; (setq win-switch-feedback-background-color "DeepPink3")
; (setq win-switch-feedback-foreground-color "black")
; (setq win-switch-window-threshold 1)
; (setq win-switch-idle-time 0.7)

; (win-switch-set-keys '() 'up)
; (win-switch-set-keys '() 'down)
; (win-switch-set-keys '() 'left)
; (win-switch-set-keys '() 'right)
; (win-switch-set-keys '("o") 'next-window)
; (win-switch-set-keys '("p") 'previous-window)
; (win-switch-set-keys '() 'enlarge-vertically)
; (win-switch-set-keys '() 'shrink-vertically)
; (win-switch-set-keys '() 'shrink-horizontally)
; (win-switch-set-keys '() 'enlarge-horizontally)
; (win-switch-set-keys '() 'other-frame)
; (win-switch-set-keys '("C-g") 'exit)
; (win-switch-set-keys '() 'split-horizontally)
; (win-switch-set-keys '() 'split-vertically)
; (win-switch-set-keys '() 'delete-window)
; (win-switch-set-keys '("\M-\C-g") 'emergency-exit)

(global-hl-line-mode)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

(set-fringe-mode '(4 . 0))

(setq-default truncate-lines 1)
