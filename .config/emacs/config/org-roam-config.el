(require 'org)

;; Org-Roam directory
(setq org-roam-directory (file-truename "~/Documents/org/roam/"))

;; Capture templates
(setq org-roam-capture-templates
      '(("d" "default" plain "%?"
         :target
         (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                    "#+title: ${title}\n")
         :unnarrowed t)))

(provide 'org-roam-config)
