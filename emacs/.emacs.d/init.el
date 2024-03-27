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

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq make-backup-files nil)

(when (version< emacs-version "29.0") (straight-use-package 'eglot))
(straight-use-package 'evil)
(straight-use-package 'ivy)
(straight-use-package 'dash)
