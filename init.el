;;; init -- set up emacs
;;; Commentary:


;;; Code:

;; Cask makes life easier
;; Also see the Cask file
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; set path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; flycheck automatically
(add-hook 'after-init-hook #'global-flycheck-mode)

;; setup jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; pymacs
(add-to-list 'load-path "~/git/Pymacs/")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;; rope
(pymacs-load "ropemacs" "rope-")

;; virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
;; @todo: use expand-path or whatever it is
(setq venv-location "/Users/gdowding/.venvs")

(provide 'init)
;;; init.el ends here
