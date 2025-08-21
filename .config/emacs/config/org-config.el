;; ---------------------------
;; Org-mode core settings
;; ---------------------------
(setq org-src-window-setup 'current-window
      org-return-follows-link t
      org-babel-load-languages '((shell . t)
                                 (emacs-lisp . t)
                                 (python . t))
      org-confirm-babel-evaluate nil
      org-refile-targets '((org-agenda-files :maxlevel . 3))
      org-agenda-include-diary t
      org-agenda-tags-column 75
      org-agenda-start-day nil
      org-deadline-warning-days 30
      org-use-speed-commands t)

;; Directories and agenda files
(setq org-directory "~/Documents/org")
(setq org-agenda-files (directory-files org-directory 'full (rx ".org" eos)))

;; Include project files
(let* ((projects-dir (expand-file-name "projects" org-directory))
       (project-files (directory-files projects-dir 'full (rx ".org" eos))))
  (setq org-agenda-files
        (append org-agenda-files project-files)))

;; Capture templates
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

;; Custom agenda commands
(setq org-agenda-custom-commands
      '((" " "Agenda"
         ((agenda "" ((org-agenda-span 'day)))
          (todo "TODO"
                ((org-agenda-overriding-header "Unscheduled tasks")
                 (org-agenda-files (list (expand-file-name "inbox.org" org-directory)
                                         (expand-file-name "phone.org" org-directory)))
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

;; TODO keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
        (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")))

(provide 'org-config)
