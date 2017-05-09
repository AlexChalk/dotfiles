;;;;adc17's emacs.d/init.el file (I started doing this properly on 12/29/2016). 

;;;Specifies how emacs window will initially render.
(setq initial-frame-alist '((top . 0) (left . 100) (width . 150) (height . 50)))
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;;Adds package archives and disables package loading until init file has been executed.

(require 'package)

(setq package-archives
      '(("gnu elpa"     . "http://elpa.gnu.org/packages/")
	("org" 		. "http://orgmode.org/elpa/")
        ("melpa"	. "https://melpa.org/packages/")))

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
(global-set-key (kbd "C-x k") 	'kill-this-buffer)
(global-set-key (kbd "C-x C-b") 'mode-line-other-buffer)
(when-term (global-set-key (kbd "C-x C-v") 'mode-line-other-buffer))
(setq ns-pop-up-frames nil)

;;Specify window in which certain buffers will open.
(customize-set-variable
 'display-buffer-alist
 '(("\\*magit: .*" 	display-buffer-same-window)
   ("\\*ruby\\*.*" 	display-buffer-same-window)
   ("\\*ansi-term\\*" 	display-buffer-same-window)
   ("\\*shell\\*" 	display-buffer-same-window)))

;;Display 
(set-default-font "Menlo 14")
(setq scroll-margin 5)
(setq scroll-step 1)
(when-term (menu-bar-mode 0))

;;Ansi-term
(setq explicit-shell-file-name "/bin/zsh")

;;Javascript indent level
(setq js-indent-level 2)

;;Miscellaneous
(global-set-key (kbd "C-c o") 	'occur)
(global-set-key (kbd "C-x p") 	'mark-page)
(global-set-key (kbd "TAB") 	'self-insert-command)
(global-set-key (kbd "C-x C-x C-a") 'exchange-point-and-mark)

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

;;;Evil-leader configuration
(use-package evil-leader
  :ensure t
  :init
  (fset 'highlight-off
	[?: ?n ?o ?h ?l ?s return])
  (fset 'put-last-yank
	"\"0p")
  (fset 'put-from-clipboard
	"\"+p")
  (fset 'carriage-return-reverse
	[?O escape ?0])
  (fset 'indent-pasted-text
	"`[v`]=")
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "," 'other-window
    "o" 'delete-other-windows
    "w" 'delete-window
    "k" 'kill-some-buffers
    "p" 'indent-pasted-text
    "b" 'evil-prev-buffer
    "n" 'evil-next-buffer
    "c" 'cd
    "h" 'highlight-off
    "t" 'ansi-term
    "s" 'eshell
    "b" 'mode-line-other-buffer
    "yp" 'put-last-yank
    "8p" 'put-from-clipboard
    "RET" 'carriage-return-reverse))

;;;Evil configuration
(use-package evil
  :ensure t
  :init
  (setq evil-search-module 'evil-search
	evil-want-C-u-scroll t
	evil-want-C-w-in-emacs-state t
	evil-want-fine-undo t)
  (fset 'carriage-return
	[?A return escape])
  :config
  (evil-mode t)
  (dolist (mode '(help-mode
		  git-rebase-mode
		  cider-repl-mode
		  flycheck-error-list-mode
		  inf-ruby-mode
		  eshell-mode
		  term-mode))
    (evil-set-initial-state mode 'emacs))
  
  (evil-add-hjkl-bindings occur-mode-map 'emacs
    (kbd "/")       'evil-search-forward
    (kbd "n")       'evil-search-next
    (kbd "N")       'evil-search-previous
    (kbd "C-d")     'evil-scroll-down
    (kbd "C-u")     'evil-scroll-up

    (kbd "C-w C-w") 'other-window)
  
  (define-key evil-normal-state-map (kbd "RET") 'carriage-return)
  (customize-set-variable 'evil-shift-width '2)

;;;Evil-surround configuration
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1)))

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

;;;Smartparens configuration
(use-package smartparens
  :ensure t
  :init
  (dolist (mode-hook '(emacs-lisp-mode-hook
		       clojure-mode-hook))
    (add-hook mode-hook 'smartparens-strict-mode))
  (dolist (mode-hook '(web-mode-hook))
    (add-hook mode-hook 'smartparens-mode))
  :config
  (use-package smartparens-config)
  (sp-pair "'" nil :actions :rem)
  (sp-pair "\"" nil :actions :rem)
  (sp-local-pair 'web-mode "%" "%" :wrap "M-%")
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'markdown-mode "`" nil :actions '(insert))
  (eval-after-load 'smartparens-ruby (lambda () (load "sp-custom-ruby")))
  :bind
  ("C-c s" . smartparens-mode)
  ("M-)" . sp-forward-slurp-sexp)
  ("M-(" . sp-forward-barf-sexp)
  ("M-{" . sp-backward-slurp-sexp)
  ("M-}" . sp-backward-barf-sexp)
  ("M-[" . sp-beginning-of-sexp)
  ("M-]" . sp-end-of-sexp))
(use-package evil-smartparens
  :ensure t
  :diminish evil-smartparens-mode
  :init
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  :config
  (eval-after-load 'smartparens-ruby (lambda () (load "sp-custom-ruby"))))

;;;Web-mode configuration
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (setq web-mode-enable-auto-pairing nil)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-sql-indent-offset 2))

;;;Configure theme
(use-package color-theme-sanityinc-solarized
  :ensure t
  :config
  (if (display-graphic-p)
      (load-theme 'sanityinc-solarized-dark)))

(when-term
  (use-package gruvbox-theme
    :ensure t
    :config
      (load-theme 'gruvbox)))

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

(use-package tagedit
  :ensure t
  :config
  (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))
  (tagedit-add-experimental-features))

(use-package flycheck
  :ensure t
  :bind ("C-c f" . flycheck-mode)
  :init
  (add-hook 'js-mode-hook #'flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(ruby javascript-standard)))

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

(use-package aggressive-indent
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode))

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
