(use-package treesit
  :init
  (setq treesit-language-source-alist
        '((tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
          (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")))
  :config
  (dolist (lang '(tsx typescript))
    (unless (treesit-language-available-p lang)
      (treesit-install-language-grammar lang)))

  ;; File associations
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode)))

(provide 'treesitter)
