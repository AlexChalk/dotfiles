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
        ("melpa-stable"	. "https://stable.melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;;;Vanilla Emacs settings.
(global-set-key (kbd "C-c o") 	'occur)
(global-set-key (kbd "C-<return>") 'eval-buffer)
(global-set-key (kbd "TAB") 	'self-insert-command)
(global-set-key (kbd "C-x C-b") 'mode-line-other-buffer)
(global-set-key (kbd "C-x k") 	'kill-this-buffer)
(setq scroll-margin 5)
(setq scroll-step 1)
(global-linum-mode 1)

;;;Specifies window in which certain buffers open. 
(customize-set-variable
 'display-buffer-alist
 '(("\\*Help\\*" 	display-buffer-below-selected)
   ("\\*magit: .*" 	display-buffer-same-window)
   ("\\*ruby\\*.*" 	display-buffer-same-window)
   ("\\*ansi-term\\*" 	display-buffer-same-window)
   ("\\*shell\\*" 	display-buffer-same-window)))

;;;Installs given evil dependency from Melpa (unstable) if necessary,
;;;then reverts to initial package archives.

(unless (package-installed-p 'goto-chg)
  (setq package-archives '(("melpa" . "http://melpa.org/packages/")))
  (package-refresh-contents)
  (package-install 'goto-chg)
  (setq package-archives
      '(("gnu elpa"     . "http://elpa.gnu.org/packages/")
	("org" 		. "http://orgmode.org/elpa/")
        ("melpa-stable"	. "https://stable.melpa.org/packages/")))
  (package-refresh-contents))

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
	  "\"*p")
    (fset 'carriage-return-reverse
	  [?O escape ?j])
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")
    (evil-leader/set-key
      "," 'other-window
      "o" 'delete-other-windows
      "w" 'delete-window
      "k" 'kill-some-buffers
      "d" 'cd
      "h" 'highlight-off
      "t" 'ansi-term
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
  (dolist (mode '(git-rebase-mode
		  inf-ruby-mode
		  term-mode))
    (add-to-list 'evil-emacs-state-modes mode))
  (delete 'term-mode evil-insert-state-modes)
  
  (evil-add-hjkl-bindings occur-mode-map 'emacs
    (kbd "/")       'evil-search-forward
    (kbd "n")       'evil-search-next
    (kbd "N")       'evil-search-previous
    (kbd "C-d")     'evil-scroll-down
    (kbd "C-u")     'evil-scroll-up
    (kbd "C-w C-w") 'other-window)
  
  (define-key evil-normal-state-map (kbd "RET") 'carriage-return)

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
  :demand t
  :config
  (smartparens-global-strict-mode t)
  (use-package smartparens-config)
  (sp-pair "(" ")" :wrap "M-(")
  (sp-pair "[" "]" :wrap "M-[")
  (sp-pair "{" "}" :wrap "M-{")
  (sp-pair "'" "'" :wrap "M-'")
  (sp-pair "\"" "\"" :wrap "M-\"")
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'markdown-mode "`" nil :actions '(insert))  
  :bind
  ("C-c C-s" . smartparens-mode)
  ("C-)" . sp-forward-slurp-sexp)
  ("C-}" . sp-forward-barf-sexp)
  ("C-(" . sp-backward-slurp-sexp)
  ("C-{" . sp-backward-barf-sexp)
  ("C-M-(" . sp-beginning-of-sexp)
  ("C-M-)" . sp-end-of-sexp))

;;;Configure theme
(use-package color-theme-sanityinc-solarized
  :ensure t
  :config
  (load-theme 'sanityinc-solarized-light t))

;;;Auto-complete configuration
(use-package auto-complete
  :ensure t
  :config
  (global-auto-complete-mode t)
  (setq ac-auto-start 4)
  (setq ac-auto-show-menu 0.8))

;;;(Short) configuration settings for other packages.
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package rvm
  :ensure t
  :init
  (rvm-use-default))

(use-package inf-ruby
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :ensure t
  :bind ("C-x p" . helm-projectile))

;;;Emacs custom-set-* settings (Emacs advises that you leave these alone!)
(custom-set-faces
 '(powerline-active1 ((t (:background "#073642" :foreground "#93a1a1")))))
