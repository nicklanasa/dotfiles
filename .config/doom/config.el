(setq make-backup-files nil
      auto-save-default t
      history-length 25
      python-indent 4
      js-indent-level 2
      typescript-indent-level 2
      display-line-numbers-type nil
      global-hl-line-modes t
      ns-use-proxy-icon nil
      frame-title-format nil
      doom-theme 'doom-solarized-dark-high-contrast
      doom-font (font-spec :family "Monaco" :size 16)
      gptel-model "llama3.1:8b"
      gptel-backend (gptel-make-ollama "Ollama"
                      :host "localhost:11434"
                      :stream t
                      :models '("llama3.1:8b")))

;; faces
(set-face-background 'vertical-border "#073642")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

;; global modes
(global-git-gutter-mode +1)
(global-auto-revert-mode t)
(global-visual-line-mode t)

(after! company-mode
  (setq company-tooltip-align-annotations t))

(after! dash-docs
  (set-docsets! 'ts-mode :add "React" "TypeScript"))

;; org-mode
(after! org
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell .t)
     (emacs-lisp . t)
     (python . t)
     (typescript . t)
     (Javascript . t)))

  (setq org-tag-alist '(("@home" . ?h)
                        ("@work" . ?w)))

  (setq org-deadline-warning-days 10
        org-agenda-start-day nil ;; start on current day
        org-confirm-babel-evaluate nil
        org-agenda-include-diary t
        org-agenda-files '("~/Documents/org/"))

  (setq org-capture-templates
        '(("t" "Todo" entry (file "~/Documents/org/todo.org")
           "* TODO %?\n  %i\n  %a")
          ("r" "Reading List" entry (file "~/Documents/org/read.org")
           "* TODO %?\n  %i\n  %a")
          ("w" "Weekly Review" entry (file+datetree "~/Documents/org/reviews.org")
           (file "~/Documents/org/templates/weeklyreviewtemplate.org"))
          ("l" "Ledger transaction" plain
           (file "~/ledger/2024.ledger")
           "%(org-read-date) * %^{Description}
 %^{Category|Expenses:Groceries|Expenses:Eating Out|Expenses:Household|Expenses:Subscriptions}
 %^{Account|Assets:Checking|Income:Cash}  -$%^{Amount}"
           :empty-lines 1)
          ("c" "Cookbook" entry (file "~/Documents/org/cookbook.org")
           "%(org-chef-get-recipe-from-url)"
           :empty-lines 1)))

  (setq org-agenda-custom-commands
        '((" " "Agenda"
           ((agenda ""
                    ((org-agenda-span 'day)))
            (todo "TODO"
                  ((org-agenda-overriding-header "Unscheduled tasks")
                   (org-agenda-files '("~/Documents/org/todo.org" "~/Documents/org/repeaters.org"))
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))
                   ))
            (todo "TODO"
                  ((org-agenda-overriding-header "Unscheduled project tasks")
                   (org-agenda-files '("~/Documents/org/projects.org"))
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))))))
          ("r" "Reading List"
           ((todo "TODO"
                  ((org-agenda-overriding-header "Reading List")
                   (org-agenda-files '("~/Documents/org/read.org")))))))))

;; icloud syncing
(defmacro func-ignore (fnc)
  "Return function that ignores its arguments and invokes FNC."
  `(lambda (&rest _rest)
     (funcall ,fnc)))

;; save all org-buffers when todo state changes
(advice-add 'org-deadline       :after (func-ignore #'org-save-all-org-buffers))
(advice-add 'org-schedule       :after (func-ignore #'org-save-all-org-buffers))
(advice-add 'org-store-log-note :after (func-ignore #'org-save-all-org-buffers))
(advice-add 'org-todo           :after (func-ignore #'org-save-all-org-buffers))

(after! org-roam
  (setq org-roam-directory "~/Documents/org/roam"))

;; end org

;; ledger
(after! ledger
  (setq ledger-default-date-format "%Y-%m-%d")
  (setq ledger-reports
        '(("bud" "%(binary) -f %(ledger-file) reg --budget --monthly ^expenses")
          ("unbud" "%(binary) -f %(ledger-file) reg --unbudgeted --monthly ^expenses")
          ("bal" "%(binary) -f %(ledger-file) bal")
          ("reg" "%(binary) -f %(ledger-file) reg")
          ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
          ("account" "%(binary) -f %(ledger-file) reg %(account)"))))

(after! auth-source
  (setq auth-sources (nreverse auth-sources)))

(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'bottom
        lsp-ui-doc-delay 0.2
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-show-hover nil))

(after! doom-ui
  ;; set your favorite themes
  (setq custom-safe-themes t)
  (setq! auto-dark-themes '((doom-solarized-dark-high-contrast) (doom-solarized-light)))
  (auto-dark-mode))

;; emacs-mac
(when (display-graphic-p)
  (set-frame-parameter (selected-frame) 'alpha '(95 . 95))
  (add-to-list 'default-frame-alist '(alpha . (95 . 95))))

;; add to lists
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-tsx-mode))

(setq explicit-shell-file-name "/bin/zsh")

(load "~/dotfiles/.config/doom/personal.el")
