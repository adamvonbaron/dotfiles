;; bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; package list
;; (straight-use-package 'evil)
(straight-use-package 'base16-theme)
(straight-use-package 'ivy)
(straight-use-package 'dash)
(straight-use-package 'cider)
(straight-use-package 'company)
(straight-use-package 'flycheck)
(straight-use-package 'go-mode)
(straight-use-package 'lua-mode)
(straight-use-package 'clojure-mode)
(straight-use-package 'geiser)
(straight-use-package 'geiser-guile)
(straight-use-package 'doom-modeline)
(straight-use-package 'dap-mode)
(straight-use-package 'magit)
(straight-use-package 'paredit)

;; core configuration
(setq auto-save-default nil)

;; GUI stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq make-backup-files nil)
(set-frame-font "JetBrains Mono 10" nil t)
;; (global-font-lock-mode 0)
(setq-default truncate-lines t)
(setq resize-mini-windows nil)
(load-theme 'base16-grayscale-light t)

;; evil-mode
;; (evil-mode)

;; org-mode
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; doom-modeline
(require 'doom-modeline)
(setq doom-modeline-icon nil)
(doom-modeline-mode 1)

;; company-mode
(global-company-mode)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; geiser
(add-hook 'scheme-mode-hook 'geiser-mode)

;; paredit
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'guile-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook 'enable-paredit-mode)

;; go-mode
(setq gofmt-command "goimports")
(defun go-fmt-on-save ()
  "Run gofmt before saving file in go-mode."
  (when (eq major-mode 'go-mode)
    #'gofmt-before-save)
  )
(add-hook 'before-save-hook #'go-fmt-on-save)

;; ensure eglot connects to LSP servers
;; go
(add-hook 'go-mode-hook 'eglot-ensure) ; gopls
;; clojure
(add-hook 'clojure-mode-hook 'eglot-ensure) ; clojure-lsp
;; c
(add-hook 'c-mode-hook 'eglot-ensure) ; clangd
;; cpp
(add-hook 'c++-mode-hook 'eglot-ensure) ; clangd
;; javascript
(add-hook 'js-mode-hook 'eglot-ensure) ; typescript-language-server
;; typescript
(add-hook 'ts-mode-hook 'eglot-ensure) ; typescript-language-server

;; notmuch
(require 'notmuch)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
