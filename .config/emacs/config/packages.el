;; Add MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)

;; Paredit
(use-package paredit :ensure t)
(use-package org-roam :ensure t)
(use-package magit :ensure t)
(use-package org-chef :ensure t)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-solarized-dark-high-contrast t))

(provide 'packages)
