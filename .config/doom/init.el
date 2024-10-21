(doom! :completion
       (company)
       vertico

       :ui
       doom
       doom-dashboard
       (emoji +unicode)
       hl-todo
       modeline
       ophints
       (popup +defaults)
       unicode
       workspaces
       zen

       :editor
       file-templates
       fold
       snippets
       word-wrap

       :emacs
       dired
       electric
       undo
       vc

       :checkers
       syntax

       :tools
       (debugger +lsp)
       (eval +overlay)
       (lookup +dictionary +docsets)
       (lsp +peek)
       magit
       make
       pdf
       tree-sitter

       :os
       (:if IS-MAC macos)

       :lang
       data
       (emacs-lisp +lsp)
       (json +lsp)
       (javascript +lsp)
       markdown
       (python +pyenv +lsp)
       sh
       ledger
       (web +lsp)
       (yaml +lsp)
       (org +roam2 +dragndrop +pretty)

       :config
       (default +bindings +smartparens))

