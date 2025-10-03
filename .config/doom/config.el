(setq make-backup-files nil
      auto-save-default t
      auto-save-visited-interval 15 ;; save after 15s idle
      history-length 25
      python-indent 4
      js-indent-level 2
      typescript-indent-level 2
      display-line-numbers-type nil
      global-hl-line-modes nil
      custom-safe-themes t
      ledger-default-date-format "%Y-%m-%d"
      doom-font (font-spec :family "CaskaydiaMono Nerd Font" :size 14)
      explicit-shell-file-name "/bin/zsh")

;; frame
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;; docs
(after! dash-docs
  (set-docsets! 'ts-mode :add "React" "TypeScript"))

;; ai/copilot
(after! copilot
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))

;; lsp
(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-doc-delay 0.2
        lsp-ui-doc-position 'at-point)
  (add-hook 'lsp-mode-hook 'lsp-ui-doc-mode))

(after! doom-ui
  (setq! auto-dark-themes '((doom-solarized-dark-high-contrast) (doom-solarized-light)))
  (setq! doom-theme nil)
  (auto-dark-mode))

(after! vterm
  ;; Prevent vterm from using Doom's popup system
  (set-popup-rule! "^\\*vterm.*" :ignore t))

;; global modes
(global-git-gutter-mode +1)
(global-auto-revert-mode t)
(global-visual-line-mode t)

;; auto saving
(auto-save-visited-mode 1)

;; add to lists
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.restclient\\'" . restclient-mode))

;; TypeScript files
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; TSX (React components)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

;; max frame
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; keyboard shortcuts
(global-set-key (kbd "<f1>") #'org-capture)
(global-set-key (kbd "<f2>") #'org-roam-dailies-goto-today)
(global-set-key (kbd "<f3>") #'org-agenda)
(global-set-key (kbd "<f4>") #'org-roam-node-find)

;; hook
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
