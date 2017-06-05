;;;;adc17's emacs.d/init.el file (I started doing this properly on 12/29/2016). 

;;;Specifies how emacs window will initially render.
(setq initial-frame-alist '((top . 0) (left . 97) (width . 140) (height . 50)))
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;;Adds package archives and disables package loading until init file has been executed.

(require 'package)

(setq package-archives
      '(("gnu elpa"     . "http://elpa.gnu.org/packages/")
        ("org"          . "http://orgmode.org/elpa/")
        ("melpa"        . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;;;Other init files go in here.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-custom)

;;;Define when-term: I can use it when I want a setting to be terminal-only.
(defun is-in-terminal()
  (not (display-graphic-p)))
(defmacro when-term (&rest body)
  "Works just like `progn' but will only evaluate expressions in VAR when Emacs is running in a terminal else just nil."
  `(when (is-in-terminal) ,@body))

;;;Some vanilla emacs settings.

;;Reserve for my own custom bindings.
(global-unset-key (kbd "C-x C-x"))

;;Buffer navigaton
(global-set-key (kbd "C-<return>") 'eval-buffer)
(global-set-key (kbd "C-x C-x C-b") 'other-window)
(global-set-key (kbd "C-x k")   'kill-this-buffer)
(global-set-key (kbd "C-x C-b") 'mode-line-other-buffer)
(when-term (global-set-key (kbd "C-x C-v") 'mode-line-other-buffer))
(setq ns-pop-up-frames nil)

;;Specify window in which certain buffers will open.
(customize-set-variable
 'display-buffer-alist
 '(("\\*magit: .*"      display-buffer-same-window)
   ("\\*ruby\\*.*"      display-buffer-same-window)
   ("\\*ansi-term\\*"   display-buffer-same-window)
   ("\\*shell\\*"       display-buffer-same-window)))

;; Shell copy and paste for osx.
(when-term
  (defun copy-from-osx ()
    (shell-command-to-string "pbpaste"))
  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))
  (defun clipboard-on ()
    (interactive)
    (setq interprogram-cut-function 'paste-to-osx)
    (setq interprogram-paste-function 'copy-from-osx))
  (defun clipboard-off ()
    (interactive)
    (setq interprogram-cut-function 'gui-select-text)
    (setq interprogram-paste-function 'gui-selection-value))
  (global-set-key (kbd "C-c C-p") 'clipboard-on)
  (global-set-key (kbd "C-c C-y") 'clipboard-off))

;;Display 
(set-default-font "Menlo 14")
(setq scroll-margin 5)
(setq scroll-step 1)
(when-term (menu-bar-mode 0))

;Turn off scroll margin in terminal/repl buffers
(dolist (mode-hook '(cider-repl-mode-hook
                     inf-ruby-mode-hook
                     eshell-mode-hook
                     term-mode-hook))
  (add-hook mode-hook
            '(lambda()
               (make-local-variable 'scroll-margin)
               (setq scroll-margin 0))))

;;Ansi-term
(setq explicit-shell-file-name "/bin/zsh")

;;Javascript indent level
(setq js-indent-level 2)
(setq css-indent-offset 2)

;;No tabs, only spaces
(add-hook 'js-mode-hook
          '(lambda ()
             (setq-default indent-tabs-mode nil)))

;;Miscellaneous
(global-set-key (kbd "C-c o")   'occur)
(global-set-key (kbd "C-x p")   'mark-page)
(global-set-key (kbd "TAB")     'self-insert-command)
(global-set-key (kbd "C-x C-x C-a") 'exchange-point-and-mark)
(setq-default indent-tabs-mode nil)

;; Tell emacs when to use linum-mode
(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)

;;...and when to use visual-line-mode
(define-global-minor-mode my-global-visual-line-mode visual-line-mode
  (lambda ()
    (when (memq major-mode
                (list 'inf-ruby-mode
                      'help-mode))
      (visual-line-mode 1))))
(my-global-visual-line-mode 1)

;;;Bootloader for use-package.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'init-evil)
;;;Helm configuration
(use-package helm
  :ensure t
  :demand t
  :diminish helm-mode
  :config
  (helm-mode 1)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (setq helm-split-window-in-side-p t)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-s") 'helm-occur)
  (when-term (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)))

;;;Web-mode configuration
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-sql-indent-offset 2))

;;;Parinfer configuration
(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
             pretty-parens  ; different paren styles for different modes.
             evil           ; If you use Evil.
            ;lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
            ;paredit        ; Introduce some paredit commands.
             smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
             smart-yank))   ; Yank behavior depend on mode.

    (dolist (mode-hook '(emacs-lisp-mode-hook
                         clojure-mode-hook))
      (add-hook mode-hook 'parinfer-mode))))

;;;Configure theme
(use-package gruvbox-theme
  :ensure t
  :init
  (setq gruvbox-contrast 'soft)
  ;(gruvbox-light0          "#ffd7a6" "#ffffaf")
  :config
  (load-theme 'gruvbox))

;;;Auto-complete configuration
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (setq ac-auto-start 4)
  (setq ac-auto-show-menu 0.8))

;;;(Short) configuration settings for other packages.

(use-package web-beautify
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package flymd
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package dumb-jump
  :ensure t
  :init
  (dumb-jump-mode)
  :bind
  ("C-x C-x C-s" . dumb-jump-go)
  ("C-x C-x C-x" . dumb-jump-go-prefer-external))

(use-package flycheck
  :ensure t
  :bind ("C-c f" . flycheck-mode)
  :init
  (dolist (mode-hook '(js-mode-hook))
                                        ;ruby-mode-hook
    (add-hook mode-hook #'flycheck-mode))
  :config
  (setq-default flycheck-disabled-checkers '(ruby javascript-standard javascript-jshint)))

(use-package rvm
  :ensure t
  :init
  (rvm-use-default))

(use-package rspec-mode
  :ensure t
  :init
  (add-hook 'ruby-mode-hook #'rspec-mode)
  (add-hook 'web-mode-hook #'rspec-mode))

(use-package inf-ruby
  :ensure t
  :bind ("C-c r" . inf-ruby))

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode))

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode)

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :ensure t
  :bind ("C-x C-p" . helm-projectile))

(use-package json-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package eshell-z
  :ensure t)

(use-package eshell-prompt-extras
  :ensure t
  :init
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda)))
