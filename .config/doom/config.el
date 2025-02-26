(setq make-backup-files nil
      auto-save-default t
      history-length 25
      python-indent 4
      js-indent-level 2
      typescript-indent-level 2
      display-line-numbers-type nil
      global-hl-line-modes nil
      doom-font (font-spec :family "Monaco" :size 16)
      doom-theme 'doom-solarized-dark-high-contrast
      custom-safe-themes t
      explicit-shell-file-name "/bin/zsh")

(after! dash-docs
  (set-docsets! 'ts-mode :add "React" "TypeScript"))


(after! doom-ui
  (setq! auto-dark-themes '((doom-solarized-dark-high-contrast) (doom-solarized-light)))
  (auto-dark-mode))

;; global modes
(global-git-gutter-mode +1)
(global-auto-revert-mode t)
(global-visual-line-mode t)

;; add to lists
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-tsx-mode))
(add-to-list 'auto-mode-alist '("\\.restclient\\'" . restclient-mode))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
