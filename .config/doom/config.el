(setq make-backup-files nil
      auto-save-default t
      history-length 25
      python-indent 4
      js-indent-level 2
      typescript-indent-level 2
      display-line-numbers-type nil
      global-hl-line-modes nil
      ns-use-proxy-icon nil
      frame-title-format nil
      doom-theme 'doom-opera
      explicit-shell-file-name "/bin/zsh")

(set-face-background 'vertical-border "#000000")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

(after! dash-docs
  (set-docsets! 'ts-mode :add "React" "TypeScript"))

;; add to lists
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-tsx-mode))
(add-to-list 'auto-mode-alist '("\\.restclient\\'" . restclient-mode))

;; global modes
(global-git-gutter-mode +1)
(global-auto-revert-mode t)
(global-visual-line-mode t)

(load "~/dotfiles/.config/doom/personal.el")
