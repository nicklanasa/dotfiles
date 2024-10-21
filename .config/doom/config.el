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

  (setq org-directory "~/Documents/Org")
  (setq org-agenda-files (directory-files org-directory 'full (rx ".org" eos)))

  (setq org-capture-templates
        '(("t" "Todo" entry (file (lambda () (expand-file-name "todo.org" org-directory)))
           "* TODO %?\n  %i\n  %a")
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
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))))
            (todo "TODO"
                  ((org-agenda-overriding-header "Unscheduled project tasks")
                   (org-agenda-files (list (expand-file-name "projects.org" org-directory)))
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))))))))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))

(after! org-roam
  (setq org-roam-directory (file-truename "~/Documents/Org/roam/"))
  (setq org-roam-capture-templates '(("d" "default" plain "%?"
                                      :target
                                      (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                                 "#+title: ${title}\n")
                                      :unnarrowed t))))

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
