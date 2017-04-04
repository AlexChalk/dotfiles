;;;;adc17's emacs.d/init.el file (I started doing this properly on 12/29/2016). 

;;;Specifies how emacs window will initially render.
(setq initial-frame-alist '((top . 0) (left . 190) (width . 100) (height . 40)))
(setq inhibit-splash-screen t)
(tool-bar-mode -1)

;;;Adds package archives and disables package loading until init file has been executed.

(require 'package)

(setq package-archives
      '(("gnu elpa"     . "http://elpa.gnu.org/packages/")
	("org" 		. "http://orgmode.org/elpa/")
        ("melpa"	. "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;;;Vanilla Emacs settings.
(global-set-key (kbd "C-c o") 	'occur)
(global-set-key (kbd "C-<return>") 'eval-buffer)
(global-set-key (kbd "TAB") 	'self-insert-command)
(global-set-key (kbd "C-x C-b") 'mode-line-other-buffer)
(global-set-key (kbd "C-x k") 	'kill-this-buffer)
(global-unset-key (kbd "C-x C-x"))
(global-set-key (kbd "C-x C-x C-a") 'exchange-point-and-mark)
(global-set-key (kbd "C-x C-x C-b") 'other-window)
(set-default-font "Menlo for Powerline 14")
(setq scroll-margin 5)
(setq scroll-step 1)
(setq ns-pop-up-frames nil)
(setq explicit-shell-file-name "/bin/zsh")

;; Tell emacs when to use linum-mode
(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)

;;...and when to use visual-line-mode
(define-global-minor-mode my-global-visual-line-mode visual-line-mode
  (lambda ()
    (when (memq major-mode
                     (list 'inf-ruby-mode 'help-mode))
      (visual-line-mode 1))))
(my-global-visual-line-mode 1)

;;;Specifies window in which certain buffers open.

(customize-set-variable
 'display-buffer-alist
 '(("\\*magit: .*" 	display-buffer-same-window)
   ("\\*ruby\\*.*" 	display-buffer-same-window)
   ("\\*ansi-term\\*" 	display-buffer-same-window)
   ("\\*shell\\*" 	display-buffer-same-window)))

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
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-s") 'helm-occur))

;;;Smartparens configuration
(use-package smartparens
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'smartparens-strict-mode)
  :config
  (use-package smartparens-config)
  (sp-pair "'" nil :actions :rem)
  (sp-pair "\"" nil :actions :rem)
  (sp-local-pair 'web-mode "%" "%" :wrap "M-%")
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'markdown-mode "`" nil :actions '(insert))  
  :bind
  ("C-c s" . smartparens-mode)
  ("C-)" . sp-forward-slurp-sexp)
  ("C-(" . sp-forward-barf-sexp)
  ("C-{" . sp-backward-slurp-sexp)
  ("C-}" . sp-backward-barf-sexp)
  ("C-M-(" . sp-beginning-of-sexp)
  ("C-M-)" . sp-end-of-sexp))
(use-package evil-smartparens
  :ensure t
  :diminish evil-smartparens-mode
  :init
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))

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
  (load-theme 'sanityinc-solarized-light t))

;;;Auto-complete configuration
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (setq ac-auto-start 4)
  (setq ac-auto-show-menu 0.8))

;;;(Short) configuration settings for other packages.
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
  :config
  (setq-default flycheck-disabled-checkers '(ruby)))

(use-package rvm
  :ensure t
  :init
  (rvm-use-default))

(use-package rspec-mode
  :ensure t)

(use-package inf-ruby
  :ensure t
  :bind ("C-c r" . inf-ruby))

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package powerline
  :ensure t
  :init
;  (setq powerline-default-separator 'utf-8)
  (setq ns-use-srgb-colorspace nil)
  :config
  (powerline-default-theme))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode)

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :ensure t
  :bind ("C-x p" . helm-projectile))

;;;Emacs custom-set-* settings (Emacs advises that you leave these alone!)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-active1 ((t (:background "#073642" :foreground "#93a1a1")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-buffer-alist
   (quote
    (("\\*magit: .*" display-buffer-same-window)
     ("\\*ruby\\*.*" display-buffer-same-window)
     ("\\*ansi-term\\*" display-buffer-same-window)
     ("\\*shell\\*" display-buffer-same-window))))
 '(evil-shift-width 2)
 '(package-selected-packages
   (quote
    (rspec-mode tagedit use-package rvm rainbow-delimiters powerline magit inf-ruby helm-projectile flycheck evil-surround evil-leader dumb-jump color-theme-sanityinc-solarized auto-complete))))
