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
      doom-theme 'doom-tokyo-night
      doom-font (font-spec :family "CaskaydiaMono Nerd Font" :size 12)
      explicit-shell-file-name "/bin/zsh")

(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

(after! dash-docs
  (set-docsets! 'ts-mode :add "React" "TypeScript"))

(after! lsp-ui
  (setq lsp-ui-doc-enable nil
        lsp-ui-doc-use-childframe nil
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-doc-delay 0.2
        lsp-ui-doc-position 'at-point)
  (add-hook 'lsp-mode-hook 'lsp-ui-doc-mode))

;; org mode
(setq org-directory "~/Dropbox/org"
      org-agenda-files (list
                        (expand-file-name "inbox.org" org-directory)
                        (expand-file-name "projects" org-directory)
                        (expand-file-name "books" org-directory))
      org-default-notes-file (expand-file-name "inbox.org" org-directory))

;; Task keywords and logging
(setq org-log-done 'time
      org-log-into-drawer t

      org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
        (sequence "WAITING(w@/!)" "HOLD(h)" "|" "CANCELLED(c@/!)"))

      org-todo-keyword-faces
      '(("NEXT" . +org-todo-active)
        ("WAITING" . +org-todo-onhold)
        ("HOLD" . +org-todo-onhold)
        ("CANCELLED" . +org-todo-cancel)))

;; Agenda
(setq org-agenda-span 'day
      org-agenda-start-on-weekday nil
      org-agenda-start-day "+0d"
      org-deadline-warning-days 7
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-tags-todo-honor-ignore-options t)

;; Refile
(setq org-refile-targets '((nil :maxlevel . 3)
                           (org-agenda-files :maxlevel . 3))
      org-outline-path-complete-in-steps nil
      org-refile-use-outline-path t)

;; Capture Templates
(setq org-capture-templates
      `(
        ("i" "Inbox" entry
         (file ,(expand-file-name "inbox.org" org-directory))
         "* TODO %?\n%U\n")

        ("b" "Book to Read" entry
         (file+headline ,(expand-file-name "books/inbox.org" org-directory) "Books")
         "* TODO %?  :book:\n%U\n")

        ("p" "Project Task" entry
         (function
          (lambda () (read-file-name "Select project file: "
                                     (expand-file-name "projects/" org-directory))))
         "* TODO %?\n%U\n")

        ("n" "Note" entry
         (file ,(expand-file-name "notes.org" org-directory))
         "* %? :note:\n%U\n")))

;; Tag alignment and groups
(setq org-tags-column 0
      org-tag-alist
      '((:startgroup)
        ("@work" . ?w)
        ("@home" . ?h)
        (:endgroup)
        ("urgent" . ?u)
        ("deep" . ?d)
        ("book" . ?b)))

;; Visuals
(setq org-hide-emphasis-markers t
      org-ellipsis " ▾ "
      org-pretty-entities t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t
      org-image-actual-width '(300))

(setq org-agenda-custom-commands
      '((" " "Agenda"
         ((agenda ""
                  ((org-agenda-span 'day)))
          (todo "TODO"
                ((org-agenda-overriding-header "Unscheduled tasks")
                 (org-agenda-files (list (expand-file-name "inbox.org" org-directory)))
                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))))
          (todo "TODO"
                ((org-agenda-overriding-header "Unscheduled project tasks")
                 (org-agenda-files (directory-files (expand-file-name "projects" org-directory) 'full (rx ".org" eos)))
                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))))))

        ("b" "Books Agenda"
         ((agenda ""
                  ((org-agenda-span 'day)
                   (org-agenda-files (directory-files (expand-file-name "books" org-directory) 'full (rx ".org" eos)))))
          (todo "TODO"
                ((org-agenda-overriding-header "Unscheduled book entries")
                 (org-agenda-files (directory-files (expand-file-name "books" org-directory) 'full (rx ".org" eos)))
                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))))))))

(after! org-roam
  (setq org-roam-directory (file-truename "~/Dropbox/org/roam")
        org-roam-db-location (expand-file-name ".org-roam.db" org-roam-directory)
        org-roam-completion-everywhere t
        org-roam-capture-templates
        '(("d" "Default" plain
           "%?"
           :if-new (file+head "${slug}.org"
                              "#+title: ${title}\n#+date: %U\n\n")
           :unnarrowed t)

          ("n" "Note with Tags" plain
           "%?"
           :if-new (file+head "${slug}.org"
                              "#+title: ${title}\n#+filetags: :note:\n#+date: %U\n\n")
           :unnarrowed t)

          ("b" "Book Note" plain
           "%?"
           :if-new (file+head "books/${slug}.org"
                              "#+title: ${title}\n#+filetags: :book:\n#+date: %U\n\n")
           :unnarrowed t))))

;; global modes
(global-git-gutter-mode +1)
(global-auto-revert-mode t)
(global-visual-line-mode t)

;; auto saving
(auto-save-visited-mode 1)

;; add to lists
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-tsx-mode))
(add-to-list 'auto-mode-alist '("\\.restclient\\'" . restclient-mode))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
