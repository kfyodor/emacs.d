(toggle-scroll-bar -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq echo-keystrokes 0.1)

(add-to-list 'initial-frame-alist '(width . 176))
(add-to-list 'initial-frame-alist '(height . 54))

(setq c-basic-offset 2)
(setq css-indent-offset 2)

(setq color-theme-is-global t)
(setq ring-bell-function 'ignore)
(setq init-loader-show-log-after-init nil)

(load-theme 'cyberpunk t)

; https://github.com/tonsky/FiraCode/wiki/Setting-up-Emacs
(when (window-system)
  (set-default-font "Fira Code 13"))

(when (functionp 'mac-auto-operator-composition-mode)
  (setq mac-auto-operator-composition-characters "!\"#$%&'*+,-/:;<=>?@^_`|~.")
  (mac-auto-operator-composition-mode))

(global-hl-line-mode 1)

(require 'ansi-color)
(setq font-lock-maximum-decoration t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(set-fringe-mode '(4 . 0))
(setq-default truncate-lines 1)
