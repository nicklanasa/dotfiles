;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! paredit)
(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! gptel)
(package! git-gutter)
(package! restclient)
(package! copilot
  :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el")))

(unpin! org-roam)
(package! org-roam-ui)

(package! eldoc-box)
