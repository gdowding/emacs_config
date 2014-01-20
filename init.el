;; o-blog
;; all this stuff needs to be cloned
(add-to-list 'load-path "~/git/htmlize")
(add-to-list 'load-path "~/git/markup-faces")
(add-to-list 'load-path "~/git/adoc-mode")
(add-to-list 'load-path "~/git/o-blog")
(require 'htmlize)
(require 'adoc-mode)
(require 'o-blog)

;; This makes life easier
;; Also see the Cask file

(require 'cask "~/.cask/cask.el")
(cask-initialize)
