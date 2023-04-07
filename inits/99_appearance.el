;;; package --- Summary:
;;; Commentary:

;;; Code:

(toggle-scroll-bar -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq echo-keystrokes 0.1)

;; works only with emacs-mac
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq ring-bell-function 'ignore)

(load-theme 'cyberpunk t)

; https://github.com/tonsky/FiraCode/wiki/Setting-up-Emacs
(when (window-system)
  (set-frame-font "Fira Code 13"))

(global-hl-line-mode 1)

(require 'ansi-color)
(setq font-lock-maximum-decoration t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

(set-fringe-mode '(4 . 0))

(setq-default truncate-lines t)

;;;;;;;;;
