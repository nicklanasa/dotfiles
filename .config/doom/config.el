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
      doom-font (font-spec :family "Consolas" :size 18)
      explicit-shell-file-name "/bin/zsh")

;; set env
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))

;; faces
(set-face-background 'vertical-border "#073642")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

;; emacs-mac
(when (display-graphic-p)
  (set-frame-parameter (selected-frame) 'alpha '(95 . 95))
  (add-to-list 'default-frame-alist '(alpha . (95 . 95))))

;; org-mode
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
        (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")))

(setq org-directory
      (let ((sys (system-name)))
        (cond
         ((string-prefix-p "NytekPC" sys) "/mnt/c/Users/Nickl/iCloudDrive/Documents/org/")
         ((string-prefix-p "mbp.local" sys) "~/Documents/org/"))))

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
      org-agenda-files (directory-files-recursively org-directory "\.org$"))

(setq org-capture-templates
      '(("t" "Todo" entry (file (lambda () (expand-file-name "todo.org" org-directory)))
         "* TODO %?\n  %i\n  %a")
        ("l" "Ledger transaction" plain
         (file "~/ledger/2024.ledger")
         "%(org-read-date) %^{Description}
 %^{Category|Expenses:Food:Groceries|Expenses:Food:Eating Out|Expenses:Household|Expenses:Subscriptions}
 %^{Account|Assets:Checking|Income:Cash}  -$%^{Amount}"
         :empty-lines 1)
        ("c" "Cookbook" entry (file (lambda () (expand-file-name "cookbook.org" org-directory)))
         "%(org-chef-get-recipe-from-url)"
         :empty-lines 1)))
(setq org-agenda-custom-commands
      '((" " "Agenda"
         ((agenda ""
                  ((org-agenda-span 'week)))
          (todo "TODO"
                ((org-agenda-overriding-header "Unscheduled tasks")
                 (org-agenda-files (list (expand-file-name "todo.org" org-directory)))
                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))
                 ))
          (todo "TODO"
                ((org-agenda-overriding-header "Unscheduled project tasks")
                 (org-agenda-files (directory-files-recursively (expand-file-name "projects" org-directory) "\.org$"))
                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))))))))

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

  (setq org-roam-directory
        (let ((sys (system-name)))
          (cond
           ((string-prefix-p "NytekPC" sys) "/mnt/c/Users/Nickl/iCloudDrive/Documents/org/roam")
           ((string-prefix-p "mbp.local" sys) "~/Documents/org/roam"))))

  (setq org-roam-capture-templates
        '(("d" "Default" plain
           "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)
          ("b" "Book" plain
           "\n* Source\n\nAuthor: %^{Author}\nTitle: ${title}\nYear: %^{Year}\n\n* Summary\n\n%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t))))
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

(after! company-mode
  (setq company-tooltip-align-annotations t))

(after! dash-docs
  (set-docsets! 'ts-mode :add "React" "TypeScript"))

(after! lsp-ui
  (setq gc-cons-threshold 100000000
        read-process-output-max (* 1024 1024)
        lsp-ui-doc-enable t
        lsp-ui-doc-position 'bottom
        lsp-ui-doc-delay 0.1
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-include-signature nil
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-show-hover nil))

(after! gptel
  (setq
   gptel-model 'llama3.2:latest
   gptel-backend (gptel-make-ollama "Ollama"
                   :host "localhost:11434"
                   :stream t
                   :models '(llama3.2:latest))))

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
