(setq native-comp-deferred-compilation t
      native-comp-async-report-warnings-errors nil	
      ring-bell-function 'ignore
      visible-bell t
      warning-minimum-level 'error
      completion-styles '(basic flex)
      completion-auto-select t        
      completion-auto-help 'visible)

;; Set Homebrew library paths for native compilation
(setenv "LIBRARY_PATH" "/opt/homebrew/opt/libgccjit/lib/gcc/current:$LIBRARY_PATH")
(setenv "LD_LIBRARY_PATH" "/opt/homebrew/opt/libgccjit/lib/gcc/current:$LD_LIBRARY_PATH")

;; Optional: clear broken native cache after reinstall
;; (delete-directory "~/.config/emacs/eln-cache" t)

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Frame transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;; Font
(add-to-list 'default-frame-alist
             `(font . ,(format "%s-%d" "CaskaydiaMono Nerd Font Mono" 18)))

(with-eval-after-load 'custom
  (add-to-list 'custom-theme-load-path
               (expand-file-name "themes/" user-emacs-directory))
  (setq custom-safe-themes
        (cons "solarized-osaka-light" custom-safe-themes))
  (load-theme 'solarized-osaka-light t))

;; Requires emacs-plus with native macOS appearance change hooks
(defun ny/apply-appearance (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'solarized-osaka-light :no-confirm))  ;; light theme
    ('dark (load-theme 'solarized-osaka-dark :no-confirm))))  ;; dark theme

;; Hook into macOS appearance changes
(add-hook 'ns-system-appearance-change-functions #'ny/apply-appearance)

(auto-save-visited-mode 1)

(fido-vertical-mode 1)

(global-visual-line-mode 1)
(global-hl-line-mode -1)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)

(use-package prettier-js
  :hook ((typescript-mode typescript-ts-mode tsx-ts-mode js-mode js2-mode jsx-mode) . prettier-js-mode))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  :hook (typescript-mode . company-mode))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package ledger-mode :ensure t)

(use-package paredit :ensure t)

(use-package org-roam
  :ensure t
  :config
  (setq org-roam-directory (file-truename "~/Documents/org/roam/"))
  (setq org-roam-capture-templates
	'(("d" "default" plain "%?"
           :target
           (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                      "#+title: ${title}\n")
           :unnarrowed t))))

(use-package org-chef :ensure t)

(use-package magit :ensure t)

(use-package treesit
  :init
  (setq treesit-language-source-alist
	'((tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
          (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")))
  :config
  (dolist (lang '(tsx typescript))
    (unless (treesit-language-available-p lang)
      (treesit-install-language-grammar lang)))

  ;; File associations
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode)))

(use-package lsp-mode
  :ensure t
  :hook ((tsx-ts-mode . lsp)
         (typescript-ts-mode . lsp))
  :config
  ;; Send diagnostics to Flymake
  (setq lsp-diagnostic-package :flymake))

;; Flymake inline diagnostics
(setq flymake-display-functions '(flymake-show-diagnostics-inline))

;; Optional: make overlays more visible
(custom-set-faces
 '(flymake-error ((t (:underline (:style wave :color "Red1")))))
 '(flymake-warning ((t (:underline (:style wave :color "Orange1"))))))

;; LSP UI for definitions/signatures only
(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  ;; Definitions / hover
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-doc-show-diagnostics t
        lsp-ui-sideline-enable t))

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

(setq org-directory "~/Documents/org")
(setq org-agenda-files (directory-files org-directory 'full (rx ".org" eos)))

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

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
	(sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

(dolist (hook '(emacs-lisp-mode-hook
		ielm-mode-hook
		lisp-interaction-mode-hook))
  (add-hook hook #'paredit-mode))

(defvar ny/themes
  '(solarized-osaka-dark solarized-osaka-light modus-operandi-tinted modus-vivendi)
  "List of themes to choose from.")

(defun ny/select-theme ()
  "Select and load a theme from a list."
  (interactive)
  (let ((theme (intern (completing-read
                        "Select theme: "
                        (mapcar #'symbol-name ny/themes)))))
    (mapc #'disable-theme custom-enabled-themes)
    (load-theme theme t)
    (message "Loaded theme: %s" theme)))
