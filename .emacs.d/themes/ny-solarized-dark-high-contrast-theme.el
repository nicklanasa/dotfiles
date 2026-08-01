;;; ny-solarized-dark-high-contrast-theme.el --- Pure Emacs Solarized HC theme -*- lexical-binding: t; -*-

;; Author: Nick + Codex
;; Keywords: faces, theme
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.1"))

;;; Commentary:

;; A standalone custom theme based on Doom Emacs'
;; `doom-solarized-dark-high-contrast-theme.el`.
;;
;; This version does not depend on `doom-themes` or `solarized-theme`.

;;; Code:

(deftheme ny-solarized-dark-high-contrast
  "Pure Emacs theme based on Doom's Solarized Dark High Contrast.")

(let* ((class '((class color) (min-colors 89)))
       (bg            "#002732")
       (bg-alt        "#01323d")
       (base0         "#8d9fa1")
       (base1         "#9eacac")
       (base2         "#faf3e0")
       (base3         "#ffffee")
       (grey          "#62787f")
       (grey-alt      "#60767e")
       (red           "#ec423a")
       (orange        "#db5823")
       (green         "#93a61a")
       (teal          "#3cafa5")
       (yellow        "#c49619")
       (blue          "#3c98e0")
       (dark-blue     "#0069b0")
       (magenta       "#e2468f")
       (violet        "#7a7ed2")
       (cyan          "#3cafa5")
       (red-bg        "#2f2c31")
       (green-bg      "#1e3531")
       (yellow-bg     "#273430")
       (blue-bg       "#023447")
       (magenta-bg    "#292d3c")
       (cyan-bg       "#03373f")
       (border        "#01323d")
       (modeline-bg   "#01323d")
       (modeline-fg   "#faf3e0")
       (modeline-inactive-bg "#002732")
       (modeline-inactive-fg "#62787f"))
  (custom-theme-set-faces
   'ny-solarized-dark-high-contrast

   ;; Core UI
   `(default ((,class (:background ,bg :foreground ,base2))))
   `(cursor ((,class (:background ,yellow :foreground ,bg))))
   `(fringe ((,class (:background ,bg :foreground ,grey))))
   `(highlight ((,class (:background ,bg-alt :foreground ,base2))))
   `(region ((,class (:background ,blue-bg :extend t))))
   `(secondary-selection ((,class (:background ,cyan-bg :extend t))))
   `(shadow ((,class (:foreground ,grey))))
   `(minibuffer-prompt ((,class (:foreground ,blue :weight bold))))
   `(vertical-border ((,class (:foreground ,border))))
   `(link ((,class (:foreground ,blue :underline t))))
   `(link-visited ((,class (:foreground ,violet :underline t))))
   `(error ((,class (:foreground ,red :weight bold))))
   `(warning ((,class (:foreground ,orange :weight bold))))
   `(success ((,class (:foreground ,green :weight bold))))
   `(escape-glyph ((,class (:foreground ,magenta))))
   `(homoglyph ((,class (:foreground ,magenta))))
   `(match ((,class (:background ,green-bg :foreground ,green :weight bold))))
   `(lazy-highlight ((,class (:background ,yellow-bg :foreground ,yellow))))
   `(isearch ((,class (:background ,yellow :foreground ,bg :weight bold))))
   `(isearch-fail ((,class (:background ,red-bg :foreground ,red :weight bold))))
   `(trailing-whitespace ((,class (:background ,red))))
   `(show-paren-match ((,class (:background ,green-bg :foreground ,green :weight bold))))
   `(show-paren-mismatch ((,class (:background ,red-bg :foreground ,red :weight bold))))

   ;; Font lock
   `(font-lock-builtin-face ((,class (:foreground ,magenta))))
   `(font-lock-comment-face ((,class (:foreground ,grey :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,grey-alt :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,violet))))
   `(font-lock-doc-face ((,class (:foreground ,grey-alt))))
   `(font-lock-function-name-face ((,class (:foreground ,blue))))
   `(font-lock-keyword-face ((,class (:foreground ,green :weight semi-bold))))
   `(font-lock-negation-char-face ((,class (:foreground ,red))))
   `(font-lock-preprocessor-face ((,class (:foreground ,orange))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,yellow))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,orange))))
   `(font-lock-string-face ((,class (:foreground ,cyan))))
   `(font-lock-type-face ((,class (:foreground ,yellow))))
   `(font-lock-variable-name-face ((,class (:foreground ,base2))))
   `(font-lock-warning-face ((,class (:foreground ,red :weight bold))))

   ;; Mode line / header line
   `(mode-line ((,class (:background ,modeline-bg :foreground ,modeline-fg :box (:line-width 1 :color ,border)))))
   `(mode-line-buffer-id ((,class (:foreground ,base3 :weight bold))))
   `(mode-line-emphasis ((,class (:foreground ,yellow :weight bold))))
   `(mode-line-inactive ((,class (:background ,modeline-inactive-bg :foreground ,modeline-inactive-fg :box (:line-width 1 :color ,border)))))
   `(header-line ((,class (:background ,bg-alt :foreground ,base1 :box nil))))

   ;; Line numbers
   `(line-number ((,class (:background ,bg :foreground ,grey))))
   `(line-number-current-line ((,class (:background ,bg :foreground ,base2 :weight bold))))

   ;; Completion / popup-ish built-ins
   `(icomplete-first-match ((,class (:foreground ,green :weight bold))))
   `(completions-common-part ((,class (:foreground ,blue :weight bold))))
   `(completions-first-difference ((,class (:foreground ,orange :weight bold))))

   ;; Diff
   `(diff-added ((,class (:background ,green-bg :foreground ,green))))
   `(diff-changed ((,class (:background ,blue-bg :foreground ,blue))))
   `(diff-removed ((,class (:background ,red-bg :foreground ,red))))
   `(diff-refine-added ((,class (:background ,green :foreground ,bg))))
   `(diff-refine-removed ((,class (:background ,red :foreground ,bg))))
   `(diff-header ((,class (:background ,bg-alt :foreground ,base1))))
   `(diff-file-header ((,class (:background ,bg-alt :foreground ,blue :weight bold))))

   ;; Org
   `(org-document-title ((,class (:foreground ,base3 :weight bold :height 1.1))))
   `(org-document-info ((,class (:foreground ,base1))))
   `(org-level-1 ((,class (:foreground ,blue :weight bold :height 1.0))))
   `(org-level-2 ((,class (:foreground ,green :weight bold :height 1.0))))
   `(org-level-3 ((,class (:foreground ,yellow :weight bold :height 1.0))))
   `(org-level-4 ((,class (:foreground ,violet :weight bold))))
   `(org-level-5 ((,class (:foreground ,cyan))))
   `(org-level-6 ((,class (:foreground ,magenta))))
   `(org-level-7 ((,class (:foreground ,orange))))
   `(org-level-8 ((,class (:foreground ,base1))))
   `(org-block ((,class (:background ,bg-alt :extend t))))
   `(org-block-begin-line ((,class (:background ,bg-alt :foreground ,grey))))
   `(org-block-end-line ((,class (:background ,bg-alt :foreground ,grey))))
   `(org-code ((,class (:foreground ,cyan))))
   `(org-verbatim ((,class (:foreground ,yellow))))
   `(org-quote ((,class (:background ,bg-alt :slant italic :extend t))))
   `(org-table ((,class (:foreground ,blue))))
   `(org-date ((,class (:foreground ,violet :underline t))))
   `(org-done ((,class (:foreground ,green :weight bold))))
   `(org-todo ((,class (:foreground ,red :weight bold))))
   `(org-headline-done ((,class (:foreground ,grey))))

   ;; Built-in package faces that matter in your config
   `(dired-directory ((,class (:foreground ,blue :weight bold))))
   `(dired-flagged ((,class (:foreground ,red))))
   `(dired-header ((,class (:foreground ,magenta :weight bold))))
   `(dired-ignored ((,class (:foreground ,grey))))
   `(dired-mark ((,class (:foreground ,yellow :weight bold))))
   `(dired-marked ((,class (:foreground ,orange :weight bold))))
   `(dired-perm-write ((,class (:foreground ,base2 :underline t))))
   `(dired-symlink ((,class (:foreground ,cyan :weight bold))))
   `(dired-warning ((,class (:foreground ,orange))))

   `(widget-field ((,class (:background ,bg-alt :box (:line-width 1 :color ,border)))))
   `(custom-variable-tag ((,class (:foreground ,blue :weight bold))))
   `(custom-group-tag ((,class (:foreground ,violet :weight bold :height 1.15))))
   `(custom-state ((,class (:foreground ,green))))

   ;; Common optional package faces; harmless if packages are absent
   `(vertico-current ((,class (:background ,bg-alt :foreground ,base3 :extend t))))
   `(corfu-current ((,class (:background ,bg-alt :foreground ,base3 :extend t))))
   `(corfu-bar ((,class (:background ,blue))))
   `(which-key-key-face ((,class (:foreground ,green :weight bold))))
   `(which-key-command-description-face ((,class (:foreground ,base2))))
   `(which-key-group-description-face ((,class (:foreground ,blue))))
   `(which-key-local-map-description-face ((,class (:foreground ,violet))))))
;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'ny-solarized-dark-high-contrast)

;;; ny-solarized-dark-high-contrast-theme.el ends here
