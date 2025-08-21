;; ---------------------------
;; Global Org keybindings
;; ---------------------------
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; ;; ---------------------------
;; ;; Org-mode local keybindings (via hook)
;; ;; ---------------------------
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c r") 'org-refile)
;;             (local-set-key (kbd "C-c t") 'org-todo)
;;             (local-set-key (kbd "C-c s") 'org-schedule)
;;             (local-set-key (kbd "C-c d") 'org-deadline)
;;             (local-set-key (kbd "C-c i") 'org-insert-heading-respect-content)))

;; ;; ---------------------------
;; ;; Org-agenda keybindings (via hook)
;; ;; ---------------------------
;; (add-hook 'org-agenda-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "n") 'org-agenda-next-line)
;;             (local-set-key (kbd "p") 'org-agenda-previous-line)
;;             (local-set-key (kbd "RET") 'org-agenda-switch-to)
;;             (local-set-key (kbd "C") 'org-agenda-show-calendar)
;;             (local-set-key (kbd "t") 'org-agenda-todo)))

;; ;; ---------------------------
;; ;; Org-Roam keybindings (global)
;; ;; ---------------------------
;; (require 'org-roam)

;; (global-set-key (kbd "C-c n l") 'org-roam-buffer-toggle)
;; (global-set-key (kbd "C-c n f") 'org-roam-node-find)
;; (global-set-key (kbd "C-c n g") 'org-roam-graph-show)
;; (global-set-key (kbd "C-c n c") 'org-roam-capture)
;; (global-set-key (kbd "C-c n i") 'org-roam-node-insert)

;; ;; ---------------------------
;; ;; LSP keybindings (via hook)
;; ;; ---------------------------
;; (add-hook 'lsp-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c r") 'lsp-rename)
;;             (local-set-key (kbd "C-c a") 'lsp-execute-code-action)
;;             (local-set-key (kbd "C-c f") 'lsp-format-buffer)
;;             (local-set-key (kbd "C-c h") 'lsp-describe-thing-at-point)))

;; ;; ---------------------------
;; ;; Other global keybindings
;; ;; ---------------------------
;; (global-set-key (kbd "C-x g") 'magit-status)
;; (global-set-key (kbd "C-x b") 'switch-to-buffer)
;; (global-set-key (kbd "C-x k") 'kill-buffer)

(provide 'bindings)
;; ;;; bindings.el ends here
