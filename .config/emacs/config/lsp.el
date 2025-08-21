(use-package lsp-mode
  :ensure t
  :hook ((tsx-ts-mode . lsp)
         (typescript-ts-mode . lsp))
  :config
  ;; Send diagnostics to Flymake
  (setq lsp-diagnostic-package :flymake))

;; Flymake inline diagnostics
(setq flymake-display-functions '(flymake-show-diagnostics-inline))

;; Optional: make overlays more visible
(custom-set-faces
 '(flymake-error ((t (:underline (:style wave :color "Red1")))))
 '(flymake-warning ((t (:underline (:style wave :color "Orange1"))))))

;; LSP UI for definitions/signatures only
(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  ;; Definitions / hover
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-doc-show-diagnostics t
        lsp-ui-sideline-enable t))

(provide 'lsp)
