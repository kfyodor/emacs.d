(require 'cask "~/.cask/cask.el")

(cask-initialize)

(require 'use-package)
(require 'init-loader)
(require 'bind-key)

(eval-after-load "sql"
  '(progn
     (sql-set-product 'postgres)))

(setq make-backup-files nil)
(setq auto-save-default nil)

(use-package scratch)

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
  :config
  (browse-kill-ring-default-keybindings))

; (use-package ido :ensure t)
; (use-package flx :ensure t)

(use-package flx-ido
  :ensure t
  :init
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil)
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1))

(use-package monokai-theme
  :ensure t)

(defun my-disable-indent-tabs-mode ()
  (set-variable 'indent-tabs-mode nil))

(use-package js2-mode
  :init
  (add-hook 'js2-mode-hook 'my-disable-indent-tabs-mode))

(use-package linum-relative
   :init
   (setq linum-format
         (lambda (line)
           (propertize
            (format
             (let ((w (length (number-to-string
                               (count-lines (point-min)
                                            (point-max))))))
               (concat "%" (number-to-string w) "d "))
             line)
            'face
            'linum)))
   :config
   (global-linum-mode t))

(use-package projectile
  :init
  (setq projectile-switch-project-action 'projectile-find-dir)
  :config
  (projectile-global-mode))

(use-package perspective
  :config
  (persp-mode))

(use-package persp-projectile)
(use-package clojure-mode)

(use-package cider
  :config
  (setq cider-lein-command "/usr/local/bin/lein"))

(use-package paredit)
(use-package rainbow-delimiters)
(use-package highlight)
(use-package mic-paren
  :config
  (paren-activate))

(use-package undo-tree)

(use-package ruby-mode)
(use-package rspec-mode)
(use-package scss-mode)
(use-package coffee-mode)
(use-package slim-mode)
(use-package markdown-mode)
(use-package haskell-mode)
(use-package scala-mode)


(use-package magit
  :ensure t
  :config
  (setq magit-last-seen-setup-instructions "1.4.0"))

(use-package dired-details+)
(use-package volatile-highlights)

(use-package ace-jump-mode
  :bind ("C-o" . ace-jump-mode))

(use-package expand-region
  :bind ("C-=" . er/expand-region))


(init-loader-load)
