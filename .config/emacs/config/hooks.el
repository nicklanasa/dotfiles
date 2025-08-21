;; ---------------------------
;; Emacs Lisp / Lisp hooks
;; ---------------------------
(dolist (hook '(emacs-lisp-mode-hook
                ielm-mode-hook
                lisp-interaction-mode-hook))
  (add-hook hook #'paredit-mode))  ;; enable paredit

;; ---------------------------
;; LSP hooks
;; ---------------------------
(defun ny/lsp-format-on-save ()
  "Add `lsp-format-buffer` to `before-save-hook` in this buffer."
  (add-hook 'before-save-hook #'lsp-format-buffer nil t))

(add-hook 'tsx-ts-mode-hook #'ny/lsp-format-on-save)
(add-hook 'typescript-ts-mode-hook #'ny/lsp-format-on-save)

(provide 'hooks)
