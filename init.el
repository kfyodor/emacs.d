(require 'cl)
(require 'package)

(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(setq package-pinned-packages
      '((init-loader          . "melpa-stable")
        (exec-path-from-shell . "melpa-stable")
        (diff-hl              . "melpa-stable")
        (emmet-mode           . "melpa-stable")
        (smart-mode-line      . "melpa-stable")
        (smex                 . "melpa-stable")
        (browse-kill-ring     . "melpa-stable")
        (flx                  . "melpa-stable")
        ;(ido-vertical-mode   . "melpa-stable")
        ;(flx-ido             . "melpa-stable")
        (js2-mode             . "melpa-stable")
        (projectile           . "melpa-stable")
        (go-mode              . "melpa-stable")
        (clojure-mode         . "melpa-stable")
        (clj-refactor         . "melpa-stable")
        (queue                . "melpa")
        (cider                . "melpa-stable")
        (paredit              . "melpa-stable")
        (smartparens          . "melpa-stable")
        (rainbow-delimiters   . "melpa-stable")
        (rspec-mode           . "melpa-stable")
        (scss-mode            . "melpa-stable")
        (coffee-mode          . "melpa-stable")
        (slim-mode            . "melpa-stable")
        (markdown-mode        . "melpa-stable")
        (haskell-mode         . "melpa-stable")
        (hi2                  . "melpa-stable")
        (magit                . "melpa-stable")
        (git-gutter           . "melpa-stable")
        (ace-jump-mode        . "melpa-stable")
        (expand-region        . "melpa-stable")
        (mic-paren            . "melpa")
        (win-switch           . "melpa-stable")
        (ag                   . "melpa-stable")
        (yaml-mode            . "melpa-stable")
        (haml-mode            . "melpa-stable")
        (company              . "melpa-stable")
        (scala-mode           . "melpa-stable")
        (sbt-mode             . "melpa-stable")
        (yasnippet            . "melpa-stable")
        (idomenu              . "melpa-stable")
        (dockerfile-mode      . "melpa-stable")
        (alchemist            . "melpa-stable")
        (dired-filter         . "melpa")
        (dired-subtree        . "melpa")
        (use-package          . "melpa")
        (undo-tree            . "elpa")
        (indent-guide         . "melpa")
        (highlight            . "melpa")
        (ivy                  . "melpa")
        (counsel-projectile   . "melpa-stable")
        (swiper               . "melpa-stable")
        (flycheck             . "melpa")
        (lsp-mode             . "melpa-stable")
        (lsp-metals           . "melpa-stable")
        (lsp-ui               . "melpa-stable")
        (company-lsp          . "melpa-stable")
        (posframe             . "melpa-stable")
        (dap-mode             . "melpa-stable")
        (enh-ruby-mode        . "melpa")))

(package-initialize)
(setq package-contents-refreshed nil)

(mapc (lambda (pinned-package)
	(let ((package (car pinned-package))
	      (archive (cdr pinned-package)))
	  (unless (package-installed-p package)
            (unless package-contents-refreshed
              (package-refresh-contents)
              (setq package-contents-refreshed t))
	    (message "Installing %s from %s" package archive)
	    (package-install package))))
      package-pinned-packages)

(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))

(require 'use-package)

(use-package init-loader)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package diff-hl)

(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'dark)
  (setq sml/shorten-directory t)
  (setq sml/shorten-modes t)
  :config
  (add-to-list 'sml/replacer-regexp-list '("^~/apps" ":a:"))
  (sml/setup))

(use-package smex
  :bind
  (("M-x" . smex)
   ("C-x m" . smex)))

(use-package browse-kill-ring
  :config (browse-kill-ring-default-keybindings))

;(use-package idomenu)

; (use-package ido-vertical-mode)

;; (use-package flx-ido
;;   :init
;;   (setq ido-create-new-buffer 'always)
;;   (setq ido-enable-flex-matching t)
;;   (setq ido-enable-prefix nil)
;;   (setq ido-max-prospects 8)
;;   (setq ido-default-file-method 'selected-window)
;;   (add-to-list 'ido-ignore-files "\\.DS_Store")
;;   :config
;;   (ido-mode t)
;;   (icomplete-mode 1)
;;   (ido-everywhere 1)
;;   (flx-ido-mode 1)
;;   (ido-vertical-mode 1))

(require 'cyberpunk-theme)

(defun my-disable-indent-tabs-mode ()
  (set-variable 'indent-tabs-mode nil))

(add-hook 'prog-mode-hook 'my-disable-indent-tabs-mode)

(use-package js2-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.avsc\\'" . js2-mode))
  (setq js2-basic-offset 2)
  (setq js-indent-level 2)
  :config
  (add-hook 'js2-mode-hook 'my-disable-indent-tabs-mode))

(use-package projectile
  :init
  (setq projectile-switch-project-action 'projectile-dired)
  :config
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-file-suffixes "\.js\.map")
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-global-mode))

(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode))

(use-package swiper)

(use-package dired-filter)
(use-package dired-subtree)

(use-package clojure-mode)

;(use-package aggressive-indent)

(use-package clj-refactor)

(use-package cider
  :init
  (add-hook 'clojure-mode-hook #'cider-mode)
  :config
  (setq cider-lein-command "/usr/local/bin/lein")
  (setq cider-boot-commant "/usr/local/bin/boot")
  (setq cider-repl-display-help-banner nil)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (cider-repl-toggle-pretty-printing)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode))

(use-package paredit)

(use-package smartparens
  :init
  (add-hook 'js-mode-hook 'smartparens-mode)
  (add-hook 'ruby-mode-hook 'smartparens-mode)
  (add-hook 'scala-mode-hook 'smartparens-mode))

(use-package rainbow-delimiters)

(use-package undo-tree)

(use-package rspec-mode)

(use-package scss-mode
  :init
  (setq scss-compile-at-save nil))

(use-package coffee-mode
  :init
  (setq coffee-tab-width 2))

(use-package slim-mode)

(use-package markdown-mode)

(use-package haskell-mode
  :config
  (add-hook 'haskell-mode-hook 'haskell-indentation-mode))

(use-package hi2
  :config
  (add-hook 'haskell-mode-hook 'turn-on-hi2))

(use-package indent-guide
  :init
  (setq indent-guide-recursive t))

(use-package magit
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  :config
  (add-hook 'magit-log-edit-mode-hook
	    (lambda ()
	      (set-fill-column 72)
	      (auto-fill-mode 1))))

(use-package git-gutter
  :init
  (setq git-gutter:window-width 2)
  (setq git-gutter:modified-sign "~ ")
  (setq git-gutter:added-sign "+ ")
  (setq git-gutter:deleted-sign "- ")
  (setq git-gutter:lighter " G-+")
  (global-git-gutter-mode t)
  (git-gutter:linum-setup))

(use-package ace-jump-mode
  :bind ("C-o" . ace-jump-mode))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package mic-paren
  :config
  (paren-activate)
  (add-hook 'after-init-hook
	    (lambda () (set-face-background 'paren-face-match "DeepPink3"))))

(require 'volatile-highlights)
(volatile-highlights-mode t)

(use-package highlight)

(use-package win-switch
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

(require 'livedown)

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

(use-package haml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode)))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package scala-mode
  :init
  (setq scala-indent:align-parameters t))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false")))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :hook  (scala-mode . lsp)
         (lsp-mode . lsp-lens-mode)
  :config (setq lsp-prefer-flymake nil))

(use-package lsp-metals)

(use-package lsp-ui)

(use-package posframe)

(use-package company-lsp)

(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

;; (use-package lsp-treemacs
;;   :config
;;   (lsp-metals-treeview-enable t)
;;   (setq lsp-metals-treeview-show-when-views-received t))

(use-package yasnippet
  :config
  (yas-global-mode 1)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

;; (use-package sql-indent
;;   :config
;;   (add-hook 'sql-mode-hook 'sqlind-minor-mode))

(use-package emmet-mode
  :init
  (add-hook 'html-mode-hook 'emmet-mode)
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))))

(use-package dockerfile-mode
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

;(use-package systemd
;  :config
;  (add-to-list 'auto-mode-alist '("//.service'" . systemd-mode)))

(init-loader-load)
(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (sql-indent counsel-projectile ivy highlight indent-guide undo-tree use-package dired-subtree dired-filter dockerfile-mode idomenu sbt-mode scala-mode yaml-mode win-switch smex smartparens smart-mode-line slim-mode scss-mode rspec-mode rainbow-delimiters projectile mic-paren markdown-mode magit js2-mode init-loader ido-vertical-mode hi2 haskell-mode haml-mode go-mode git-gutter flx-ido expand-region exec-path-from-shell emmet-mode diff-hl company coffee-mode clj-refactor browse-kill-ring ag ace-jump-mode)))
 '(sql-mode-hook (quote (sqlind-minor-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
