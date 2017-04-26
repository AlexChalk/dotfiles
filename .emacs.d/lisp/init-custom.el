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
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(display-buffer-alist
   (quote
    (("\\*magit: .*" display-buffer-same-window)
     ("\\*ruby\\*.*" display-buffer-same-window)
     ("\\*ansi-term\\*" display-buffer-same-window)
     ("\\*shell\\*" display-buffer-same-window))))
 '(evil-shift-width 2)
 '(package-selected-packages
   (quote
    (solarized-theme smart-mode-line-powerline-theme smart-mode-line rspec-mode tagedit use-package rvm rainbow-delimiters powerline magit inf-ruby helm-projectile flycheck evil-surround evil-leader dumb-jump color-theme-sanityinc-solarized auto-complete))))

(provide 'init-custom)
