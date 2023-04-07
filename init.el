;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'package)

(package-initialize)

(add-to-list 'package-archives
             '("elpa" . "http://elpa.gnu.org/packages/") t)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(require 'use-package)

(setq use-package-always-pin "melpa-stable")

(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))

(use-package init-loader
  :ensure t
  :init
  (setq init-loader-show-log-after-init nil))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package diff-hl
  :ensure t)

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'dark)
  (setq sml/shorten-directory t)
  (setq sml/shorten-modes t)
  :config
  (add-to-list 'sml/replacer-regexp-list '("^~/apps" ":a:"))
  (sml/setup))

(use-package smex
  :ensure t
  :bind
  (("M-x" . smex)
   ("C-x m" . smex)))

(use-package browse-kill-ring
  :ensure t
  :config
  (browse-kill-ring-default-keybindings))

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
;; [TODO] ???
(defun my-disable-indent-tabs-mode ()
  (set-variable 'indent-tabs-mode nil))
(add-hook 'prog-mode-hook 'my-disable-indent-tabs-mode)


(use-package js2-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.avsc\\'" . js2-mode))
  (setq js2-basic-offset 2)
  (setq js-indent-level 2)
  :config
  (add-hook 'js2-mode-hook 'my-disable-indent-tabs-mode))

(use-package projectile
  :ensure t
  :init
  (setq projectile-switch-project-action 'projectile-dired)
  :config
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-file-suffixes "\.js\.map")
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-global-mode))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package ag
  :ensure t)

(use-package swiper
  :ensure t)

(use-package ace-jump-mode
  :ensure t
  :bind ("C-o" . ace-jump-mode))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package mic-paren
  :ensure t
  :pin "melpa"
  :config
  (paren-activate)
  (add-hook 'after-init-hook
	    (lambda () (set-face-background 'paren-face-match "DeepPink3"))))

(use-package volatile-highlights
  :ensure t
  :pin "melpa"
  :config
  (volatile-highlights-mode t))

(use-package rainbow-delimiters
  :ensure t)

(use-package undo-tree
  :ensure t
  :pin "elpa")

(use-package indent-guide
  :ensure t
  :init
  (setq indent-guide-recursive t))

;; (use-package dired-filter)
;; (use-package dired-subtree)

;; Clojure:

(use-package clojure-mode
  :ensure t)

(use-package clj-refactor
  :ensure t)

;; (use-package aggressive-indent)

(use-package paredit
  :ensure t)


(use-package cider
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'cider-mode)
  :config
  (setq cider-lein-command "/usr/local/bin/lein")
  (setq cider-boot-commant "/usr/local/bin/boot")
  (setq cider-repl-display-help-banner nil)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (cider-repl-toggle-pretty-printing)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode))

;; Ruby:

(use-package rbenv
  :ensure t
  :pin "melpa"
  :init
  (setq rbenv-installation-dir "~/.rbenv")

  :config
  (global-rbenv-mode 1)
  (rbenv-use-global))

(use-package enh-ruby-mode
  :ensure t
  :pin "melpa"
  :interpreter "ruby"
  :mode
  "\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'"

  :config
  (setq enh-ruby-program "~/.rbenv/versions/3.1.3/bin/ruby")
  (setq enh-ruby-deep-indent-paren nil)
  (setq enh-ruby-deep-indent-construct t)
  (setq enh-ruby-deep-indent-paren t)
  (setq enh-ruby-hanging-brace-deep-indent-level 0)
  (setq enh-ruby-hanging-brace-indent-level 2)
  (setq enh-ruby-hanging-indent-level 2)
  (setq enh-ruby-hanging-paren-deep-indent-level 0)
  (setq enh-ruby-hanging-paren-indent-level 2)
  (setq enh-ruby-indent-level 2)
  (setq enh-ruby-indent-tabs-mode nil)

  (remove-hook 'enh-ruby-mode-hook 'erm-define-faces))

(use-package rspec-mode
  :ensure t)

(use-package rubocop
  :ensure t
  :config
  (add-hook 'enh-ruby-mode-hook #'rubocop-mode))

(use-package smartparens
  :ensure t
  :init
  (add-hook 'js-mode-hook 'smartparens-mode)
  (add-hook 'ruby-mode-hook 'smartparens-mode)
  (add-hook 'enh-ruby-mode-hook 'smartparens-mode)
  (add-hook 'scala-mode-hook 'smartparens-mode))

;; Other langs and major modes:

(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'haskell-indentation-mode))

(use-package hi2
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'turn-on-hi2))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

(use-package scala-mode
  :ensure t
  :init
  (setq scala-indent:align-parameters t))

(use-package sbt-mode
  :ensure t
  :commands sbt-start sbt-command
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
  (setq sbt:program-options '("-Dsbt.supershell=false")))

(use-package dockerfile-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package make-mode
  :init
  (add-hook 'makefile-mode-hook
            (lambda () (setq indent-tabs-mode t))))

(use-package markdown-mode
  :ensure t)

(use-package systemd
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("//.service'" . systemd-mode)))

;; Misc:

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config (add-hook 'enh-ruby-mode-hook
                    (lambda ()
                      (setq-local flycheck-command-wrapper-function
                                  (lambda (command) (append '("bundle" "exec") command))))))

(use-package magit
  :ensure t
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  :config
  (add-hook 'magit-log-edit-mode-hook
	    (lambda ()
	      (set-fill-column 72)
	      (auto-fill-mode 1))))

(use-package git-gutter
  :ensure t
  :init
  (setq git-gutter:window-width 2)
  (setq git-gutter:modified-sign "~ ")
  (setq git-gutter:added-sign "+ ")
  (setq git-gutter:deleted-sign "- ")
  (setq git-gutter:lighter " G-+")
  (global-git-gutter-mode t)
  (git-gutter:linum-setup))

;; (use-package highlight)


;; [TODO] Do I use it???
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

;; Markdown live preview in Browser
;; (require 'livedown)

;; (use-package lsp-mode
;;   ;; Optional - enable lsp-mode automatically in scala files
;;   :hook  (scala-mode . lsp)
;;          (lsp-mode . lsp-lens-mode)
;;   :config (setq lsp-prefer-flymake nil))

;; (use-package lsp-metals
;;   :ensure t)

;; (use-package lsp-ui
;;   :ensure t)

;; (use-package posframe
;;   :ensure t)

;; (use-package company-lsp
;;   :ensure t)

;; (use-package dap-mode
;;   :ensure t
;;   :hook
;;   (lsp-mode . dap-mode)
;;   (lsp-mode . dap-ui-mode))

;; Do I use it?
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

(use-package ligature
  :ensure t
  :pin "melpa"
  :config
  (ligature-set-ligatures 't '("www"))
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
  (global-ligature-mode t))

(init-loader-load)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   '(ligature systemd volatile-highlights rubocop enh-ruby-mode rbenv sql-indent counsel-projectile ivy highlight indent-guide undo-tree use-package dired-subtree dired-filter dockerfile-mode idomenu sbt-mode scala-mode yaml-mode win-switch smex smartparens smart-mode-line slim-mode scss-mode rspec-mode rainbow-delimiters projectile mic-paren markdown-mode magit js2-mode init-loader ido-vertical-mode hi2 haskell-mode haml-mode go-mode git-gutter flx-ido expand-region exec-path-from-shell emmet-mode diff-hl company coffee-mode clj-refactor browse-kill-ring ag ace-jump-mode))
 '(sql-mode-hook '(sqlind-minor-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
