;;;; Package configs that are <6 lines
(use-package rainbow-delimiters
  :ensure t
  :init
  (dolist (mode-hook '(prog-mode-hook
                       cider-repl-mode-hook))
    (add-hook mode-hook #'rainbow-delimiters-mode)))

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup))

(use-package rspec-mode
  :ensure t
  :init
  (dolist (mode-hook '(ruby-mode-hook
                       web-mode-hook))
    (add-hook mode-hook #'rspec-mode)))

(use-package rvm
  :ensure t
  :config
  (rvm-use-default))

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode)

(use-package web-beautify
  :ensure t)

(use-package flymd
  :ensure t)

(use-package inf-ruby
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(provide 'init-short-package-configs)
