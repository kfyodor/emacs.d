(require 'cask "~/.cask/cask.el")

(cask-initialize)

(require 'use-package)
(require 'init-loader)

; (use-package win-switch
;   :ensure t)

(use-package diff-hl)

(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'reverse))

(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'dark)
  (setq sml/shorten-directory t)
  :config
  (sml/setup))

(use-package smex
  :bind
  (("M-x" . smex)
   ("C-x m" . smex)))


(use-package browse-kill-ring
  :ensure t
  :config (browse-kill-ring-default-keybindings))

(use-package flx-ido
  :ensure t
  :init
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil)
  (add-to-list 'ido-ignore-files "\\.DS_Store")
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1))

(use-package cyberpunk-theme
  :ensure t)

(defun my-disable-indent-tabs-mode ()
  (set-variable 'indent-tabs-mode nil))

(use-package js2-mode
  :init
  (add-hook 'js2-mode-hook 'my-disable-indent-tabs-mode))

(use-package projectile
  :init
  (setq projectile-switch-project-action 'projectile-dired)
  :config
  (projectile-global-mode))

(use-package perspective
  :config
  (persp-mode))

(use-package persp-projectile)

(use-package clojure-mode)

(use-package cider
  :config
  (setq cider-lein-command "/usr/local/bin/lein")
  (setq cider-boot-commant "/usr/local/bin/boot"))

(use-package paredit)
(use-package rainbow-delimiters)

(use-package undo-tree)

(use-package ruby-mode)
(use-package rspec-mode)
(use-package scss-mode)
(use-package coffee-mode)
(use-package slim-mode)
(use-package markdown-mode)
(use-package haskell-mode)

(use-package indent-guide
  :init
  (setq indent-guide-recursive t))

(use-package magit
  :ensure t
  :config
  (setq magit-last-seen-setup-instructions "1.4.0"))

(use-package ace-jump-mode
  :bind ("C-o" . ace-jump-mode))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(init-loader-load)
