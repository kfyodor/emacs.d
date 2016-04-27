(defun custom-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'custom-clojure-mode-hook)

;; Grabbed from Emacs Live

(dolist (x '(scheme emacs-lisp lisp clojure clojurescript))
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) #'paredit-mode)
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) #'rainbow-delimiters-mode)
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) #'aggressive-indent-mode))

(setq auto-mode-alist (append '(("\\.cljs$" . clojurescript-mode))
                                 auto-mode-alist))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil))))))

(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))

(define-clojure-indent
  (defroutes 'defun)
  (routes 2)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2)
  (go-let 2)
  (go-loop 2)
  (match 2))
