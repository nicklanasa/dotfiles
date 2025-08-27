(setq native-comp-deferred-compilation t
      native-comp-async-report-warnings-errors nil	
      ring-bell-function 'ignore
      visible-bell t
      warning-minimum-level 'error
      tab-width 2
      indent-tabs-mode nil
      js-indent-level 2
      typescript-indent-level 2
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

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Frame transparency
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

;; Font
(add-to-list 'default-frame-alist
             `(font . ,(format "%s-%d" "CaskaydiaMono Nerd Font Mono" 16)))

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
    ('light (load-theme 'solarized-osaka-light :no-confirm))
    ('dark (load-theme 'solarized-osaka-dark :no-confirm))))

;; Hook into macOS appearance changes
(add-hook 'ns-system-appearance-change-functions #'ny/apply-appearance)

(auto-save-visited-mode 1)

(fido-vertical-mode 1)

(global-visual-line-mode 1)
(global-hl-line-mode -1)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)

(use-package elfeed
  :ensure t
  :config
  (setq elfeed-feeds
	'(("https://sachachua.com/blog/category/emacs-news/feed" emacs)
	  ("https://hnrss.org/frontpage" tech)
	  ("https://planet.emacslife.com/atom.xml" emacs)
	  ("http://export.arxiv.org/rss/cs" research))))

(use-package gptel
  :ensure t
  :config
  (setq gptel-use-tools t)
  (gptel-make-ollama "Ollama"
    :host "localhost:11434"
    :stream t
    :models '(gpt-oss:120b)))

(gptel-make-tool
 :name "fetch_url"
 :function (lambda (url)
             (let ((buffer (url-retrieve-synchronously url t t 10)))
	       (if buffer
                   (with-current-buffer buffer
                     (goto-char (point-min))
                     ;; Skip HTTP headers
                     (re-search-forward "\n\n" nil 'move)
                     (let ((content (buffer-substring-no-properties (point) (point-max))))
		       (kill-buffer)
		       content))
                 (format "Failed to fetch URL: %s" url))))
 :description "Fetch the content of a specified URL and return it as a string"
 :args (list '(:name "url"
                     :type string
                     :description "The URL to fetch content from"))
 :category "network")

(gptel-make-tool
 :name "insert_text"
 :function (lambda (text)
             (insert text)
             (format "Inserted text at cursor:\n%s" text))
 :description "Insert the given text at the current cursor position"
 :args (list '(:name "text"
                     :type string
                     :description "Text to insert"))
 :category "editing")

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

(use-package paredit :ensure t)

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
