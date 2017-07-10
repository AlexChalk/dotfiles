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

;;; Bootloader for use-package.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; Some vanilla emacs settings.
;; Reserve for my own custom bindings.
(global-unset-key (kbd "C-x C-x"))

;; Buffer navigaton
(global-set-key (kbd "C-<return>") 'eval-buffer)
(global-set-key (kbd "C-x C-x C-b") 'other-window)
(global-set-key (kbd "C-x k")   'kill-this-buffer)
(global-set-key (kbd "C-x C-b") 'mode-line-other-buffer)
(setq ns-pop-up-frames nil)

;; Specify window in which certain buffers will open.
(customize-set-variable
 'display-buffer-alist
 '(("\\*magit: .*"      display-buffer-same-window)
   ("\\*ruby\\*.*"      display-buffer-same-window)
   ("\\*ansi-term\\*"   display-buffer-same-window)
   ("\\*shell\\*"       display-buffer-same-window)))

;; Display
(set-default-font "Menlo 14")
(setq scroll-margin 5)
(setq scroll-step 1)

;; Miscellaneous
(global-set-key (kbd "C-c o")   'occur)
(global-set-key (kbd "C-x p")   'mark-page)
(global-set-key (kbd "TAB")     'self-insert-command)
(global-set-key (kbd "C-x C-x C-a") 'exchange-point-and-mark)
(setq-default indent-tabs-mode nil)
(setq explicit-shell-file-name "/bin/zsh")

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

;;; Filetype-specific settings
;; Javascript indent level
(setq js-indent-level 2)
(setq css-indent-offset 2)

;; No tabs, only spaces
(add-hook 'js-mode-hook
          '(lambda ()
             (setq-default indent-tabs-mode nil)))

;Turn off scroll margin in terminal/repl buffers
(dolist (mode-hook '(cider-repl-mode-hook
                     inf-ruby-mode-hook
                     eshell-mode-hook
                     term-mode-hook))
  (add-hook mode-hook
            '(lambda()
               (make-local-variable 'scroll-margin)
               (setq scroll-margin 0))))

;;; Settings for terminal emacs
;; Define when-term: I can use it when I want a setting to be terminal-only.
(defun is-in-terminal()
  (not (display-graphic-p)))
(defmacro when-term (&rest body)
  "Works just like `progn' but will only evaluate expressions in VAR when Emacs is running in a terminal else just nil."
  `(when (is-in-terminal) ,@body))

;; Copy to osx clipboard
(when-term
  (defun copy-to-clipboard (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))
  (setq interprogram-cut-function 'copy-to-clipboard))

;; Misc
(when-term (global-set-key (kbd "C-x C-v") 'mode-line-other-buffer))
(when-term (menu-bar-mode 0))

;;; Other init files go in here.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-custom)
(require 'init-evil)
(require 'init-short-package-configs)

;;; Configure theme
(use-package spacemacs-theme
  :ensure t
  :config)
(load-theme 'spacemacs-dark)

;;;; Package configs that are >6 lines in length
;;; Helm configuration
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

(use-package helm-projectile
  :ensure t
  :bind ("C-x C-p" . helm-projectile))

;;; Web-mode configuration
(use-package web-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-sql-indent-offset 2))

;;; Parinfer configuration
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
             smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
             smart-yank))   ; Yank behavior depend on mode.

    (dolist (mode-hook '(emacs-lisp-mode-hook
                         clojure-mode-hook))
      (add-hook mode-hook 'parinfer-mode))))

;;; Other >6 line length configs
(use-package auto-complete
  :ensure t
  :init
  (add-hook 'robe-mode-hook 'ac-robe-setup)
  (setq ac-auto-show-menu 0.4)
  :config
  (ac-config-default)
  (global-auto-complete-mode t))

(use-package flycheck
  :ensure t
  :bind ("C-c f" . flycheck-mode)
  :init
  (dolist (mode-hook '(js-mode-hook))
    (add-hook mode-hook #'flycheck-mode))
  (setq-default flycheck-disabled-checkers '(ruby javascript-standard javascript-jshint)))

(use-package dumb-jump
  :ensure t
  :bind
  ("C-x C-x C-s" . dumb-jump-go)
  ("C-x C-x C-x" . dumb-jump-go-prefer-external))

(use-package eshell-prompt-extras
  :ensure t
  :init
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda)))

(use-package eshell-z
  :ensure t)

(use-package robe
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'robe-mode))
