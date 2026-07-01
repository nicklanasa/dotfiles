;;; ny-cursor-dark-theme.el --- Cursor Dark inspired theme -*- lexical-binding: t; -*-

;; Author: Nick + Codex
;; Keywords: faces, theme
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.1"))

;;; Commentary:

;; A standalone custom theme based on Cursor Dark:
;; https://github.com/CedricVerlinden/cursor-dark/blob/master/themes/cursor-dark.json

;;; Code:

(deftheme ny-cursor-dark
  "Dark Emacs theme inspired by Cursor Dark.")

(let* ((class '((class color) (min-colors 89)))
       (bg            "#1a1a1a")
       (bg-alt        "#141414")
       (bg-hl         "#292929")
       (fg            "#D8DEE9")
       (fg-alt        "#CCCCCC")
       (grey          "#505050")
       (grey-alt      "#606060")
       (border        "#2A2A2A")
       (selection     "#404040")
       (red           "#BF616A")
       (orange        "#efb080")
       (green         "#A3BE8C")
       (teal          "#83d6c5")
       (yellow        "#EBCB8B")
       (blue          "#87c3ff")
       (blue-alt      "#4c9df3")
       (cyan          "#88C0D0")
       (magenta       "#B48EAD")
       (violet        "#AA9BF5")
       (red-bg        "#352426")
       (green-bg      "#263126")
       (yellow-bg     "#393323")
       (blue-bg       "#233040")
       (cyan-bg       "#203238")
       (modeline-bg   "#141414")
       (modeline-fg   "#cccccc")
       (modeline-inactive-bg "#141414")
       (modeline-inactive-fg "#666666"))
  (custom-theme-set-faces
   'ny-cursor-dark

   ;; Core UI
   `(default ((,class (:background ,bg :foreground ,fg))))
   `(cursor ((,class (:background "#FFFFFF" :foreground ,bg))))
   `(fringe ((,class (:background ,bg :foreground ,grey))))
   `(highlight ((,class (:background ,bg-hl :foreground ,fg))))
   `(hl-line ((,class (:background ,bg-hl :extend t))))
   `(region ((,class (:background ,selection :extend t))))
   `(secondary-selection ((,class (:background ,cyan-bg :extend t))))
   `(shadow ((,class (:foreground ,grey))))
   `(minibuffer-prompt ((,class (:foreground ,blue-alt :weight bold))))
   `(vertical-border ((,class (:foreground ,border))))
   `(link ((,class (:foreground ,blue-alt :underline t))))
   `(link-visited ((,class (:foreground ,violet :underline t))))
   `(error ((,class (:foreground ,red :weight bold))))
   `(warning ((,class (:foreground ,yellow :weight bold))))
   `(success ((,class (:foreground ,green :weight bold))))
   `(escape-glyph ((,class (:foreground ,magenta))))
   `(homoglyph ((,class (:foreground ,magenta))))
   `(match ((,class (:background ,cyan-bg :foreground ,cyan :weight bold))))
   `(lazy-highlight ((,class (:background ,yellow-bg :foreground ,yellow))))
   `(isearch ((,class (:background ,cyan :foreground ,bg :weight bold))))
   `(isearch-fail ((,class (:background ,red-bg :foreground ,red :weight bold))))
   `(trailing-whitespace ((,class (:background ,red))))
   `(show-paren-match ((,class (:background ,selection :foreground "#FFFFFF" :weight bold))))
   `(show-paren-mismatch ((,class (:background ,red-bg :foreground ,red :weight bold))))

   ;; Font lock
   `(font-lock-builtin-face ((,class (:foreground ,teal))))
   `(font-lock-comment-face ((,class (:foreground ,grey-alt :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,grey :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,teal))))
   `(font-lock-doc-face ((,class (:foreground ,green))))
   `(font-lock-function-name-face ((,class (:foreground ,yellow))))
   `(font-lock-keyword-face ((,class (:foreground ,green :weight semi-bold))))
   `(font-lock-negation-char-face ((,class (:foreground ,red))))
   `(font-lock-preprocessor-face ((,class (:foreground ,green))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,yellow))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,orange))))
   `(font-lock-string-face ((,class (:foreground ,green))))
   `(font-lock-type-face ((,class (:foreground ,blue))))
   `(font-lock-variable-name-face ((,class (:foreground ,violet))))
   `(font-lock-warning-face ((,class (:foreground ,red :weight bold))))

   ;; Mode line / header line
   `(mode-line ((,class (:background ,modeline-bg :foreground ,modeline-fg :box (:line-width 1 :color ,border)))))
   `(mode-line-buffer-id ((,class (:foreground "#FFFFFF" :weight bold))))
   `(mode-line-emphasis ((,class (:foreground ,yellow :weight bold))))
   `(mode-line-inactive ((,class (:background ,modeline-inactive-bg :foreground ,modeline-inactive-fg :box (:line-width 1 :color ,border)))))
   `(header-line ((,class (:background ,bg-alt :foreground ,fg-alt :box nil))))

   ;; Line numbers
   `(line-number ((,class (:background ,bg :foreground ,grey))))
   `(line-number-current-line ((,class (:background ,bg :foreground "#FFFFFF" :weight bold))))

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
   `(diff-header ((,class (:background ,bg-alt :foreground ,fg-alt))))
   `(diff-file-header ((,class (:background ,bg-alt :foreground ,blue :weight bold))))

   ;; Org
   `(org-document-title ((,class (:foreground "#FFFFFF" :weight bold :height 1.1))))
   `(org-document-info ((,class (:foreground ,fg-alt))))
   `(org-level-1 ((,class (:foreground ,blue :weight bold :height 1.0))))
   `(org-level-2 ((,class (:foreground ,green :weight bold :height 1.0))))
   `(org-level-3 ((,class (:foreground ,yellow :weight bold :height 1.0))))
   `(org-level-4 ((,class (:foreground ,violet :weight bold))))
   `(org-level-5 ((,class (:foreground ,cyan))))
   `(org-level-6 ((,class (:foreground ,magenta))))
   `(org-level-7 ((,class (:foreground ,orange))))
   `(org-level-8 ((,class (:foreground ,fg-alt))))
   `(org-block ((,class (:background ,bg-alt :extend t))))
   `(org-block-begin-line ((,class (:background ,bg-alt :foreground ,grey))))
   `(org-block-end-line ((,class (:background ,bg-alt :foreground ,grey))))
   `(org-code ((,class (:foreground ,teal))))
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
   `(dired-perm-write ((,class (:foreground ,fg :underline t))))
   `(dired-symlink ((,class (:foreground ,cyan :weight bold))))
   `(dired-warning ((,class (:foreground ,yellow))))

   `(widget-field ((,class (:background ,bg-alt :box (:line-width 1 :color ,border)))))
   `(custom-variable-tag ((,class (:foreground ,blue :weight bold))))
   `(custom-group-tag ((,class (:foreground ,violet :weight bold :height 1.0))))
   `(custom-state ((,class (:foreground ,green))))

   ;; Common optional package faces; harmless if packages are absent
   `(vertico-current ((,class (:background ,selection :foreground "#FFFFFF" :extend t))))
   `(corfu-current ((,class (:background ,selection :foreground "#FFFFFF" :extend t))))
   `(corfu-bar ((,class (:background ,blue-alt))))
   `(which-key-key-face ((,class (:foreground ,green :weight bold))))
   `(which-key-command-description-face ((,class (:foreground ,fg))))
   `(which-key-group-description-face ((,class (:foreground ,blue))))
   `(which-key-local-map-description-face ((,class (:foreground ,violet))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'ny-cursor-dark)

;;; ny-cursor-dark-theme.el ends here
