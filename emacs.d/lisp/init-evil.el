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
        evil-want-C-w-in-emacs-state t)
                                        ;evil-want-fine-undo t
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

(provide 'init-evil)
