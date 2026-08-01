(require 'package)
(package-initialize)

(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(defun ny/macos-p ()
  "Return non-nil on macOS."
  (eq system-type 'darwin))

(defvar ny/homebrew-prefixes
  '("/opt/homebrew" "/usr/local")
  "Homebrew prefixes to search, in preference order.")

(defun ny/existing-directory (path)
  "Return expanded PATH when it is an existing directory."
  (let ((expanded-path (expand-file-name path)))
    (when (file-directory-p expanded-path)
      expanded-path)))

(defun ny/homebrew-executable (name)
  "Return Homebrew executable NAME when it exists."
  (catch 'executable
    (dolist (prefix ny/homebrew-prefixes)
      (let ((path (expand-file-name (concat "bin/" name) prefix)))
        (when (file-executable-p path)
          (throw 'executable path))))))

;; Make subprocess PATH match the key command locations used outside Emacs.
(let* ((homebrew-paths
        (apply #'append
               (mapcar (lambda (prefix)
                         (list (expand-file-name "bin" prefix)
                               (expand-file-name "sbin" prefix)))
                       ny/homebrew-prefixes)))
       (extra-paths
        (delq nil
              (mapcar #'ny/existing-directory
                      (append homebrew-paths
                              '("~/.local/bin" "/Library/TeX/texbin"))))))
  (setenv "PATH" (concat (mapconcat #'identity extra-paths ":")
                         (when extra-paths ":")
                         (getenv "PATH")))
  (setq exec-path (append extra-paths exec-path)))

(add-to-list 'load-path (locate-user-emacs-file "lisp"))

(require 'ny-vterm)

(global-visual-line-mode 1)
(global-auto-revert-mode 1)
(electric-pair-mode 1)
(line-number-mode 1)

(setq visible-bell t
      ring-bell-function 'ignore
      inhibit-startup-screen t
      initial-scratch-message ""
      bookmark-save-flag 1
      confirm-kill-emacs 'yes-or-no-p
      auto-save-visited-interval 15
      history-length 25
      tab-width 2
      battery-mode-line-format " [%b%p%%]"
      display-time-default-load-average nil
      display-time-format "%H:%M"
      use-short-answers t)

(auto-save-visited-mode 1)
(display-battery-mode 1)
(display-time-mode 1)

(menu-bar-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 4)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(undecorated-round . t))
(set-frame-parameter nil 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

(let ((mono-spaced-font "Mononoki Nerd Font")
      (proportionately-spaced-font "Mononoki Nerd Font"))
  (set-face-attribute 'default nil :family mono-spaced-font :height 160)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))

(add-to-list 'custom-theme-load-path
             (expand-file-name "themes/" user-emacs-directory))

(defun ny/apply-system-theme (&optional appearance)
  (mapc #'disable-theme custom-enabled-themes)
  (pcase (or appearance ns-system-appearance)
    ('dark (load-theme 'ny-cursor-dark t))
    (_ (load-theme 'ny-cursor-light t))))

(ny/apply-system-theme)

(when (boundp 'ns-system-appearance-change-functions)
  (add-hook 'ns-system-appearance-change-functions #'ny/apply-system-theme))

(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode))

(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides nil))

(use-package savehist
  :ensure nil ; it is built-in
  :hook (after-init . savehist-mode))

(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode))

(use-package corfu
  :ensure t
  :hook (after-init . global-corfu-mode)
  :config
  (setq tab-always-indent 'complete)
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.1)
  (setq corfu-auto-prefix 2)
  (setq corfu-cycle t)
  (setq corfu-preview-current nil)
  (setq corfu-min-width 20)

  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1) ; shows documentation after `corfu-popupinfo-delay'

  ;; Sort by input history (no need to modify `corfu-sort-function').
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (make-directory (expand-file-name "snippets/" user-emacs-directory) t)
  (setq-default yas-snippet-dirs `(,(expand-file-name "snippets/" user-emacs-directory)))
  (yas-reload-all)
  (yas-global-mode 1))

(use-package paredit
  :ensure t
  :hook (emacs-lisp-mode-hook . paredit-mode))

(use-package dired
  :ensure nil
  :commands (dired)
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t))

(use-package dired-subtree
  :ensure t
  :after dired
  :bind
  ( :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("TAB" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))

(use-package trashed
  :ensure t
  :commands (trashed)
  :config
  (setq trashed-action-confirmer 'y-or-n-p)
  (setq trashed-use-header-line t)
  (setq trashed-sort-key '("Date deleted" . t))
  (setq trashed-date-format "%Y-%m-%d %H:%M:%S"))

(use-package markdown-mode
    :mode (("\\.md\\'" . gfm-mode)
           ("\\.markdown\\'" . markdown-mode))
    :custom
    (markdown-command "pandoc --from=gfm --to=html5")
    :config
    (setq markdown-css-paths
          (list (concat "file://"
                        (expand-file-name "markdown-preview.css" user-emacs-directory)))
          markdown-xhtml-header-content
          (concat
           "<script src=\"file://"
           (expand-file-name "mermaid.min.js" user-emacs-directory)
           "\"></script>\n"
           "<script src=\"file://"
           (expand-file-name "markdown-preview.js" user-emacs-directory)
           "\"></script>\n")))

(setq treesit-font-lock-level 4)
(setq treesit-language-source-alist
      '((tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(add-hook 'typescript-ts-mode-hook #'lsp-deferred)
(add-hook 'tsx-ts-mode-hook #'lsp-deferred)

(add-to-list 'treesit-language-source-alist
             '(python "https://github.com/tree-sitter/tree-sitter-python"))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-ts-mode))

(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-ts-mode)
  :interpreter ("python3" . python-ts-mode))

(use-package lsp-sourcekit
  :ensure t
  :after lsp-mode)

(use-package swift-mode
  :ensure t
  :mode "\\.swift\\'")

(use-package flymake
  :ensure nil
  :config
  (setq flymake-show-diagnostics-at-end-of-line t
        flymake-mode-line-lighter " Fly"))

(use-package lsp-mode
 :ensure t
 :init
 (setq lsp-diagnostics-provider :flymake)
 (setq lsp-completion-provider :none)
 :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
        ;; if you want which-key integration
        (lsp-mode . lsp-enable-which-key-integration))
 :commands (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-doc-delay 0.3)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-update-mode 'point))

(use-package diff-hl
  :ensure t
  :hook
  ((prog-mode . diff-hl-mode)
   (org-mode . diff-hl-mode)
   (dired-mode . diff-hl-dired-mode)
   (magit-pre-refresh . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh)))

(use-package magit :ensure t)

(if (locate-library "vterm")
    (use-package vterm
      :ensure t
      :commands vterm
      :config
      (setq vterm-kill-buffer-on-exit t)

      (ny/setup-vterm-theme-recoloring))
  (message "vterm is not installed yet; install cmake/libtool, then run M-x package-refresh-contents and M-x package-install RET vterm RET"))

(use-package ledger-mode
  :ensure t
  :mode ("\\.journal\\'" . ledger-mode))

(use-package org
  :ensure nil
  :config
  (setq org-directory "~/Documents/Org")
  (setq org-agenda-files (directory-files org-directory 'full (rx ".org" eos)))
  (setq org-startup-with-inline-images t)
  (setq org-image-actual-width (list 700))
  (setq org-deadline-warning-days 30)
  (setq org-indent-mode t)
  (add-hook 'org-mode-hook #'org-indent-mode))

(with-eval-after-load 'org
  (setq org-capture-templates
        '(("t" "Todo" entry (file (lambda () (expand-file-name "inbox.org" org-directory)))
           "* TODO %?\n  %a")))

  (setq org-agenda-custom-commands
        '((" " "Agenda"
           ((agenda ""
                    ((org-agenda-span 'day)))
            (todo "TODO"
                  ((org-agenda-overriding-header "Unscheduled tasks")
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'scheduled 'deadline)))))))))

(defun ny/paste-markdown-as-org ()
  "Convert markdown from the clipboard to org syntax and insert it at point."
  (interactive)
  (let ((md (current-kill 0 t)))
    (if (not md)
        (message "Clipboard is empty")
      (insert
       (with-temp-buffer
         (insert md)
         (call-process-region (point-min) (point-max)
                              "pandoc"
                              t t nil
                              "-f" "markdown" "-t" "org")
         (buffer-string))))))

(with-eval-after-load 'org
  (define-key minibuffer-local-completion-map (kbd "SPC") #'self-insert-command))

(use-package org-roam
  :ensure t
  :config
  (setq org-roam-directory (file-truename "~/Documents/Org/Roam"))
  (org-roam-db-autosync-mode 1))

(use-package org-roam-ui
  :ensure t
  :after org-roam
  :commands org-roam-ui-mode
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package ox-latex
  :ensure nil
  :after org
  :config
  (setq org-latex-src-block-backend 'listings)
  (setq org-latex-listings t)
  (setq org-latex-listings-options
        '(("breaklines" "true")
          ("breakatwhitespace" "false")
          ("breakautoindent" "false")
          ("breakindent" "0pt")
          ("basicstyle" "\\ttfamily\\scriptsize")
          ("columns" "fullflexible")
          ("keepspaces" "true")
          ("showstringspaces" "false"))))

(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c a") #'org-agenda)

(global-set-key (kbd "C-c r d") #'org-roam-dailies-goto-today)
(global-set-key (kbd "C-c r f") #'org-roam-node-find)
(global-set-key (kbd "C-c r i") #'org-roam-node-insert)

(global-set-key (kbd "C-c t t") #'vterm)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e417a25a2fbd1a6b09139245a10e21d670c6669868266bc4bbf283efa3e2d222"
     default))
 '(package-selected-packages
   '(corfu diff-hl dired-subtree ledger-mode lsp-sourcekit lsp-ui magit
	   marginalia multi-vterm nerd-icons-completion
	   nerd-icons-corfu nerd-icons-dired orderless org-roam-ui
	   paredit swift-mode trashed vertico yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
