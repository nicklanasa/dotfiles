(use-package lsp-mode
  :ensure t
  :hook ((tsx-ts-mode . lsp)
         (typescript-ts-mode . lsp))
  :commands lsp
  :config
  (setq lsp-headerline-breadcrumb-enable t
        lsp-enable-symbol-highlighting t
        lsp-enable-on-type-formatting t))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-delay 0.3
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-border (face-foreground 'default)
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-sideline-enable nil))

(provide 'lsp)
