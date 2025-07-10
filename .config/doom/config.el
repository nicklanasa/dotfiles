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
      explicit-shell-file-name "/bin/zsh")

(cond
 ((string= system-name "Mac")
  (setq doom-font (font-spec :family "CaskaydiaMono Nerd Font" :size 20)))
 (t
  (setq doom-font (font-spec :family "CaskaydiaMono Nerd Font" :size 14))))

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

;; org
(after! org
  (setq org-src-window-setup 'current-window
        org-return-follows-link t
        org-babel-load-languages '((shell .t)
                                   (emacs-lisp . t)
                                   (python . t))
        org-confirm-babel-evaluate nil
        org-refile-targets '((org-agenda-files :maxlevel . 3))
        org-agenda-include-diary t
        org-agenda-tags-column 125
        org-agenda-start-day nil
        org-deadline-warning-days 30
        org-use-speed-commands t)

  (setq org-directory "~/Documents/org")
  (setq org-agenda-files (directory-files org-directory 'full (rx ".org" eos)))

  ;; then add project files
  (let* ((projects-dir (expand-file-name "projects" org-directory))
         (project-files (directory-files projects-dir 'full (rx ".org" eos))))
    (setq org-agenda-files
          (append org-agenda-files project-files)))

  (setq org-capture-templates
        '(("t" "Todo" entry (file (lambda () (expand-file-name "inbox.org" org-directory)))
           "* TODO %?\n  %i\n  %a")
          ("e" "Event" entry (file (lambda () (expand-file-name "calendar.org" org-directory)))
           "* %^{Title} %^T\n")
          ("r" "Weekly Review" entry (file (lambda () (expand-file-name "reviews.org" org-directory)))
           (file (lambda () (expand-file-name "templates/weeklyreviewtemplate.org" org-directory))))
          ("c" "Cookbook" entry (file (lambda () (expand-file-name "cookbook.org" org-directory)))
           "%(org-chef-get-recipe-from-url)"
           :empty-lines 1)))

  (setq org-agenda-custom-commands
        '((" " "Agenda"
           ((agenda ""
                    ((org-agenda-span 'day)))
            (todo "TODO"
                  ((org-agenda-overriding-header "Unscheduled tasks")
                   (org-agenda-files (list (expand-file-name "inbox.org" org-directory)))
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'scheduled 'deadline))))
            (todo "TODO"
                  ((org-agenda-overriding-header "Unscheduled project tasks")
                   (org-agenda-files
                    (directory-files (expand-file-name "projects" org-directory)
                                     'full (rx ".org" eos)))
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'scheduled 'deadline))))))
          ("w" "Watch Agenda"
           ((agenda ""
                    ((org-agenda-span 'day)
                     (org-agenda-files
                      (directory-files (expand-file-name "watch" org-directory)
                                       'full (rx ".org" eos)))))
            (todo "TODO"
                  ((org-agenda-overriding-header "Unscheduled watch entries")
                   (org-agenda-files
                    (directory-files (expand-file-name "watch" org-directory)
                                     'full (rx ".org" eos)))
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'scheduled 'deadline))))))
          ("r" "Read Agenda"
           ((agenda ""
                    ((org-agenda-span 'day)
                     (org-agenda-files
                      (directory-files (expand-file-name "read" org-directory)
                                       'full (rx ".org" eos)))))
            (todo "TODO"
                  ((org-agenda-overriding-header "Unscheduled read entries")
                   (org-agenda-files
                    (directory-files (expand-file-name "read" org-directory)
                                     'full (rx ".org" eos)))
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'scheduled 'deadline))))))))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))

(after! org-roam
  (setq org-roam-directory (file-truename "~/Documents/org/roam/"))
  (setq org-roam-capture-templates '(("d" "default" plain "%?"
                                      :target
                                      (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                                 "#+title: ${title}\n")
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

;; keyboard shortcuts
(global-set-key (kbd "<f1>") #'org-capture)
(global-set-key (kbd "<f2>") #'org-roam-node-find)
(global-set-key (kbd "<f3>") #'find-file)
