(doom! :completion
       (company +childframe)
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

       :term
       vterm

       :editor
       file-templates
       fold
       snippets
       word-wrap
       (format +onsave)

       :emacs
       dired
       electric
       undo
       vc

       :checkers
       (syntax +childframe +flycheck +icons)

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
       (python +lsp)
       sh
       ledger
       (web +lsp)
       (yaml +lsp)
       (org +roam2)

       :config
       (default +bindings +smartparens))
