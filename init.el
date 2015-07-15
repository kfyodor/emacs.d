(require 'cask "~/.cask/cask.el")

(cask-initialize)

(require 'use-package)
(require 'init-loader)

(add-to-list 'load-path
	     (expand-file-name "lib" user-emacs-directory))

(use-package diff-hl
  :ensure t)

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'dark)
  (setq sml/shorten-directory t)
  :config
  (sml/setup))

(use-package smex
  :ensure t
  :bind
  (("M-x" . smex)
   ("C-x m" . smex)))


(use-package browse-kill-ring
  :ensure t
  :ensure t
  :config (browse-kill-ring-default-keybindings))

(use-package idomenu)
(use-package flx-ido
  :ensure t
  :init
  (setq ido-create-new-buffer 'always)
  (setq ido-enable-flex-matching t)
  (setq ido-default-file-method 'selected-window)
  ;(setq ido-use-faces nil)
  (add-to-list 'ido-ignore-files "\\.DS_Store")
  :config
  (ido-mode 1)
  (icomplete-mode 1)
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
  :ensure t
  :init
  (setq projectile-switch-project-action 'projectile-dired)
  :config
  (projectile-global-mode))

; (use-package perspective
;   :ensure t
;   :config
;   (persp-mode))

; (use-package persp-projectile)

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t
  :config
  (setq cider-lein-command "/usr/local/bin/lein")
  (setq cider-boot-commant "/usr/local/bin/boot"))

(use-package paredit
  :ensure t)

(use-package smartparens
  :init
  (add-hook 'ruby-mode-hook 'smartparens-mode))

(use-package rainbow-delimiters
  :ensure t)

(use-package undo-tree
  :ensure t)

(use-package ruby-mode)
(use-package rspec-mode)
(use-package scss-mode
  :init
  (setq scss-compile-at-save nil))

(use-package coffee-mode)
(use-package slim-mode)
(use-package markdown-mode)
(use-package haskell-mode)

(use-package indent-guide
  :init
  (setq indent-guide-recursive t))

(use-package magit
  :ensure t
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"))

(use-package git-gutter
  :ensure t
  :init
  ;(setq git-gutter:window-width 2)
  ;(setq git-gutter:modified-sign "~ ")
  ;(setq git-gutter:added-sign "+ ")
  ;(setq git-gutter:deleted-sign "- ")
  ;(setq git-gutter:lighter " G-+")
  ;(setq git-gutter:unchanged-sign "  ")
  )

(use-package git-gutter-fringe
  :ensure t
  :init
  (setq-default indicate-buffer-boundaries 'left)
  ;(setq-default indicate-empty-lines +1)
  :config
  (global-git-gutter-mode +1))

(use-package ace-jump-mode
  :bind ("C-o" . ace-jump-mode))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(require 'mic-paren)
(paren-activate)

(require 'volatile-highlights)
(volatile-highlights-mode t)

(require 'highlight)

(use-package win-switch
  :ensure t
  :config
  (setq win-switch-feedback-background-color "DeepPink3")
  (setq win-switch-feedback-foreground-color "black")
  (setq win-switch-window-threshold 1)
  (setq win-switch-idle-time 0.7)
  (win-switch-set-keys '() 'up)
  (win-switch-set-keys '() 'down)
  (win-switch-set-keys '() 'left)
  (win-switch-set-keys '() 'right)
  (win-switch-set-keys '("o") 'next-window)
  (win-switch-set-keys '("p") 'previous-window)
  (win-switch-set-keys '() 'enlarge-vertically)
  (win-switch-set-keys '() 'shrink-vertically)
  (win-switch-set-keys '() 'shrink-horizontally)
  (win-switch-set-keys '() 'enlarge-horizontally)
  (win-switch-set-keys '() 'other-frame)
  (win-switch-set-keys '("C-g") 'exit)
  (win-switch-set-keys '() 'split-horizontally)
  (win-switch-set-keys '() 'split-vertically)
  (win-switch-set-keys '() 'delete-window)
  (win-switch-set-keys '("\M-\C-g") 'emergency-exit))

(use-package ag)

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

(use-package haml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode)))

(use-package indent-guide)
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(init-loader-load)
