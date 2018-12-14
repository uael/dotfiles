(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(setq inhibit-startup-screen t)

(require 'package)
(add-to-list 'package-archives
			 '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; Apparance
(use-package busybee-theme)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-width 45)
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package linum-relative
  :init (setq linum-relative-current-symbol "")
  :config
  (linum-mode)
  (linum-relative-global-mode))
(unless (display-graphic-p)
  (setq linum-relative-format (concat linum-relative-format " ")))

; Remove toolbar and menubar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; LSP
(use-package lsp-mode
  :commands lsp
  :config (require 'lsp-clients))

(use-package company-lsp
  :commands company-lsp)

;; C mode
(use-package ccls
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (cl-pushnew #'company-lsp company-backends) (require 'ccls) (lsp))))
