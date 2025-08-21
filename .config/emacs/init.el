;; Load paths
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

;; Core settings
(setq native-comp-deferred-compilation t
      native-comp-async-report-warnings-errors nil
      ring-bell-function 'ignore
      visible-bell t
      completion-styles '(basic flex)
      completion-auto-select t
      completion-auto-help 'visible)

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Auto save visited files
(auto-save-visited-mode 1)

;; Vertical minibuffer
(fido-vertical-mode 1)

;; Visual line mode
(global-visual-line-mode 1)
(global-hl-line-mode -1)

;; Load modular config files
(require 'packages)
(require 'appearance)
(require 'editing)
(require 'treesitter)
(require 'lsp)
(require 'org-config)
(require 'org-roam-config)
(require 'bindings)
(require 'hooks)
