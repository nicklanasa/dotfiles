;;; solarized-osaka-dark-theme.el --- Solarized Osaka Dark for Emacs

(deftheme solarized-osaka-dark
  "Custom Emacs theme inspired by Solarized Osaka (dark variant)")

(let ((bg      "#002731")
      (fg      "#a5b4b9")
      (cyan    "#2aa198")
      (blue    "#268bd2")
      (green   "#859900")
      (yellow  "#b58900")
      (orange  "#cb4b16")
      (red     "#dc322f")
      (magenta "#d33682")
      (violet  "#6c71c4")
      ;; Org-specific
      (org-heading "#eee8d5")   ;; lighter heading for dark bg
      (org-block-bg "#073642")) ;; softer dark bg for source blocks
  (custom-theme-set-faces
   'solarized-osaka-dark

   ;; Core faces
   `(default ((t (:background ,bg :foreground ,fg))))
   `(ansi-color-blue ((t (:background ,bg :foreground ,blue))))
   `(cursor ((t (:background ,fg))))
   `(fringe ((t (:background ,bg))))
   `(region ((t (:background ,cyan :foreground ,bg))))
   `(highlight ((t (:background ,blue))))
   `(mode-line ((t (:background "#8a8a8a" :foreground ,bg :box nil))))
   `(mode-line-inactive ((t (:background ,bg :foreground ,fg :box nil))))

   ;; Syntax highlighting
   `(font-lock-comment-face ((t (:foreground ,green :slant italic))))
   `(font-lock-string-face ((t (:foreground ,cyan))))
   `(font-lock-keyword-face ((t (:foreground ,violet :weight bold))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-variable-name-face ((t (:foreground ,orange))))
   `(font-lock-constant-face ((t (:foreground ,yellow))))
   `(font-lock-type-face ((t (:foreground ,magenta))))
   `(font-lock-warning-face ((t (:foreground ,red :weight bold))))

   ;; UI
   `(link ((t (:foreground ,blue :underline t))))
   `(link-visited ((t (:foreground ,violet :underline t))))
   `(minibuffer-prompt ((t (:foreground ,yellow :weight bold))))
   `(success ((t (:foreground ,green :weight bold))))
   `(error ((t (:foreground ,red :weight bold))))
   `(warning ((t (:foreground ,yellow :weight bold))))

   ;; Org-mode
   `(org-todo ((t (:foreground ,red :weight bold :height 1.0))))
   `(org-level-1 ((t (:foreground ,org-heading :weight bold :height 1.0))))
   `(org-level-2 ((t (:foreground ,blue :weight semi-bold :height 0.95))))
   `(org-level-3 ((t (:foreground ,violet :weight normal :height 0.9))))
   `(org-level-4 ((t (:foreground ,green :weight normal))))
   `(org-block ((t (:background ,org-block-bg :foreground ,fg :extend t))))
   `(org-block-begin-line ((t (:background ,org-block-bg :foreground ,cyan :slant italic :extend t))))
   `(org-block-end-line ((t (:background ,org-block-bg :foreground ,cyan :slant italic :extend t))))

   ;; Fido / Vertico integration
   `(icomplete-first-match ((t (:background "#073642" :weight bold :extend t))))
   `(icomplete-selected-match ((t (:background "#073642" :foreground ,blue :weight bold :extend t))))
   `(completions-common-part ((t (:foreground ,blue :weight normal))))
   `(completions-first-difference ((t (:foreground ,red :weight bold))))
   `(vertico-current ((t (:background "#073642" :foreground ,blue :weight bold :extend t))))

   ;; Vertical separator
   `(vertical-border ((t (:background "#004f4f" :foreground "#004f4f"))))

   ;; ledger
   `(ledger-occur-xact-face ((t (:background ,bg))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'solarized-osaka-dark)
;;; solarized-osaka-dark-theme.el ends here
