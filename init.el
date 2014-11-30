;;; init -- set up emacs
;;; Commentary:

;; copied from here http://zeekat.nl/articles/making-emacs-work-for-me.html

(setq inhibit-startup-screen +1)

(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(set-face-attribute 'default nil
		    :family "Inconsolata"
		    :height 140
		    :weight 'normal
		    :width 'normal)
;; handle unicode
(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                    'unicode
                    (font-spec :family "DejaVu Sans Mono"
                               :width 'normal
                               :size 12.4
                               :weight 'normal)))

;; Doesn't seem to be working.
'(powerline-center-theme)


;;; Code:

;; Cask makes life easier
;; Also see the Cask file
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; set path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; programming
(autopair-global-mode)

;; flycheck automatically
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; setup jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; pymacs
;; (add-to-list 'load-path "~/git/Pymacs/")
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")

;; rope
;; (pymacs-load "ropemacs" "rope-")

;; virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
;; @todo: use expand-path or whatever it is
(setq venv-location "/Users/gdowding/.venvs")


;;(load-file "~/git/emacs-for-python/epy-init.el")

(add-to-list 'load-path "~/git/emacs-for-python")
(require 'epy-setup)
(require 'epy-nose)

;; python-mode
(setq py-install-directory "~/git/python-mode")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
;; ;; (setq py-python-command-args
;; ;;   '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;; ;; (setq py-force-py-shell-name-p t)
;; ; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ; don't split windows
;; (setq py-split-windows-on-execute-p nil)
;; ; try to automagically figure out indentation
;; (setq py-smart-indentation t)


;; EIN Emacs IPython Notebook
(add-to-list 'load-path "/Users/gdowding/git/ein-millejoh/lisp")
(require 'ein)

(provide 'init)
;;; init.el ends here

;; Erlang

(add-to-list 'load-path "~/git/nitrogen/support/nitrogen-mode")
(require 'nitrogen-mode)

;; Octave
(add-to-list 'load-path "~/.emacs.d/lisp-future")
(require 'octave)
;;(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))
;; (autoload 'run-octave "octave-inf" nil t)


;; http://zeekat.nl/articles/making-emacs-work-for-me.html#sec-6-1
;; pretty symbols doesn't seem to be working
;; (defun my/prog-mode-hooks ()
;;   (my/turn-on 'pretty-symbols))

;; (add-hook 'prog-mode-hook
;; 	  'my/prog-mode-hooks)

;; (defun my/turn-on (&rest mode-list)
;;   "Turn on the given (minor) modes."
;;   (dolist (m mode-list)
;;     (funcall (my/->mode m) +1)))
