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

;; GUI stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq make-backup-files nil)
(set-frame-font "JetBrains Mono 10" nil t)
(global-font-lock-mode 0)
(setq-default truncate-lines t)

;; package list
(straight-use-package 'evil)
(straight-use-package 'ivy)
(straight-use-package 'dash)
(straight-use-package 'cider)
(straight-use-package 'company)
(straight-use-package 'go-mode)
(straight-use-package 'lua-mode)
(straight-use-package 'clojure-mode)
(straight-use-package 'doom-modeline)

;; evil-mode
(evil-mode)

;; doom-modeline
(require 'doom-modeline)
(setq doom-modeline-icon nil)
(doom-modeline-mode 1)

;; company-mode
(global-company-mode)

;; ensure eglot connects to LSP servers
;; go
(add-hook 'go-mode-hook 'eglot-ensure) ;gopls
